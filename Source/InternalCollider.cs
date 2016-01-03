using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;

namespace FreeIva
{
    public class InternalCollider : IvaObject
    {
        public PrimitiveType ColliderType = PrimitiveType.Cube;

        private Rigidbody _rigidbody = null;
        private Rigidbody Rigidbody
        {
            get
            {
                if (_rigidbody == null)
                {
                    _rigidbody = IvaGameObject.GetComponent<Rigidbody>();
                    return _rigidbody;
                }
                return _rigidbody;
            }
        }

        public bool Visible
        {
            get { return IvaGameObject.renderer.enabled; }
            set
            {
                if (!AlwaysVisible)
                    IvaGameObject.renderer.enabled = value;
            }
        }
        public bool AlwaysVisible = false;

        public override void Instantiate(Part p)
        {
            Instantiate(p, ColliderType);
        }

        public void Instantiate(Part p, PrimitiveType colliderType)
        {
            Debug.Log("# Creating internal collider " + Name + " for part " + p);
            if (IvaGameObject != null)
            {
                Debug.LogError("[FreeIVA] InternalCollider " + Name + " has already been instantiated.");
                return;
            }
      
            // These values will be cleared on creating the object.
            Vector3 scale = Scale;
            Vector3 localPosition = LocalPosition;
            Quaternion rotation = Rotation;

            IvaGameObject = GameObject.CreatePrimitive(colliderType);
            IvaGameObject.layer = (int)Layers.Kerbals;
            IvaGameObject.collider.enabled = true;
            //IvaGameObject.collider.isTrigger = true;
            IvaGameObject.transform.parent = p.internalModel.transform;
            IvaGameObject.layer = (int)Layers.Kerbals;
            IvaGameObject.transform.localScale = scale;
            IvaGameObject.transform.localPosition = localPosition;
            IvaGameObject.transform.localRotation = rotation;
            IvaGameObject.name = Name;
            //IvaGameObject.AddComponent<IvaCollisionPrinter>();
            //FixedJoint joint = IvaGameObject.AddComponent<FixedJoint>();
            //joint.connectedBody = p.collider.rigidbody;
            if (IvaGameObject.GetComponent<Rigidbody>() == null)
            {
                Rigidbody rb = IvaGameObject.AddComponent<Rigidbody>();
                rb.useGravity = false;

                rb.constraints = RigidbodyConstraints.FreezeAll;
            }

            if (AlwaysVisible)
            {
                // Change the colour from the default white.
                IvaGameObject.renderer.material.color = Color.grey;
            }
            else
                IvaGameObject.renderer.enabled = false;
        }

        public void Enable(bool enabled)
        {
            IvaGameObject.collider.enabled = enabled;
        }

        public static void HideAllColliders()
        {
            foreach (Part p in FlightGlobals.ActiveVessel.Parts)
            {
                ModuleFreeIva mfi = p.GetModule<ModuleFreeIva>();
                if (mfi != null)
                {
                    for (int i = 0; i < mfi.InternalColliders.Count; i++)
                    {
                        if (!mfi.InternalColliders[i].AlwaysVisible)
                            mfi.InternalColliders[i].Visible = false;
                    }
                }
            }
        }
    }
}
