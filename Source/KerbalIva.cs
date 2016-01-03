using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;

namespace FreeIva
{
    [KSPAddon(KSPAddon.Startup.Flight, false)]
    public class KerbalIva : MonoBehaviour
    {
        public static GameObject KerbalCollider;
        public static bool WearingHelmet = true;
        public bool buckled = true;
        public bool cameraPositionLocked = false;
        public Quaternion previousRotation = new Quaternion();
        public static ProtoCrewMember ActiveKerbal;
        public InternalSeat OriginalSeat = null;
        public InternalSeat TargetedSeat = null;
        public int TargetedSeatIndex = -1;

        private CameraManager.CameraMode _lastCameraMode = CameraManager.CameraMode.Flight;
        private Vector3 _previousPos = Vector3.zero;

        // TODO: Make these user-configurable values.
        // The radius of the sphere which, when looked at, will trigger interaction prompts.
        public static float ObjectInteractionRadius = 0.3f;
        // The maximum range from an object at which interaction prompts will appear.
        public static float MaxInteractDistance = 1f;

        public void Start()
        {
            CreateCameraCollider();
            //cameraCollider.renderer.enabled = false;
            //cameraCollider.transform.parent = transform;
            //transform.parent = FlightCamera.fetch.transform; ?

            //cameraCollider.transform.parent = InternalCamera.Instance.transform;//FlightCamera.fetch.transform;
            SetCameraToSeat();
        }

        public void Update()
        {
            if (CameraManager.Instance.currentCameraMode != CameraManager.CameraMode.IVA)
            {
                if (_lastCameraMode == CameraManager.CameraMode.IVA)
                {
                    // Switching away from IVA.
                    //InputLockManager.RemoveControlLock("FreeIVA");
                    // Return the kerbal to its original seat.
                    TargetedSeat = ActiveKerbal.seat;
                    Buckle();
                }
            }
            else
            {
                // In IVA.
                if (_lastCameraMode != CameraManager.CameraMode.IVA)
                {
                    // Switching to IVA.
                    FreeIva.EnableInternals();
                    SetCameraToSeat();
                    InternalCollider.HideAllColliders();
                }
                GetInput();
            }
            _lastCameraMode = CameraManager.Instance.currentCameraMode;
        }

        private void CreateCameraCollider()
        {
            KerbalCollider = GameObject.CreatePrimitive(PrimitiveType.Sphere);
            KerbalCollider.name = "Camera collider";
            KerbalCollider.collider.enabled = false;
            Rigidbody rb = KerbalCollider.AddComponent<Rigidbody>();
            rb.useGravity = false;
            // Rotating the object would offset the rotation of the controls from the camera position.
            rb.constraints = RigidbodyConstraints.FreezeRotation;
            //cameraCollider.AddComponent<IvaCollisionPrinter>();
            KerbalCollider.collider.isTrigger = false;
            KerbalCollider.layer = (int)Layers.InternalSpace;
            KerbalCollider.transform.localScale = new Vector3(Settings.HelmetSize, Settings.HelmetSize, Settings.HelmetSize);
            KerbalCollider.renderer.enabled = false;
        }

        private void SetCameraToSeat()
        {
            KerbalCollider.transform.position = InternalCamera.Instance.transform.position; //forward;// FlightCamera.fetch.transform.forward;
            previousRotation = InternalCamera.Instance.transform.rotation;// *Quaternion.AngleAxis(-90, InternalCamera.Instance.transform.right);
        }

        private void GetInput()
        {

            if (Input.GetKeyDown(Settings.UnbuckleKey))
            {
                if (Input.GetKey(Settings.ModifierKey))
                {
                    cameraPositionLocked = !cameraPositionLocked;
                    ScreenMessages.PostScreenMessage(cameraPositionLocked ? "Camera locked" : "Camera unlocked",
                        1f, ScreenMessageStyle.LOWER_CENTER);
                }
                else
                {
                    if (buckled)
                        Unbuckle();
                    else
                        Buckle();
                }
            }

            if (!buckled && !FreeIva.Paused)
            {
                GetOrientation();
                GetPosition();
                TargetSeats();
                TargetHatches();
                if (_lastCameraMode != CameraManager.CameraMode.IVA)
                    InputLockManager.SetControlLock(ControlTypes.ALL_SHIP_CONTROLS, "FreeIVA");
            }
        }

        //private bool _reseatingCrew = false;
        public void Buckle()
        {
            if (TargetedSeat == null)
                return;

            Debug.Log(ActiveKerbal.name + " is entering seat " + TargetedSeat.transform.name + " in part " + FreeIva.CurrentPart);

            //InitialPart.RemoveCrewmember(ActiveKerbal); // Don't do this on unbuckle or we lose the InternalCamera.

            /*TargetedSeat.part.AddCrewmemberAt(ActiveKerbal, TargetedSeatIndex);
            CurrentPart.SpawnCrew();*/

            HideCurrentKerbal(false);

            if (FreeIva.InitialPart != FreeIva.CurrentPart)
            {
                GameEvents.onCrewTransferred.Fire(new GameEvents.HostedFromToAction<ProtoCrewMember, Part>(ActiveKerbal, FreeIva.InitialPart, FreeIva.CurrentPart));
                GameEvents.onVesselChange.Fire(FlightGlobals.ActiveVessel);
                /*InitialPart.SpawnCrew();
                CurrentPart.SpawnCrew();
                InitialPart.RegisterCrew();
                CurrentPart.RegisterCrew();
                FlightGlobals.ActiveVessel.SpawnCrew();*/
            }
            //_reseatingCrew = true;
            FreeIva.EnableInternals();

            KerbalCollider.collider.enabled = false;
            // InternalSpace.Instance is the InternalCamera's parent normally.
            InternalCamera.Instance.transform.parent = InternalSpace.Instance.transform;

            InputLockManager.RemoveControlLock("FreeIVA");
            //ActiveKerbal.flightLog.AddEntry("Buckled");
            ScreenMessages.PostScreenMessage("Buckled", 1f, ScreenMessageStyle.LOWER_CENTER);
            buckled = true;
        }

        public void Unbuckle()
        {
            _previousPos = Vector3.zero;
            FreeIva.EnableInternals();
            UpdateActiveKerbal();
            FreeIva.InitialPart = FreeIva.CurrentPart;
            OriginalSeat = ActiveKerbal.seat;

            HideCurrentKerbal(true);

            // InternalSpace.Instance is the InternalCamera's parent normally.
            InternalCamera.Instance.transform.parent = KerbalCollider.transform;

            InputLockManager.SetControlLock(ControlTypes.ALL_SHIP_CONTROLS, "FreeIVA");
            //ActiveKerbal.flightLog.AddEntry("Unbuckled");
            ScreenMessages.PostScreenMessage("Unbuckled", 1f, ScreenMessageStyle.LOWER_CENTER);
            KerbalCollider.collider.enabled = true;
            buckled = false;
        }

        public void UpdateActiveKerbal()
        {
            try
            {
                // TODO: There has to be a better way of doing this.
                // Attempt to find the active crew member by searching for the one with the hidden head.
                foreach (ProtoCrewMember c in FreeIva.CurrentPart.protoModuleCrew)
                {
                    if (c.KerbalRef.headTransform != null)
                    {
                        Renderer[] rs = c.KerbalRef.headTransform.GetComponentsInChildren<Renderer>();
                        if (rs.Length > 0 && !rs[0].isVisible) // Normally the left eye
                        {
                            ActiveKerbal = c;
                            break;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Debug.LogError("[FreeIVA] Error updating active kerbal: " + ex.Message + ", " + ex.StackTrace);
            }
        }

        /// <summary>
        /// Hides or unhides the kerbal IVA model of the currently controlled crew member.
        /// </summary>
        /// <param name="hidden"></param>
        public void HideCurrentKerbal(bool hidden)
        {
            try
            {
                // Set the visible/invisible state for each component of the kerbal model.
                // This won't unhide a helmet hidden elsewhere.
                if (ActiveKerbal != null)
                {
                    Renderer[] renderers = ActiveKerbal.KerbalRef.GetComponentsInChildren<Renderer>();
                    foreach (var r in renderers)
                    {
                        r.enabled = !hidden;
                    }
                }
            }
            catch (Exception ex)
            {
                Debug.LogError("[FreeIVA] Error hiding current kerbal: " + ex.Message + ", " + ex.StackTrace);
            }
        }

        public bool IsTargeted(Vector3 position)
        {
            float distance = Vector3.Distance(position, InternalCamera.Instance.transform.position);
            float angle = Vector3.Angle(position - InternalCamera.Instance.transform.position, InternalCamera.Instance.transform.forward);

            if (angle > 90)
                return false;

            float radius = (distance * Mathf.Sin(angle * Mathf.Deg2Rad)) / Mathf.Sin((90 - angle) * Mathf.Deg2Rad);
            return (radius <= ObjectInteractionRadius);
        }

        public void TargetSeats()
        {
            float closestDistance = MaxInteractDistance;
            TargetedSeat = null;
            TargetedSeatIndex = -1;
            if (FreeIva.CurrentPart.internalModel == null)
                return;

            for (int i = 0; i < FreeIva.CurrentPart.internalModel.seats.Count; i++)
            {
                if (FreeIva.CurrentPart.internalModel.seats[i].taken && !FreeIva.CurrentPart.internalModel.seats[i].crew.Equals(ActiveKerbal))
                    continue;

                if (IsTargeted(FreeIva.CurrentPart.internalModel.seats[i].seatTransform.position))
                {
                    float distance = Vector3.Distance(FreeIva.CurrentPart.internalModel.seats[i].seatTransform.position,
                        InternalCamera.Instance.transform.position);
                    if (distance < closestDistance)
                    {
                        TargetedSeat = FreeIva.CurrentPart.internalModel.seats[i];
                        TargetedSeatIndex = i;
                        closestDistance = distance;
                    }
                }
            }

            if (TargetedSeat != null)
                ScreenMessages.PostScreenMessage("Enter seat [" + Settings.UnbuckleKey + "] (Not working yet)", 0.1f, ScreenMessageStyle.LOWER_CENTER);
        }

        public void TargetHatches()
        {
            if (FreeIva.CurrentModuleFreeIva == null || FreeIva.CurrentModuleFreeIva.Hatches.Count == 0) return;

            Hatch targetedHatch = null;
            float closestDistance = MaxInteractDistance;
            //for (int i = 0; i < CurrentModuleFreeIva.Hatches.Count; i++)
            foreach (Hatch h in FreeIva.CurrentModuleFreeIva.Hatches)
            {
                if (IsTargeted(h.WorldPosition))
                {
                    float distance = Vector3.Distance(h.WorldPosition, InternalCamera.Instance.transform.position);
                    if (distance < closestDistance)
                    {
                        targetedHatch = h;
                        closestDistance = distance;
                    }
                }
            }
            if (targetedHatch != null)
            {
                ScreenMessages.PostScreenMessage((targetedHatch.IsOpen ? "Close" : "Open") + " hatch [" + Settings.OpenHatchKey + "]",
                        0.1f, ScreenMessageStyle.LOWER_CENTER);

                if (Input.GetKeyDown(Settings.OpenHatchKey) && !Input.GetKey(Settings.ModifierKey))
                    targetedHatch.Toggle();

                // Allow reaching through an open hatch to open or close the connected hatch.
                if (targetedHatch.IsOpen && targetedHatch.ConnectedHatch != null && IsTargeted(targetedHatch.ConnectedHatch.WorldPosition))
                {
                    float distance = Vector3.Distance(targetedHatch.ConnectedHatch.WorldPosition, InternalCamera.Instance.transform.position);
                    if (distance < MaxInteractDistance)
                    {
                        ScreenMessages.PostScreenMessage((targetedHatch.ConnectedHatch.IsOpen ? "Close" : "Open") + " far hatch [" + Settings.ModifierKey + " + " + Settings.OpenHatchKey + "]",
                                0.1f, ScreenMessageStyle.LOWER_CENTER);
                        if (Input.GetKeyDown(Settings.OpenHatchKey) && Input.GetKey(Settings.ModifierKey))
                            targetedHatch.ConnectedHatch.Toggle();
                    }
                }
            }
        }

        public void GetOrientation()
        {
            float yaw = 0;
            float pitch = 0;
            float roll = 0;

            if (!cameraPositionLocked)
            {
#if true
                float mouseX = Input.GetAxis("Mouse X");
                yaw = mouseX * Settings.YawSpeed;
                float mouseY = Input.GetAxis("Mouse Y");
                pitch = -mouseY * Settings.PitchSpeed;
#else
                yaw = 0;
                if (Input.GetKey(KeyCode.L))
                    yaw = Settings.YawSpeed * Time.deltaTime * 10;
                else if (Input.GetKey(KeyCode.J))
                    yaw = -Settings.YawSpeed * Time.deltaTime * 10;
                pitch = 0;
                if (Input.GetKey(KeyCode.I))
                    pitch = Settings.PitchSpeed * Time.deltaTime * 10;
                else if (Input.GetKey(KeyCode.K))
                    pitch = -Settings.PitchSpeed * Time.deltaTime * 10;
                roll = 0;
#endif

            }
            if (Input.GetKey(Settings.RollCCWKey))
                roll = Settings.RollSpeed * Time.deltaTime;
            else if (Input.GetKey(Settings.RollCWKey))
                roll = -Settings.RollSpeed * Time.deltaTime;

            Quaternion rotYaw = Quaternion.AngleAxis(yaw, previousRotation * Vector3.up);
            Quaternion rotPitch = Quaternion.AngleAxis(pitch, previousRotation * Vector3.right);// *Quaternion.Euler(0, 90, 0);
            Quaternion rotRoll = Quaternion.AngleAxis(roll, previousRotation * Vector3.forward);
            Transform cameraTransform = InternalCamera.Instance.transform;
            cameraTransform.rotation = rotRoll * rotPitch * rotYaw * previousRotation;
            previousRotation = cameraTransform.rotation;
            FlightCamera.fetch.transform.rotation = InternalSpace.InternalToWorld(cameraTransform.rotation);
        }

        private void GetPosition()
        {
            float moveForward = Input.GetKey(Settings.ForwardKey) ? Settings.ForwardSpeed * Time.deltaTime : 0;
            moveForward -= Input.GetKey(Settings.BackwardKey) ? Settings.ForwardSpeed * Time.deltaTime : 0;
            float moveRight = Input.GetKey(Settings.RightKey) ? Settings.HorizontalSpeed * Time.deltaTime : 0;
            moveRight -= Input.GetKey(Settings.LeftKey) ? Settings.HorizontalSpeed * Time.deltaTime : 0;
            float moveUp = Input.GetKey(Settings.UpKey) ? Settings.VerticalSpeed * Time.deltaTime : 0;
            moveUp -= Input.GetKey(Settings.DownKey) ? Settings.VerticalSpeed * Time.deltaTime : 0;
            Vector3 movement = new Vector3(moveRight, moveUp, moveForward);
            //ScreenMessages.PostScreenMessage("Forward: " + moveForward + ", Right: " + moveRight + ", Up: " + moveUp);


            // Make the movement relative to the camera rotation.
            Vector3 newPos = /*previousPos*/ KerbalCollider.transform.localPosition + (InternalCamera.Instance.transform.localRotation * movement);
            //cameraCollider.transform.localPosition = newPos;

            KerbalCollider.rigidbody.velocity = new Vector3(0, 0, 0);
            KerbalCollider.rigidbody.MovePosition(newPos);

            //InternalCamera.Instance.transform.localPosition = newPos;
            FlightCamera.fetch.transform.position = InternalSpace.InternalToWorld(InternalCamera.Instance.transform.position);
            //previousPos = newPos;
        }
    }
}
