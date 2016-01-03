using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FreeIva
{
    public static class ExtensionMethods
    {
        public static ModuleFreeIva GetModule<PartModule>(this Part p)
        {
            if (p == null || p.Modules == null) return null;
            List<ModuleFreeIva> mfil = p.Modules.GetModules<ModuleFreeIva>();
            if (mfil == null || mfil.Count == 0)
                return null;
            return mfil[0];
        }
    }
}
