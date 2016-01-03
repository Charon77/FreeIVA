using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;
using System.IO;
using System.Reflection;

/* TODO
 * Collisions
    * Find part collider - DONE
    * Find which part we are currently inside - DONE
    * Find out if we are intersecting the part - DONE
    * Pushback on collision - DONE
 * Acceleration
    * Gravity
	* Vessel motion
 * Interaction/GUI
    * Get out of/into seat
        * Remove character model when moving - DONE
        * Identify seat locations - DONE
        * Perform crew transfer on selecting a new seat
        * Allow returning to the original seat
        * Add sound effect
    * Open/close hatch
        * Depth mask shader - DONE
        * Find hatch locations/shapes - DONE
        * Add interaction prompts for hatches - DONE
        * Add sound effect - DONE
        * Animation?
    * Ladders / handles
    * Disable regular flight controls and reuse their keys - DONE
    * Prevent window focus areas dumping the player back in the seat with no way to leave again
    * Support switching the active kerbal (V key) properly
 * Camera without gimbal lock - DONE
 * Camera with gravity gimbal lock
 * EVA
    * Attachment over the top of external airlock hatches
    * Transition to EVA
 * Pause - DONE
 * Persist hatch states
 * Test in Editor (VAB/SPH)
 * Test with RPM transparent cockpits
 */

/* IVA design tools
 * Toggle helmet
 */

/* Quick list
 * 
 * Fix issues with loading, restarting etc.
 * Finish colliders for the rest of the parts.
 * Fix render queue to view through mutliple parts and windows.
 * Fix startup states for hatches, hide colliders.
 * Set up visible filler colliders.
 * 
 */

// Assistance received from: egg
namespace FreeIva
{
    [KSPAddon(KSPAddon.Startup.Flight, false)]
    public class FreeIva : MonoBehaviour
    {
        //public delegate void EventHandler();
        //public static event EventHandler OnIvaPartChanged;
        public static EventData<Part> OnIvaPartChanged = new EventData<Part>("OnIvaPartChanged");
        public KerbalIva IvaKerbal;

        //private GameObject sphere;
        //private GameObject capsule;
        //private ScreenMessage screenMessage;
        public static Part InitialPart;
        public static Part CurrentPart;
        private static ModuleFreeIva _currentModuleFreeIva = null;
        public static ModuleFreeIva CurrentModuleFreeIva
        {
            get
            {
                if (_currentModuleFreeIva == null || _currentModuleFreeIva.part != CurrentPart)
                {
                    _currentModuleFreeIva = CurrentPart.GetModule<FreeIva>();
                    return _currentModuleFreeIva;
                }
                return _currentModuleFreeIva;
            }
        }

        public void Start()
        {
            CurrentPart = FlightGlobals.ActiveVessel.rootPart;

            /*sphere = GameObject.CreatePrimitive(PrimitiveType.Sphere);
            Destroy(sphere.collider);
            sphere.layer = 20;*/

            IvaKerbal = new KerbalIva();

            //Physics.IgnoreLayerCollision(20, 20, false);

            GuiUtils.DrawGui = true;
            GuiUtils.SetupGui();

            //Utils.line = Utils.CreateLine(Color.white, Color.red, 0.5f, 0.5f);
            /*forwardLine = CreateLine(Color.white, Color.red, 0.05f, 0.05f);
            upLine = CreateLine(Color.white, Color.green, 0.05f, 0.05f);
            rightLine = CreateLine(Color.white, Color.blue, 0.05f, 0.05f);*/

            Paused = false;
            GameEvents.onGamePause.Add(new EventVoid.OnEvent(this.OnPause));
            GameEvents.onGameUnpause.Add(new EventVoid.OnEvent(this.OnUnPause));

            /*screenMessage = new ScreenMessage(string.Empty, 3f, ScreenMessageStyle.UPPER_CENTER);
            //screenMessage.message = "Starting Free IVA...";
            ScreenMessages.PostScreenMessage(screenMessage, false);*/

            // Per-frame screen message, as used during EVA:
            //ScreenMessages.PostScreenMessage("[" + GameSettings.EVA_Board.name + "]: Board", 0.1f, ScreenMessageStyle.LOWER_CENTER);
            Settings.LoadSettings();
            OnIvaPartChanged.Add(IvaPartChanged);
            SetRenderQueues(FlightGlobals.ActiveVessel.rootPart);
            SetCollisionLayers();
        }

        private GameObject hatchMask = null;
        private void DumpModels()
        {
            hatchMask = GameDatabase.Instance.GetModel("FreeIva/TestSphere");
            if (hatchMask != null)
            {
                //Debug.Log("#MeshFilter: " + hatchMask.GetComponent<MeshFilter>());
                //Debug.Log("#MeshRenderer: " + hatchMask.GetComponent<MeshRenderer>());

                //Debug.Log("#Creating hatchMask");
                GameObject hatchInstance = GameObject.Instantiate(hatchMask, FlightGlobals.ActiveVessel.rootPart.transform.position, Quaternion.identity) as GameObject;
                //Debug.Log("# instance null? " + (hatchInstance == null));
                hatchInstance.transform.parent = FlightCamera.fetch.transform;
                hatchInstance.transform.position = FlightCamera.fetch.transform.forward;
            }
        }

        public static bool Paused = false;
        public void OnPause()
        {
            Paused = true;
        }

        public void OnUnPause()
        {
            Paused = false;
        }

        public void OnDestroy()
        {
            GameEvents.onGamePause.Remove(OnPause);
            GameEvents.onGameUnpause.Remove(OnUnPause);
            OnIvaPartChanged.Remove(IvaPartChanged);
            InputLockManager.RemoveControlLock("FreeIVA");
        }

        public void FixedUpdate()
        {
            UpdateCurrentPart();

            /*if (_reseatingCrew)
            {
                FlightGlobals.ActiveVessel.SpawnCrew();
                _reseatingCrew = false;
            }*/
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="activePart">The part that the IVA player is currently inside.</param>
        public static void SetRenderQueues(Part activePart)
        {
            List<Part> visibleParts = new List<Part>();
            GetVisibleParts(CurrentPart, ref visibleParts);
            for (int i = 0; i < FlightGlobals.ActiveVessel.Parts.Count; i++)
            {
                Part p = FlightGlobals.ActiveVessel.Parts[i];
                bool partVisible = visibleParts.Contains(p);

                if (p.internalModel != null)
                {
                    Renderer[] renderers = p.internalModel.GetComponentsInChildren<Renderer>();
                    foreach (var r in renderers)
                    {
                        foreach (var m in r.materials)
                        {
                            // Geometry is rendered at 2000. The depth mask will be rendered over it at 1999.
                            // Render the next visible area (behind the depth mask) before it, over the top of it, at 1998.
                            if (p == activePart || !partVisible)
                                m.renderQueue = 2000; // Hide the part the player is inside, and parts with closed hatches.
                            else
                                m.renderQueue = 1998;
                        }
                    }
                }
            }
        }

        /// <summary>
        /// Gets a list of parts that have
        /// </summary>
        /// <returns></returns>
        private static List<Part> GetVisibleParts(Part part, ref List<Part> visibleParts)
        {
            ModuleFreeIva iva = part.GetModule<ModuleFreeIva>();
            if (iva != null)
            {
                if (!visibleParts.Contains(part))
                    visibleParts.Add(part);

                for (int i = 0; i < iva.Hatches.Count; i++)
                {
                    Hatch h = iva.Hatches[i];

                    if (h.IsOpen && h.ConnectedHatch != null && h.ConnectedHatch.IsOpen && 
                        h.ConnectedHatch.Part != null && !visibleParts.Contains(h.ConnectedHatch.Part))
                        visibleParts.AddRange(GetVisibleParts(h.ConnectedHatch.Part, ref visibleParts));
                }
            }

            return visibleParts;
        }

        private void SetCollisionLayers()
        {
            for (int i = 0; i < 32; i++)
            {
                /*if (i == 20)
                {
                    Physics.IgnoreLayerCollision(20, i, false);
                    continue;
                }
                Physics.IgnoreLayerCollision(20, i, true);*/
                Physics.IgnoreLayerCollision((int)Layers.Kerbals, i, true);
                Physics.IgnoreLayerCollision(i, (int)Layers.Kerbals, true);
                Physics.IgnoreLayerCollision((int)Layers.InternalSpace, i, true);
                Physics.IgnoreLayerCollision(i, (int)Layers.InternalSpace, true);
            }
            Physics.IgnoreLayerCollision((int)Layers.Kerbals, (int)Layers.InternalSpace, false);
        }

        private void DisableCollisionLayers()
        {
            for (int i = 0; i < 32; i++)
            {
                Physics.IgnoreLayerCollision((int)Layers.Kerbals, i, true);
                Physics.IgnoreLayerCollision(i, (int)Layers.Kerbals, true);
                Physics.IgnoreLayerCollision((int)Layers.InternalSpace, i, true);
                Physics.IgnoreLayerCollision(i, (int)Layers.InternalSpace, true);
            }
            Physics.IgnoreLayerCollision((int)Layers.Kerbals, (int)Layers.InternalSpace, true);
        }

        Vector3 _previousCameraPosition = Vector3.zero;
        public void UpdateCurrentPart()
        {
            if (_previousCameraPosition == InternalCamera.Instance.transform.position)
                return;
            //Debug.Log("###########################");
            _previousCameraPosition = InternalCamera.Instance.transform.position;
            Vector3 camPos = InternalSpace.InternalToWorld(InternalCamera.Instance.transform.position);
            Part lastPart = CurrentPart;

            // Part colliders are larger than the parts themselves and overlap.
            // Find which of the containing parts we're nearest to.
            List<Part> possibleParts = new List<Part>();
            if (CurrentPart.collider.bounds.Contains(camPos))
            {
                //Debug.Log("# Adding previous currentpart.");
                possibleParts.Add(CurrentPart);
            }
            // Check all attached parts.
            if (CurrentPart.parent != null && CurrentPart.parent.collider.bounds.Contains(camPos))
            {
                //Debug.Log("# Adding parent " + CurrentPart.parent);
                possibleParts.Add(CurrentPart.parent);
            }
            foreach (Part c in CurrentPart.children)
            {
                if (c.collider.bounds.Contains(camPos))
                {
                    //Debug.Log("# Adding child " + c);
                    possibleParts.Add(c);
                }
            }
            if (possibleParts.Count == 0)
            {
                //Debug.Log("# Zero connected parts found, checking everything.");
                foreach (Part p in FlightGlobals.ActiveVessel.parts)
                {
                    if (p.collider.bounds.Contains(InternalSpace.InternalToWorld(InternalCamera.Instance.transform.position)))
                    {
                        //Debug.Log("# Adding vessel part " + p);
                        possibleParts.Add(p);
                    }
                }
            }

            if (possibleParts.Count == 0)
            {
                //Debug.Log("# No potential parts found");
                return;
            }

            if (possibleParts.Count == 1)
            {
                //Debug.Log("# Only one part found: " + possibleParts[0]);
                CurrentPart = possibleParts[0];
                if (CurrentPart != lastPart)
                    OnIvaPartChanged.Fire(CurrentPart);
                /*else
                    Debug.Log("# Same part as before: " + CurrentPart + " at " + CurrentPart.transform.position);*/
                return;
            }

            float minDistance = float.MaxValue;
            Part closestPart = null;
            //Debug.Log("# Checking " + possibleParts.Count + " possibilities.");
            foreach (Part pp in possibleParts)
            {
                // Raycast from the camera to the centre of the collider.
                // TODO: Figure out how to deal with multi-collider parts.
                Vector3 c = pp.collider.bounds.center;
                Vector3 direction = c - camPos;
                Ray ray = new Ray(camPos, direction);
                RaycastHit hitInfo;
                if (!pp.collider.Raycast(ray, out hitInfo, direction.magnitude))
                {
                    //Debug.Log("# Raycast missed part from inside: " + pp);
                    // Ray didn't hit the collider => we are inside the collider.
                    float dist = Vector3.Distance(pp.collider.bounds.center, camPos);
                    if (dist < minDistance)
                    {
                        closestPart = pp;
                        minDistance = dist;
                    }
                    /*else
                        Debug.Log("# Part was further away: " + minDistance + " vs part's " + dist);*/
                }
                /*else
                    Debug.Log("# Raycast hit part from outside: " + pp);*/
            }
            if (closestPart != null)
            {
                //Debug.Log("# New closest part found: " + closestPart);
                CurrentPart = closestPart;
                if (CurrentPart != lastPart)
                    OnIvaPartChanged.Fire(CurrentPart);
                /*else
                    Debug.Log("# Same part as before: " + CurrentPart + " at " + CurrentPart.transform.position);*/
            }
            /*else
                Debug.Log("# No closest part found.");*/
            // Keep the last part we were inside as the current part: We could be transitioning between hatches.
            // TODO: Idendify/store when we are outside all parts (EVA from IVA?).
        }

        public void IvaPartChanged(Part newPart)
        {
            SetRenderQueues(newPart);
        }

        //static bool _initialised = false;
        public static void EnableInternals()
        {
            try
            {
                //if (_initialised) return;

                foreach (Part p in FlightGlobals.ActiveVessel.parts)
                {
                    if (p.internalModel == null)
                        p.CreateInternalModel();
                    if (p.internalModel != null)
                    {
                        p.internalModel.SetVisible(true);
                        //PrintInternals(p);
                    }
                }

                // TODO
                InternalCollider.HideAllColliders();
                // TODO
                Hatch.CloseAllHatches();

                //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                // Colliders, hatches and hatch props are all unhidden by this.
                //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


                //_initialised = true;
            }
            catch (Exception ex)
            {
                Debug.LogError("[FreeIVA] Error enabling internals: " + ex.Message + ", " + ex.StackTrace);
            }
        }

        /*public static float DoCollisions()
        {
            Part p = FlightGlobals.ActiveVessel.rootPart;
            if (p != null && p.collider != null)
            {
                /*
                Vector3 closestPoint = p.collider.ClosestPointOnBounds(InternalSpace.InternalToWorld(InternalCamera.Instance.transform.localPosition));
                float distance = Vector3.Distance(InternalSpace.InternalToWorld(InternalCamera.Instance.transform.localPosition), closestPoint);
                Debug.Log("Distance: " + distance + ", closest point: " + closestPoint);

                Vector3 closestPointExt = p.collider.ClosestPointOnBounds(InternalSpace.InternalToWorld(InternalCamera.Instance.transform.localPosition));
                float distanceExt = Vector3.Distance(InternalCamera.Instance.transform.localPosition, closestPoint);
                Debug.Log("DistanceExt: " + distanceExt + ", closest pointExt: " + closestPointExt);
                * /

                Vector3 camPosWorld = InternalSpace.InternalToWorld(InternalCamera.Instance.transform.forward) * 10;

                //line.SetPosition(0, InternalSpace.InternalToWorld(InternalCamera.Instance.transform.localPosition));
                //line.SetPosition(1, FlightGlobals.ActiveVessel.rootPart.transform.localPosition);
                RaycastHit hit;

                if (Physics.Linecast(InternalSpace.InternalToWorld(InternalCamera.Instance.transform.localPosition), camPosWorld, out hit)) // Progressively move the point forward, stopping everytime we see a new plane in the way.
                {
                    float distance = Vector3.Distance(InternalCamera.Instance.transform.localPosition, hit.point);
                    //Debug.Log("Distance: " + distance + ", hit point: " + hit.point);
                    return distance;
                }
                /*else
                {
                    Debug.Log("No hit");
                }* /

                //sphere.transform.position = InternalSpace.WorldToInternal(closestPoint);
            }
            return 0;
        }*/

        // GUI fields
        private static int _partIndex = 0;
        private static int _hatchIndex = 0;
        private static int _meshRendererIndex = 0;
        private static int _skinnedMeshRendererIndex = 0;

        public static void Gui()
        {
            if (GUILayout.Button("Hide GUI until next launch"))
                GuiUtils.DrawGui = false;

            // Part selection
            /*if (GUILayout.Button("Previous Part"))
                partIndex--;
            if (GUILayout.Button("Next Part"))
            {
                partIndex++;
                partChanged = true;
            }
            if (partIndex >= FlightGlobals.ActiveVessel.Parts.Count)
                partIndex = 0;
            if (partIndex < 0)
                partIndex = FlightGlobals.ActiveVessel.Parts.Count - 1;
            CurrentPart = FlightGlobals.ActiveVessel.Parts[partIndex];*/
            GuiUtils.label("Part (" + (_partIndex + 1) + "/" + FlightGlobals.ActiveVessel.Parts.Count + ")", CurrentPart);

            // Internals
            if (CurrentPart.internalModel == null)
            {
                GUILayout.Label("No internal model found");
                return;
            }

            ColliderGui();
            HatchGui();
            SeatGui();
            MeshRendererGui();
            SkinnedMeshRendererGui();


            //GUILayout.Label("Closest part: " + (closestPart == null ? "None" : closestPart.name));
            //GUILayout.Label("Closest bounds distance: " + DoCollisions());
            //GUILayout.Label("Colliding: " + colliding);
        }

        private static bool showColliderGui = false;
        private static int _colliderIndex = 0;
        //private static GameObject currentCollider = null;
        //private static FixedJoint currentJoint = null;
        private static PrimitiveType _primitiveType = PrimitiveType.Cube;
        private static void ColliderGui()
        {
            // TODO: Automatically add colliders to selected props using renderer bounds?

            if (GUILayout.Button((showColliderGui ? "Hide" : "Show") + " collider configuration"))
                showColliderGui = !showColliderGui;
            if (!showColliderGui)
            {
                InternalCollider.HideAllColliders();
                return;
            }


            GUILayout.BeginHorizontal();
            KerbalIva.KerbalCollider.collider.enabled = !GUILayout.Toggle(!KerbalIva.KerbalCollider.collider.enabled, "NoClip");
            bool helmet = KerbalIva.WearingHelmet;
            KerbalIva.WearingHelmet = GUILayout.Toggle(KerbalIva.WearingHelmet, "Helmet");
            if (helmet != KerbalIva.WearingHelmet)
            {

            }
            GUILayout.EndHorizontal();

            GUILayout.BeginHorizontal();
            if (GUILayout.Button("Print collision layers"))
            {
                StringBuilder sb = new StringBuilder();
                sb.Append("                    1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 3 3");
                sb.Append("0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1");
                for (int i = 0; i < 32; i++)
                {
                    sb.Append("\r\n");
                    if (i < 10) sb.Append(" ");
                    sb.Append(i).Append("\t");
                    for (int j = 0; j < 32; j++)
                        sb.Append(Physics.GetIgnoreLayerCollision(i, j) ? "T " : "F ");
                }
                Debug.Log(sb.ToString());
            }

            if (GUILayout.Button("Create new collider"))
            {
                InternalCollider col = new InternalCollider();
                col.Scale = new Vector3(0.5f, 0.5f, 0.5f);
                col.Instantiate(CurrentPart, _primitiveType);
                col.IvaGameObject.name = "Test collider";
                CurrentModuleFreeIva.InternalColliders.Add(col);
                _colliderIndex = CurrentModuleFreeIva.InternalColliders.Count - 1;
            }
            if (GUILayout.Button("Stop all movement"))
            {
                foreach (var col in CurrentModuleFreeIva.InternalColliders)
                {
                    col.IvaGameObject.rigidbody.velocity = Vector3.zero;
                    col.IvaGameObject.rigidbody.angularVelocity = Vector3.zero;
                }
            }
            GUILayout.EndHorizontal();

            GUILayout.BeginHorizontal();
            if (GUILayout.Toggle(_primitiveType == PrimitiveType.Sphere, "Sphere"))
                _primitiveType = PrimitiveType.Sphere;
            if (GUILayout.Toggle(_primitiveType == PrimitiveType.Capsule, "Capsule"))
                _primitiveType = PrimitiveType.Capsule;
            if (GUILayout.Toggle(_primitiveType == PrimitiveType.Cylinder, "Cylinder"))
                _primitiveType = PrimitiveType.Cylinder;
            if (GUILayout.Toggle(_primitiveType == PrimitiveType.Cube, "Cube"))
                _primitiveType = PrimitiveType.Cube;
            if (GUILayout.Toggle(_primitiveType == PrimitiveType.Plane, "Plane"))
                _primitiveType = PrimitiveType.Plane;
            if (GUILayout.Toggle(_primitiveType == PrimitiveType.Quad, "Quad"))
                _primitiveType = PrimitiveType.Quad;
            GUILayout.EndHorizontal();

            InternalCollider c = null;
            if (CurrentModuleFreeIva.InternalColliders.Count == 0)
            {
                GUILayout.Label("No colliders");
            }
            else
            {
                GUILayout.BeginHorizontal();
                if (GUILayout.Button("Previous collider"))
                    _colliderIndex--;
                if (GUILayout.Button("Next collider"))
                    _colliderIndex++;
                GUILayout.EndHorizontal();
                if (_colliderIndex >= CurrentModuleFreeIva.InternalColliders.Count)
                    _colliderIndex = 0;
                if (_colliderIndex < 0)
                    _colliderIndex = CurrentModuleFreeIva.InternalColliders.Count - 1;
                GuiUtils.label("Current collider", _colliderIndex + 1);
                c = CurrentModuleFreeIva.InternalColliders[_colliderIndex];
                GuiUtils.label("Collider (" + (_colliderIndex + 1) + "/" + CurrentModuleFreeIva.InternalColliders.Count + ")", c.Name);
            }
            if (c == null) return;

            if (GUILayout.Button("Destroy collider"))
            {
                CurrentModuleFreeIva.InternalColliders.Remove(c);
                c.IvaGameObject.DestroyGameObject();
            }

            GUILayout.BeginHorizontal();
            c.IvaGameObject.collider.enabled = GUILayout.Toggle(c.IvaGameObject.collider.enabled, "Enabled");
            bool wasVisible = c.Visible;
            bool v = GUILayout.Toggle(wasVisible, "Visible");
            if (v != wasVisible)
                c.Visible = v;
            GUILayout.EndHorizontal();

            GUILayout.BeginHorizontal();
            GUILayout.Label("Position X");

            float xPos = float.Parse(GUILayout.TextField(c.LocalPosition.x.ToString()));
            GUILayout.Label("Position Y");
            float yPos = float.Parse(GUILayout.TextField(c.LocalPosition.y.ToString()));
            GUILayout.Label("Position Z");
            float zPos = float.Parse(GUILayout.TextField(c.LocalPosition.z.ToString()));
            if (xPos != c.LocalPosition.x || yPos != c.LocalPosition.y || zPos != c.LocalPosition.z)
            {
                //currentJoint = c.IvaGameObject.GetComponent<FixedJoint>();
                //if (currentJoint != null) Destroy(currentJoint);
                c.LocalPosition = new Vector3(xPos, yPos, zPos);
                //currentJoint = c.IvaGameObject.AddComponent<FixedJoint>();
                //currentJoint.connectedBody = CurrentPart.collider.rigidbody;
                c.IvaGameObject.rigidbody.velocity = Vector3.zero;
                c.IvaGameObject.rigidbody.angularVelocity = Vector3.zero;
            }
            GUILayout.EndHorizontal();

            GUILayout.BeginHorizontal();
            GUILayout.Label("Scale X");
            float xSc = float.Parse(GUILayout.TextField(c.Scale.x.ToString()));
            GUILayout.Label("Scale Y");
            float ySc = float.Parse(GUILayout.TextField(c.Scale.y.ToString()));
            GUILayout.Label("Scale Z");
            float zSc = float.Parse(GUILayout.TextField(c.Scale.z.ToString()));
            if (xSc != c.Scale.x || ySc != c.Scale.y || zSc != c.Scale.z)
            {
                //currentJoint = c.IvaGameObject.GetComponent<FixedJoint>();
                //if (currentJoint != null) Destroy(currentJoint);
                c.Scale = new Vector3(xSc, ySc, zSc);
                //currentJoint = c.IvaGameObject.AddComponent<FixedJoint>();
                //currentJoint.connectedBody = CurrentPart.collider.rigidbody;
                c.IvaGameObject.rigidbody.velocity = Vector3.zero;
                c.IvaGameObject.rigidbody.angularVelocity = Vector3.zero;
            }
            GUILayout.EndHorizontal();

            GUILayout.BeginHorizontal();
            GUILayout.Label("Rotation X");
            float xRot = float.Parse(GUILayout.TextField(c.Rotation.eulerAngles.x.ToString()));
            GUILayout.Label("Rotation Y");
            float yRot = float.Parse(GUILayout.TextField(c.Rotation.eulerAngles.y.ToString()));
            GUILayout.Label("Rotation Z");
            float zRot = float.Parse(GUILayout.TextField(c.Rotation.eulerAngles.z.ToString()));
            if (xRot != c.Rotation.eulerAngles.x || yRot != c.Rotation.eulerAngles.y || zRot != c.Rotation.eulerAngles.z)
            {
                //currentJoint = c.IvaGameObject.GetComponent<FixedJoint>();
                //if (currentJoint != null) Destroy(currentJoint);
                c.Rotation = Quaternion.Euler(xRot, yRot, zRot);
                //currentJoint = c.IvaGameObject.AddComponent<FixedJoint>();
                //currentJoint.connectedBody = CurrentPart.collider.rigidbody;
                c.IvaGameObject.rigidbody.velocity = Vector3.zero;
                c.IvaGameObject.rigidbody.angularVelocity = Vector3.zero;
            }
            GUILayout.EndHorizontal();

            GUILayout.BeginHorizontal();
            GuiUtils.label("Velocity", c.IvaGameObject.rigidbody.velocity.magnitude);
            GuiUtils.label("Angular velocity", c.IvaGameObject.rigidbody.angularVelocity.magnitude);
            GUILayout.EndHorizontal();

        }

        private static bool showHatchGui = false;
        private static void HatchGui()
        {
            if (GUILayout.Button((showHatchGui ? "Hide" : "Show") + " hatch configuration"))
                showHatchGui = !showHatchGui;
            if (!showHatchGui || CurrentModuleFreeIva == null) return;
            if (CurrentModuleFreeIva.Hatches.Count == 0)
            {
                GUILayout.Label("No hatches");
                return;
            }

            /*if (partChanged)
            {
                partChanged = false;
                foreach (var hat in mfi.Hatches)
                    hat.Init(CurrentPart);
            }*/

            if (GUILayout.Button("Previous Hatch"))
                _hatchIndex--;
            if (GUILayout.Button("Next Hatch"))
                _hatchIndex++;
            if (_hatchIndex >= CurrentModuleFreeIva.Hatches.Count)
                _hatchIndex = 0;
            if (_hatchIndex < 0)
                _hatchIndex = CurrentModuleFreeIva.Hatches.Count - 1;
            GuiUtils.label("Current Hatch", _hatchIndex + 1);
            Hatch h = CurrentModuleFreeIva.Hatches[_hatchIndex];
            GuiUtils.label("Hatch (" + (_hatchIndex + 1) + "/" + CurrentModuleFreeIva.Hatches.Count + ")", h);

            GUILayout.Label("<b>Hatch</b>");
            GUILayout.BeginVertical();
            bool openHatch = h.IsOpen;
            openHatch = GUILayout.Toggle(openHatch, "Open");
            if (h.IsOpen != openHatch)
                h.Open(openHatch);
            GUILayout.BeginHorizontal();
            GUILayout.Label("Position X");
            float xPos = float.Parse(GUILayout.TextField(h.LocalPosition.x.ToString()));
            GUILayout.Label("Position Y");
            float yPos = float.Parse(GUILayout.TextField(h.LocalPosition.y.ToString()));
            GUILayout.Label("Position Z");
            float zPos = float.Parse(GUILayout.TextField(h.LocalPosition.z.ToString()));
            h.LocalPosition = new Vector3(xPos, yPos, zPos);
            GUILayout.EndHorizontal();

            GUILayout.BeginHorizontal();
            GUILayout.Label("Scale X");
            float xSc = float.Parse(GUILayout.TextField(h.Scale.x.ToString()));
            GUILayout.Label("Scale Y");
            float ySc = float.Parse(GUILayout.TextField(h.Scale.y.ToString()));
            GUILayout.Label("Scale Z");
            float zSc = float.Parse(GUILayout.TextField(h.Scale.z.ToString()));
            h.Scale = new Vector3(xSc, ySc, zSc);
            GUILayout.EndHorizontal();

            GUILayout.BeginHorizontal();
            GUILayout.Label("Rotation X");
            float xRo = float.Parse(GUILayout.TextField(h.Rotation.eulerAngles.x.ToString()));
            GUILayout.Label("Rotation Y");
            float yRo = float.Parse(GUILayout.TextField(h.Rotation.eulerAngles.y.ToString()));
            GUILayout.Label("Rotation Z");
            float zRo = float.Parse(GUILayout.TextField(h.Rotation.eulerAngles.z.ToString()));
            h.Rotation = Quaternion.Euler(xRo, yRo, zRo);
            GUILayout.EndHorizontal();
            GUILayout.EndVertical();

            float distance = Vector3.Distance(h.WorldPosition, InternalCamera.Instance.transform.position);
            GUILayout.Label(distance.ToString());

            /*GUILayout.Label("Rotation x");
            hatchRotX = float.Parse(GUILayout.TextField(hatchRotX.ToString()));
            GUILayout.Label("Rotation Y");
            hatchRotY = float.Parse(GUILayout.TextField(hatchRotY.ToString()));
            GUILayout.Label("Rotation Z");
            hatchRotZ = float.Parse(GUILayout.TextField(hatchRotZ.ToString()));
            GUILayout.Label("Scale X");
            hatchScaleX = float.Parse(GUILayout.TextField(hatchScaleX.ToString()));
            GUILayout.Label("Scale Y");
            hatchScaleY = float.Parse(GUILayout.TextField(hatchScaleY.ToString()));
            GUILayout.Label("Scale Z");
            hatchScaleZ = float.Parse(GUILayout.TextField(hatchScaleZ.ToString()));*/
        }

        private static bool showSeatGui = false;
        private static void SeatGui()
        {
            if (GUILayout.Button((showSeatGui ? "Hide" : "Show") + " seat controls"))
                showSeatGui = !showSeatGui;
            if (showSeatGui)
            {
                GUILayout.Label("<b>Seats</b>");
                GUILayout.BeginHorizontal();
                GUILayout.Label("<b>Name</b>");
                GUILayout.Label("<b>Distance</b>");
                GUILayout.Label("<b>Angle</b>");
                GUILayout.Label("<b>Targeted</b>");
                GUILayout.EndHorizontal();
                Transform closestSeat = null;
                float closestDistance = KerbalIva.MaxInteractDistance;

                foreach (var s in CurrentPart.internalModel.seats)
                {
                    if (s.taken)
                        continue;

                    GUILayout.BeginHorizontal();
                    GUILayout.Label(s.seatTransform.ToString());
                    float distance = Vector3.Distance(s.seatTransform.position, InternalCamera.Instance.transform.position);
                    GUILayout.Label(distance.ToString());

                    //GuiUtils.label(imr.name, Vector3.Distance(imr.transform.position, InternalCamera.Instance.transform.position));
                    float angle = Vector3.Angle(s.seatTransform.position - InternalCamera.Instance.transform.position,
                        InternalCamera.Instance.transform.forward);
                    //GuiUtils.label("Angle", angle);
                    GUILayout.Label(angle.ToString());
                    bool targeted = false;
                    float radius = 0f;
                    if (angle < 90)
                    {
                        radius = (distance * Mathf.Sin(angle * Mathf.Deg2Rad)) / Mathf.Sin((90 - angle) * Mathf.Deg2Rad);
                        targeted = radius <= KerbalIva.ObjectInteractionRadius;
                    }
                    GUILayout.Label(targeted.ToString());
                    GUILayout.EndHorizontal();

                    if (targeted && distance < closestDistance)
                    {
                        closestSeat = s.seatTransform;
                        closestDistance = distance;
                    }
                }
            }
        }

        private static bool showMRGui = false;
        private static void MeshRendererGui()
        {
            MeshRenderer[] meshRenderers = CurrentPart.internalModel.GetComponentsInChildren<MeshRenderer>();
            if (GUILayout.Button((showMRGui ? "Hide" : "Show") + " MeshRenderer controls"))
                showMRGui = !showMRGui;
            if (showMRGui)
            {
                if (meshRenderers.Length == 0)
                {
                    GUILayout.Label("No MeshRenderers");
                    return;
                }
                GuiUtils.label("MeshRenderers", meshRenderers.Length);
                if (_meshRendererIndex >= meshRenderers.Length)
                    _meshRendererIndex = 0;
                if (_meshRendererIndex < 0)
                    _meshRendererIndex = meshRenderers.Length - 1;
                GuiUtils.label("Current MeshRenderer", _meshRendererIndex + 1);
                MeshRenderer mr = meshRenderers[_meshRendererIndex];

                GUILayout.BeginHorizontal();
                if (GUILayout.Button("Previous MeshRenderer"))
                    _meshRendererIndex--;
                if (GUILayout.Button("Next MeshRenderer"))
                    _meshRendererIndex++;
                GUILayout.EndHorizontal();
                if (mr.material != null)
                    mr.enabled = GUILayout.Toggle(mr.enabled, "Enabled");
                else
                    GUILayout.Label("Material is null");
                /*if (GUILayout.Button("Hide all MRs but this"))
                {
                    for (int i = 0; i < meshRenderers.Length; i++)
                    {
                        meshRenderers[meshRendererIndex].enabled = i != meshRendererIndex;
                        Debug.Log("MR " + meshRenderers[meshRendererIndex] + " is now " + meshRenderers[meshRendererIndex].enabled);
                    }
                }*/
                GUILayout.Label("<b>MeshRenderer</b>");
                GUILayout.Label(mr == null ? "null" : mr.ToString());
                GUILayout.Label("<b>Material</b>");
                GUILayout.Label(mr.material == null ? "null" : mr.material.ToString());
                GUILayout.Label("<b>Transform</b>");
                GUILayout.Label(mr.transform == null ? "null" : mr.transform.ToString());
                //GuiUtils.label("MeshRenderer", mr);
                //GuiUtils.label("Material", mr.material);
                //GuiUtils.label("Transform", mr.transform);
                if (mr.transform != null)
                {
                    GuiUtils.label("Transform position", mr.transform.localPosition);
                    GuiUtils.label("Range", Vector3.Distance(mr.transform.position, InternalCamera.Instance.transform.position));
                }
            }
        }

        private static bool showSMRGui = false;
        private static void SkinnedMeshRendererGui()
        {
            if (GUILayout.Button((showSMRGui ? "Hide" : "Show") + " SkinnedMeshRenderer controls"))
                showSMRGui = !showSMRGui;
            if (showSMRGui)
            {
                SkinnedMeshRenderer[] skinnedMeshRenderers = CurrentPart.internalModel.GetComponentsInChildren<SkinnedMeshRenderer>();
                if (skinnedMeshRenderers.Length == 0)
                {
                    GUILayout.Label("No SkinnedMeshRenderers");
                    return;
                }
                GuiUtils.label("SkinnedMeshRenderers", skinnedMeshRenderers.Length);
                if (_skinnedMeshRendererIndex >= skinnedMeshRenderers.Length)
                    _skinnedMeshRendererIndex = 0;
                if (_skinnedMeshRendererIndex < 0)
                    _skinnedMeshRendererIndex = skinnedMeshRenderers.Length - 1;
                GuiUtils.label("Current SkinnedMeshRenderer", _skinnedMeshRendererIndex + 1);
                SkinnedMeshRenderer smr = skinnedMeshRenderers[_skinnedMeshRendererIndex];

                GUILayout.BeginHorizontal();
                if (GUILayout.Button("Previous SkinnedMeshRenderer"))
                    _skinnedMeshRendererIndex--;
                if (GUILayout.Button("Next SkinnedMeshRenderer"))
                    _skinnedMeshRendererIndex++;
                GUILayout.EndHorizontal();

                if (smr.material != null)
                    smr.enabled = GUILayout.Toggle(smr.enabled, "Enabled");
                else
                    GUILayout.Label("Material is null");
                /*if (GUILayout.Button("Hide all SMRs but this"))
                {
                    for (int i = 0; i < skinnedMeshRenderers.Length; i++)
                    {
                        skinnedMeshRenderers[skinnedMeshRendererIndex].enabled = i != skinnedMeshRendererIndex;
                    }
                }*/
                GUILayout.Label("<b>SkinnedMeshRenderer</b>");
                GUILayout.Label(smr == null ? "null" : smr.ToString());
                GUILayout.Label("<b>Material</b>");
                GUILayout.Label(smr.material == null ? "null" : smr.material.ToString());
                GUILayout.Label("<b>Transform</b>");
                GUILayout.Label(smr.transform == null ? "null" : smr.transform.ToString());
                //GUILayout.Label("SkinnedMeshRenderer");
                //GuiUtils.label("SkinnedMeshRenderer", smr);
                //GuiUtils.label("Material", smr.material);
                //GuiUtils.label("Transform", smr.transform);
                //if (smr.transform != null)
                {
                    GuiUtils.label("Transform position", smr.transform.position);
                    GuiUtils.label("Range", Vector3.Distance(smr.transform.position, InternalCamera.Instance.transform.position));
                }
            }
        }
    }

    [KSPAddon(KSPAddon.Startup.MainMenu, false)]
    class AutoStartup : UnityEngine.MonoBehaviour
    {
        public static bool first = true;
        public void Start()
        {
            //only do it on the first entry to the menu
            if (first)
            {
                first = false;
                HighLogic.SaveFolder = "test";
                var game = GamePersistence.LoadGame("persistent", HighLogic.SaveFolder, true, false);
                if (game != null && game.flightState != null && game.compatible)
                    FlightDriver.StartAndFocusVessel(game, game.flightState.activeVesselIdx);
                CheatOptions.InfiniteFuel = true;
                CheatOptions.InfiniteRCS = true;
            }
        }
    }
}
