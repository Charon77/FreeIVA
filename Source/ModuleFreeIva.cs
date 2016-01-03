using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;

// Assistance received from: blowfish, stupid_chris
namespace FreeIva
{
    /// <summary>
    /// A PartModule used to define what additional objects a part should have, such as hatches and colldiers.
    /// </summary>
    public class ModuleFreeIva : PartModule
    {
        private static char[] _splitChars = new char[] { ',', ' ', '\t' };
        public bool CanIva = true;
        public List<Hatch> Hatches = new List<Hatch>();
        public List<InternalCollider> InternalColliders = new List<InternalCollider>();

        public override void OnStart(StartState state)
        {
            if (HighLogic.LoadedScene != GameScenes.FLIGHT) return;
            if (Hatches == null)
                Debug.LogError("[FreeIVA] Startup error: Hatches null");
            foreach (Hatch h in Hatches)
                h.Instantiate(part);

            foreach (InternalCollider c in InternalColliders)
                c.Instantiate(part);
        }

        public override void OnAwake()
        {
            if (HighLogic.LoadedScene != GameScenes.FLIGHT) return;
            //Debug.Log("# PartInfo name " + part.partInfo.name);
            Hatches = new List<Hatch>(PersistenceManager.instance.GetPartHatches(part.partInfo.name));
            InternalColliders = new List<InternalCollider>(PersistenceManager.instance.GetPartColliders(part.partInfo.name));
        }

        /*public override void OnSave(ConfigNode node)
        {
            Debug.Log("# OnSave " + node);
            return;
            base.OnSave(node);
            Debug.Log("# Saving hatches");
            ConfigNode hatchNode = new ConfigNode("Hatch");
            foreach (Hatch h in Hatches)
            {
                hatchNode.AddValue("attachNodeId", h.AttachNodeId);
                hatchNode.AddValue("position", h.Position.x + ", " +  h.Position.y + ", " + h.Position.z);
                hatchNode.AddValue("scale", h.Scale.x + ", " + h.Scale.y + ", " + h.Scale.z);
            }
            Debug.Log("# Adding hatch node " + hatchNode);
            node.AddNode(hatchNode);
        }*/

        public override void OnLoad(ConfigNode node)
        {
            if (node.HasValue("CanIva"))
                CanIva = bool.Parse(node.GetValue("CanIva"));

            if (node.HasNode("Hatch"))
            {
                ConfigNode[] hatchNodes = node.GetNodes("Hatch");
                foreach (var hn in hatchNodes)
                {
                    Hatch h = ParseHatch(hn);
                    if (h != null)
                    {
                        Hatches.Add(h);
                        if (h.Collider != null)
                            InternalColliders.Add(h.Collider);
                    }
                }
                PersistenceManager.instance.AddHatches(part.name, Hatches);
            }
            Debug.Log("# Hatches loaded from config for part " + part.name + ": " + Hatches.Count);

            if (node.HasNode("InternalCollider"))
            {
                ConfigNode[] colliderNodes = node.GetNodes("InternalCollider");
                foreach (var cn in colliderNodes)
                {
                    InternalCollider ic = ParseInternalCollider(cn);
                    if (ic != null)
                        InternalColliders.Add(ic);
                }
                PersistenceManager.instance.AddInternalColliders(part.name, InternalColliders);
                Debug.Log("# Internal colliders loaded from config for part " + part.name + ": " + InternalColliders.Count);
            }
        }

        private Hatch ParseHatch(ConfigNode node)
        {
            Vector3 position = Vector3.zero;
            Vector3 scale = Vector3.one;
            if (!node.HasValue("attachNodeId"))
            {
                Debug.LogWarning("[FreeIVA] Hatch attachNodeId not found: Skipping hatch.");
                return null;
            }
            Hatch hatch = new Hatch();

            hatch.AttachNodeId = node.GetValue("attachNodeId");

            if (node.HasValue("position"))
            {
                string posString = node.GetValue("position");
                string[] p = posString.Split(_splitChars, StringSplitOptions.RemoveEmptyEntries);
                if (p.Length != 3)
                {
                    Debug.LogWarning("[FreeIVA] Invalid hatch position definition \"" + posString + "\": Must be in the form x, y, z.");
                    return null;
                }
                else
                    hatch.LocalPosition = new Vector3(float.Parse(p[0]), float.Parse(p[1]), float.Parse(p[2]));
            }
            else
            {
                Debug.LogWarning("[FreeIVA] Hatch position not found: Skipping hatch.");
                return null;
            }

            if (node.HasValue("scale"))
            {
                string scaleString = node.GetValue("scale");
                string[] s = scaleString.Split(_splitChars, StringSplitOptions.RemoveEmptyEntries);
                if (s.Length != 3)
                {
                    Debug.LogWarning("[FreeIVA] Invalid hatch scale definition \"" + scaleString + "\": Must be in the form x, y, z.");
                    return null;
                }
                else
                    hatch.Scale = new Vector3(float.Parse(s[0]), float.Parse(s[1]), float.Parse(s[2]));
            }
            else
            {
                Debug.LogWarning("[FreeIVA] Hatch scale not found: Skipping hatch.");
                return null;
            }

            if (node.HasValue("rotation"))
            {
                string rotationString = node.GetValue("rotation");
                string[] s = rotationString.Split(_splitChars, StringSplitOptions.RemoveEmptyEntries);
                if (s.Length != 3)
                {
                    Debug.LogWarning("[FreeIVA] Invalid hatch rotation definition \"" + rotationString + "\": Must be in the form x, y, z.");
                    return null;
                }
                else
                    hatch.Rotation = Quaternion.Euler(float.Parse(s[0]), float.Parse(s[1]), float.Parse(s[2]));
            }
            else
            {
                Debug.LogWarning("[FreeIVA] Hatch rotation not found: Skipping hatch.");
                return null;
            }

            if (node.HasNode("HideWhenOpen"))
            {
                ConfigNode[] hideNodes = node.GetNodes("HideWhenOpen");
                foreach (var hideNode in hideNodes)
                {
                    if (!hideNode.HasValue("name"))
                    {
                        Debug.LogWarning("[FreeIVA] HideWhenOpen name not found.");
                        continue;
                    }
                    string propName = hideNode.GetValue("name");
                    Vector3 propPos;

                    if (hideNode.HasValue("position"))
                    {
                        string posString = hideNode.GetValue("position");
                        string[] p = posString.Split(_splitChars, StringSplitOptions.RemoveEmptyEntries);
                        if (p.Length != 3)
                        {
                            Debug.LogWarning("[FreeIVA] Invalid HideWhenOpen position definition \"" + posString + "\": Must be in the form x, y, z.");
                            continue;
                        }
                        else
                        {
                            propPos = new Vector3(float.Parse(p[0]), float.Parse(p[1]), float.Parse(p[2]));
                        }
                    }
                    else
                    {
                        Debug.LogWarning("[FreeIVA] Hatch position not found: Skipping hatch.");
                        continue;
                    }

                    hatch.HideWhenOpen.Add(new KeyValuePair<Vector3, string>(propPos, propName));
                }
            }

            if (node.HasNode("InternalCollider"))
            {
                ConfigNode hatchColliderNode = node.GetNode("InternalCollider");
                if (hatchColliderNode != null)
                    hatch.Collider = ParseInternalCollider(hatchColliderNode);
            }
            return hatch;
        }

        private InternalCollider ParseInternalCollider(ConfigNode node)
        {
            Vector3 position = Vector3.zero;
            if (!node.HasValue("type"))
            {
                Debug.LogWarning("[FreeIVA] InternalCollider type not found: Skipping collider.");
                return null;
            }
            InternalCollider internalCollider = new InternalCollider();
            internalCollider.ColliderType = (PrimitiveType)Enum.Parse(typeof(PrimitiveType), node.GetValue("type"));

            if (node.HasValue("name"))
            {
                internalCollider.Name = node.GetValue("name");
            }

            if (node.HasValue("alwaysVisible"))
            {
                internalCollider.AlwaysVisible = bool.Parse(node.GetValue("alwaysVisible"));
            }

            if (node.HasValue("position"))
            {
                string posString = node.GetValue("position");
                string[] p = posString.Split(_splitChars, StringSplitOptions.RemoveEmptyEntries);
                if (p.Length != 3)
                {
                    Debug.LogWarning("[FreeIVA] Invalid collider position definition \"" + posString + "\": Must be in the form x, y, z.");
                    return null;
                }
                else
                    internalCollider.LocalPosition = new Vector3(float.Parse(p[0]), float.Parse(p[1]), float.Parse(p[2]));
            }
            else
            {
                Debug.LogWarning("[FreeIVA] Collider position not found: Skipping collider.");
                return null;
            }

            if (node.HasValue("scale"))
            {
                string scaleString = node.GetValue("scale");
                string[] s = scaleString.Split(_splitChars, StringSplitOptions.RemoveEmptyEntries);
                if (s.Length != 3)
                {
                    Debug.LogWarning("[FreeIVA] Invalid collider scale definition \"" + scaleString + "\": Must be in the form x, y, z.");
                    return null;
                }
                else
                    internalCollider.Scale = new Vector3(float.Parse(s[0]), float.Parse(s[1]), float.Parse(s[2]));
            }
            else
            {
                Debug.LogWarning("[FreeIVA] Collider scale not found: Skipping collider.");
                return null;
            }

            if (node.HasValue("rotation"))
            {
                string rotationString = node.GetValue("rotation");
                string[] s = rotationString.Split(_splitChars, StringSplitOptions.RemoveEmptyEntries);
                if (s.Length != 3)
                {
                    Debug.LogWarning("[FreeIVA] Invalid collider rotation definition \"" + rotationString + "\": Must be in the form x, y, z.");
                    return null;
                }
                else
                    internalCollider.Rotation = Quaternion.Euler(float.Parse(s[0]), float.Parse(s[1]), float.Parse(s[2]));
            }
            else
            {
                Debug.LogWarning("[FreeIVA] Collider rotation not found: Skipping collider.");
                return null;
            }
            return internalCollider;
        }

        /*public void OnDestroy()
        {
            /*Debug.Log("#Destroying");
            foreach (Hatch h in Hatches)
                h.Destroy();
            Hatches.Clear();* /
        }*/
    }
}
