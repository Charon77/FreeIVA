using System.Collections.Generic;
using UnityEngine;

namespace FreeIva
{
    public static class GuiUtils
    {
        public static void SetupGui()
        {
            RenderingManager.AddToPostDrawQueue(3, new Callback(drawGUI));
        }
        public static void label(string text, object obj)
        {
            GUILayout.BeginHorizontal();
            GUILayout.Label(text);
            GUILayout.FlexibleSpace();
            GUILayout.Label(obj == null ? "null" : obj.ToString(), GUILayout.Width(100));
            GUILayout.EndHorizontal();
        }
        public static float editValue(string text, float value)
        {
            GUILayout.BeginHorizontal();
            GUILayout.Label(text);
            GUILayout.FlexibleSpace();
            string v = GUILayout.TextField(value.ToString());
            float f = value;
            float.TryParse(v, out f);
            GUILayout.EndHorizontal();
            return f;
        }
        public static void slider(string label, ref float variable, float from, float to)
        {
            GUILayout.BeginHorizontal();
            GUILayout.Label(label + ": " + variable.ToString());
            GUILayout.FlexibleSpace();
            variable = GUILayout.HorizontalSlider(variable, from, to, GUILayout.Width(100));
            GUILayout.EndHorizontal();
        }
        public static Color rgbaSlider(string label, ref float r, ref float g, ref float b, ref float a, float from, float to)
        {
            GUILayout.Label(label);
            slider("r", ref r, from, to);
            slider("g", ref g, from, to);
            slider("b", ref b, from, to);
            slider("a", ref a, from, to);
            return new Color(r, g, b, a);

        }

        public static bool DrawGui = true;
        private static Rect windowPos = new Rect(Screen.width / 4, Screen.height / 4, 10f, 10f);
        public static void drawGUI()
        {
            if (DrawGui)
            windowPos = GUILayout.Window(-5234629, windowPos, mainGUI, "Free IVA", GUILayout.Width(600), GUILayout.Height(50));
        }
        private static void mainGUI(int windowID)
        {
            GUILayout.BeginVertical();

            FreeIva.Gui();

            GUILayout.EndVertical();
            GUI.DragWindow();
        }


        static float x = 0;
        static float y = 0;
        public static KeyValuePair<float, float> GetSliderXY()
        {
            return new KeyValuePair<float, float>(x, y);
        }
    }
}
