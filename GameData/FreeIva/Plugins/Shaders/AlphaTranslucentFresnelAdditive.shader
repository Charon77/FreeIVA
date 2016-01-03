// Compiled shader for all platforms, uncompressed size: 710.0KB

Shader "KSP/Specular Layered" {
Properties {
 _MainTex ("Diffuse (4x grayscale in RGBA)", 2D) = "white" {}
 _Emissive ("Color mask (RGBA)", 2D) = "white" {}
 _SpecColor ("Specular Color", Color) = (0.5,0.5,0.5,1)
 _Shininess ("Shininess", Range(0.03,1)) = 0.078125
 _Opacity ("_Opacity", Range(0,1)) = 1
 _RimFalloff ("_RimFalloff", Range(0.01,5)) = 0.1
 _RimColor ("_RimColor", Color) = (0,0,0,0)
}
SubShader { 


 // Stats for Vertex shader:
 //       d3d11 : 36 avg math (18..66)
 //        d3d9 : 45 avg math (22..84)
 //      opengl : 43 avg math (21..81)
 // Stats for Fragment shader:
 //       d3d11 : 43 avg math (29..56), 3 avg texture (2..5)
 //        d3d9 : 57 avg math (39..71), 3 avg texture (2..5)
 //      opengl : 55 avg math (39..69), 3 avg texture (2..5)
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" }
  Blend SrcAlpha OneMinusSrcAlpha
Program "vp" {
SubProgram "opengl " {
// Stats: 45 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_SHAr]
Vector 16 [unity_SHAg]
Vector 17 [unity_SHAb]
Vector 18 [unity_SHBr]
Vector 19 [unity_SHBg]
Vector 20 [unity_SHBb]
Vector 21 [unity_SHC]
Vector 22 [unity_Scale]
Vector 23 [_MainTex_ST]
Vector 24 [_Emissive_ST]
"3.0-!!ARBvp1.0
PARAM c[25] = { { 1 },
		state.matrix.mvp,
		program.local[5..24] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[22].w;
DP3 R2.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[17];
DP4 R2.y, R0, c[16];
DP4 R2.x, R0, c[15];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[20];
DP4 R3.y, R1, c[19];
DP4 R3.x, R1, c[18];
ADD R2.xyz, R2, R3;
MAD R0.x, R0, R0, -R0.y;
MUL R3.xyz, R0.x, c[21];
MOV R1.xyz, vertex.attrib[14];
MUL R0.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R1.zxyw, -R0;
ADD result.texcoord[3].xyz, R2, R3;
MOV R0.xyz, c[13];
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
MAD R0.xyz, R2, c[22].w, -vertex.position;
MUL R2.xyz, R1, vertex.attrib[14].w;
MOV R1, c[14];
DP4 R3.z, R1, c[11];
DP4 R3.x, R1, c[9];
DP4 R3.y, R1, c[10];
DP3 result.texcoord[1].y, R0, R2;
DP3 result.texcoord[2].y, R2, R3;
DP3 result.texcoord[1].z, vertex.normal, R0;
DP3 result.texcoord[1].x, R0, vertex.attrib[14];
DP3 result.texcoord[2].z, vertex.normal, R3;
DP3 result.texcoord[2].x, vertex.attrib[14], R3;
MOV result.color, vertex.color;
MAD result.texcoord[0].zw, vertex.texcoord[1].xyxy, c[24].xyxy, c[24];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[23], c[23].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 45 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 48 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_SHAr]
Vector 15 [unity_SHAg]
Vector 16 [unity_SHAb]
Vector 17 [unity_SHBr]
Vector 18 [unity_SHBg]
Vector 19 [unity_SHBb]
Vector 20 [unity_SHC]
Vector 21 [unity_Scale]
Vector 22 [_MainTex_ST]
Vector 23 [_Emissive_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_color0 o3
dcl_texcoord2 o4
dcl_texcoord3 o5
def c24, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mul r1.xyz, v2, c21.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c24.x
dp4 r2.z, r0, c16
dp4 r2.y, r0, c15
dp4 r2.x, r0, c14
mul r0.y, r2.w, r2.w
dp4 r3.z, r1, c19
dp4 r3.y, r1, c18
dp4 r3.x, r1, c17
add r1.xyz, r2, r3
mad r0.x, r0, r0, -r0.y
mul r2.xyz, r0.x, c20
add o5.xyz, r1, r2
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r3.xyz, r0, v1.w
mov r0, c10
dp4 r4.z, c13, r0
mov r0, c9
mov r1.w, c24.x
mov r1.xyz, c12
dp4 r4.y, c13, r0
dp4 r2.z, r1, c10
dp4 r2.x, r1, c8
dp4 r2.y, r1, c9
mad r2.xyz, r2, c21.w, -v0
mov r1, c8
dp4 r4.x, c13, r1
dp3 o2.y, r2, r3
dp3 o4.y, r3, r4
dp3 o2.z, v2, r2
dp3 o2.x, r2, v1
dp3 o4.z, v2, r4
dp3 o4.x, v1, r4
mov o3, v5
mad o1.zw, v4.xyxy, c23.xyxy, c23
mad o1.xy, v3, c22, c22.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 39 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 112
Vector 80 [_MainTex_ST]
Vector 96 [_Emissive_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedgmdfmmhogmhcinooaomgoldadjokobmlabaaaaaaceaiaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefcgmagaaaaeaaaabaajlabaaaa
fjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaad
pcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaacaeaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaa
dcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaagaaaaaa
kgiocaaaaaaaaaaaagaaaaaadiaaaaahhcaabaaaaaaaaaaajgbebaaaabaaaaaa
cgbjbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaajgbebaaaacaaaaaacgbjbaaa
abaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaapgbpbaaaabaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaabaaaaaa
aeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaa
egacbaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaa
adaaaaaabdaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaa
adaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaahcccabaaaacaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbccabaaaacaaaaaaegbcbaaa
abaaaaaaegacbaaaabaaaaaabaaaaaaheccabaaaacaaaaaaegbcbaaaacaaaaaa
egacbaaaabaaaaaadgaaaaafpccabaaaadaaaaaaegbobaaaafaaaaaadiaaaaaj
hcaabaaaabaaaaaafgifcaaaacaaaaaaaaaaaaaaegiccaaaadaaaaaabbaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaacaaaaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaa
bcaaaaaakgikcaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaa
abaaaaaaegiccaaaadaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
baaaaaahbccabaaaaeaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaah
eccabaaaaeaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaa
aaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaa
aaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaa
egadbaaaaaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaai
bcaabaaaabaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaai
ccaabaaaabaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaai
ecaabaaaabaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaah
pcaabaaaacaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaa
adaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaa
adaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaa
adaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahccaabaaaaaaaaaaa
bkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaakaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaa
afaaaaaaegiccaaaacaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaa
doaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec3 shlight_3;
  highp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  mat3 tmpvar_7;
  tmpvar_7[0] = _Object2World[0].xyz;
  tmpvar_7[1] = _Object2World[1].xyz;
  tmpvar_7[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_8 = tmpvar_1.xyz;
  tmpvar_9 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_10;
  tmpvar_10[0].x = tmpvar_8.x;
  tmpvar_10[0].y = tmpvar_9.x;
  tmpvar_10[0].z = tmpvar_2.x;
  tmpvar_10[1].x = tmpvar_8.y;
  tmpvar_10[1].y = tmpvar_9.y;
  tmpvar_10[1].z = tmpvar_2.y;
  tmpvar_10[2].x = tmpvar_8.z;
  tmpvar_10[2].y = tmpvar_9.z;
  tmpvar_10[2].z = tmpvar_2.z;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_11;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = _WorldSpaceCameraPos;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = (tmpvar_7 * (tmpvar_2 * unity_Scale.w));
  mediump vec3 tmpvar_14;
  mediump vec4 normal_15;
  normal_15 = tmpvar_13;
  highp float vC_16;
  mediump vec3 x3_17;
  mediump vec3 x2_18;
  mediump vec3 x1_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHAr, normal_15);
  x1_19.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHAg, normal_15);
  x1_19.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHAb, normal_15);
  x1_19.z = tmpvar_22;
  mediump vec4 tmpvar_23;
  tmpvar_23 = (normal_15.xyzz * normal_15.yzzx);
  highp float tmpvar_24;
  tmpvar_24 = dot (unity_SHBr, tmpvar_23);
  x2_18.x = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHBg, tmpvar_23);
  x2_18.y = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHBb, tmpvar_23);
  x2_18.z = tmpvar_26;
  mediump float tmpvar_27;
  tmpvar_27 = ((normal_15.x * normal_15.x) - (normal_15.y * normal_15.y));
  vC_16 = tmpvar_27;
  highp vec3 tmpvar_28;
  tmpvar_28 = (unity_SHC.xyz * vC_16);
  x3_17 = tmpvar_28;
  tmpvar_14 = ((x1_19 + x2_18) + x3_17);
  shlight_3 = tmpvar_14;
  tmpvar_6 = shlight_3;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = (tmpvar_10 * (((_World2Object * tmpvar_12).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = xlv_COLOR0;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  lowp float tmpvar_6;
  mediump float rim_7;
  highp vec4 mask_8;
  highp vec4 color_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  color_9 = tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Emissive, xlv_TEXCOORD0.xy);
  mask_8 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_7 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = ((_RimColor.xyz * pow (rim_7, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_14;
  tmpvar_14.x = color_9.x;
  tmpvar_14.y = mask_8.x;
  highp vec2 tmpvar_15;
  tmpvar_15.x = color_9.y;
  tmpvar_15.y = mask_8.y;
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_9.z;
  tmpvar_16.y = mask_8.z;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_9.w;
  tmpvar_17.y = mask_8.w;
  highp vec2 tmpvar_18;
  tmpvar_18 = mix (mix (tmpvar_14, tmpvar_15, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_16, tmpvar_17, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_19;
  tmpvar_19 = mix (tmpvar_18.xxx, mix (mix (vec3(clamp ((tmpvar_18.x + ((1.0 - tmpvar_18.y) * pow (tmpvar_18.x, 2.0))), 0.0, 1.0)), tmpvar_2.xyz, tmpvar_18.yyy), tmpvar_2.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_2.w, 0.0, 1.0)));
  tmpvar_3 = tmpvar_19;
  tmpvar_4 = tmpvar_13;
  highp float tmpvar_20;
  tmpvar_20 = tmpvar_18.x;
  tmpvar_5 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_4 * _Opacity);
  tmpvar_4 = tmpvar_21;
  tmpvar_6 = _Opacity;
  highp vec3 tmpvar_22;
  tmpvar_22 = normalize(xlv_TEXCOORD1);
  mediump vec3 viewDir_23;
  viewDir_23 = tmpvar_22;
  lowp vec4 c_24;
  highp float nh_25;
  lowp float tmpvar_26;
  tmpvar_26 = max (0.0, xlv_TEXCOORD2.z);
  mediump float tmpvar_27;
  tmpvar_27 = max (0.0, normalize((xlv_TEXCOORD2 + viewDir_23)).z);
  nh_25 = tmpvar_27;
  mediump float arg1_28;
  arg1_28 = (_Shininess * 128.0);
  highp float tmpvar_29;
  tmpvar_29 = (pow (nh_25, arg1_28) * tmpvar_5);
  highp vec3 tmpvar_30;
  tmpvar_30 = ((((tmpvar_3 * _LightColor0.xyz) * tmpvar_26) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_29)) * 2.0);
  c_24.xyz = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (tmpvar_6 + ((_LightColor0.w * _SpecColor.w) * tmpvar_29));
  c_24.w = tmpvar_31;
  c_1.w = c_24.w;
  c_1.xyz = (c_24.xyz + (tmpvar_3 * xlv_TEXCOORD3));
  c_1.xyz = (c_1.xyz + tmpvar_4);
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec3 shlight_3;
  highp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  mat3 tmpvar_7;
  tmpvar_7[0] = _Object2World[0].xyz;
  tmpvar_7[1] = _Object2World[1].xyz;
  tmpvar_7[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_8 = tmpvar_1.xyz;
  tmpvar_9 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_10;
  tmpvar_10[0].x = tmpvar_8.x;
  tmpvar_10[0].y = tmpvar_9.x;
  tmpvar_10[0].z = tmpvar_2.x;
  tmpvar_10[1].x = tmpvar_8.y;
  tmpvar_10[1].y = tmpvar_9.y;
  tmpvar_10[1].z = tmpvar_2.y;
  tmpvar_10[2].x = tmpvar_8.z;
  tmpvar_10[2].y = tmpvar_9.z;
  tmpvar_10[2].z = tmpvar_2.z;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_11;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = _WorldSpaceCameraPos;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = (tmpvar_7 * (tmpvar_2 * unity_Scale.w));
  mediump vec3 tmpvar_14;
  mediump vec4 normal_15;
  normal_15 = tmpvar_13;
  highp float vC_16;
  mediump vec3 x3_17;
  mediump vec3 x2_18;
  mediump vec3 x1_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHAr, normal_15);
  x1_19.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHAg, normal_15);
  x1_19.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHAb, normal_15);
  x1_19.z = tmpvar_22;
  mediump vec4 tmpvar_23;
  tmpvar_23 = (normal_15.xyzz * normal_15.yzzx);
  highp float tmpvar_24;
  tmpvar_24 = dot (unity_SHBr, tmpvar_23);
  x2_18.x = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHBg, tmpvar_23);
  x2_18.y = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHBb, tmpvar_23);
  x2_18.z = tmpvar_26;
  mediump float tmpvar_27;
  tmpvar_27 = ((normal_15.x * normal_15.x) - (normal_15.y * normal_15.y));
  vC_16 = tmpvar_27;
  highp vec3 tmpvar_28;
  tmpvar_28 = (unity_SHC.xyz * vC_16);
  x3_17 = tmpvar_28;
  tmpvar_14 = ((x1_19 + x2_18) + x3_17);
  shlight_3 = tmpvar_14;
  tmpvar_6 = shlight_3;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = (tmpvar_10 * (((_World2Object * tmpvar_12).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = xlv_COLOR0;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  lowp float tmpvar_6;
  mediump float rim_7;
  highp vec4 mask_8;
  highp vec4 color_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  color_9 = tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Emissive, xlv_TEXCOORD0.xy);
  mask_8 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_7 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = ((_RimColor.xyz * pow (rim_7, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_14;
  tmpvar_14.x = color_9.x;
  tmpvar_14.y = mask_8.x;
  highp vec2 tmpvar_15;
  tmpvar_15.x = color_9.y;
  tmpvar_15.y = mask_8.y;
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_9.z;
  tmpvar_16.y = mask_8.z;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_9.w;
  tmpvar_17.y = mask_8.w;
  highp vec2 tmpvar_18;
  tmpvar_18 = mix (mix (tmpvar_14, tmpvar_15, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_16, tmpvar_17, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_19;
  tmpvar_19 = mix (tmpvar_18.xxx, mix (mix (vec3(clamp ((tmpvar_18.x + ((1.0 - tmpvar_18.y) * pow (tmpvar_18.x, 2.0))), 0.0, 1.0)), tmpvar_2.xyz, tmpvar_18.yyy), tmpvar_2.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_2.w, 0.0, 1.0)));
  tmpvar_3 = tmpvar_19;
  tmpvar_4 = tmpvar_13;
  highp float tmpvar_20;
  tmpvar_20 = tmpvar_18.x;
  tmpvar_5 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_4 * _Opacity);
  tmpvar_4 = tmpvar_21;
  tmpvar_6 = _Opacity;
  highp vec3 tmpvar_22;
  tmpvar_22 = normalize(xlv_TEXCOORD1);
  mediump vec3 viewDir_23;
  viewDir_23 = tmpvar_22;
  lowp vec4 c_24;
  highp float nh_25;
  lowp float tmpvar_26;
  tmpvar_26 = max (0.0, xlv_TEXCOORD2.z);
  mediump float tmpvar_27;
  tmpvar_27 = max (0.0, normalize((xlv_TEXCOORD2 + viewDir_23)).z);
  nh_25 = tmpvar_27;
  mediump float arg1_28;
  arg1_28 = (_Shininess * 128.0);
  highp float tmpvar_29;
  tmpvar_29 = (pow (nh_25, arg1_28) * tmpvar_5);
  highp vec3 tmpvar_30;
  tmpvar_30 = ((((tmpvar_3 * _LightColor0.xyz) * tmpvar_26) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_29)) * 2.0);
  c_24.xyz = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (tmpvar_6 + ((_LightColor0.w * _SpecColor.w) * tmpvar_29));
  c_24.w = tmpvar_31;
  c_1.w = c_24.w;
  c_1.xyz = (c_24.xyz + (tmpvar_3 * xlv_TEXCOORD3));
  c_1.xyz = (c_1.xyz + tmpvar_4);
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesColor;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
in vec4 _glesMultiTexCoord1;
in vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec3 xlv_TEXCOORD1;
out lowp vec4 xlv_COLOR0;
out lowp vec3 xlv_TEXCOORD2;
out lowp vec3 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec3 shlight_3;
  highp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  mat3 tmpvar_7;
  tmpvar_7[0] = _Object2World[0].xyz;
  tmpvar_7[1] = _Object2World[1].xyz;
  tmpvar_7[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_8 = tmpvar_1.xyz;
  tmpvar_9 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_10;
  tmpvar_10[0].x = tmpvar_8.x;
  tmpvar_10[0].y = tmpvar_9.x;
  tmpvar_10[0].z = tmpvar_2.x;
  tmpvar_10[1].x = tmpvar_8.y;
  tmpvar_10[1].y = tmpvar_9.y;
  tmpvar_10[1].z = tmpvar_2.y;
  tmpvar_10[2].x = tmpvar_8.z;
  tmpvar_10[2].y = tmpvar_9.z;
  tmpvar_10[2].z = tmpvar_2.z;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_11;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = _WorldSpaceCameraPos;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = (tmpvar_7 * (tmpvar_2 * unity_Scale.w));
  mediump vec3 tmpvar_14;
  mediump vec4 normal_15;
  normal_15 = tmpvar_13;
  highp float vC_16;
  mediump vec3 x3_17;
  mediump vec3 x2_18;
  mediump vec3 x1_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHAr, normal_15);
  x1_19.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHAg, normal_15);
  x1_19.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHAb, normal_15);
  x1_19.z = tmpvar_22;
  mediump vec4 tmpvar_23;
  tmpvar_23 = (normal_15.xyzz * normal_15.yzzx);
  highp float tmpvar_24;
  tmpvar_24 = dot (unity_SHBr, tmpvar_23);
  x2_18.x = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHBg, tmpvar_23);
  x2_18.y = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHBb, tmpvar_23);
  x2_18.z = tmpvar_26;
  mediump float tmpvar_27;
  tmpvar_27 = ((normal_15.x * normal_15.x) - (normal_15.y * normal_15.y));
  vC_16 = tmpvar_27;
  highp vec3 tmpvar_28;
  tmpvar_28 = (unity_SHC.xyz * vC_16);
  x3_17 = tmpvar_28;
  tmpvar_14 = ((x1_19 + x2_18) + x3_17);
  shlight_3 = tmpvar_14;
  tmpvar_6 = shlight_3;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = (tmpvar_10 * (((_World2Object * tmpvar_12).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
in highp vec4 xlv_TEXCOORD0;
in highp vec3 xlv_TEXCOORD1;
in lowp vec4 xlv_COLOR0;
in lowp vec3 xlv_TEXCOORD2;
in lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = xlv_COLOR0;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  lowp float tmpvar_6;
  mediump float rim_7;
  highp vec4 mask_8;
  highp vec4 color_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture (_MainTex, xlv_TEXCOORD0.xy);
  color_9 = tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture (_Emissive, xlv_TEXCOORD0.xy);
  mask_8 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_7 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = ((_RimColor.xyz * pow (rim_7, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_14;
  tmpvar_14.x = color_9.x;
  tmpvar_14.y = mask_8.x;
  highp vec2 tmpvar_15;
  tmpvar_15.x = color_9.y;
  tmpvar_15.y = mask_8.y;
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_9.z;
  tmpvar_16.y = mask_8.z;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_9.w;
  tmpvar_17.y = mask_8.w;
  highp vec2 tmpvar_18;
  tmpvar_18 = mix (mix (tmpvar_14, tmpvar_15, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_16, tmpvar_17, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_19;
  tmpvar_19 = mix (tmpvar_18.xxx, mix (mix (vec3(clamp ((tmpvar_18.x + ((1.0 - tmpvar_18.y) * pow (tmpvar_18.x, 2.0))), 0.0, 1.0)), tmpvar_2.xyz, tmpvar_18.yyy), tmpvar_2.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_2.w, 0.0, 1.0)));
  tmpvar_3 = tmpvar_19;
  tmpvar_4 = tmpvar_13;
  highp float tmpvar_20;
  tmpvar_20 = tmpvar_18.x;
  tmpvar_5 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_4 * _Opacity);
  tmpvar_4 = tmpvar_21;
  tmpvar_6 = _Opacity;
  highp vec3 tmpvar_22;
  tmpvar_22 = normalize(xlv_TEXCOORD1);
  mediump vec3 viewDir_23;
  viewDir_23 = tmpvar_22;
  lowp vec4 c_24;
  highp float nh_25;
  lowp float tmpvar_26;
  tmpvar_26 = max (0.0, xlv_TEXCOORD2.z);
  mediump float tmpvar_27;
  tmpvar_27 = max (0.0, normalize((xlv_TEXCOORD2 + viewDir_23)).z);
  nh_25 = tmpvar_27;
  mediump float arg1_28;
  arg1_28 = (_Shininess * 128.0);
  highp float tmpvar_29;
  tmpvar_29 = (pow (nh_25, arg1_28) * tmpvar_5);
  highp vec3 tmpvar_30;
  tmpvar_30 = ((((tmpvar_3 * _LightColor0.xyz) * tmpvar_26) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_29)) * 2.0);
  c_24.xyz = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (tmpvar_6 + ((_LightColor0.w * _SpecColor.w) * tmpvar_29));
  c_24.w = tmpvar_31;
  c_1.w = c_24.w;
  c_1.xyz = (c_24.xyz + (tmpvar_3 * xlv_TEXCOORD3));
  c_1.xyz = (c_1.xyz + tmpvar_4);
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 21 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 15 [unity_Scale]
Vector 16 [unity_LightmapST]
Vector 17 [_MainTex_ST]
Vector 18 [_Emissive_ST]
"3.0-!!ARBvp1.0
PARAM c[19] = { { 1 },
		state.matrix.mvp,
		program.local[5..18] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R1.xyz, R0, vertex.attrib[14].w;
MOV R0.xyz, c[13];
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
MAD R0.xyz, R2, c[15].w, -vertex.position;
DP3 result.texcoord[1].y, R0, R1;
DP3 result.texcoord[1].z, vertex.normal, R0;
DP3 result.texcoord[1].x, R0, vertex.attrib[14];
MOV result.color, vertex.color;
MAD result.texcoord[0].zw, vertex.texcoord[1].xyxy, c[18].xyxy, c[18];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[17], c[17].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[1], c[16], c[16].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 21 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 22 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [unity_Scale]
Vector 14 [unity_LightmapST]
Vector 15 [_MainTex_ST]
Vector 16 [_Emissive_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_color0 o3
dcl_texcoord2 o4
def c17, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r1.xyz, r0, v1.w
mov r0.xyz, c12
mov r0.w, c17.x
dp4 r2.z, r0, c10
dp4 r2.x, r0, c8
dp4 r2.y, r0, c9
mad r0.xyz, r2, c13.w, -v0
dp3 o2.y, r0, r1
dp3 o2.z, v2, r0
dp3 o2.x, r0, v1
mov o3, v5
mad o1.zw, v4.xyxy, c16.xyxy, c16
mad o1.xy, v3, c15, c15.zwzw
mad o4.xy, v4, c14, c14.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 18 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 128
Vector 80 [unity_LightmapST]
Vector 96 [_MainTex_ST]
Vector 112 [_Emissive_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecednddjkjpjnjnbjakanbjfifjceealajpgabaaaaaabiafaaaaadaaaaaa
cmaaaaaapeaaaaaajiabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaadamaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklfdeieefchiadaaaa
eaaaabaanoaaaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaa
abaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaadpcbabaaaafaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaad
hccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaaddccabaaaaeaaaaaa
giaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaa
ogikcaaaaaaaaaaaagaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaa
agiecaaaaaaaaaaaahaaaaaakgiocaaaaaaaaaaaahaaaaaadiaaaaahhcaabaaa
aaaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaa
jgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgbpbaaaabaaaaaadiaaaaajhcaabaaa
abaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaa
egacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaabcaaaaaa
kgikcaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaa
egacbaaaabaaaaaaegiccaaaacaaaaaabdaaaaaadcaaaaalhcaabaaaabaaaaaa
egacbaaaabaaaaaapgipcaaaacaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaa
baaaaaahcccabaaaacaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaah
bccabaaaacaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaaheccabaaa
acaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadgaaaaafpccabaaaadaaaaaa
egbobaaaafaaaaaadcaaaaaldccabaaaaeaaaaaaegbabaaaaeaaaaaaegiacaaa
aaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec3 tmpvar_4;
  highp vec3 tmpvar_5;
  tmpvar_4 = tmpvar_1.xyz;
  tmpvar_5 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_6;
  tmpvar_6[0].x = tmpvar_4.x;
  tmpvar_6[0].y = tmpvar_5.x;
  tmpvar_6[0].z = tmpvar_2.x;
  tmpvar_6[1].x = tmpvar_4.y;
  tmpvar_6[1].y = tmpvar_5.y;
  tmpvar_6[1].z = tmpvar_2.y;
  tmpvar_6[2].x = tmpvar_4.z;
  tmpvar_6[2].y = tmpvar_5.z;
  tmpvar_6[2].z = tmpvar_2.z;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _WorldSpaceCameraPos;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = (tmpvar_6 * (((_World2Object * tmpvar_7).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
uniform sampler2D unity_Lightmap;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 c_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = xlv_COLOR0;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump float rim_6;
  highp vec4 mask_7;
  highp vec4 color_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  color_8 = tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Emissive, xlv_TEXCOORD0.xy);
  mask_7 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_6 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = ((_RimColor.xyz * pow (rim_6, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_13;
  tmpvar_13.x = color_8.x;
  tmpvar_13.y = mask_7.x;
  highp vec2 tmpvar_14;
  tmpvar_14.x = color_8.y;
  tmpvar_14.y = mask_7.y;
  highp vec2 tmpvar_15;
  tmpvar_15.x = color_8.z;
  tmpvar_15.y = mask_7.z;
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_8.w;
  tmpvar_16.y = mask_7.w;
  highp vec2 tmpvar_17;
  tmpvar_17 = mix (mix (tmpvar_13, tmpvar_14, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_15, tmpvar_16, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_18;
  tmpvar_18 = mix (tmpvar_17.xxx, mix (mix (vec3(clamp ((tmpvar_17.x + ((1.0 - tmpvar_17.y) * pow (tmpvar_17.x, 2.0))), 0.0, 1.0)), tmpvar_2.xyz, tmpvar_17.yyy), tmpvar_2.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_2.w, 0.0, 1.0)));
  tmpvar_3 = tmpvar_18;
  tmpvar_4 = tmpvar_12;
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_4 * _Opacity);
  tmpvar_4 = tmpvar_19;
  tmpvar_5 = _Opacity;
  c_1.xyz = (tmpvar_3 * (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD2).xyz));
  c_1.w = tmpvar_5;
  c_1.xyz = (c_1.xyz + tmpvar_4);
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec3 tmpvar_4;
  highp vec3 tmpvar_5;
  tmpvar_4 = tmpvar_1.xyz;
  tmpvar_5 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_6;
  tmpvar_6[0].x = tmpvar_4.x;
  tmpvar_6[0].y = tmpvar_5.x;
  tmpvar_6[0].z = tmpvar_2.x;
  tmpvar_6[1].x = tmpvar_4.y;
  tmpvar_6[1].y = tmpvar_5.y;
  tmpvar_6[1].z = tmpvar_2.y;
  tmpvar_6[2].x = tmpvar_4.z;
  tmpvar_6[2].y = tmpvar_5.z;
  tmpvar_6[2].z = tmpvar_2.z;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _WorldSpaceCameraPos;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = (tmpvar_6 * (((_World2Object * tmpvar_7).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
uniform sampler2D unity_Lightmap;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 c_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = xlv_COLOR0;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump float rim_6;
  highp vec4 mask_7;
  highp vec4 color_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  color_8 = tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Emissive, xlv_TEXCOORD0.xy);
  mask_7 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_6 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = ((_RimColor.xyz * pow (rim_6, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_13;
  tmpvar_13.x = color_8.x;
  tmpvar_13.y = mask_7.x;
  highp vec2 tmpvar_14;
  tmpvar_14.x = color_8.y;
  tmpvar_14.y = mask_7.y;
  highp vec2 tmpvar_15;
  tmpvar_15.x = color_8.z;
  tmpvar_15.y = mask_7.z;
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_8.w;
  tmpvar_16.y = mask_7.w;
  highp vec2 tmpvar_17;
  tmpvar_17 = mix (mix (tmpvar_13, tmpvar_14, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_15, tmpvar_16, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_18;
  tmpvar_18 = mix (tmpvar_17.xxx, mix (mix (vec3(clamp ((tmpvar_17.x + ((1.0 - tmpvar_17.y) * pow (tmpvar_17.x, 2.0))), 0.0, 1.0)), tmpvar_2.xyz, tmpvar_17.yyy), tmpvar_2.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_2.w, 0.0, 1.0)));
  tmpvar_3 = tmpvar_18;
  tmpvar_4 = tmpvar_12;
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_4 * _Opacity);
  tmpvar_4 = tmpvar_19;
  tmpvar_5 = _Opacity;
  lowp vec4 tmpvar_20;
  tmpvar_20 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  c_1.xyz = (tmpvar_3 * ((8.0 * tmpvar_20.w) * tmpvar_20.xyz));
  c_1.w = tmpvar_5;
  c_1.xyz = (c_1.xyz + tmpvar_4);
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesColor;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
in vec4 _glesMultiTexCoord1;
in vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec3 xlv_TEXCOORD1;
out lowp vec4 xlv_COLOR0;
out highp vec2 xlv_TEXCOORD2;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec3 tmpvar_4;
  highp vec3 tmpvar_5;
  tmpvar_4 = tmpvar_1.xyz;
  tmpvar_5 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_6;
  tmpvar_6[0].x = tmpvar_4.x;
  tmpvar_6[0].y = tmpvar_5.x;
  tmpvar_6[0].z = tmpvar_2.x;
  tmpvar_6[1].x = tmpvar_4.y;
  tmpvar_6[1].y = tmpvar_5.y;
  tmpvar_6[1].z = tmpvar_2.y;
  tmpvar_6[2].x = tmpvar_4.z;
  tmpvar_6[2].y = tmpvar_5.z;
  tmpvar_6[2].z = tmpvar_2.z;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _WorldSpaceCameraPos;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = (tmpvar_6 * (((_World2Object * tmpvar_7).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
uniform sampler2D unity_Lightmap;
in highp vec4 xlv_TEXCOORD0;
in highp vec3 xlv_TEXCOORD1;
in lowp vec4 xlv_COLOR0;
in highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 c_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = xlv_COLOR0;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump float rim_6;
  highp vec4 mask_7;
  highp vec4 color_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture (_MainTex, xlv_TEXCOORD0.xy);
  color_8 = tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture (_Emissive, xlv_TEXCOORD0.xy);
  mask_7 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_6 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = ((_RimColor.xyz * pow (rim_6, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_13;
  tmpvar_13.x = color_8.x;
  tmpvar_13.y = mask_7.x;
  highp vec2 tmpvar_14;
  tmpvar_14.x = color_8.y;
  tmpvar_14.y = mask_7.y;
  highp vec2 tmpvar_15;
  tmpvar_15.x = color_8.z;
  tmpvar_15.y = mask_7.z;
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_8.w;
  tmpvar_16.y = mask_7.w;
  highp vec2 tmpvar_17;
  tmpvar_17 = mix (mix (tmpvar_13, tmpvar_14, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_15, tmpvar_16, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_18;
  tmpvar_18 = mix (tmpvar_17.xxx, mix (mix (vec3(clamp ((tmpvar_17.x + ((1.0 - tmpvar_17.y) * pow (tmpvar_17.x, 2.0))), 0.0, 1.0)), tmpvar_2.xyz, tmpvar_17.yyy), tmpvar_2.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_2.w, 0.0, 1.0)));
  tmpvar_3 = tmpvar_18;
  tmpvar_4 = tmpvar_12;
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_4 * _Opacity);
  tmpvar_4 = tmpvar_19;
  tmpvar_5 = _Opacity;
  c_1.xyz = (tmpvar_3 * (2.0 * texture (unity_Lightmap, xlv_TEXCOORD2).xyz));
  c_1.w = tmpvar_5;
  c_1.xyz = (c_1.xyz + tmpvar_4);
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 21 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 15 [unity_Scale]
Vector 16 [unity_LightmapST]
Vector 17 [_MainTex_ST]
Vector 18 [_Emissive_ST]
"3.0-!!ARBvp1.0
PARAM c[19] = { { 1 },
		state.matrix.mvp,
		program.local[5..18] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R1.xyz, R0, vertex.attrib[14].w;
MOV R0.xyz, c[13];
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
MAD R0.xyz, R2, c[15].w, -vertex.position;
DP3 result.texcoord[1].y, R0, R1;
DP3 result.texcoord[1].z, vertex.normal, R0;
DP3 result.texcoord[1].x, R0, vertex.attrib[14];
MOV result.color, vertex.color;
MAD result.texcoord[0].zw, vertex.texcoord[1].xyxy, c[18].xyxy, c[18];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[17], c[17].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[1], c[16], c[16].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 21 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 22 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [unity_Scale]
Vector 14 [unity_LightmapST]
Vector 15 [_MainTex_ST]
Vector 16 [_Emissive_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_color0 o3
dcl_texcoord2 o4
def c17, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r1.xyz, r0, v1.w
mov r0.xyz, c12
mov r0.w, c17.x
dp4 r2.z, r0, c10
dp4 r2.x, r0, c8
dp4 r2.y, r0, c9
mad r0.xyz, r2, c13.w, -v0
dp3 o2.y, r0, r1
dp3 o2.z, v2, r0
dp3 o2.x, r0, v1
mov o3, v5
mad o1.zw, v4.xyxy, c16.xyxy, c16
mad o1.xy, v3, c15, c15.zwzw
mad o4.xy, v4, c14, c14.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 18 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 128
Vector 80 [unity_LightmapST]
Vector 96 [_MainTex_ST]
Vector 112 [_Emissive_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecednddjkjpjnjnbjakanbjfifjceealajpgabaaaaaabiafaaaaadaaaaaa
cmaaaaaapeaaaaaajiabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaadamaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklfdeieefchiadaaaa
eaaaabaanoaaaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaa
abaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaadpcbabaaaafaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaad
hccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaaddccabaaaaeaaaaaa
giaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaa
ogikcaaaaaaaaaaaagaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaa
agiecaaaaaaaaaaaahaaaaaakgiocaaaaaaaaaaaahaaaaaadiaaaaahhcaabaaa
aaaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaa
jgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgbpbaaaabaaaaaadiaaaaajhcaabaaa
abaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaa
egacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaabcaaaaaa
kgikcaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaa
egacbaaaabaaaaaaegiccaaaacaaaaaabdaaaaaadcaaaaalhcaabaaaabaaaaaa
egacbaaaabaaaaaapgipcaaaacaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaa
baaaaaahcccabaaaacaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaah
bccabaaaacaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaaheccabaaa
acaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadgaaaaafpccabaaaadaaaaaa
egbobaaaafaaaaaadcaaaaaldccabaaaaeaaaaaaegbabaaaaeaaaaaaegiacaaa
aaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec3 tmpvar_4;
  highp vec3 tmpvar_5;
  tmpvar_4 = tmpvar_1.xyz;
  tmpvar_5 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_6;
  tmpvar_6[0].x = tmpvar_4.x;
  tmpvar_6[0].y = tmpvar_5.x;
  tmpvar_6[0].z = tmpvar_2.x;
  tmpvar_6[1].x = tmpvar_4.y;
  tmpvar_6[1].y = tmpvar_5.y;
  tmpvar_6[1].z = tmpvar_2.y;
  tmpvar_6[2].x = tmpvar_4.z;
  tmpvar_6[2].y = tmpvar_5.z;
  tmpvar_6[2].z = tmpvar_2.z;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _WorldSpaceCameraPos;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = (tmpvar_6 * (((_World2Object * tmpvar_7).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _SpecColor;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 c_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = xlv_COLOR0;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  lowp float tmpvar_6;
  mediump float rim_7;
  highp vec4 mask_8;
  highp vec4 color_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  color_9 = tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Emissive, xlv_TEXCOORD0.xy);
  mask_8 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_7 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = ((_RimColor.xyz * pow (rim_7, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_14;
  tmpvar_14.x = color_9.x;
  tmpvar_14.y = mask_8.x;
  highp vec2 tmpvar_15;
  tmpvar_15.x = color_9.y;
  tmpvar_15.y = mask_8.y;
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_9.z;
  tmpvar_16.y = mask_8.z;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_9.w;
  tmpvar_17.y = mask_8.w;
  highp vec2 tmpvar_18;
  tmpvar_18 = mix (mix (tmpvar_14, tmpvar_15, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_16, tmpvar_17, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_19;
  tmpvar_19 = mix (tmpvar_18.xxx, mix (mix (vec3(clamp ((tmpvar_18.x + ((1.0 - tmpvar_18.y) * pow (tmpvar_18.x, 2.0))), 0.0, 1.0)), tmpvar_2.xyz, tmpvar_18.yyy), tmpvar_2.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_2.w, 0.0, 1.0)));
  tmpvar_3 = tmpvar_19;
  tmpvar_4 = tmpvar_13;
  highp float tmpvar_20;
  tmpvar_20 = tmpvar_18.x;
  tmpvar_5 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_4 * _Opacity);
  tmpvar_4 = tmpvar_21;
  tmpvar_6 = _Opacity;
  c_1.w = 0.0;
  highp vec3 tmpvar_22;
  tmpvar_22 = normalize(xlv_TEXCOORD1);
  mediump vec4 tmpvar_23;
  mediump vec3 viewDir_24;
  viewDir_24 = tmpvar_22;
  mediump vec3 specColor_25;
  highp float nh_26;
  mat3 tmpvar_27;
  tmpvar_27[0].x = 0.816497;
  tmpvar_27[0].y = -0.408248;
  tmpvar_27[0].z = -0.408248;
  tmpvar_27[1].x = 0.0;
  tmpvar_27[1].y = 0.707107;
  tmpvar_27[1].z = -0.707107;
  tmpvar_27[2].x = 0.57735;
  tmpvar_27[2].y = 0.57735;
  tmpvar_27[2].z = 0.57735;
  mediump vec3 scalePerBasisVector_28;
  mediump vec3 lm_29;
  lowp vec3 tmpvar_30;
  tmpvar_30 = (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD2).xyz);
  lm_29 = tmpvar_30;
  lowp vec3 tmpvar_31;
  tmpvar_31 = (2.0 * texture2D (unity_LightmapInd, xlv_TEXCOORD2).xyz);
  scalePerBasisVector_28 = tmpvar_31;
  lm_29 = (lm_29 * dot (clamp ((tmpvar_27 * vec3(0.0, 0.0, 1.0)), 0.0, 1.0), scalePerBasisVector_28));
  vec3 v_32;
  v_32.x = tmpvar_27[0].x;
  v_32.y = tmpvar_27[1].x;
  v_32.z = tmpvar_27[2].x;
  vec3 v_33;
  v_33.x = tmpvar_27[0].y;
  v_33.y = tmpvar_27[1].y;
  v_33.z = tmpvar_27[2].y;
  vec3 v_34;
  v_34.x = tmpvar_27[0].z;
  v_34.y = tmpvar_27[1].z;
  v_34.z = tmpvar_27[2].z;
  mediump float tmpvar_35;
  tmpvar_35 = max (0.0, normalize((normalize((((scalePerBasisVector_28.x * v_32) + (scalePerBasisVector_28.y * v_33)) + (scalePerBasisVector_28.z * v_34))) + viewDir_24)).z);
  nh_26 = tmpvar_35;
  highp float tmpvar_36;
  mediump float arg1_37;
  arg1_37 = (_Shininess * 128.0);
  tmpvar_36 = pow (nh_26, arg1_37);
  highp vec3 tmpvar_38;
  tmpvar_38 = (((lm_29 * _SpecColor.xyz) * tmpvar_5) * tmpvar_36);
  specColor_25 = tmpvar_38;
  highp vec4 tmpvar_39;
  tmpvar_39.xyz = lm_29;
  tmpvar_39.w = tmpvar_36;
  tmpvar_23 = tmpvar_39;
  c_1.xyz = specColor_25;
  mediump vec3 tmpvar_40;
  tmpvar_40 = (c_1.xyz + (tmpvar_3 * tmpvar_23.xyz));
  c_1.xyz = tmpvar_40;
  c_1.w = tmpvar_6;
  c_1.xyz = (c_1.xyz + tmpvar_4);
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec3 tmpvar_4;
  highp vec3 tmpvar_5;
  tmpvar_4 = tmpvar_1.xyz;
  tmpvar_5 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_6;
  tmpvar_6[0].x = tmpvar_4.x;
  tmpvar_6[0].y = tmpvar_5.x;
  tmpvar_6[0].z = tmpvar_2.x;
  tmpvar_6[1].x = tmpvar_4.y;
  tmpvar_6[1].y = tmpvar_5.y;
  tmpvar_6[1].z = tmpvar_2.y;
  tmpvar_6[2].x = tmpvar_4.z;
  tmpvar_6[2].y = tmpvar_5.z;
  tmpvar_6[2].z = tmpvar_2.z;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _WorldSpaceCameraPos;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = (tmpvar_6 * (((_World2Object * tmpvar_7).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _SpecColor;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 c_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = xlv_COLOR0;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  lowp float tmpvar_6;
  mediump float rim_7;
  highp vec4 mask_8;
  highp vec4 color_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  color_9 = tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Emissive, xlv_TEXCOORD0.xy);
  mask_8 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_7 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = ((_RimColor.xyz * pow (rim_7, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_14;
  tmpvar_14.x = color_9.x;
  tmpvar_14.y = mask_8.x;
  highp vec2 tmpvar_15;
  tmpvar_15.x = color_9.y;
  tmpvar_15.y = mask_8.y;
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_9.z;
  tmpvar_16.y = mask_8.z;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_9.w;
  tmpvar_17.y = mask_8.w;
  highp vec2 tmpvar_18;
  tmpvar_18 = mix (mix (tmpvar_14, tmpvar_15, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_16, tmpvar_17, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_19;
  tmpvar_19 = mix (tmpvar_18.xxx, mix (mix (vec3(clamp ((tmpvar_18.x + ((1.0 - tmpvar_18.y) * pow (tmpvar_18.x, 2.0))), 0.0, 1.0)), tmpvar_2.xyz, tmpvar_18.yyy), tmpvar_2.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_2.w, 0.0, 1.0)));
  tmpvar_3 = tmpvar_19;
  tmpvar_4 = tmpvar_13;
  highp float tmpvar_20;
  tmpvar_20 = tmpvar_18.x;
  tmpvar_5 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_4 * _Opacity);
  tmpvar_4 = tmpvar_21;
  tmpvar_6 = _Opacity;
  c_1.w = 0.0;
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (unity_LightmapInd, xlv_TEXCOORD2);
  highp vec3 tmpvar_24;
  tmpvar_24 = normalize(xlv_TEXCOORD1);
  mediump vec4 tmpvar_25;
  mediump vec3 viewDir_26;
  viewDir_26 = tmpvar_24;
  mediump vec3 specColor_27;
  highp float nh_28;
  mat3 tmpvar_29;
  tmpvar_29[0].x = 0.816497;
  tmpvar_29[0].y = -0.408248;
  tmpvar_29[0].z = -0.408248;
  tmpvar_29[1].x = 0.0;
  tmpvar_29[1].y = 0.707107;
  tmpvar_29[1].z = -0.707107;
  tmpvar_29[2].x = 0.57735;
  tmpvar_29[2].y = 0.57735;
  tmpvar_29[2].z = 0.57735;
  mediump vec3 scalePerBasisVector_30;
  mediump vec3 lm_31;
  lowp vec3 tmpvar_32;
  tmpvar_32 = ((8.0 * tmpvar_22.w) * tmpvar_22.xyz);
  lm_31 = tmpvar_32;
  lowp vec3 tmpvar_33;
  tmpvar_33 = ((8.0 * tmpvar_23.w) * tmpvar_23.xyz);
  scalePerBasisVector_30 = tmpvar_33;
  lm_31 = (lm_31 * dot (clamp ((tmpvar_29 * vec3(0.0, 0.0, 1.0)), 0.0, 1.0), scalePerBasisVector_30));
  vec3 v_34;
  v_34.x = tmpvar_29[0].x;
  v_34.y = tmpvar_29[1].x;
  v_34.z = tmpvar_29[2].x;
  vec3 v_35;
  v_35.x = tmpvar_29[0].y;
  v_35.y = tmpvar_29[1].y;
  v_35.z = tmpvar_29[2].y;
  vec3 v_36;
  v_36.x = tmpvar_29[0].z;
  v_36.y = tmpvar_29[1].z;
  v_36.z = tmpvar_29[2].z;
  mediump float tmpvar_37;
  tmpvar_37 = max (0.0, normalize((normalize((((scalePerBasisVector_30.x * v_34) + (scalePerBasisVector_30.y * v_35)) + (scalePerBasisVector_30.z * v_36))) + viewDir_26)).z);
  nh_28 = tmpvar_37;
  highp float tmpvar_38;
  mediump float arg1_39;
  arg1_39 = (_Shininess * 128.0);
  tmpvar_38 = pow (nh_28, arg1_39);
  highp vec3 tmpvar_40;
  tmpvar_40 = (((lm_31 * _SpecColor.xyz) * tmpvar_5) * tmpvar_38);
  specColor_27 = tmpvar_40;
  highp vec4 tmpvar_41;
  tmpvar_41.xyz = lm_31;
  tmpvar_41.w = tmpvar_38;
  tmpvar_25 = tmpvar_41;
  c_1.xyz = specColor_27;
  mediump vec3 tmpvar_42;
  tmpvar_42 = (c_1.xyz + (tmpvar_3 * tmpvar_25.xyz));
  c_1.xyz = tmpvar_42;
  c_1.w = tmpvar_6;
  c_1.xyz = (c_1.xyz + tmpvar_4);
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesColor;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
in vec4 _glesMultiTexCoord1;
in vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec3 xlv_TEXCOORD1;
out lowp vec4 xlv_COLOR0;
out highp vec2 xlv_TEXCOORD2;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec3 tmpvar_4;
  highp vec3 tmpvar_5;
  tmpvar_4 = tmpvar_1.xyz;
  tmpvar_5 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_6;
  tmpvar_6[0].x = tmpvar_4.x;
  tmpvar_6[0].y = tmpvar_5.x;
  tmpvar_6[0].z = tmpvar_2.x;
  tmpvar_6[1].x = tmpvar_4.y;
  tmpvar_6[1].y = tmpvar_5.y;
  tmpvar_6[1].z = tmpvar_2.y;
  tmpvar_6[2].x = tmpvar_4.z;
  tmpvar_6[2].y = tmpvar_5.z;
  tmpvar_6[2].z = tmpvar_2.z;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _WorldSpaceCameraPos;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = (tmpvar_6 * (((_World2Object * tmpvar_7).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform lowp vec4 _SpecColor;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
in highp vec4 xlv_TEXCOORD0;
in highp vec3 xlv_TEXCOORD1;
in lowp vec4 xlv_COLOR0;
in highp vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 c_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = xlv_COLOR0;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  lowp float tmpvar_6;
  mediump float rim_7;
  highp vec4 mask_8;
  highp vec4 color_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture (_MainTex, xlv_TEXCOORD0.xy);
  color_9 = tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture (_Emissive, xlv_TEXCOORD0.xy);
  mask_8 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_7 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = ((_RimColor.xyz * pow (rim_7, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_14;
  tmpvar_14.x = color_9.x;
  tmpvar_14.y = mask_8.x;
  highp vec2 tmpvar_15;
  tmpvar_15.x = color_9.y;
  tmpvar_15.y = mask_8.y;
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_9.z;
  tmpvar_16.y = mask_8.z;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_9.w;
  tmpvar_17.y = mask_8.w;
  highp vec2 tmpvar_18;
  tmpvar_18 = mix (mix (tmpvar_14, tmpvar_15, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_16, tmpvar_17, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_19;
  tmpvar_19 = mix (tmpvar_18.xxx, mix (mix (vec3(clamp ((tmpvar_18.x + ((1.0 - tmpvar_18.y) * pow (tmpvar_18.x, 2.0))), 0.0, 1.0)), tmpvar_2.xyz, tmpvar_18.yyy), tmpvar_2.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_2.w, 0.0, 1.0)));
  tmpvar_3 = tmpvar_19;
  tmpvar_4 = tmpvar_13;
  highp float tmpvar_20;
  tmpvar_20 = tmpvar_18.x;
  tmpvar_5 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_4 * _Opacity);
  tmpvar_4 = tmpvar_21;
  tmpvar_6 = _Opacity;
  c_1.w = 0.0;
  highp vec3 tmpvar_22;
  tmpvar_22 = normalize(xlv_TEXCOORD1);
  mediump vec4 tmpvar_23;
  mediump vec3 viewDir_24;
  viewDir_24 = tmpvar_22;
  mediump vec3 specColor_25;
  highp float nh_26;
  mat3 tmpvar_27;
  tmpvar_27[0].x = 0.816497;
  tmpvar_27[0].y = -0.408248;
  tmpvar_27[0].z = -0.408248;
  tmpvar_27[1].x = 0.0;
  tmpvar_27[1].y = 0.707107;
  tmpvar_27[1].z = -0.707107;
  tmpvar_27[2].x = 0.57735;
  tmpvar_27[2].y = 0.57735;
  tmpvar_27[2].z = 0.57735;
  mediump vec3 scalePerBasisVector_28;
  mediump vec3 lm_29;
  lowp vec3 tmpvar_30;
  tmpvar_30 = (2.0 * texture (unity_Lightmap, xlv_TEXCOORD2).xyz);
  lm_29 = tmpvar_30;
  lowp vec3 tmpvar_31;
  tmpvar_31 = (2.0 * texture (unity_LightmapInd, xlv_TEXCOORD2).xyz);
  scalePerBasisVector_28 = tmpvar_31;
  lm_29 = (lm_29 * dot (clamp ((tmpvar_27 * vec3(0.0, 0.0, 1.0)), 0.0, 1.0), scalePerBasisVector_28));
  vec3 v_32;
  v_32.x = tmpvar_27[0].x;
  v_32.y = tmpvar_27[1].x;
  v_32.z = tmpvar_27[2].x;
  vec3 v_33;
  v_33.x = tmpvar_27[0].y;
  v_33.y = tmpvar_27[1].y;
  v_33.z = tmpvar_27[2].y;
  vec3 v_34;
  v_34.x = tmpvar_27[0].z;
  v_34.y = tmpvar_27[1].z;
  v_34.z = tmpvar_27[2].z;
  mediump float tmpvar_35;
  tmpvar_35 = max (0.0, normalize((normalize((((scalePerBasisVector_28.x * v_32) + (scalePerBasisVector_28.y * v_33)) + (scalePerBasisVector_28.z * v_34))) + viewDir_24)).z);
  nh_26 = tmpvar_35;
  highp float tmpvar_36;
  mediump float arg1_37;
  arg1_37 = (_Shininess * 128.0);
  tmpvar_36 = pow (nh_26, arg1_37);
  highp vec3 tmpvar_38;
  tmpvar_38 = (((lm_29 * _SpecColor.xyz) * tmpvar_5) * tmpvar_36);
  specColor_25 = tmpvar_38;
  highp vec4 tmpvar_39;
  tmpvar_39.xyz = lm_29;
  tmpvar_39.w = tmpvar_36;
  tmpvar_23 = tmpvar_39;
  c_1.xyz = specColor_25;
  mediump vec3 tmpvar_40;
  tmpvar_40 = (c_1.xyz + (tmpvar_3 * tmpvar_23.xyz));
  c_1.xyz = tmpvar_40;
  c_1.w = tmpvar_6;
  c_1.xyz = (c_1.xyz + tmpvar_4);
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 50 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_ProjectionParams]
Vector 15 [_WorldSpaceLightPos0]
Vector 16 [unity_SHAr]
Vector 17 [unity_SHAg]
Vector 18 [unity_SHAb]
Vector 19 [unity_SHBr]
Vector 20 [unity_SHBg]
Vector 21 [unity_SHBb]
Vector 22 [unity_SHC]
Vector 23 [unity_Scale]
Vector 24 [_MainTex_ST]
Vector 25 [_Emissive_ST]
"3.0-!!ARBvp1.0
PARAM c[26] = { { 1, 0.5 },
		state.matrix.mvp,
		program.local[5..25] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[23].w;
DP3 R2.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[18];
DP4 R2.y, R0, c[17];
DP4 R2.x, R0, c[16];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[21];
DP4 R3.y, R1, c[20];
DP4 R3.x, R1, c[19];
ADD R2.xyz, R2, R3;
MAD R0.x, R0, R0, -R0.y;
MUL R3.xyz, R0.x, c[22];
MOV R1.xyz, vertex.attrib[14];
MUL R0.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R1.zxyw, -R0;
ADD result.texcoord[3].xyz, R2, R3;
MOV R0.w, c[0].x;
MOV R0.xyz, c[13];
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
MAD R0.xyz, R2, c[23].w, -vertex.position;
MUL R2.xyz, R1, vertex.attrib[14].w;
MOV R1, c[15];
DP4 R3.z, R1, c[11];
DP4 R3.x, R1, c[9];
DP4 R3.y, R1, c[10];
DP3 result.texcoord[1].y, R0, R2;
DP3 result.texcoord[1].z, vertex.normal, R0;
DP3 result.texcoord[1].x, R0, vertex.attrib[14];
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].y;
MUL R1.y, R1, c[14].x;
DP3 result.texcoord[2].y, R2, R3;
DP3 result.texcoord[2].z, vertex.normal, R3;
DP3 result.texcoord[2].x, vertex.attrib[14], R3;
ADD result.texcoord[4].xy, R1, R1.z;
MOV result.position, R0;
MOV result.color, vertex.color;
MOV result.texcoord[4].zw, R0;
MAD result.texcoord[0].zw, vertex.texcoord[1].xyxy, c[25].xyxy, c[25];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[24], c[24].zwzw;
END
# 50 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 53 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_ProjectionParams]
Vector 14 [_ScreenParams]
Vector 15 [_WorldSpaceLightPos0]
Vector 16 [unity_SHAr]
Vector 17 [unity_SHAg]
Vector 18 [unity_SHAb]
Vector 19 [unity_SHBr]
Vector 20 [unity_SHBg]
Vector 21 [unity_SHBb]
Vector 22 [unity_SHC]
Vector 23 [unity_Scale]
Vector 24 [_MainTex_ST]
Vector 25 [_Emissive_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_color0 o3
dcl_texcoord2 o4
dcl_texcoord3 o5
dcl_texcoord4 o6
def c26, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mul r1.xyz, v2, c23.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c26.x
dp4 r2.z, r0, c18
dp4 r2.y, r0, c17
dp4 r2.x, r0, c16
mul r0.y, r2.w, r2.w
dp4 r3.z, r1, c21
dp4 r3.y, r1, c20
dp4 r3.x, r1, c19
add r1.xyz, r2, r3
mad r0.x, r0, r0, -r0.y
mul r2.xyz, r0.x, c22
add o5.xyz, r1, r2
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r3.xyz, r0, v1.w
mov r0, c10
dp4 r4.z, c15, r0
mov r0, c9
dp4 r4.y, c15, r0
mov r1.w, c26.x
mov r1.xyz, c12
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r2.z, r1, c10
dp4 r2.x, r1, c8
dp4 r2.y, r1, c9
mad r2.xyz, r2, c23.w, -v0
mov r1, c8
dp4 r4.x, c15, r1
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c26.y
mul r1.y, r1, c13.x
dp3 o2.y, r2, r3
dp3 o4.y, r3, r4
dp3 o2.z, v2, r2
dp3 o2.x, r2, v1
dp3 o4.z, v2, r4
dp3 o4.x, v1, r4
mad o6.xy, r1.z, c14.zwzw, r1
mov o0, r0
mov o3, v5
mov o6.zw, r0
mad o1.zw, v4.xyxy, c25.xyxy, c25
mad o1.xy, v3, c24, c24.zwzw
"
}
SubProgram "d3d11 " {
// Stats: 42 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 176
Vector 144 [_MainTex_ST]
Vector 160 [_Emissive_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedogpoepnphdeimfmliidkidalpbibcghhabaaaaaaneaiaaaaadaaaaaa
cmaaaaaapeaaaaaamiabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheommaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaamfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaagaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklfdeieefcaeahaaaaeaaaabaambabaaaafjaaaaaeegiocaaa
aaaaaaaaalaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaa
acaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaadpcbabaaaafaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaad
hccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
gfaaaaadhccabaaaafaaaaaagfaaaaadpccabaaaagaaaaaagiaaaaacafaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaadcaaaaalmccabaaa
abaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaakaaaaaakgiocaaaaaaaaaaa
akaaaaaadiaaaaahhcaabaaaabaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaa
dcaaaaakhcaabaaaabaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaia
ebaaaaaaabaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgbpbaaa
abaaaaaadiaaaaajhcaabaaaacaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaa
adaaaaaabbaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaadaaaaaabaaaaaaa
agiacaaaabaaaaaaaeaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaa
egiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaacaaaaaa
aaaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaegiccaaaadaaaaaabdaaaaaa
dcaaaaalhcaabaaaacaaaaaaegacbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaa
egbcbaiaebaaaaaaaaaaaaaabaaaaaahcccabaaaacaaaaaaegacbaaaabaaaaaa
egacbaaaacaaaaaabaaaaaahbccabaaaacaaaaaaegbcbaaaabaaaaaaegacbaaa
acaaaaaabaaaaaaheccabaaaacaaaaaaegbcbaaaacaaaaaaegacbaaaacaaaaaa
dgaaaaafpccabaaaadaaaaaaegbobaaaafaaaaaadiaaaaajhcaabaaaacaaaaaa
fgifcaaaacaaaaaaaaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaa
acaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaa
acaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaa
acaaaaaaaaaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaa
adaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaaegacbaaaacaaaaaabaaaaaah
cccabaaaaeaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaabaaaaaahbccabaaa
aeaaaaaaegbcbaaaabaaaaaaegacbaaaacaaaaaabaaaaaaheccabaaaaeaaaaaa
egbcbaaaacaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaaabaaaaaaegbcbaaa
acaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaa
abaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaa
adaaaaaaamaaaaaaagaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaa
dgaaaaaficaabaaaabaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaacaaaaaa
egiocaaaacaaaaaacgaaaaaaegaobaaaabaaaaaabbaaaaaiccaabaaaacaaaaaa
egiocaaaacaaaaaachaaaaaaegaobaaaabaaaaaabbaaaaaiecaabaaaacaaaaaa
egiocaaaacaaaaaaciaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaa
jgacbaaaabaaaaaaegakbaaaabaaaaaabbaaaaaibcaabaaaaeaaaaaaegiocaaa
acaaaaaacjaaaaaaegaobaaaadaaaaaabbaaaaaiccaabaaaaeaaaaaaegiocaaa
acaaaaaackaaaaaaegaobaaaadaaaaaabbaaaaaiecaabaaaaeaaaaaaegiocaaa
acaaaaaaclaaaaaaegaobaaaadaaaaaaaaaaaaahhcaabaaaacaaaaaaegacbaaa
acaaaaaaegacbaaaaeaaaaaadiaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaa
bkaabaaaabaaaaaadcaaaaakbcaabaaaabaaaaaaakaabaaaabaaaaaaakaabaaa
abaaaaaabkaabaiaebaaaaaaabaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaa
acaaaaaacmaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadiaaaaaiccaabaaa
aaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaa
abaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadp
dgaaaaafmccabaaaagaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaagaaaaaa
kgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec3 shlight_3;
  highp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  mat3 tmpvar_7;
  tmpvar_7[0] = _Object2World[0].xyz;
  tmpvar_7[1] = _Object2World[1].xyz;
  tmpvar_7[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_8 = tmpvar_1.xyz;
  tmpvar_9 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_10;
  tmpvar_10[0].x = tmpvar_8.x;
  tmpvar_10[0].y = tmpvar_9.x;
  tmpvar_10[0].z = tmpvar_2.x;
  tmpvar_10[1].x = tmpvar_8.y;
  tmpvar_10[1].y = tmpvar_9.y;
  tmpvar_10[1].z = tmpvar_2.y;
  tmpvar_10[2].x = tmpvar_8.z;
  tmpvar_10[2].y = tmpvar_9.z;
  tmpvar_10[2].z = tmpvar_2.z;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_11;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = _WorldSpaceCameraPos;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = (tmpvar_7 * (tmpvar_2 * unity_Scale.w));
  mediump vec3 tmpvar_14;
  mediump vec4 normal_15;
  normal_15 = tmpvar_13;
  highp float vC_16;
  mediump vec3 x3_17;
  mediump vec3 x2_18;
  mediump vec3 x1_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHAr, normal_15);
  x1_19.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHAg, normal_15);
  x1_19.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHAb, normal_15);
  x1_19.z = tmpvar_22;
  mediump vec4 tmpvar_23;
  tmpvar_23 = (normal_15.xyzz * normal_15.yzzx);
  highp float tmpvar_24;
  tmpvar_24 = dot (unity_SHBr, tmpvar_23);
  x2_18.x = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHBg, tmpvar_23);
  x2_18.y = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHBb, tmpvar_23);
  x2_18.z = tmpvar_26;
  mediump float tmpvar_27;
  tmpvar_27 = ((normal_15.x * normal_15.x) - (normal_15.y * normal_15.y));
  vC_16 = tmpvar_27;
  highp vec3 tmpvar_28;
  tmpvar_28 = (unity_SHC.xyz * vC_16);
  x3_17 = tmpvar_28;
  tmpvar_14 = ((x1_19 + x2_18) + x3_17);
  shlight_3 = tmpvar_14;
  tmpvar_6 = shlight_3;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = (tmpvar_10 * (((_World2Object * tmpvar_12).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

uniform highp vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _ShadowMapTexture;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = xlv_COLOR0;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  lowp float tmpvar_6;
  mediump float rim_7;
  highp vec4 mask_8;
  highp vec4 color_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  color_9 = tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Emissive, xlv_TEXCOORD0.xy);
  mask_8 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_7 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = ((_RimColor.xyz * pow (rim_7, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_14;
  tmpvar_14.x = color_9.x;
  tmpvar_14.y = mask_8.x;
  highp vec2 tmpvar_15;
  tmpvar_15.x = color_9.y;
  tmpvar_15.y = mask_8.y;
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_9.z;
  tmpvar_16.y = mask_8.z;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_9.w;
  tmpvar_17.y = mask_8.w;
  highp vec2 tmpvar_18;
  tmpvar_18 = mix (mix (tmpvar_14, tmpvar_15, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_16, tmpvar_17, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_19;
  tmpvar_19 = mix (tmpvar_18.xxx, mix (mix (vec3(clamp ((tmpvar_18.x + ((1.0 - tmpvar_18.y) * pow (tmpvar_18.x, 2.0))), 0.0, 1.0)), tmpvar_2.xyz, tmpvar_18.yyy), tmpvar_2.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_2.w, 0.0, 1.0)));
  tmpvar_3 = tmpvar_19;
  tmpvar_4 = tmpvar_13;
  highp float tmpvar_20;
  tmpvar_20 = tmpvar_18.x;
  tmpvar_5 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_4 * _Opacity);
  tmpvar_4 = tmpvar_21;
  tmpvar_6 = _Opacity;
  lowp float tmpvar_22;
  mediump float lightShadowDataX_23;
  highp float dist_24;
  lowp float tmpvar_25;
  tmpvar_25 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD4).x;
  dist_24 = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = _LightShadowData.x;
  lightShadowDataX_23 = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = max (float((dist_24 > (xlv_TEXCOORD4.z / xlv_TEXCOORD4.w))), lightShadowDataX_23);
  tmpvar_22 = tmpvar_27;
  highp vec3 tmpvar_28;
  tmpvar_28 = normalize(xlv_TEXCOORD1);
  mediump vec3 viewDir_29;
  viewDir_29 = tmpvar_28;
  lowp vec4 c_30;
  highp float nh_31;
  lowp float tmpvar_32;
  tmpvar_32 = max (0.0, xlv_TEXCOORD2.z);
  mediump float tmpvar_33;
  tmpvar_33 = max (0.0, normalize((xlv_TEXCOORD2 + viewDir_29)).z);
  nh_31 = tmpvar_33;
  mediump float arg1_34;
  arg1_34 = (_Shininess * 128.0);
  highp float tmpvar_35;
  tmpvar_35 = (pow (nh_31, arg1_34) * tmpvar_5);
  highp vec3 tmpvar_36;
  tmpvar_36 = ((((tmpvar_3 * _LightColor0.xyz) * tmpvar_32) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_35)) * (tmpvar_22 * 2.0));
  c_30.xyz = tmpvar_36;
  highp float tmpvar_37;
  tmpvar_37 = (tmpvar_6 + (((_LightColor0.w * _SpecColor.w) * tmpvar_35) * tmpvar_22));
  c_30.w = tmpvar_37;
  c_1.w = c_30.w;
  c_1.xyz = (c_30.xyz + (tmpvar_3 * xlv_TEXCOORD3));
  c_1.xyz = (c_1.xyz + tmpvar_4);
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec3 shlight_3;
  highp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_9 = tmpvar_1.xyz;
  tmpvar_10 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_11;
  tmpvar_11[0].x = tmpvar_9.x;
  tmpvar_11[0].y = tmpvar_10.x;
  tmpvar_11[0].z = tmpvar_2.x;
  tmpvar_11[1].x = tmpvar_9.y;
  tmpvar_11[1].y = tmpvar_10.y;
  tmpvar_11[1].z = tmpvar_2.y;
  tmpvar_11[2].x = tmpvar_9.z;
  tmpvar_11[2].y = tmpvar_10.z;
  tmpvar_11[2].z = tmpvar_2.z;
  highp vec3 tmpvar_12;
  tmpvar_12 = (tmpvar_11 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = _WorldSpaceCameraPos;
  highp vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = (tmpvar_8 * (tmpvar_2 * unity_Scale.w));
  mediump vec3 tmpvar_15;
  mediump vec4 normal_16;
  normal_16 = tmpvar_14;
  highp float vC_17;
  mediump vec3 x3_18;
  mediump vec3 x2_19;
  mediump vec3 x1_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHAr, normal_16);
  x1_20.x = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHAg, normal_16);
  x1_20.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHAb, normal_16);
  x1_20.z = tmpvar_23;
  mediump vec4 tmpvar_24;
  tmpvar_24 = (normal_16.xyzz * normal_16.yzzx);
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHBr, tmpvar_24);
  x2_19.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHBg, tmpvar_24);
  x2_19.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHBb, tmpvar_24);
  x2_19.z = tmpvar_27;
  mediump float tmpvar_28;
  tmpvar_28 = ((normal_16.x * normal_16.x) - (normal_16.y * normal_16.y));
  vC_17 = tmpvar_28;
  highp vec3 tmpvar_29;
  tmpvar_29 = (unity_SHC.xyz * vC_17);
  x3_18 = tmpvar_29;
  tmpvar_15 = ((x1_20 + x2_19) + x3_18);
  shlight_3 = tmpvar_15;
  tmpvar_6 = shlight_3;
  highp vec4 o_30;
  highp vec4 tmpvar_31;
  tmpvar_31 = (tmpvar_7 * 0.5);
  highp vec2 tmpvar_32;
  tmpvar_32.x = tmpvar_31.x;
  tmpvar_32.y = (tmpvar_31.y * _ProjectionParams.x);
  o_30.xy = (tmpvar_32 + tmpvar_31.w);
  o_30.zw = tmpvar_7.zw;
  gl_Position = tmpvar_7;
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = (tmpvar_11 * (((_World2Object * tmpvar_13).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = o_30;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _ShadowMapTexture;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = xlv_COLOR0;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  lowp float tmpvar_6;
  mediump float rim_7;
  highp vec4 mask_8;
  highp vec4 color_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  color_9 = tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Emissive, xlv_TEXCOORD0.xy);
  mask_8 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_7 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = ((_RimColor.xyz * pow (rim_7, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_14;
  tmpvar_14.x = color_9.x;
  tmpvar_14.y = mask_8.x;
  highp vec2 tmpvar_15;
  tmpvar_15.x = color_9.y;
  tmpvar_15.y = mask_8.y;
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_9.z;
  tmpvar_16.y = mask_8.z;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_9.w;
  tmpvar_17.y = mask_8.w;
  highp vec2 tmpvar_18;
  tmpvar_18 = mix (mix (tmpvar_14, tmpvar_15, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_16, tmpvar_17, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_19;
  tmpvar_19 = mix (tmpvar_18.xxx, mix (mix (vec3(clamp ((tmpvar_18.x + ((1.0 - tmpvar_18.y) * pow (tmpvar_18.x, 2.0))), 0.0, 1.0)), tmpvar_2.xyz, tmpvar_18.yyy), tmpvar_2.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_2.w, 0.0, 1.0)));
  tmpvar_3 = tmpvar_19;
  tmpvar_4 = tmpvar_13;
  highp float tmpvar_20;
  tmpvar_20 = tmpvar_18.x;
  tmpvar_5 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_4 * _Opacity);
  tmpvar_4 = tmpvar_21;
  tmpvar_6 = _Opacity;
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD4);
  highp vec3 tmpvar_23;
  tmpvar_23 = normalize(xlv_TEXCOORD1);
  mediump vec3 viewDir_24;
  viewDir_24 = tmpvar_23;
  lowp vec4 c_25;
  highp float nh_26;
  lowp float tmpvar_27;
  tmpvar_27 = max (0.0, xlv_TEXCOORD2.z);
  mediump float tmpvar_28;
  tmpvar_28 = max (0.0, normalize((xlv_TEXCOORD2 + viewDir_24)).z);
  nh_26 = tmpvar_28;
  mediump float arg1_29;
  arg1_29 = (_Shininess * 128.0);
  highp float tmpvar_30;
  tmpvar_30 = (pow (nh_26, arg1_29) * tmpvar_5);
  highp vec3 tmpvar_31;
  tmpvar_31 = ((((tmpvar_3 * _LightColor0.xyz) * tmpvar_27) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_30)) * (tmpvar_22.x * 2.0));
  c_25.xyz = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = (tmpvar_6 + (((_LightColor0.w * _SpecColor.w) * tmpvar_30) * tmpvar_22.x));
  c_25.w = tmpvar_32;
  c_1.w = c_25.w;
  c_1.xyz = (c_25.xyz + (tmpvar_3 * xlv_TEXCOORD3));
  c_1.xyz = (c_1.xyz + tmpvar_4);
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesColor;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
in vec4 _glesMultiTexCoord1;
in vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec3 xlv_TEXCOORD1;
out lowp vec4 xlv_COLOR0;
out lowp vec3 xlv_TEXCOORD2;
out lowp vec3 xlv_TEXCOORD3;
out highp vec4 xlv_TEXCOORD4;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec3 shlight_3;
  highp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  mat3 tmpvar_7;
  tmpvar_7[0] = _Object2World[0].xyz;
  tmpvar_7[1] = _Object2World[1].xyz;
  tmpvar_7[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_8 = tmpvar_1.xyz;
  tmpvar_9 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_10;
  tmpvar_10[0].x = tmpvar_8.x;
  tmpvar_10[0].y = tmpvar_9.x;
  tmpvar_10[0].z = tmpvar_2.x;
  tmpvar_10[1].x = tmpvar_8.y;
  tmpvar_10[1].y = tmpvar_9.y;
  tmpvar_10[1].z = tmpvar_2.y;
  tmpvar_10[2].x = tmpvar_8.z;
  tmpvar_10[2].y = tmpvar_9.z;
  tmpvar_10[2].z = tmpvar_2.z;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_11;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = _WorldSpaceCameraPos;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = (tmpvar_7 * (tmpvar_2 * unity_Scale.w));
  mediump vec3 tmpvar_14;
  mediump vec4 normal_15;
  normal_15 = tmpvar_13;
  highp float vC_16;
  mediump vec3 x3_17;
  mediump vec3 x2_18;
  mediump vec3 x1_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHAr, normal_15);
  x1_19.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHAg, normal_15);
  x1_19.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHAb, normal_15);
  x1_19.z = tmpvar_22;
  mediump vec4 tmpvar_23;
  tmpvar_23 = (normal_15.xyzz * normal_15.yzzx);
  highp float tmpvar_24;
  tmpvar_24 = dot (unity_SHBr, tmpvar_23);
  x2_18.x = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHBg, tmpvar_23);
  x2_18.y = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHBb, tmpvar_23);
  x2_18.z = tmpvar_26;
  mediump float tmpvar_27;
  tmpvar_27 = ((normal_15.x * normal_15.x) - (normal_15.y * normal_15.y));
  vC_16 = tmpvar_27;
  highp vec3 tmpvar_28;
  tmpvar_28 = (unity_SHC.xyz * vC_16);
  x3_17 = tmpvar_28;
  tmpvar_14 = ((x1_19 + x2_18) + x3_17);
  shlight_3 = tmpvar_14;
  tmpvar_6 = shlight_3;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = (tmpvar_10 * (((_World2Object * tmpvar_12).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _ShadowMapTexture;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
in highp vec4 xlv_TEXCOORD0;
in highp vec3 xlv_TEXCOORD1;
in lowp vec4 xlv_COLOR0;
in lowp vec3 xlv_TEXCOORD2;
in lowp vec3 xlv_TEXCOORD3;
in highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = xlv_COLOR0;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  lowp float tmpvar_6;
  mediump float rim_7;
  highp vec4 mask_8;
  highp vec4 color_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture (_MainTex, xlv_TEXCOORD0.xy);
  color_9 = tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture (_Emissive, xlv_TEXCOORD0.xy);
  mask_8 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_7 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = ((_RimColor.xyz * pow (rim_7, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_14;
  tmpvar_14.x = color_9.x;
  tmpvar_14.y = mask_8.x;
  highp vec2 tmpvar_15;
  tmpvar_15.x = color_9.y;
  tmpvar_15.y = mask_8.y;
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_9.z;
  tmpvar_16.y = mask_8.z;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_9.w;
  tmpvar_17.y = mask_8.w;
  highp vec2 tmpvar_18;
  tmpvar_18 = mix (mix (tmpvar_14, tmpvar_15, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_16, tmpvar_17, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_19;
  tmpvar_19 = mix (tmpvar_18.xxx, mix (mix (vec3(clamp ((tmpvar_18.x + ((1.0 - tmpvar_18.y) * pow (tmpvar_18.x, 2.0))), 0.0, 1.0)), tmpvar_2.xyz, tmpvar_18.yyy), tmpvar_2.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_2.w, 0.0, 1.0)));
  tmpvar_3 = tmpvar_19;
  tmpvar_4 = tmpvar_13;
  highp float tmpvar_20;
  tmpvar_20 = tmpvar_18.x;
  tmpvar_5 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_4 * _Opacity);
  tmpvar_4 = tmpvar_21;
  tmpvar_6 = _Opacity;
  lowp float tmpvar_22;
  mediump float lightShadowDataX_23;
  highp float dist_24;
  lowp float tmpvar_25;
  tmpvar_25 = textureProj (_ShadowMapTexture, xlv_TEXCOORD4).x;
  dist_24 = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = _LightShadowData.x;
  lightShadowDataX_23 = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = max (float((dist_24 > (xlv_TEXCOORD4.z / xlv_TEXCOORD4.w))), lightShadowDataX_23);
  tmpvar_22 = tmpvar_27;
  highp vec3 tmpvar_28;
  tmpvar_28 = normalize(xlv_TEXCOORD1);
  mediump vec3 viewDir_29;
  viewDir_29 = tmpvar_28;
  lowp vec4 c_30;
  highp float nh_31;
  lowp float tmpvar_32;
  tmpvar_32 = max (0.0, xlv_TEXCOORD2.z);
  mediump float tmpvar_33;
  tmpvar_33 = max (0.0, normalize((xlv_TEXCOORD2 + viewDir_29)).z);
  nh_31 = tmpvar_33;
  mediump float arg1_34;
  arg1_34 = (_Shininess * 128.0);
  highp float tmpvar_35;
  tmpvar_35 = (pow (nh_31, arg1_34) * tmpvar_5);
  highp vec3 tmpvar_36;
  tmpvar_36 = ((((tmpvar_3 * _LightColor0.xyz) * tmpvar_32) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_35)) * (tmpvar_22 * 2.0));
  c_30.xyz = tmpvar_36;
  highp float tmpvar_37;
  tmpvar_37 = (tmpvar_6 + (((_LightColor0.w * _SpecColor.w) * tmpvar_35) * tmpvar_22));
  c_30.w = tmpvar_37;
  c_1.w = c_30.w;
  c_1.xyz = (c_30.xyz + (tmpvar_3 * xlv_TEXCOORD3));
  c_1.xyz = (c_1.xyz + tmpvar_4);
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 26 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_ProjectionParams]
Vector 16 [unity_Scale]
Vector 17 [unity_LightmapST]
Vector 18 [_MainTex_ST]
Vector 19 [_Emissive_ST]
"3.0-!!ARBvp1.0
PARAM c[20] = { { 1, 0.5 },
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R0.xyz, R0, vertex.attrib[14].w;
MOV R1.xyz, c[13];
MOV R1.w, c[0].x;
DP4 R0.w, vertex.position, c[4];
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
MAD R2.xyz, R2, c[16].w, -vertex.position;
DP3 result.texcoord[1].y, R2, R0;
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].y;
MUL R1.y, R1, c[14].x;
DP3 result.texcoord[1].z, vertex.normal, R2;
DP3 result.texcoord[1].x, R2, vertex.attrib[14];
ADD result.texcoord[3].xy, R1, R1.z;
MOV result.position, R0;
MOV result.color, vertex.color;
MOV result.texcoord[3].zw, R0;
MAD result.texcoord[0].zw, vertex.texcoord[1].xyxy, c[19].xyxy, c[19];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[18], c[18].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[1], c[17], c[17].zwzw;
END
# 26 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 27 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_ProjectionParams]
Vector 14 [_ScreenParams]
Vector 15 [unity_Scale]
Vector 16 [unity_LightmapST]
Vector 17 [_MainTex_ST]
Vector 18 [_Emissive_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_color0 o3
dcl_texcoord2 o4
dcl_texcoord3 o5
def c19, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r0.xyz, r0, v1.w
mov r1.xyz, c12
mov r1.w, c19.x
dp4 r0.w, v0, c3
dp4 r2.z, r1, c10
dp4 r2.x, r1, c8
dp4 r2.y, r1, c9
mad r2.xyz, r2, c15.w, -v0
dp3 o2.y, r2, r0
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c19.y
mul r1.y, r1, c13.x
dp3 o2.z, v2, r2
dp3 o2.x, r2, v1
mad o5.xy, r1.z, c14.zwzw, r1
mov o0, r0
mov o3, v5
mov o5.zw, r0
mad o1.zw, v4.xyxy, c18.xyxy, c18
mad o1.xy, v3, c17, c17.zwzw
mad o4.xy, v4, c16, c16.zwzw
"
}
SubProgram "d3d11 " {
// Stats: 21 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 192
Vector 144 [unity_LightmapST]
Vector 160 [_MainTex_ST]
Vector 176 [_Emissive_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedmpnejfobkfacohiclpigaijohcekoahiabaaaaaamiafaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaadamaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefcbaaeaaaaeaaaabaaaeabaaaa
fjaaaaaeegiocaaaaaaaaaaaamaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaa
fjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
pcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaa
gfaaaaadpccabaaaadaaaaaagfaaaaaddccabaaaaeaaaaaagfaaaaadpccabaaa
afaaaaaagiaaaaacadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaa
akaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaa
alaaaaaakgiocaaaaaaaaaaaalaaaaaadiaaaaahhcaabaaaabaaaaaajgbebaaa
abaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaabaaaaaajgbebaaaacaaaaaa
cgbjbaaaabaaaaaaegacbaiaebaaaaaaabaaaaaadiaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaapgbpbaaaabaaaaaadiaaaaajhcaabaaaacaaaaaafgifcaaa
abaaaaaaaeaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaaacaaaaaa
egiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaacaaaaaa
dcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaaabaaaaaa
aeaaaaaaegacbaaaacaaaaaaaaaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaa
egiccaaaacaaaaaabdaaaaaadcaaaaalhcaabaaaacaaaaaaegacbaaaacaaaaaa
pgipcaaaacaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaahcccabaaa
acaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaabaaaaaahbccabaaaacaaaaaa
egbcbaaaabaaaaaaegacbaaaacaaaaaabaaaaaaheccabaaaacaaaaaaegbcbaaa
acaaaaaaegacbaaaacaaaaaadgaaaaafpccabaaaadaaaaaaegbobaaaafaaaaaa
dcaaaaaldccabaaaaeaaaaaaegbabaaaaeaaaaaaegiacaaaaaaaaaaaajaaaaaa
ogikcaaaaaaaaaaaajaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaa
akiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaafaaaaaa
kgaobaaaaaaaaaaaaaaaaaahdccabaaaafaaaaaakgakbaaaabaaaaaamgaabaaa
abaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec3 tmpvar_4;
  highp vec3 tmpvar_5;
  tmpvar_4 = tmpvar_1.xyz;
  tmpvar_5 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_6;
  tmpvar_6[0].x = tmpvar_4.x;
  tmpvar_6[0].y = tmpvar_5.x;
  tmpvar_6[0].z = tmpvar_2.x;
  tmpvar_6[1].x = tmpvar_4.y;
  tmpvar_6[1].y = tmpvar_5.y;
  tmpvar_6[1].z = tmpvar_2.y;
  tmpvar_6[2].x = tmpvar_4.z;
  tmpvar_6[2].y = tmpvar_5.z;
  tmpvar_6[2].z = tmpvar_2.z;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _WorldSpaceCameraPos;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = (tmpvar_6 * (((_World2Object * tmpvar_7).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

uniform highp vec4 _LightShadowData;
uniform sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
uniform sampler2D unity_Lightmap;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = xlv_COLOR0;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump float rim_6;
  highp vec4 mask_7;
  highp vec4 color_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  color_8 = tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Emissive, xlv_TEXCOORD0.xy);
  mask_7 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_6 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = ((_RimColor.xyz * pow (rim_6, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_13;
  tmpvar_13.x = color_8.x;
  tmpvar_13.y = mask_7.x;
  highp vec2 tmpvar_14;
  tmpvar_14.x = color_8.y;
  tmpvar_14.y = mask_7.y;
  highp vec2 tmpvar_15;
  tmpvar_15.x = color_8.z;
  tmpvar_15.y = mask_7.z;
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_8.w;
  tmpvar_16.y = mask_7.w;
  highp vec2 tmpvar_17;
  tmpvar_17 = mix (mix (tmpvar_13, tmpvar_14, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_15, tmpvar_16, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_18;
  tmpvar_18 = mix (tmpvar_17.xxx, mix (mix (vec3(clamp ((tmpvar_17.x + ((1.0 - tmpvar_17.y) * pow (tmpvar_17.x, 2.0))), 0.0, 1.0)), tmpvar_2.xyz, tmpvar_17.yyy), tmpvar_2.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_2.w, 0.0, 1.0)));
  tmpvar_3 = tmpvar_18;
  tmpvar_4 = tmpvar_12;
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_4 * _Opacity);
  tmpvar_4 = tmpvar_19;
  tmpvar_5 = _Opacity;
  lowp float tmpvar_20;
  mediump float lightShadowDataX_21;
  highp float dist_22;
  lowp float tmpvar_23;
  tmpvar_23 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD3).x;
  dist_22 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = _LightShadowData.x;
  lightShadowDataX_21 = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = max (float((dist_22 > (xlv_TEXCOORD3.z / xlv_TEXCOORD3.w))), lightShadowDataX_21);
  tmpvar_20 = tmpvar_25;
  c_1.xyz = (tmpvar_3 * min ((2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD2).xyz), vec3((tmpvar_20 * 2.0))));
  c_1.w = tmpvar_5;
  c_1.xyz = (c_1.xyz + tmpvar_4);
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec3 tmpvar_5;
  highp vec3 tmpvar_6;
  tmpvar_5 = tmpvar_1.xyz;
  tmpvar_6 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_7;
  tmpvar_7[0].x = tmpvar_5.x;
  tmpvar_7[0].y = tmpvar_6.x;
  tmpvar_7[0].z = tmpvar_2.x;
  tmpvar_7[1].x = tmpvar_5.y;
  tmpvar_7[1].y = tmpvar_6.y;
  tmpvar_7[1].z = tmpvar_2.y;
  tmpvar_7[2].x = tmpvar_5.z;
  tmpvar_7[2].y = tmpvar_6.z;
  tmpvar_7[2].z = tmpvar_2.z;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _WorldSpaceCameraPos;
  highp vec4 o_9;
  highp vec4 tmpvar_10;
  tmpvar_10 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_11;
  tmpvar_11.x = tmpvar_10.x;
  tmpvar_11.y = (tmpvar_10.y * _ProjectionParams.x);
  o_9.xy = (tmpvar_11 + tmpvar_10.w);
  o_9.zw = tmpvar_4.zw;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = (tmpvar_7 * (((_World2Object * tmpvar_8).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = o_9;
}



#endif
#ifdef FRAGMENT

uniform sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
uniform sampler2D unity_Lightmap;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = xlv_COLOR0;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump float rim_6;
  highp vec4 mask_7;
  highp vec4 color_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  color_8 = tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Emissive, xlv_TEXCOORD0.xy);
  mask_7 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_6 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = ((_RimColor.xyz * pow (rim_6, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_13;
  tmpvar_13.x = color_8.x;
  tmpvar_13.y = mask_7.x;
  highp vec2 tmpvar_14;
  tmpvar_14.x = color_8.y;
  tmpvar_14.y = mask_7.y;
  highp vec2 tmpvar_15;
  tmpvar_15.x = color_8.z;
  tmpvar_15.y = mask_7.z;
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_8.w;
  tmpvar_16.y = mask_7.w;
  highp vec2 tmpvar_17;
  tmpvar_17 = mix (mix (tmpvar_13, tmpvar_14, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_15, tmpvar_16, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_18;
  tmpvar_18 = mix (tmpvar_17.xxx, mix (mix (vec3(clamp ((tmpvar_17.x + ((1.0 - tmpvar_17.y) * pow (tmpvar_17.x, 2.0))), 0.0, 1.0)), tmpvar_2.xyz, tmpvar_17.yyy), tmpvar_2.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_2.w, 0.0, 1.0)));
  tmpvar_3 = tmpvar_18;
  tmpvar_4 = tmpvar_12;
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_4 * _Opacity);
  tmpvar_4 = tmpvar_19;
  tmpvar_5 = _Opacity;
  lowp vec4 tmpvar_20;
  tmpvar_20 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD3);
  lowp vec4 tmpvar_21;
  tmpvar_21 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec3 tmpvar_22;
  tmpvar_22 = ((8.0 * tmpvar_21.w) * tmpvar_21.xyz);
  c_1.xyz = (tmpvar_3 * max (min (tmpvar_22, ((tmpvar_20.x * 2.0) * tmpvar_21.xyz)), (tmpvar_22 * tmpvar_20.x)));
  c_1.w = tmpvar_5;
  c_1.xyz = (c_1.xyz + tmpvar_4);
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesColor;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
in vec4 _glesMultiTexCoord1;
in vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec3 xlv_TEXCOORD1;
out lowp vec4 xlv_COLOR0;
out highp vec2 xlv_TEXCOORD2;
out highp vec4 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec3 tmpvar_4;
  highp vec3 tmpvar_5;
  tmpvar_4 = tmpvar_1.xyz;
  tmpvar_5 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_6;
  tmpvar_6[0].x = tmpvar_4.x;
  tmpvar_6[0].y = tmpvar_5.x;
  tmpvar_6[0].z = tmpvar_2.x;
  tmpvar_6[1].x = tmpvar_4.y;
  tmpvar_6[1].y = tmpvar_5.y;
  tmpvar_6[1].z = tmpvar_2.y;
  tmpvar_6[2].x = tmpvar_4.z;
  tmpvar_6[2].y = tmpvar_5.z;
  tmpvar_6[2].z = tmpvar_2.z;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _WorldSpaceCameraPos;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = (tmpvar_6 * (((_World2Object * tmpvar_7).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec4 _LightShadowData;
uniform sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
uniform sampler2D unity_Lightmap;
in highp vec4 xlv_TEXCOORD0;
in highp vec3 xlv_TEXCOORD1;
in lowp vec4 xlv_COLOR0;
in highp vec2 xlv_TEXCOORD2;
in highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = xlv_COLOR0;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump float rim_6;
  highp vec4 mask_7;
  highp vec4 color_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture (_MainTex, xlv_TEXCOORD0.xy);
  color_8 = tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture (_Emissive, xlv_TEXCOORD0.xy);
  mask_7 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_6 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = ((_RimColor.xyz * pow (rim_6, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_13;
  tmpvar_13.x = color_8.x;
  tmpvar_13.y = mask_7.x;
  highp vec2 tmpvar_14;
  tmpvar_14.x = color_8.y;
  tmpvar_14.y = mask_7.y;
  highp vec2 tmpvar_15;
  tmpvar_15.x = color_8.z;
  tmpvar_15.y = mask_7.z;
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_8.w;
  tmpvar_16.y = mask_7.w;
  highp vec2 tmpvar_17;
  tmpvar_17 = mix (mix (tmpvar_13, tmpvar_14, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_15, tmpvar_16, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_18;
  tmpvar_18 = mix (tmpvar_17.xxx, mix (mix (vec3(clamp ((tmpvar_17.x + ((1.0 - tmpvar_17.y) * pow (tmpvar_17.x, 2.0))), 0.0, 1.0)), tmpvar_2.xyz, tmpvar_17.yyy), tmpvar_2.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_2.w, 0.0, 1.0)));
  tmpvar_3 = tmpvar_18;
  tmpvar_4 = tmpvar_12;
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_4 * _Opacity);
  tmpvar_4 = tmpvar_19;
  tmpvar_5 = _Opacity;
  lowp float tmpvar_20;
  mediump float lightShadowDataX_21;
  highp float dist_22;
  lowp float tmpvar_23;
  tmpvar_23 = textureProj (_ShadowMapTexture, xlv_TEXCOORD3).x;
  dist_22 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = _LightShadowData.x;
  lightShadowDataX_21 = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = max (float((dist_22 > (xlv_TEXCOORD3.z / xlv_TEXCOORD3.w))), lightShadowDataX_21);
  tmpvar_20 = tmpvar_25;
  c_1.xyz = (tmpvar_3 * min ((2.0 * texture (unity_Lightmap, xlv_TEXCOORD2).xyz), vec3((tmpvar_20 * 2.0))));
  c_1.w = tmpvar_5;
  c_1.xyz = (c_1.xyz + tmpvar_4);
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 26 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_ProjectionParams]
Vector 16 [unity_Scale]
Vector 17 [unity_LightmapST]
Vector 18 [_MainTex_ST]
Vector 19 [_Emissive_ST]
"3.0-!!ARBvp1.0
PARAM c[20] = { { 1, 0.5 },
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R0.xyz, R0, vertex.attrib[14].w;
MOV R1.xyz, c[13];
MOV R1.w, c[0].x;
DP4 R0.w, vertex.position, c[4];
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
MAD R2.xyz, R2, c[16].w, -vertex.position;
DP3 result.texcoord[1].y, R2, R0;
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].y;
MUL R1.y, R1, c[14].x;
DP3 result.texcoord[1].z, vertex.normal, R2;
DP3 result.texcoord[1].x, R2, vertex.attrib[14];
ADD result.texcoord[3].xy, R1, R1.z;
MOV result.position, R0;
MOV result.color, vertex.color;
MOV result.texcoord[3].zw, R0;
MAD result.texcoord[0].zw, vertex.texcoord[1].xyxy, c[19].xyxy, c[19];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[18], c[18].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[1], c[17], c[17].zwzw;
END
# 26 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 27 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_ProjectionParams]
Vector 14 [_ScreenParams]
Vector 15 [unity_Scale]
Vector 16 [unity_LightmapST]
Vector 17 [_MainTex_ST]
Vector 18 [_Emissive_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_color0 o3
dcl_texcoord2 o4
dcl_texcoord3 o5
def c19, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r0.xyz, r0, v1.w
mov r1.xyz, c12
mov r1.w, c19.x
dp4 r0.w, v0, c3
dp4 r2.z, r1, c10
dp4 r2.x, r1, c8
dp4 r2.y, r1, c9
mad r2.xyz, r2, c15.w, -v0
dp3 o2.y, r2, r0
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c19.y
mul r1.y, r1, c13.x
dp3 o2.z, v2, r2
dp3 o2.x, r2, v1
mad o5.xy, r1.z, c14.zwzw, r1
mov o0, r0
mov o3, v5
mov o5.zw, r0
mad o1.zw, v4.xyxy, c18.xyxy, c18
mad o1.xy, v3, c17, c17.zwzw
mad o4.xy, v4, c16, c16.zwzw
"
}
SubProgram "d3d11 " {
// Stats: 21 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 192
Vector 144 [unity_LightmapST]
Vector 160 [_MainTex_ST]
Vector 176 [_Emissive_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedmpnejfobkfacohiclpigaijohcekoahiabaaaaaamiafaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaadamaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefcbaaeaaaaeaaaabaaaeabaaaa
fjaaaaaeegiocaaaaaaaaaaaamaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaa
fjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
pcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaa
gfaaaaadpccabaaaadaaaaaagfaaaaaddccabaaaaeaaaaaagfaaaaadpccabaaa
afaaaaaagiaaaaacadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaa
akaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaa
alaaaaaakgiocaaaaaaaaaaaalaaaaaadiaaaaahhcaabaaaabaaaaaajgbebaaa
abaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaabaaaaaajgbebaaaacaaaaaa
cgbjbaaaabaaaaaaegacbaiaebaaaaaaabaaaaaadiaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaapgbpbaaaabaaaaaadiaaaaajhcaabaaaacaaaaaafgifcaaa
abaaaaaaaeaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaaacaaaaaa
egiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaacaaaaaa
dcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaaabaaaaaa
aeaaaaaaegacbaaaacaaaaaaaaaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaa
egiccaaaacaaaaaabdaaaaaadcaaaaalhcaabaaaacaaaaaaegacbaaaacaaaaaa
pgipcaaaacaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaahcccabaaa
acaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaabaaaaaahbccabaaaacaaaaaa
egbcbaaaabaaaaaaegacbaaaacaaaaaabaaaaaaheccabaaaacaaaaaaegbcbaaa
acaaaaaaegacbaaaacaaaaaadgaaaaafpccabaaaadaaaaaaegbobaaaafaaaaaa
dcaaaaaldccabaaaaeaaaaaaegbabaaaaeaaaaaaegiacaaaaaaaaaaaajaaaaaa
ogikcaaaaaaaaaaaajaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaa
akiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaafaaaaaa
kgaobaaaaaaaaaaaaaaaaaahdccabaaaafaaaaaakgakbaaaabaaaaaamgaabaaa
abaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec3 tmpvar_4;
  highp vec3 tmpvar_5;
  tmpvar_4 = tmpvar_1.xyz;
  tmpvar_5 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_6;
  tmpvar_6[0].x = tmpvar_4.x;
  tmpvar_6[0].y = tmpvar_5.x;
  tmpvar_6[0].z = tmpvar_2.x;
  tmpvar_6[1].x = tmpvar_4.y;
  tmpvar_6[1].y = tmpvar_5.y;
  tmpvar_6[1].z = tmpvar_2.y;
  tmpvar_6[2].x = tmpvar_4.z;
  tmpvar_6[2].y = tmpvar_5.z;
  tmpvar_6[2].z = tmpvar_2.z;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _WorldSpaceCameraPos;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = (tmpvar_6 * (((_World2Object * tmpvar_7).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

uniform highp vec4 _LightShadowData;
uniform lowp vec4 _SpecColor;
uniform sampler2D _ShadowMapTexture;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = xlv_COLOR0;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  lowp float tmpvar_6;
  mediump float rim_7;
  highp vec4 mask_8;
  highp vec4 color_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  color_9 = tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Emissive, xlv_TEXCOORD0.xy);
  mask_8 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_7 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = ((_RimColor.xyz * pow (rim_7, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_14;
  tmpvar_14.x = color_9.x;
  tmpvar_14.y = mask_8.x;
  highp vec2 tmpvar_15;
  tmpvar_15.x = color_9.y;
  tmpvar_15.y = mask_8.y;
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_9.z;
  tmpvar_16.y = mask_8.z;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_9.w;
  tmpvar_17.y = mask_8.w;
  highp vec2 tmpvar_18;
  tmpvar_18 = mix (mix (tmpvar_14, tmpvar_15, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_16, tmpvar_17, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_19;
  tmpvar_19 = mix (tmpvar_18.xxx, mix (mix (vec3(clamp ((tmpvar_18.x + ((1.0 - tmpvar_18.y) * pow (tmpvar_18.x, 2.0))), 0.0, 1.0)), tmpvar_2.xyz, tmpvar_18.yyy), tmpvar_2.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_2.w, 0.0, 1.0)));
  tmpvar_3 = tmpvar_19;
  tmpvar_4 = tmpvar_13;
  highp float tmpvar_20;
  tmpvar_20 = tmpvar_18.x;
  tmpvar_5 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_4 * _Opacity);
  tmpvar_4 = tmpvar_21;
  tmpvar_6 = _Opacity;
  lowp float tmpvar_22;
  mediump float lightShadowDataX_23;
  highp float dist_24;
  lowp float tmpvar_25;
  tmpvar_25 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD3).x;
  dist_24 = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = _LightShadowData.x;
  lightShadowDataX_23 = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = max (float((dist_24 > (xlv_TEXCOORD3.z / xlv_TEXCOORD3.w))), lightShadowDataX_23);
  tmpvar_22 = tmpvar_27;
  c_1.w = 0.0;
  highp vec3 tmpvar_28;
  tmpvar_28 = normalize(xlv_TEXCOORD1);
  mediump vec4 tmpvar_29;
  mediump vec3 viewDir_30;
  viewDir_30 = tmpvar_28;
  mediump vec3 specColor_31;
  highp float nh_32;
  mat3 tmpvar_33;
  tmpvar_33[0].x = 0.816497;
  tmpvar_33[0].y = -0.408248;
  tmpvar_33[0].z = -0.408248;
  tmpvar_33[1].x = 0.0;
  tmpvar_33[1].y = 0.707107;
  tmpvar_33[1].z = -0.707107;
  tmpvar_33[2].x = 0.57735;
  tmpvar_33[2].y = 0.57735;
  tmpvar_33[2].z = 0.57735;
  mediump vec3 scalePerBasisVector_34;
  mediump vec3 lm_35;
  lowp vec3 tmpvar_36;
  tmpvar_36 = (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD2).xyz);
  lm_35 = tmpvar_36;
  lowp vec3 tmpvar_37;
  tmpvar_37 = (2.0 * texture2D (unity_LightmapInd, xlv_TEXCOORD2).xyz);
  scalePerBasisVector_34 = tmpvar_37;
  lm_35 = (lm_35 * dot (clamp ((tmpvar_33 * vec3(0.0, 0.0, 1.0)), 0.0, 1.0), scalePerBasisVector_34));
  vec3 v_38;
  v_38.x = tmpvar_33[0].x;
  v_38.y = tmpvar_33[1].x;
  v_38.z = tmpvar_33[2].x;
  vec3 v_39;
  v_39.x = tmpvar_33[0].y;
  v_39.y = tmpvar_33[1].y;
  v_39.z = tmpvar_33[2].y;
  vec3 v_40;
  v_40.x = tmpvar_33[0].z;
  v_40.y = tmpvar_33[1].z;
  v_40.z = tmpvar_33[2].z;
  mediump float tmpvar_41;
  tmpvar_41 = max (0.0, normalize((normalize((((scalePerBasisVector_34.x * v_38) + (scalePerBasisVector_34.y * v_39)) + (scalePerBasisVector_34.z * v_40))) + viewDir_30)).z);
  nh_32 = tmpvar_41;
  highp float tmpvar_42;
  mediump float arg1_43;
  arg1_43 = (_Shininess * 128.0);
  tmpvar_42 = pow (nh_32, arg1_43);
  highp vec3 tmpvar_44;
  tmpvar_44 = (((lm_35 * _SpecColor.xyz) * tmpvar_5) * tmpvar_42);
  specColor_31 = tmpvar_44;
  highp vec4 tmpvar_45;
  tmpvar_45.xyz = lm_35;
  tmpvar_45.w = tmpvar_42;
  tmpvar_29 = tmpvar_45;
  c_1.xyz = specColor_31;
  lowp vec3 tmpvar_46;
  tmpvar_46 = vec3((tmpvar_22 * 2.0));
  mediump vec3 tmpvar_47;
  tmpvar_47 = (c_1.xyz + (tmpvar_3 * min (tmpvar_29.xyz, tmpvar_46)));
  c_1.xyz = tmpvar_47;
  c_1.w = tmpvar_6;
  c_1.xyz = (c_1.xyz + tmpvar_4);
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec3 tmpvar_5;
  highp vec3 tmpvar_6;
  tmpvar_5 = tmpvar_1.xyz;
  tmpvar_6 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_7;
  tmpvar_7[0].x = tmpvar_5.x;
  tmpvar_7[0].y = tmpvar_6.x;
  tmpvar_7[0].z = tmpvar_2.x;
  tmpvar_7[1].x = tmpvar_5.y;
  tmpvar_7[1].y = tmpvar_6.y;
  tmpvar_7[1].z = tmpvar_2.y;
  tmpvar_7[2].x = tmpvar_5.z;
  tmpvar_7[2].y = tmpvar_6.z;
  tmpvar_7[2].z = tmpvar_2.z;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _WorldSpaceCameraPos;
  highp vec4 o_9;
  highp vec4 tmpvar_10;
  tmpvar_10 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_11;
  tmpvar_11.x = tmpvar_10.x;
  tmpvar_11.y = (tmpvar_10.y * _ProjectionParams.x);
  o_9.xy = (tmpvar_11 + tmpvar_10.w);
  o_9.zw = tmpvar_4.zw;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = (tmpvar_7 * (((_World2Object * tmpvar_8).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = o_9;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _SpecColor;
uniform sampler2D _ShadowMapTexture;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = xlv_COLOR0;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  lowp float tmpvar_6;
  mediump float rim_7;
  highp vec4 mask_8;
  highp vec4 color_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  color_9 = tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Emissive, xlv_TEXCOORD0.xy);
  mask_8 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_7 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = ((_RimColor.xyz * pow (rim_7, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_14;
  tmpvar_14.x = color_9.x;
  tmpvar_14.y = mask_8.x;
  highp vec2 tmpvar_15;
  tmpvar_15.x = color_9.y;
  tmpvar_15.y = mask_8.y;
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_9.z;
  tmpvar_16.y = mask_8.z;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_9.w;
  tmpvar_17.y = mask_8.w;
  highp vec2 tmpvar_18;
  tmpvar_18 = mix (mix (tmpvar_14, tmpvar_15, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_16, tmpvar_17, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_19;
  tmpvar_19 = mix (tmpvar_18.xxx, mix (mix (vec3(clamp ((tmpvar_18.x + ((1.0 - tmpvar_18.y) * pow (tmpvar_18.x, 2.0))), 0.0, 1.0)), tmpvar_2.xyz, tmpvar_18.yyy), tmpvar_2.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_2.w, 0.0, 1.0)));
  tmpvar_3 = tmpvar_19;
  tmpvar_4 = tmpvar_13;
  highp float tmpvar_20;
  tmpvar_20 = tmpvar_18.x;
  tmpvar_5 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_4 * _Opacity);
  tmpvar_4 = tmpvar_21;
  tmpvar_6 = _Opacity;
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD3);
  c_1.w = 0.0;
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (unity_Lightmap, xlv_TEXCOORD2);
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (unity_LightmapInd, xlv_TEXCOORD2);
  highp vec3 tmpvar_25;
  tmpvar_25 = normalize(xlv_TEXCOORD1);
  mediump vec4 tmpvar_26;
  mediump vec3 viewDir_27;
  viewDir_27 = tmpvar_25;
  mediump vec3 specColor_28;
  highp float nh_29;
  mat3 tmpvar_30;
  tmpvar_30[0].x = 0.816497;
  tmpvar_30[0].y = -0.408248;
  tmpvar_30[0].z = -0.408248;
  tmpvar_30[1].x = 0.0;
  tmpvar_30[1].y = 0.707107;
  tmpvar_30[1].z = -0.707107;
  tmpvar_30[2].x = 0.57735;
  tmpvar_30[2].y = 0.57735;
  tmpvar_30[2].z = 0.57735;
  mediump vec3 scalePerBasisVector_31;
  mediump vec3 lm_32;
  lowp vec3 tmpvar_33;
  tmpvar_33 = ((8.0 * tmpvar_23.w) * tmpvar_23.xyz);
  lm_32 = tmpvar_33;
  lowp vec3 tmpvar_34;
  tmpvar_34 = ((8.0 * tmpvar_24.w) * tmpvar_24.xyz);
  scalePerBasisVector_31 = tmpvar_34;
  lm_32 = (lm_32 * dot (clamp ((tmpvar_30 * vec3(0.0, 0.0, 1.0)), 0.0, 1.0), scalePerBasisVector_31));
  vec3 v_35;
  v_35.x = tmpvar_30[0].x;
  v_35.y = tmpvar_30[1].x;
  v_35.z = tmpvar_30[2].x;
  vec3 v_36;
  v_36.x = tmpvar_30[0].y;
  v_36.y = tmpvar_30[1].y;
  v_36.z = tmpvar_30[2].y;
  vec3 v_37;
  v_37.x = tmpvar_30[0].z;
  v_37.y = tmpvar_30[1].z;
  v_37.z = tmpvar_30[2].z;
  mediump float tmpvar_38;
  tmpvar_38 = max (0.0, normalize((normalize((((scalePerBasisVector_31.x * v_35) + (scalePerBasisVector_31.y * v_36)) + (scalePerBasisVector_31.z * v_37))) + viewDir_27)).z);
  nh_29 = tmpvar_38;
  highp float tmpvar_39;
  mediump float arg1_40;
  arg1_40 = (_Shininess * 128.0);
  tmpvar_39 = pow (nh_29, arg1_40);
  highp vec3 tmpvar_41;
  tmpvar_41 = (((lm_32 * _SpecColor.xyz) * tmpvar_5) * tmpvar_39);
  specColor_28 = tmpvar_41;
  highp vec4 tmpvar_42;
  tmpvar_42.xyz = lm_32;
  tmpvar_42.w = tmpvar_39;
  tmpvar_26 = tmpvar_42;
  c_1.xyz = specColor_28;
  lowp vec3 arg1_43;
  arg1_43 = ((tmpvar_22.x * 2.0) * tmpvar_23.xyz);
  mediump vec3 tmpvar_44;
  tmpvar_44 = (c_1.xyz + (tmpvar_3 * max (min (tmpvar_26.xyz, arg1_43), (tmpvar_26.xyz * tmpvar_22.x))));
  c_1.xyz = tmpvar_44;
  c_1.w = tmpvar_6;
  c_1.xyz = (c_1.xyz + tmpvar_4);
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesColor;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
in vec4 _glesMultiTexCoord1;
in vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec3 xlv_TEXCOORD1;
out lowp vec4 xlv_COLOR0;
out highp vec2 xlv_TEXCOORD2;
out highp vec4 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec3 tmpvar_4;
  highp vec3 tmpvar_5;
  tmpvar_4 = tmpvar_1.xyz;
  tmpvar_5 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_6;
  tmpvar_6[0].x = tmpvar_4.x;
  tmpvar_6[0].y = tmpvar_5.x;
  tmpvar_6[0].z = tmpvar_2.x;
  tmpvar_6[1].x = tmpvar_4.y;
  tmpvar_6[1].y = tmpvar_5.y;
  tmpvar_6[1].z = tmpvar_2.y;
  tmpvar_6[2].x = tmpvar_4.z;
  tmpvar_6[2].y = tmpvar_5.z;
  tmpvar_6[2].z = tmpvar_2.z;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _WorldSpaceCameraPos;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = (tmpvar_6 * (((_World2Object * tmpvar_7).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec4 _LightShadowData;
uniform lowp vec4 _SpecColor;
uniform sampler2D _ShadowMapTexture;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
in highp vec4 xlv_TEXCOORD0;
in highp vec3 xlv_TEXCOORD1;
in lowp vec4 xlv_COLOR0;
in highp vec2 xlv_TEXCOORD2;
in highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = xlv_COLOR0;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  lowp float tmpvar_6;
  mediump float rim_7;
  highp vec4 mask_8;
  highp vec4 color_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture (_MainTex, xlv_TEXCOORD0.xy);
  color_9 = tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture (_Emissive, xlv_TEXCOORD0.xy);
  mask_8 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_7 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = ((_RimColor.xyz * pow (rim_7, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_14;
  tmpvar_14.x = color_9.x;
  tmpvar_14.y = mask_8.x;
  highp vec2 tmpvar_15;
  tmpvar_15.x = color_9.y;
  tmpvar_15.y = mask_8.y;
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_9.z;
  tmpvar_16.y = mask_8.z;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_9.w;
  tmpvar_17.y = mask_8.w;
  highp vec2 tmpvar_18;
  tmpvar_18 = mix (mix (tmpvar_14, tmpvar_15, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_16, tmpvar_17, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_19;
  tmpvar_19 = mix (tmpvar_18.xxx, mix (mix (vec3(clamp ((tmpvar_18.x + ((1.0 - tmpvar_18.y) * pow (tmpvar_18.x, 2.0))), 0.0, 1.0)), tmpvar_2.xyz, tmpvar_18.yyy), tmpvar_2.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_2.w, 0.0, 1.0)));
  tmpvar_3 = tmpvar_19;
  tmpvar_4 = tmpvar_13;
  highp float tmpvar_20;
  tmpvar_20 = tmpvar_18.x;
  tmpvar_5 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_4 * _Opacity);
  tmpvar_4 = tmpvar_21;
  tmpvar_6 = _Opacity;
  lowp float tmpvar_22;
  mediump float lightShadowDataX_23;
  highp float dist_24;
  lowp float tmpvar_25;
  tmpvar_25 = textureProj (_ShadowMapTexture, xlv_TEXCOORD3).x;
  dist_24 = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = _LightShadowData.x;
  lightShadowDataX_23 = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = max (float((dist_24 > (xlv_TEXCOORD3.z / xlv_TEXCOORD3.w))), lightShadowDataX_23);
  tmpvar_22 = tmpvar_27;
  c_1.w = 0.0;
  highp vec3 tmpvar_28;
  tmpvar_28 = normalize(xlv_TEXCOORD1);
  mediump vec4 tmpvar_29;
  mediump vec3 viewDir_30;
  viewDir_30 = tmpvar_28;
  mediump vec3 specColor_31;
  highp float nh_32;
  mat3 tmpvar_33;
  tmpvar_33[0].x = 0.816497;
  tmpvar_33[0].y = -0.408248;
  tmpvar_33[0].z = -0.408248;
  tmpvar_33[1].x = 0.0;
  tmpvar_33[1].y = 0.707107;
  tmpvar_33[1].z = -0.707107;
  tmpvar_33[2].x = 0.57735;
  tmpvar_33[2].y = 0.57735;
  tmpvar_33[2].z = 0.57735;
  mediump vec3 scalePerBasisVector_34;
  mediump vec3 lm_35;
  lowp vec3 tmpvar_36;
  tmpvar_36 = (2.0 * texture (unity_Lightmap, xlv_TEXCOORD2).xyz);
  lm_35 = tmpvar_36;
  lowp vec3 tmpvar_37;
  tmpvar_37 = (2.0 * texture (unity_LightmapInd, xlv_TEXCOORD2).xyz);
  scalePerBasisVector_34 = tmpvar_37;
  lm_35 = (lm_35 * dot (clamp ((tmpvar_33 * vec3(0.0, 0.0, 1.0)), 0.0, 1.0), scalePerBasisVector_34));
  vec3 v_38;
  v_38.x = tmpvar_33[0].x;
  v_38.y = tmpvar_33[1].x;
  v_38.z = tmpvar_33[2].x;
  vec3 v_39;
  v_39.x = tmpvar_33[0].y;
  v_39.y = tmpvar_33[1].y;
  v_39.z = tmpvar_33[2].y;
  vec3 v_40;
  v_40.x = tmpvar_33[0].z;
  v_40.y = tmpvar_33[1].z;
  v_40.z = tmpvar_33[2].z;
  mediump float tmpvar_41;
  tmpvar_41 = max (0.0, normalize((normalize((((scalePerBasisVector_34.x * v_38) + (scalePerBasisVector_34.y * v_39)) + (scalePerBasisVector_34.z * v_40))) + viewDir_30)).z);
  nh_32 = tmpvar_41;
  highp float tmpvar_42;
  mediump float arg1_43;
  arg1_43 = (_Shininess * 128.0);
  tmpvar_42 = pow (nh_32, arg1_43);
  highp vec3 tmpvar_44;
  tmpvar_44 = (((lm_35 * _SpecColor.xyz) * tmpvar_5) * tmpvar_42);
  specColor_31 = tmpvar_44;
  highp vec4 tmpvar_45;
  tmpvar_45.xyz = lm_35;
  tmpvar_45.w = tmpvar_42;
  tmpvar_29 = tmpvar_45;
  c_1.xyz = specColor_31;
  lowp vec3 tmpvar_46;
  tmpvar_46 = vec3((tmpvar_22 * 2.0));
  mediump vec3 tmpvar_47;
  tmpvar_47 = (c_1.xyz + (tmpvar_3 * min (tmpvar_29.xyz, tmpvar_46)));
  c_1.xyz = tmpvar_47;
  c_1.w = tmpvar_6;
  c_1.xyz = (c_1.xyz + tmpvar_4);
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 76 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_4LightPosX0]
Vector 16 [unity_4LightPosY0]
Vector 17 [unity_4LightPosZ0]
Vector 18 [unity_4LightAtten0]
Vector 19 [unity_LightColor0]
Vector 20 [unity_LightColor1]
Vector 21 [unity_LightColor2]
Vector 22 [unity_LightColor3]
Vector 23 [unity_SHAr]
Vector 24 [unity_SHAg]
Vector 25 [unity_SHAb]
Vector 26 [unity_SHBr]
Vector 27 [unity_SHBg]
Vector 28 [unity_SHBb]
Vector 29 [unity_SHC]
Vector 30 [unity_Scale]
Vector 31 [_MainTex_ST]
Vector 32 [_Emissive_ST]
"3.0-!!ARBvp1.0
PARAM c[33] = { { 1, 0 },
		state.matrix.mvp,
		program.local[5..32] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R3.xyz, vertex.normal, c[30].w;
DP4 R0.x, vertex.position, c[6];
ADD R1, -R0.x, c[16];
DP3 R3.w, R3, c[6];
DP3 R4.x, R3, c[5];
DP3 R3.x, R3, c[7];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[5];
ADD R0, -R0.x, c[15];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MAD R2, R4.x, R0, R2;
MOV R4.w, c[0].x;
DP4 R4.y, vertex.position, c[7];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[17];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[18];
MOV R4.y, R3.w;
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].x;
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].y;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[20];
MAD R1.xyz, R0.x, c[19], R1;
MAD R0.xyz, R0.z, c[21], R1;
MAD R1.xyz, R0.w, c[22], R0;
MUL R0, R4.xyzz, R4.yzzx;
DP4 R3.z, R0, c[28];
DP4 R3.y, R0, c[27];
DP4 R3.x, R0, c[26];
MUL R1.w, R3, R3;
MAD R0.x, R4, R4, -R1.w;
MOV R0.w, c[0].x;
DP4 R2.z, R4, c[25];
DP4 R2.y, R4, c[24];
DP4 R2.x, R4, c[23];
ADD R2.xyz, R2, R3;
MUL R3.xyz, R0.x, c[29];
ADD R3.xyz, R2, R3;
MOV R0.xyz, vertex.attrib[14];
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
ADD result.texcoord[3].xyz, R3, R1;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MOV R0.xyz, c[13];
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
MAD R0.xyz, R2, c[30].w, -vertex.position;
MUL R2.xyz, R1, vertex.attrib[14].w;
MOV R1, c[14];
DP4 R3.z, R1, c[11];
DP4 R3.x, R1, c[9];
DP4 R3.y, R1, c[10];
DP3 result.texcoord[1].y, R0, R2;
DP3 result.texcoord[2].y, R2, R3;
DP3 result.texcoord[1].z, vertex.normal, R0;
DP3 result.texcoord[1].x, R0, vertex.attrib[14];
DP3 result.texcoord[2].z, vertex.normal, R3;
DP3 result.texcoord[2].x, vertex.attrib[14], R3;
MOV result.color, vertex.color;
MAD result.texcoord[0].zw, vertex.texcoord[1].xyxy, c[32].xyxy, c[32];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[31], c[31].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 76 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 79 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_4LightPosX0]
Vector 15 [unity_4LightPosY0]
Vector 16 [unity_4LightPosZ0]
Vector 17 [unity_4LightAtten0]
Vector 18 [unity_LightColor0]
Vector 19 [unity_LightColor1]
Vector 20 [unity_LightColor2]
Vector 21 [unity_LightColor3]
Vector 22 [unity_SHAr]
Vector 23 [unity_SHAg]
Vector 24 [unity_SHAb]
Vector 25 [unity_SHBr]
Vector 26 [unity_SHBg]
Vector 27 [unity_SHBb]
Vector 28 [unity_SHC]
Vector 29 [unity_Scale]
Vector 30 [_MainTex_ST]
Vector 31 [_Emissive_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_color0 o3
dcl_texcoord2 o4
dcl_texcoord3 o5
def c32, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mul r3.xyz, v2, c29.w
dp4 r0.x, v0, c5
add r1, -r0.x, c15
dp3 r3.w, r3, c5
dp3 r4.x, r3, c4
dp3 r3.x, r3, c6
mul r2, r3.w, r1
dp4 r0.x, v0, c4
add r0, -r0.x, c14
mul r1, r1, r1
mov r4.z, r3.x
mad r2, r4.x, r0, r2
mov r4.w, c32.x
dp4 r4.y, v0, c6
mad r1, r0, r0, r1
add r0, -r4.y, c16
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c17
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c32.x
dp4 r2.z, r4, c24
dp4 r2.y, r4, c23
dp4 r2.x, r4, c22
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c32.y
mul r0, r0, r1
mul r1.xyz, r0.y, c19
mad r1.xyz, r0.x, c18, r1
mad r0.xyz, r0.z, c20, r1
mad r1.xyz, r0.w, c21, r0
mul r0, r4.xyzz, r4.yzzx
mul r1.w, r3, r3
dp4 r3.z, r0, c27
dp4 r3.y, r0, c26
dp4 r3.x, r0, c25
mad r1.w, r4.x, r4.x, -r1
mul r0.xyz, r1.w, c28
add r2.xyz, r2, r3
add r2.xyz, r2, r0
add o5.xyz, r2, r1
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r3.xyz, r0, v1.w
mov r0, c10
dp4 r4.z, c13, r0
mov r0, c9
mov r1.w, c32.x
mov r1.xyz, c12
dp4 r4.y, c13, r0
dp4 r2.z, r1, c10
dp4 r2.x, r1, c8
dp4 r2.y, r1, c9
mad r2.xyz, r2, c29.w, -v0
mov r1, c8
dp4 r4.x, c13, r1
dp3 o2.y, r2, r3
dp3 o4.y, r3, r4
dp3 o2.z, v2, r2
dp3 o2.x, r2, v1
dp3 o4.z, v2, r4
dp3 o4.x, v1, r4
mov o3, v5
mad o1.zw, v4.xyxy, c31.xyxy, c31
mad o1.xy, v3, c30, c30.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 63 math
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 112
Vector 80 [_MainTex_ST]
Vector 96 [_Emissive_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 32 [unity_4LightPosX0]
Vector 48 [unity_4LightPosY0]
Vector 64 [unity_4LightPosZ0]
Vector 80 [unity_4LightAtten0]
Vector 96 [unity_LightColor0]
Vector 112 [unity_LightColor1]
Vector 128 [unity_LightColor2]
Vector 144 [unity_LightColor3]
Vector 160 [unity_LightColor4]
Vector 176 [unity_LightColor5]
Vector 192 [unity_LightColor6]
Vector 208 [unity_LightColor7]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefieceddffjjpnhpihfmdbhbiknaagkbpgdjaliabaaaaaahealaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefclmajaaaaeaaaabaagpacaaaa
fjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaad
pcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaacagaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaa
dcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaagaaaaaa
kgiocaaaaaaaaaaaagaaaaaadiaaaaahhcaabaaaaaaaaaaajgbebaaaabaaaaaa
cgbjbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaajgbebaaaacaaaaaacgbjbaaa
abaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaapgbpbaaaabaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaabaaaaaa
aeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaa
egacbaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaa
adaaaaaabdaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaa
adaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaahcccabaaaacaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbccabaaaacaaaaaaegbcbaaa
abaaaaaaegacbaaaabaaaaaabaaaaaaheccabaaaacaaaaaaegbcbaaaacaaaaaa
egacbaaaabaaaaaadgaaaaafpccabaaaadaaaaaaegbobaaaafaaaaaadiaaaaaj
hcaabaaaabaaaaaafgifcaaaacaaaaaaaaaaaaaaegiccaaaadaaaaaabbaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaacaaaaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaa
bcaaaaaakgikcaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaa
abaaaaaaegiccaaaadaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
baaaaaahbccabaaaaeaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaah
eccabaaaaeaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadgaaaaaficaabaaa
aaaaaaaaabeaaaaaaaaaiadpdiaaaaaihcaabaaaabaaaaaaegbcbaaaacaaaaaa
pgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaa
egiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaaadaaaaaa
amaaaaaaagaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaadaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaabbaaaaai
bcaabaaaabaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaai
ccaabaaaabaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaai
ecaabaaaabaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaah
pcaabaaaacaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaa
adaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaa
adaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaa
adaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahicaabaaaaaaaaaaa
bkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakicaabaaaaaaaaaaaakaabaaa
aaaaaaaaakaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaacaaaaaacmaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaa
diaaaaaihcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaakhcaabaaaacaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaa
egacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgbkbaaaaaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
adaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaacaaaaaaaaaaaaajpcaabaaa
adaaaaaafgafbaiaebaaaaaaacaaaaaaegiocaaaacaaaaaaadaaaaaadiaaaaah
pcaabaaaaeaaaaaafgafbaaaaaaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaa
adaaaaaaegaobaaaadaaaaaaegaobaaaadaaaaaaaaaaaaajpcaabaaaafaaaaaa
agaabaiaebaaaaaaacaaaaaaegiocaaaacaaaaaaacaaaaaaaaaaaaajpcaabaaa
acaaaaaakgakbaiaebaaaaaaacaaaaaaegiocaaaacaaaaaaaeaaaaaadcaaaaaj
pcaabaaaaeaaaaaaegaobaaaafaaaaaaagaabaaaaaaaaaaaegaobaaaaeaaaaaa
dcaaaaajpcaabaaaaaaaaaaaegaobaaaacaaaaaakgakbaaaaaaaaaaaegaobaaa
aeaaaaaadcaaaaajpcaabaaaadaaaaaaegaobaaaafaaaaaaegaobaaaafaaaaaa
egaobaaaadaaaaaadcaaaaajpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaa
acaaaaaaegaobaaaadaaaaaaeeaaaaafpcaabaaaadaaaaaaegaobaaaacaaaaaa
dcaaaaanpcaabaaaacaaaaaaegaobaaaacaaaaaaegiocaaaacaaaaaaafaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpaoaaaaakpcaabaaaacaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpegaobaaaacaaaaaadiaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaadaaaaaadeaaaaakpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
diaaaaahpcaabaaaaaaaaaaaegaobaaaacaaaaaaegaobaaaaaaaaaaadiaaaaai
hcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaahaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaacaaaaaaagaaaaaaagaabaaaaaaaaaaaegacbaaa
acaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaiaaaaaakgakbaaa
aaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaa
ajaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaahhccabaaaafaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightAtten0;
uniform highp vec4 unity_LightColor[8];
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec3 shlight_3;
  highp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  mat3 tmpvar_7;
  tmpvar_7[0] = _Object2World[0].xyz;
  tmpvar_7[1] = _Object2World[1].xyz;
  tmpvar_7[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_7 * (tmpvar_2 * unity_Scale.w));
  highp vec3 tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_9 = tmpvar_1.xyz;
  tmpvar_10 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_11;
  tmpvar_11[0].x = tmpvar_9.x;
  tmpvar_11[0].y = tmpvar_10.x;
  tmpvar_11[0].z = tmpvar_2.x;
  tmpvar_11[1].x = tmpvar_9.y;
  tmpvar_11[1].y = tmpvar_10.y;
  tmpvar_11[1].z = tmpvar_2.y;
  tmpvar_11[2].x = tmpvar_9.z;
  tmpvar_11[2].y = tmpvar_10.z;
  tmpvar_11[2].z = tmpvar_2.z;
  highp vec3 tmpvar_12;
  tmpvar_12 = (tmpvar_11 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = _WorldSpaceCameraPos;
  highp vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_8;
  mediump vec3 tmpvar_15;
  mediump vec4 normal_16;
  normal_16 = tmpvar_14;
  highp float vC_17;
  mediump vec3 x3_18;
  mediump vec3 x2_19;
  mediump vec3 x1_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHAr, normal_16);
  x1_20.x = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHAg, normal_16);
  x1_20.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHAb, normal_16);
  x1_20.z = tmpvar_23;
  mediump vec4 tmpvar_24;
  tmpvar_24 = (normal_16.xyzz * normal_16.yzzx);
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHBr, tmpvar_24);
  x2_19.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHBg, tmpvar_24);
  x2_19.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHBb, tmpvar_24);
  x2_19.z = tmpvar_27;
  mediump float tmpvar_28;
  tmpvar_28 = ((normal_16.x * normal_16.x) - (normal_16.y * normal_16.y));
  vC_17 = tmpvar_28;
  highp vec3 tmpvar_29;
  tmpvar_29 = (unity_SHC.xyz * vC_17);
  x3_18 = tmpvar_29;
  tmpvar_15 = ((x1_20 + x2_19) + x3_18);
  shlight_3 = tmpvar_15;
  tmpvar_6 = shlight_3;
  highp vec3 tmpvar_30;
  tmpvar_30 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_31;
  tmpvar_31 = (unity_4LightPosX0 - tmpvar_30.x);
  highp vec4 tmpvar_32;
  tmpvar_32 = (unity_4LightPosY0 - tmpvar_30.y);
  highp vec4 tmpvar_33;
  tmpvar_33 = (unity_4LightPosZ0 - tmpvar_30.z);
  highp vec4 tmpvar_34;
  tmpvar_34 = (((tmpvar_31 * tmpvar_31) + (tmpvar_32 * tmpvar_32)) + (tmpvar_33 * tmpvar_33));
  highp vec4 tmpvar_35;
  tmpvar_35 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_31 * tmpvar_8.x) + (tmpvar_32 * tmpvar_8.y)) + (tmpvar_33 * tmpvar_8.z)) * inversesqrt(tmpvar_34))) * (1.0/((1.0 + (tmpvar_34 * unity_4LightAtten0)))));
  highp vec3 tmpvar_36;
  tmpvar_36 = (tmpvar_6 + ((((unity_LightColor[0].xyz * tmpvar_35.x) + (unity_LightColor[1].xyz * tmpvar_35.y)) + (unity_LightColor[2].xyz * tmpvar_35.z)) + (unity_LightColor[3].xyz * tmpvar_35.w)));
  tmpvar_6 = tmpvar_36;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = (tmpvar_11 * (((_World2Object * tmpvar_13).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = xlv_COLOR0;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  lowp float tmpvar_6;
  mediump float rim_7;
  highp vec4 mask_8;
  highp vec4 color_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  color_9 = tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Emissive, xlv_TEXCOORD0.xy);
  mask_8 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_7 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = ((_RimColor.xyz * pow (rim_7, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_14;
  tmpvar_14.x = color_9.x;
  tmpvar_14.y = mask_8.x;
  highp vec2 tmpvar_15;
  tmpvar_15.x = color_9.y;
  tmpvar_15.y = mask_8.y;
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_9.z;
  tmpvar_16.y = mask_8.z;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_9.w;
  tmpvar_17.y = mask_8.w;
  highp vec2 tmpvar_18;
  tmpvar_18 = mix (mix (tmpvar_14, tmpvar_15, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_16, tmpvar_17, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_19;
  tmpvar_19 = mix (tmpvar_18.xxx, mix (mix (vec3(clamp ((tmpvar_18.x + ((1.0 - tmpvar_18.y) * pow (tmpvar_18.x, 2.0))), 0.0, 1.0)), tmpvar_2.xyz, tmpvar_18.yyy), tmpvar_2.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_2.w, 0.0, 1.0)));
  tmpvar_3 = tmpvar_19;
  tmpvar_4 = tmpvar_13;
  highp float tmpvar_20;
  tmpvar_20 = tmpvar_18.x;
  tmpvar_5 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_4 * _Opacity);
  tmpvar_4 = tmpvar_21;
  tmpvar_6 = _Opacity;
  highp vec3 tmpvar_22;
  tmpvar_22 = normalize(xlv_TEXCOORD1);
  mediump vec3 viewDir_23;
  viewDir_23 = tmpvar_22;
  lowp vec4 c_24;
  highp float nh_25;
  lowp float tmpvar_26;
  tmpvar_26 = max (0.0, xlv_TEXCOORD2.z);
  mediump float tmpvar_27;
  tmpvar_27 = max (0.0, normalize((xlv_TEXCOORD2 + viewDir_23)).z);
  nh_25 = tmpvar_27;
  mediump float arg1_28;
  arg1_28 = (_Shininess * 128.0);
  highp float tmpvar_29;
  tmpvar_29 = (pow (nh_25, arg1_28) * tmpvar_5);
  highp vec3 tmpvar_30;
  tmpvar_30 = ((((tmpvar_3 * _LightColor0.xyz) * tmpvar_26) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_29)) * 2.0);
  c_24.xyz = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (tmpvar_6 + ((_LightColor0.w * _SpecColor.w) * tmpvar_29));
  c_24.w = tmpvar_31;
  c_1.w = c_24.w;
  c_1.xyz = (c_24.xyz + (tmpvar_3 * xlv_TEXCOORD3));
  c_1.xyz = (c_1.xyz + tmpvar_4);
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightAtten0;
uniform highp vec4 unity_LightColor[8];
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec3 shlight_3;
  highp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  mat3 tmpvar_7;
  tmpvar_7[0] = _Object2World[0].xyz;
  tmpvar_7[1] = _Object2World[1].xyz;
  tmpvar_7[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_7 * (tmpvar_2 * unity_Scale.w));
  highp vec3 tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_9 = tmpvar_1.xyz;
  tmpvar_10 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_11;
  tmpvar_11[0].x = tmpvar_9.x;
  tmpvar_11[0].y = tmpvar_10.x;
  tmpvar_11[0].z = tmpvar_2.x;
  tmpvar_11[1].x = tmpvar_9.y;
  tmpvar_11[1].y = tmpvar_10.y;
  tmpvar_11[1].z = tmpvar_2.y;
  tmpvar_11[2].x = tmpvar_9.z;
  tmpvar_11[2].y = tmpvar_10.z;
  tmpvar_11[2].z = tmpvar_2.z;
  highp vec3 tmpvar_12;
  tmpvar_12 = (tmpvar_11 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = _WorldSpaceCameraPos;
  highp vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_8;
  mediump vec3 tmpvar_15;
  mediump vec4 normal_16;
  normal_16 = tmpvar_14;
  highp float vC_17;
  mediump vec3 x3_18;
  mediump vec3 x2_19;
  mediump vec3 x1_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHAr, normal_16);
  x1_20.x = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHAg, normal_16);
  x1_20.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHAb, normal_16);
  x1_20.z = tmpvar_23;
  mediump vec4 tmpvar_24;
  tmpvar_24 = (normal_16.xyzz * normal_16.yzzx);
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHBr, tmpvar_24);
  x2_19.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHBg, tmpvar_24);
  x2_19.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHBb, tmpvar_24);
  x2_19.z = tmpvar_27;
  mediump float tmpvar_28;
  tmpvar_28 = ((normal_16.x * normal_16.x) - (normal_16.y * normal_16.y));
  vC_17 = tmpvar_28;
  highp vec3 tmpvar_29;
  tmpvar_29 = (unity_SHC.xyz * vC_17);
  x3_18 = tmpvar_29;
  tmpvar_15 = ((x1_20 + x2_19) + x3_18);
  shlight_3 = tmpvar_15;
  tmpvar_6 = shlight_3;
  highp vec3 tmpvar_30;
  tmpvar_30 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_31;
  tmpvar_31 = (unity_4LightPosX0 - tmpvar_30.x);
  highp vec4 tmpvar_32;
  tmpvar_32 = (unity_4LightPosY0 - tmpvar_30.y);
  highp vec4 tmpvar_33;
  tmpvar_33 = (unity_4LightPosZ0 - tmpvar_30.z);
  highp vec4 tmpvar_34;
  tmpvar_34 = (((tmpvar_31 * tmpvar_31) + (tmpvar_32 * tmpvar_32)) + (tmpvar_33 * tmpvar_33));
  highp vec4 tmpvar_35;
  tmpvar_35 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_31 * tmpvar_8.x) + (tmpvar_32 * tmpvar_8.y)) + (tmpvar_33 * tmpvar_8.z)) * inversesqrt(tmpvar_34))) * (1.0/((1.0 + (tmpvar_34 * unity_4LightAtten0)))));
  highp vec3 tmpvar_36;
  tmpvar_36 = (tmpvar_6 + ((((unity_LightColor[0].xyz * tmpvar_35.x) + (unity_LightColor[1].xyz * tmpvar_35.y)) + (unity_LightColor[2].xyz * tmpvar_35.z)) + (unity_LightColor[3].xyz * tmpvar_35.w)));
  tmpvar_6 = tmpvar_36;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = (tmpvar_11 * (((_World2Object * tmpvar_13).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = xlv_COLOR0;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  lowp float tmpvar_6;
  mediump float rim_7;
  highp vec4 mask_8;
  highp vec4 color_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  color_9 = tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Emissive, xlv_TEXCOORD0.xy);
  mask_8 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_7 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = ((_RimColor.xyz * pow (rim_7, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_14;
  tmpvar_14.x = color_9.x;
  tmpvar_14.y = mask_8.x;
  highp vec2 tmpvar_15;
  tmpvar_15.x = color_9.y;
  tmpvar_15.y = mask_8.y;
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_9.z;
  tmpvar_16.y = mask_8.z;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_9.w;
  tmpvar_17.y = mask_8.w;
  highp vec2 tmpvar_18;
  tmpvar_18 = mix (mix (tmpvar_14, tmpvar_15, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_16, tmpvar_17, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_19;
  tmpvar_19 = mix (tmpvar_18.xxx, mix (mix (vec3(clamp ((tmpvar_18.x + ((1.0 - tmpvar_18.y) * pow (tmpvar_18.x, 2.0))), 0.0, 1.0)), tmpvar_2.xyz, tmpvar_18.yyy), tmpvar_2.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_2.w, 0.0, 1.0)));
  tmpvar_3 = tmpvar_19;
  tmpvar_4 = tmpvar_13;
  highp float tmpvar_20;
  tmpvar_20 = tmpvar_18.x;
  tmpvar_5 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_4 * _Opacity);
  tmpvar_4 = tmpvar_21;
  tmpvar_6 = _Opacity;
  highp vec3 tmpvar_22;
  tmpvar_22 = normalize(xlv_TEXCOORD1);
  mediump vec3 viewDir_23;
  viewDir_23 = tmpvar_22;
  lowp vec4 c_24;
  highp float nh_25;
  lowp float tmpvar_26;
  tmpvar_26 = max (0.0, xlv_TEXCOORD2.z);
  mediump float tmpvar_27;
  tmpvar_27 = max (0.0, normalize((xlv_TEXCOORD2 + viewDir_23)).z);
  nh_25 = tmpvar_27;
  mediump float arg1_28;
  arg1_28 = (_Shininess * 128.0);
  highp float tmpvar_29;
  tmpvar_29 = (pow (nh_25, arg1_28) * tmpvar_5);
  highp vec3 tmpvar_30;
  tmpvar_30 = ((((tmpvar_3 * _LightColor0.xyz) * tmpvar_26) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_29)) * 2.0);
  c_24.xyz = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (tmpvar_6 + ((_LightColor0.w * _SpecColor.w) * tmpvar_29));
  c_24.w = tmpvar_31;
  c_1.w = c_24.w;
  c_1.xyz = (c_24.xyz + (tmpvar_3 * xlv_TEXCOORD3));
  c_1.xyz = (c_1.xyz + tmpvar_4);
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesColor;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
in vec4 _glesMultiTexCoord1;
in vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightAtten0;
uniform highp vec4 unity_LightColor[8];
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec3 xlv_TEXCOORD1;
out lowp vec4 xlv_COLOR0;
out lowp vec3 xlv_TEXCOORD2;
out lowp vec3 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec3 shlight_3;
  highp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  mat3 tmpvar_7;
  tmpvar_7[0] = _Object2World[0].xyz;
  tmpvar_7[1] = _Object2World[1].xyz;
  tmpvar_7[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_7 * (tmpvar_2 * unity_Scale.w));
  highp vec3 tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_9 = tmpvar_1.xyz;
  tmpvar_10 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_11;
  tmpvar_11[0].x = tmpvar_9.x;
  tmpvar_11[0].y = tmpvar_10.x;
  tmpvar_11[0].z = tmpvar_2.x;
  tmpvar_11[1].x = tmpvar_9.y;
  tmpvar_11[1].y = tmpvar_10.y;
  tmpvar_11[1].z = tmpvar_2.y;
  tmpvar_11[2].x = tmpvar_9.z;
  tmpvar_11[2].y = tmpvar_10.z;
  tmpvar_11[2].z = tmpvar_2.z;
  highp vec3 tmpvar_12;
  tmpvar_12 = (tmpvar_11 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = _WorldSpaceCameraPos;
  highp vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_8;
  mediump vec3 tmpvar_15;
  mediump vec4 normal_16;
  normal_16 = tmpvar_14;
  highp float vC_17;
  mediump vec3 x3_18;
  mediump vec3 x2_19;
  mediump vec3 x1_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHAr, normal_16);
  x1_20.x = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHAg, normal_16);
  x1_20.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHAb, normal_16);
  x1_20.z = tmpvar_23;
  mediump vec4 tmpvar_24;
  tmpvar_24 = (normal_16.xyzz * normal_16.yzzx);
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHBr, tmpvar_24);
  x2_19.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHBg, tmpvar_24);
  x2_19.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHBb, tmpvar_24);
  x2_19.z = tmpvar_27;
  mediump float tmpvar_28;
  tmpvar_28 = ((normal_16.x * normal_16.x) - (normal_16.y * normal_16.y));
  vC_17 = tmpvar_28;
  highp vec3 tmpvar_29;
  tmpvar_29 = (unity_SHC.xyz * vC_17);
  x3_18 = tmpvar_29;
  tmpvar_15 = ((x1_20 + x2_19) + x3_18);
  shlight_3 = tmpvar_15;
  tmpvar_6 = shlight_3;
  highp vec3 tmpvar_30;
  tmpvar_30 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_31;
  tmpvar_31 = (unity_4LightPosX0 - tmpvar_30.x);
  highp vec4 tmpvar_32;
  tmpvar_32 = (unity_4LightPosY0 - tmpvar_30.y);
  highp vec4 tmpvar_33;
  tmpvar_33 = (unity_4LightPosZ0 - tmpvar_30.z);
  highp vec4 tmpvar_34;
  tmpvar_34 = (((tmpvar_31 * tmpvar_31) + (tmpvar_32 * tmpvar_32)) + (tmpvar_33 * tmpvar_33));
  highp vec4 tmpvar_35;
  tmpvar_35 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_31 * tmpvar_8.x) + (tmpvar_32 * tmpvar_8.y)) + (tmpvar_33 * tmpvar_8.z)) * inversesqrt(tmpvar_34))) * (1.0/((1.0 + (tmpvar_34 * unity_4LightAtten0)))));
  highp vec3 tmpvar_36;
  tmpvar_36 = (tmpvar_6 + ((((unity_LightColor[0].xyz * tmpvar_35.x) + (unity_LightColor[1].xyz * tmpvar_35.y)) + (unity_LightColor[2].xyz * tmpvar_35.z)) + (unity_LightColor[3].xyz * tmpvar_35.w)));
  tmpvar_6 = tmpvar_36;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = (tmpvar_11 * (((_World2Object * tmpvar_13).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
in highp vec4 xlv_TEXCOORD0;
in highp vec3 xlv_TEXCOORD1;
in lowp vec4 xlv_COLOR0;
in lowp vec3 xlv_TEXCOORD2;
in lowp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = xlv_COLOR0;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  lowp float tmpvar_6;
  mediump float rim_7;
  highp vec4 mask_8;
  highp vec4 color_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture (_MainTex, xlv_TEXCOORD0.xy);
  color_9 = tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture (_Emissive, xlv_TEXCOORD0.xy);
  mask_8 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_7 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = ((_RimColor.xyz * pow (rim_7, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_14;
  tmpvar_14.x = color_9.x;
  tmpvar_14.y = mask_8.x;
  highp vec2 tmpvar_15;
  tmpvar_15.x = color_9.y;
  tmpvar_15.y = mask_8.y;
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_9.z;
  tmpvar_16.y = mask_8.z;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_9.w;
  tmpvar_17.y = mask_8.w;
  highp vec2 tmpvar_18;
  tmpvar_18 = mix (mix (tmpvar_14, tmpvar_15, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_16, tmpvar_17, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_19;
  tmpvar_19 = mix (tmpvar_18.xxx, mix (mix (vec3(clamp ((tmpvar_18.x + ((1.0 - tmpvar_18.y) * pow (tmpvar_18.x, 2.0))), 0.0, 1.0)), tmpvar_2.xyz, tmpvar_18.yyy), tmpvar_2.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_2.w, 0.0, 1.0)));
  tmpvar_3 = tmpvar_19;
  tmpvar_4 = tmpvar_13;
  highp float tmpvar_20;
  tmpvar_20 = tmpvar_18.x;
  tmpvar_5 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_4 * _Opacity);
  tmpvar_4 = tmpvar_21;
  tmpvar_6 = _Opacity;
  highp vec3 tmpvar_22;
  tmpvar_22 = normalize(xlv_TEXCOORD1);
  mediump vec3 viewDir_23;
  viewDir_23 = tmpvar_22;
  lowp vec4 c_24;
  highp float nh_25;
  lowp float tmpvar_26;
  tmpvar_26 = max (0.0, xlv_TEXCOORD2.z);
  mediump float tmpvar_27;
  tmpvar_27 = max (0.0, normalize((xlv_TEXCOORD2 + viewDir_23)).z);
  nh_25 = tmpvar_27;
  mediump float arg1_28;
  arg1_28 = (_Shininess * 128.0);
  highp float tmpvar_29;
  tmpvar_29 = (pow (nh_25, arg1_28) * tmpvar_5);
  highp vec3 tmpvar_30;
  tmpvar_30 = ((((tmpvar_3 * _LightColor0.xyz) * tmpvar_26) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_29)) * 2.0);
  c_24.xyz = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (tmpvar_6 + ((_LightColor0.w * _SpecColor.w) * tmpvar_29));
  c_24.w = tmpvar_31;
  c_1.w = c_24.w;
  c_1.xyz = (c_24.xyz + (tmpvar_3 * xlv_TEXCOORD3));
  c_1.xyz = (c_1.xyz + tmpvar_4);
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 81 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_ProjectionParams]
Vector 15 [_WorldSpaceLightPos0]
Vector 16 [unity_4LightPosX0]
Vector 17 [unity_4LightPosY0]
Vector 18 [unity_4LightPosZ0]
Vector 19 [unity_4LightAtten0]
Vector 20 [unity_LightColor0]
Vector 21 [unity_LightColor1]
Vector 22 [unity_LightColor2]
Vector 23 [unity_LightColor3]
Vector 24 [unity_SHAr]
Vector 25 [unity_SHAg]
Vector 26 [unity_SHAb]
Vector 27 [unity_SHBr]
Vector 28 [unity_SHBg]
Vector 29 [unity_SHBb]
Vector 30 [unity_SHC]
Vector 31 [unity_Scale]
Vector 32 [_MainTex_ST]
Vector 33 [_Emissive_ST]
"3.0-!!ARBvp1.0
PARAM c[34] = { { 1, 0, 0.5 },
		state.matrix.mvp,
		program.local[5..33] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R3.xyz, vertex.normal, c[31].w;
DP4 R0.x, vertex.position, c[6];
ADD R1, -R0.x, c[17];
DP3 R3.w, R3, c[6];
DP3 R4.x, R3, c[5];
DP3 R3.x, R3, c[7];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[5];
ADD R0, -R0.x, c[16];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MAD R2, R4.x, R0, R2;
MOV R4.w, c[0].x;
DP4 R4.y, vertex.position, c[7];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[18];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[19];
MOV R4.y, R3.w;
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].x;
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].y;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[21];
MAD R1.xyz, R0.x, c[20], R1;
MAD R0.xyz, R0.z, c[22], R1;
MAD R1.xyz, R0.w, c[23], R0;
MUL R0, R4.xyzz, R4.yzzx;
DP4 R3.z, R0, c[29];
DP4 R3.y, R0, c[28];
DP4 R3.x, R0, c[27];
MUL R1.w, R3, R3;
MOV R0.w, c[0].x;
MAD R0.x, R4, R4, -R1.w;
DP4 R2.z, R4, c[26];
DP4 R2.y, R4, c[25];
DP4 R2.x, R4, c[24];
ADD R2.xyz, R2, R3;
MUL R3.xyz, R0.x, c[30];
ADD R3.xyz, R2, R3;
MOV R0.xyz, vertex.attrib[14];
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
ADD result.texcoord[3].xyz, R3, R1;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MOV R0.xyz, c[13];
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
MAD R0.xyz, R2, c[31].w, -vertex.position;
MUL R2.xyz, R1, vertex.attrib[14].w;
MOV R1, c[15];
DP4 R3.z, R1, c[11];
DP4 R3.x, R1, c[9];
DP4 R3.y, R1, c[10];
DP3 result.texcoord[1].y, R0, R2;
DP3 result.texcoord[1].z, vertex.normal, R0;
DP3 result.texcoord[1].x, R0, vertex.attrib[14];
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].z;
MUL R1.y, R1, c[14].x;
DP3 result.texcoord[2].y, R2, R3;
DP3 result.texcoord[2].z, vertex.normal, R3;
DP3 result.texcoord[2].x, vertex.attrib[14], R3;
ADD result.texcoord[4].xy, R1, R1.z;
MOV result.position, R0;
MOV result.color, vertex.color;
MOV result.texcoord[4].zw, R0;
MAD result.texcoord[0].zw, vertex.texcoord[1].xyxy, c[33].xyxy, c[33];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[32], c[32].zwzw;
END
# 81 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 84 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_ProjectionParams]
Vector 14 [_ScreenParams]
Vector 15 [_WorldSpaceLightPos0]
Vector 16 [unity_4LightPosX0]
Vector 17 [unity_4LightPosY0]
Vector 18 [unity_4LightPosZ0]
Vector 19 [unity_4LightAtten0]
Vector 20 [unity_LightColor0]
Vector 21 [unity_LightColor1]
Vector 22 [unity_LightColor2]
Vector 23 [unity_LightColor3]
Vector 24 [unity_SHAr]
Vector 25 [unity_SHAg]
Vector 26 [unity_SHAb]
Vector 27 [unity_SHBr]
Vector 28 [unity_SHBg]
Vector 29 [unity_SHBb]
Vector 30 [unity_SHC]
Vector 31 [unity_Scale]
Vector 32 [_MainTex_ST]
Vector 33 [_Emissive_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_color0 o3
dcl_texcoord2 o4
dcl_texcoord3 o5
dcl_texcoord4 o6
def c34, 1.00000000, 0.00000000, 0.50000000, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mul r3.xyz, v2, c31.w
dp4 r0.x, v0, c5
add r1, -r0.x, c17
dp3 r3.w, r3, c5
dp3 r4.x, r3, c4
dp3 r3.x, r3, c6
mul r2, r3.w, r1
dp4 r0.x, v0, c4
add r0, -r0.x, c16
mul r1, r1, r1
mov r4.z, r3.x
mad r2, r4.x, r0, r2
mov r4.w, c34.x
dp4 r4.y, v0, c6
mad r1, r0, r0, r1
add r0, -r4.y, c18
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c19
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c34.x
dp4 r2.z, r4, c26
dp4 r2.y, r4, c25
dp4 r2.x, r4, c24
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c34.y
mul r0, r0, r1
mul r1.xyz, r0.y, c21
mad r1.xyz, r0.x, c20, r1
mad r0.xyz, r0.z, c22, r1
mad r1.xyz, r0.w, c23, r0
mul r0, r4.xyzz, r4.yzzx
mul r1.w, r3, r3
dp4 r3.z, r0, c29
dp4 r3.y, r0, c28
dp4 r3.x, r0, c27
mad r1.w, r4.x, r4.x, -r1
mul r0.xyz, r1.w, c30
add r2.xyz, r2, r3
add r2.xyz, r2, r0
add o5.xyz, r2, r1
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r3.xyz, r0, v1.w
mov r0, c10
dp4 r4.z, c15, r0
mov r0, c9
dp4 r4.y, c15, r0
mov r1.w, c34.x
mov r1.xyz, c12
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r2.z, r1, c10
dp4 r2.x, r1, c8
dp4 r2.y, r1, c9
mad r2.xyz, r2, c31.w, -v0
mov r1, c8
dp4 r4.x, c15, r1
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c34.z
mul r1.y, r1, c13.x
dp3 o2.y, r2, r3
dp3 o4.y, r3, r4
dp3 o2.z, v2, r2
dp3 o2.x, r2, v1
dp3 o4.z, v2, r4
dp3 o4.x, v1, r4
mad o6.xy, r1.z, c14.zwzw, r1
mov o0, r0
mov o3, v5
mov o6.zw, r0
mad o1.zw, v4.xyxy, c33.xyxy, c33
mad o1.xy, v3, c32, c32.zwzw
"
}
SubProgram "d3d11 " {
// Stats: 66 math
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 176
Vector 144 [_MainTex_ST]
Vector 160 [_Emissive_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 32 [unity_4LightPosX0]
Vector 48 [unity_4LightPosY0]
Vector 64 [unity_4LightPosZ0]
Vector 80 [unity_4LightAtten0]
Vector 96 [unity_LightColor0]
Vector 112 [unity_LightColor1]
Vector 128 [unity_LightColor2]
Vector 144 [unity_LightColor3]
Vector 160 [unity_LightColor4]
Vector 176 [unity_LightColor5]
Vector 192 [unity_LightColor6]
Vector 208 [unity_LightColor7]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedgjehdbbkleaifhcgilbkhhcjfgjbeeoiabaaaaaaceamaaaaadaaaaaa
cmaaaaaapeaaaaaamiabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheommaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaamfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaagaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklfdeieefcfeakaaaaeaaaabaajfacaaaafjaaaaaeegiocaaa
aaaaaaaaalaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaa
acaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaadpcbabaaaafaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaad
hccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
gfaaaaadhccabaaaafaaaaaagfaaaaadpccabaaaagaaaaaagiaaaaacahaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaadcaaaaalmccabaaa
abaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaakaaaaaakgiocaaaaaaaaaaa
akaaaaaadiaaaaahhcaabaaaabaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaa
dcaaaaakhcaabaaaabaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaia
ebaaaaaaabaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgbpbaaa
abaaaaaadiaaaaajhcaabaaaacaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaa
adaaaaaabbaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaadaaaaaabaaaaaaa
agiacaaaabaaaaaaaeaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaa
egiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaacaaaaaa
aaaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaegiccaaaadaaaaaabdaaaaaa
dcaaaaalhcaabaaaacaaaaaaegacbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaa
egbcbaiaebaaaaaaaaaaaaaabaaaaaahcccabaaaacaaaaaaegacbaaaabaaaaaa
egacbaaaacaaaaaabaaaaaahbccabaaaacaaaaaaegbcbaaaabaaaaaaegacbaaa
acaaaaaabaaaaaaheccabaaaacaaaaaaegbcbaaaacaaaaaaegacbaaaacaaaaaa
dgaaaaafpccabaaaadaaaaaaegbobaaaafaaaaaadiaaaaajhcaabaaaacaaaaaa
fgifcaaaacaaaaaaaaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaa
acaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaa
acaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaa
acaaaaaaaaaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaa
adaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaaegacbaaaacaaaaaabaaaaaah
cccabaaaaeaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaabaaaaaahbccabaaa
aeaaaaaaegbcbaaaabaaaaaaegacbaaaacaaaaaabaaaaaaheccabaaaaeaaaaaa
egbcbaaaacaaaaaaegacbaaaacaaaaaadgaaaaaficaabaaaabaaaaaaabeaaaaa
aaaaiadpdiaaaaaihcaabaaaacaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaa
beaaaaaadiaaaaaihcaabaaaadaaaaaafgafbaaaacaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaaklcaabaaaacaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaa
acaaaaaaegaibaaaadaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaa
aoaaaaaakgakbaaaacaaaaaaegadbaaaacaaaaaabbaaaaaibcaabaaaacaaaaaa
egiocaaaacaaaaaacgaaaaaaegaobaaaabaaaaaabbaaaaaiccaabaaaacaaaaaa
egiocaaaacaaaaaachaaaaaaegaobaaaabaaaaaabbaaaaaiecaabaaaacaaaaaa
egiocaaaacaaaaaaciaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaa
jgacbaaaabaaaaaaegakbaaaabaaaaaabbaaaaaibcaabaaaaeaaaaaaegiocaaa
acaaaaaacjaaaaaaegaobaaaadaaaaaabbaaaaaiccaabaaaaeaaaaaaegiocaaa
acaaaaaackaaaaaaegaobaaaadaaaaaabbaaaaaiecaabaaaaeaaaaaaegiocaaa
acaaaaaaclaaaaaaegaobaaaadaaaaaaaaaaaaahhcaabaaaacaaaaaaegacbaaa
acaaaaaaegacbaaaaeaaaaaadiaaaaahicaabaaaabaaaaaabkaabaaaabaaaaaa
bkaabaaaabaaaaaadcaaaaakicaabaaaabaaaaaaakaabaaaabaaaaaaakaabaaa
abaaaaaadkaabaiaebaaaaaaabaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
acaaaaaacmaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaa
adaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaa
adaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaadaaaaaa
dcaaaaakhcaabaaaadaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaa
egacbaaaadaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaadaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegacbaaaadaaaaaaaaaaaaajpcaabaaaaeaaaaaafgafbaia
ebaaaaaaadaaaaaaegiocaaaacaaaaaaadaaaaaadiaaaaahpcaabaaaafaaaaaa
fgafbaaaabaaaaaaegaobaaaaeaaaaaadiaaaaahpcaabaaaaeaaaaaaegaobaaa
aeaaaaaaegaobaaaaeaaaaaaaaaaaaajpcaabaaaagaaaaaaagaabaiaebaaaaaa
adaaaaaaegiocaaaacaaaaaaacaaaaaaaaaaaaajpcaabaaaadaaaaaakgakbaia
ebaaaaaaadaaaaaaegiocaaaacaaaaaaaeaaaaaadcaaaaajpcaabaaaafaaaaaa
egaobaaaagaaaaaaagaabaaaabaaaaaaegaobaaaafaaaaaadcaaaaajpcaabaaa
abaaaaaaegaobaaaadaaaaaakgakbaaaabaaaaaaegaobaaaafaaaaaadcaaaaaj
pcaabaaaaeaaaaaaegaobaaaagaaaaaaegaobaaaagaaaaaaegaobaaaaeaaaaaa
dcaaaaajpcaabaaaadaaaaaaegaobaaaadaaaaaaegaobaaaadaaaaaaegaobaaa
aeaaaaaaeeaaaaafpcaabaaaaeaaaaaaegaobaaaadaaaaaadcaaaaanpcaabaaa
adaaaaaaegaobaaaadaaaaaaegiocaaaacaaaaaaafaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpaoaaaaakpcaabaaaadaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpegaobaaaadaaaaaadiaaaaahpcaabaaaabaaaaaa
egaobaaaabaaaaaaegaobaaaaeaaaaaadeaaaaakpcaabaaaabaaaaaaegaobaaa
abaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaahpcaabaaa
abaaaaaaegaobaaaadaaaaaaegaobaaaabaaaaaadiaaaaaihcaabaaaadaaaaaa
fgafbaaaabaaaaaaegiccaaaacaaaaaaahaaaaaadcaaaaakhcaabaaaadaaaaaa
egiccaaaacaaaaaaagaaaaaaagaabaaaabaaaaaaegacbaaaadaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaacaaaaaaaiaaaaaakgakbaaaabaaaaaaegacbaaa
adaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaaajaaaaaapgapbaaa
abaaaaaaegacbaaaabaaaaaaaaaaaaahhccabaaaafaaaaaaegacbaaaabaaaaaa
egacbaaaacaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaa
abaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaa
aaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaagaaaaaakgaobaaa
aaaaaaaaaaaaaaahdccabaaaagaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaa
doaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightAtten0;
uniform highp vec4 unity_LightColor[8];
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec3 shlight_3;
  highp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  mat3 tmpvar_7;
  tmpvar_7[0] = _Object2World[0].xyz;
  tmpvar_7[1] = _Object2World[1].xyz;
  tmpvar_7[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_7 * (tmpvar_2 * unity_Scale.w));
  highp vec3 tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_9 = tmpvar_1.xyz;
  tmpvar_10 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_11;
  tmpvar_11[0].x = tmpvar_9.x;
  tmpvar_11[0].y = tmpvar_10.x;
  tmpvar_11[0].z = tmpvar_2.x;
  tmpvar_11[1].x = tmpvar_9.y;
  tmpvar_11[1].y = tmpvar_10.y;
  tmpvar_11[1].z = tmpvar_2.y;
  tmpvar_11[2].x = tmpvar_9.z;
  tmpvar_11[2].y = tmpvar_10.z;
  tmpvar_11[2].z = tmpvar_2.z;
  highp vec3 tmpvar_12;
  tmpvar_12 = (tmpvar_11 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = _WorldSpaceCameraPos;
  highp vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_8;
  mediump vec3 tmpvar_15;
  mediump vec4 normal_16;
  normal_16 = tmpvar_14;
  highp float vC_17;
  mediump vec3 x3_18;
  mediump vec3 x2_19;
  mediump vec3 x1_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHAr, normal_16);
  x1_20.x = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHAg, normal_16);
  x1_20.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHAb, normal_16);
  x1_20.z = tmpvar_23;
  mediump vec4 tmpvar_24;
  tmpvar_24 = (normal_16.xyzz * normal_16.yzzx);
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHBr, tmpvar_24);
  x2_19.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHBg, tmpvar_24);
  x2_19.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHBb, tmpvar_24);
  x2_19.z = tmpvar_27;
  mediump float tmpvar_28;
  tmpvar_28 = ((normal_16.x * normal_16.x) - (normal_16.y * normal_16.y));
  vC_17 = tmpvar_28;
  highp vec3 tmpvar_29;
  tmpvar_29 = (unity_SHC.xyz * vC_17);
  x3_18 = tmpvar_29;
  tmpvar_15 = ((x1_20 + x2_19) + x3_18);
  shlight_3 = tmpvar_15;
  tmpvar_6 = shlight_3;
  highp vec3 tmpvar_30;
  tmpvar_30 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_31;
  tmpvar_31 = (unity_4LightPosX0 - tmpvar_30.x);
  highp vec4 tmpvar_32;
  tmpvar_32 = (unity_4LightPosY0 - tmpvar_30.y);
  highp vec4 tmpvar_33;
  tmpvar_33 = (unity_4LightPosZ0 - tmpvar_30.z);
  highp vec4 tmpvar_34;
  tmpvar_34 = (((tmpvar_31 * tmpvar_31) + (tmpvar_32 * tmpvar_32)) + (tmpvar_33 * tmpvar_33));
  highp vec4 tmpvar_35;
  tmpvar_35 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_31 * tmpvar_8.x) + (tmpvar_32 * tmpvar_8.y)) + (tmpvar_33 * tmpvar_8.z)) * inversesqrt(tmpvar_34))) * (1.0/((1.0 + (tmpvar_34 * unity_4LightAtten0)))));
  highp vec3 tmpvar_36;
  tmpvar_36 = (tmpvar_6 + ((((unity_LightColor[0].xyz * tmpvar_35.x) + (unity_LightColor[1].xyz * tmpvar_35.y)) + (unity_LightColor[2].xyz * tmpvar_35.z)) + (unity_LightColor[3].xyz * tmpvar_35.w)));
  tmpvar_6 = tmpvar_36;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = (tmpvar_11 * (((_World2Object * tmpvar_13).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

uniform highp vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _ShadowMapTexture;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = xlv_COLOR0;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  lowp float tmpvar_6;
  mediump float rim_7;
  highp vec4 mask_8;
  highp vec4 color_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  color_9 = tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Emissive, xlv_TEXCOORD0.xy);
  mask_8 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_7 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = ((_RimColor.xyz * pow (rim_7, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_14;
  tmpvar_14.x = color_9.x;
  tmpvar_14.y = mask_8.x;
  highp vec2 tmpvar_15;
  tmpvar_15.x = color_9.y;
  tmpvar_15.y = mask_8.y;
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_9.z;
  tmpvar_16.y = mask_8.z;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_9.w;
  tmpvar_17.y = mask_8.w;
  highp vec2 tmpvar_18;
  tmpvar_18 = mix (mix (tmpvar_14, tmpvar_15, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_16, tmpvar_17, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_19;
  tmpvar_19 = mix (tmpvar_18.xxx, mix (mix (vec3(clamp ((tmpvar_18.x + ((1.0 - tmpvar_18.y) * pow (tmpvar_18.x, 2.0))), 0.0, 1.0)), tmpvar_2.xyz, tmpvar_18.yyy), tmpvar_2.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_2.w, 0.0, 1.0)));
  tmpvar_3 = tmpvar_19;
  tmpvar_4 = tmpvar_13;
  highp float tmpvar_20;
  tmpvar_20 = tmpvar_18.x;
  tmpvar_5 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_4 * _Opacity);
  tmpvar_4 = tmpvar_21;
  tmpvar_6 = _Opacity;
  lowp float tmpvar_22;
  mediump float lightShadowDataX_23;
  highp float dist_24;
  lowp float tmpvar_25;
  tmpvar_25 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD4).x;
  dist_24 = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = _LightShadowData.x;
  lightShadowDataX_23 = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = max (float((dist_24 > (xlv_TEXCOORD4.z / xlv_TEXCOORD4.w))), lightShadowDataX_23);
  tmpvar_22 = tmpvar_27;
  highp vec3 tmpvar_28;
  tmpvar_28 = normalize(xlv_TEXCOORD1);
  mediump vec3 viewDir_29;
  viewDir_29 = tmpvar_28;
  lowp vec4 c_30;
  highp float nh_31;
  lowp float tmpvar_32;
  tmpvar_32 = max (0.0, xlv_TEXCOORD2.z);
  mediump float tmpvar_33;
  tmpvar_33 = max (0.0, normalize((xlv_TEXCOORD2 + viewDir_29)).z);
  nh_31 = tmpvar_33;
  mediump float arg1_34;
  arg1_34 = (_Shininess * 128.0);
  highp float tmpvar_35;
  tmpvar_35 = (pow (nh_31, arg1_34) * tmpvar_5);
  highp vec3 tmpvar_36;
  tmpvar_36 = ((((tmpvar_3 * _LightColor0.xyz) * tmpvar_32) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_35)) * (tmpvar_22 * 2.0));
  c_30.xyz = tmpvar_36;
  highp float tmpvar_37;
  tmpvar_37 = (tmpvar_6 + (((_LightColor0.w * _SpecColor.w) * tmpvar_35) * tmpvar_22));
  c_30.w = tmpvar_37;
  c_1.w = c_30.w;
  c_1.xyz = (c_30.xyz + (tmpvar_3 * xlv_TEXCOORD3));
  c_1.xyz = (c_1.xyz + tmpvar_4);
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightAtten0;
uniform highp vec4 unity_LightColor[8];
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec3 shlight_3;
  highp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (tmpvar_2 * unity_Scale.w));
  highp vec3 tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_10 = tmpvar_1.xyz;
  tmpvar_11 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_12;
  tmpvar_12[0].x = tmpvar_10.x;
  tmpvar_12[0].y = tmpvar_11.x;
  tmpvar_12[0].z = tmpvar_2.x;
  tmpvar_12[1].x = tmpvar_10.y;
  tmpvar_12[1].y = tmpvar_11.y;
  tmpvar_12[1].z = tmpvar_2.y;
  tmpvar_12[2].x = tmpvar_10.z;
  tmpvar_12[2].y = tmpvar_11.z;
  tmpvar_12[2].z = tmpvar_2.z;
  highp vec3 tmpvar_13;
  tmpvar_13 = (tmpvar_12 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = _WorldSpaceCameraPos;
  highp vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = tmpvar_9;
  mediump vec3 tmpvar_16;
  mediump vec4 normal_17;
  normal_17 = tmpvar_15;
  highp float vC_18;
  mediump vec3 x3_19;
  mediump vec3 x2_20;
  mediump vec3 x1_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHAr, normal_17);
  x1_21.x = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHAg, normal_17);
  x1_21.y = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = dot (unity_SHAb, normal_17);
  x1_21.z = tmpvar_24;
  mediump vec4 tmpvar_25;
  tmpvar_25 = (normal_17.xyzz * normal_17.yzzx);
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHBr, tmpvar_25);
  x2_20.x = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHBg, tmpvar_25);
  x2_20.y = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = dot (unity_SHBb, tmpvar_25);
  x2_20.z = tmpvar_28;
  mediump float tmpvar_29;
  tmpvar_29 = ((normal_17.x * normal_17.x) - (normal_17.y * normal_17.y));
  vC_18 = tmpvar_29;
  highp vec3 tmpvar_30;
  tmpvar_30 = (unity_SHC.xyz * vC_18);
  x3_19 = tmpvar_30;
  tmpvar_16 = ((x1_21 + x2_20) + x3_19);
  shlight_3 = tmpvar_16;
  tmpvar_6 = shlight_3;
  highp vec3 tmpvar_31;
  tmpvar_31 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_32;
  tmpvar_32 = (unity_4LightPosX0 - tmpvar_31.x);
  highp vec4 tmpvar_33;
  tmpvar_33 = (unity_4LightPosY0 - tmpvar_31.y);
  highp vec4 tmpvar_34;
  tmpvar_34 = (unity_4LightPosZ0 - tmpvar_31.z);
  highp vec4 tmpvar_35;
  tmpvar_35 = (((tmpvar_32 * tmpvar_32) + (tmpvar_33 * tmpvar_33)) + (tmpvar_34 * tmpvar_34));
  highp vec4 tmpvar_36;
  tmpvar_36 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_32 * tmpvar_9.x) + (tmpvar_33 * tmpvar_9.y)) + (tmpvar_34 * tmpvar_9.z)) * inversesqrt(tmpvar_35))) * (1.0/((1.0 + (tmpvar_35 * unity_4LightAtten0)))));
  highp vec3 tmpvar_37;
  tmpvar_37 = (tmpvar_6 + ((((unity_LightColor[0].xyz * tmpvar_36.x) + (unity_LightColor[1].xyz * tmpvar_36.y)) + (unity_LightColor[2].xyz * tmpvar_36.z)) + (unity_LightColor[3].xyz * tmpvar_36.w)));
  tmpvar_6 = tmpvar_37;
  highp vec4 o_38;
  highp vec4 tmpvar_39;
  tmpvar_39 = (tmpvar_7 * 0.5);
  highp vec2 tmpvar_40;
  tmpvar_40.x = tmpvar_39.x;
  tmpvar_40.y = (tmpvar_39.y * _ProjectionParams.x);
  o_38.xy = (tmpvar_40 + tmpvar_39.w);
  o_38.zw = tmpvar_7.zw;
  gl_Position = tmpvar_7;
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = (tmpvar_12 * (((_World2Object * tmpvar_14).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = o_38;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _ShadowMapTexture;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = xlv_COLOR0;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  lowp float tmpvar_6;
  mediump float rim_7;
  highp vec4 mask_8;
  highp vec4 color_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  color_9 = tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Emissive, xlv_TEXCOORD0.xy);
  mask_8 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_7 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = ((_RimColor.xyz * pow (rim_7, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_14;
  tmpvar_14.x = color_9.x;
  tmpvar_14.y = mask_8.x;
  highp vec2 tmpvar_15;
  tmpvar_15.x = color_9.y;
  tmpvar_15.y = mask_8.y;
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_9.z;
  tmpvar_16.y = mask_8.z;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_9.w;
  tmpvar_17.y = mask_8.w;
  highp vec2 tmpvar_18;
  tmpvar_18 = mix (mix (tmpvar_14, tmpvar_15, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_16, tmpvar_17, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_19;
  tmpvar_19 = mix (tmpvar_18.xxx, mix (mix (vec3(clamp ((tmpvar_18.x + ((1.0 - tmpvar_18.y) * pow (tmpvar_18.x, 2.0))), 0.0, 1.0)), tmpvar_2.xyz, tmpvar_18.yyy), tmpvar_2.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_2.w, 0.0, 1.0)));
  tmpvar_3 = tmpvar_19;
  tmpvar_4 = tmpvar_13;
  highp float tmpvar_20;
  tmpvar_20 = tmpvar_18.x;
  tmpvar_5 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_4 * _Opacity);
  tmpvar_4 = tmpvar_21;
  tmpvar_6 = _Opacity;
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD4);
  highp vec3 tmpvar_23;
  tmpvar_23 = normalize(xlv_TEXCOORD1);
  mediump vec3 viewDir_24;
  viewDir_24 = tmpvar_23;
  lowp vec4 c_25;
  highp float nh_26;
  lowp float tmpvar_27;
  tmpvar_27 = max (0.0, xlv_TEXCOORD2.z);
  mediump float tmpvar_28;
  tmpvar_28 = max (0.0, normalize((xlv_TEXCOORD2 + viewDir_24)).z);
  nh_26 = tmpvar_28;
  mediump float arg1_29;
  arg1_29 = (_Shininess * 128.0);
  highp float tmpvar_30;
  tmpvar_30 = (pow (nh_26, arg1_29) * tmpvar_5);
  highp vec3 tmpvar_31;
  tmpvar_31 = ((((tmpvar_3 * _LightColor0.xyz) * tmpvar_27) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_30)) * (tmpvar_22.x * 2.0));
  c_25.xyz = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = (tmpvar_6 + (((_LightColor0.w * _SpecColor.w) * tmpvar_30) * tmpvar_22.x));
  c_25.w = tmpvar_32;
  c_1.w = c_25.w;
  c_1.xyz = (c_25.xyz + (tmpvar_3 * xlv_TEXCOORD3));
  c_1.xyz = (c_1.xyz + tmpvar_4);
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesColor;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
in vec4 _glesMultiTexCoord1;
in vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightAtten0;
uniform highp vec4 unity_LightColor[8];
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec3 xlv_TEXCOORD1;
out lowp vec4 xlv_COLOR0;
out lowp vec3 xlv_TEXCOORD2;
out lowp vec3 xlv_TEXCOORD3;
out highp vec4 xlv_TEXCOORD4;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec3 shlight_3;
  highp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  mat3 tmpvar_7;
  tmpvar_7[0] = _Object2World[0].xyz;
  tmpvar_7[1] = _Object2World[1].xyz;
  tmpvar_7[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_7 * (tmpvar_2 * unity_Scale.w));
  highp vec3 tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_9 = tmpvar_1.xyz;
  tmpvar_10 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_11;
  tmpvar_11[0].x = tmpvar_9.x;
  tmpvar_11[0].y = tmpvar_10.x;
  tmpvar_11[0].z = tmpvar_2.x;
  tmpvar_11[1].x = tmpvar_9.y;
  tmpvar_11[1].y = tmpvar_10.y;
  tmpvar_11[1].z = tmpvar_2.y;
  tmpvar_11[2].x = tmpvar_9.z;
  tmpvar_11[2].y = tmpvar_10.z;
  tmpvar_11[2].z = tmpvar_2.z;
  highp vec3 tmpvar_12;
  tmpvar_12 = (tmpvar_11 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = _WorldSpaceCameraPos;
  highp vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_8;
  mediump vec3 tmpvar_15;
  mediump vec4 normal_16;
  normal_16 = tmpvar_14;
  highp float vC_17;
  mediump vec3 x3_18;
  mediump vec3 x2_19;
  mediump vec3 x1_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHAr, normal_16);
  x1_20.x = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHAg, normal_16);
  x1_20.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHAb, normal_16);
  x1_20.z = tmpvar_23;
  mediump vec4 tmpvar_24;
  tmpvar_24 = (normal_16.xyzz * normal_16.yzzx);
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHBr, tmpvar_24);
  x2_19.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHBg, tmpvar_24);
  x2_19.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHBb, tmpvar_24);
  x2_19.z = tmpvar_27;
  mediump float tmpvar_28;
  tmpvar_28 = ((normal_16.x * normal_16.x) - (normal_16.y * normal_16.y));
  vC_17 = tmpvar_28;
  highp vec3 tmpvar_29;
  tmpvar_29 = (unity_SHC.xyz * vC_17);
  x3_18 = tmpvar_29;
  tmpvar_15 = ((x1_20 + x2_19) + x3_18);
  shlight_3 = tmpvar_15;
  tmpvar_6 = shlight_3;
  highp vec3 tmpvar_30;
  tmpvar_30 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_31;
  tmpvar_31 = (unity_4LightPosX0 - tmpvar_30.x);
  highp vec4 tmpvar_32;
  tmpvar_32 = (unity_4LightPosY0 - tmpvar_30.y);
  highp vec4 tmpvar_33;
  tmpvar_33 = (unity_4LightPosZ0 - tmpvar_30.z);
  highp vec4 tmpvar_34;
  tmpvar_34 = (((tmpvar_31 * tmpvar_31) + (tmpvar_32 * tmpvar_32)) + (tmpvar_33 * tmpvar_33));
  highp vec4 tmpvar_35;
  tmpvar_35 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_31 * tmpvar_8.x) + (tmpvar_32 * tmpvar_8.y)) + (tmpvar_33 * tmpvar_8.z)) * inversesqrt(tmpvar_34))) * (1.0/((1.0 + (tmpvar_34 * unity_4LightAtten0)))));
  highp vec3 tmpvar_36;
  tmpvar_36 = (tmpvar_6 + ((((unity_LightColor[0].xyz * tmpvar_35.x) + (unity_LightColor[1].xyz * tmpvar_35.y)) + (unity_LightColor[2].xyz * tmpvar_35.z)) + (unity_LightColor[3].xyz * tmpvar_35.w)));
  tmpvar_6 = tmpvar_36;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = (tmpvar_11 * (((_World2Object * tmpvar_13).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _ShadowMapTexture;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
in highp vec4 xlv_TEXCOORD0;
in highp vec3 xlv_TEXCOORD1;
in lowp vec4 xlv_COLOR0;
in lowp vec3 xlv_TEXCOORD2;
in lowp vec3 xlv_TEXCOORD3;
in highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = xlv_COLOR0;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  lowp float tmpvar_6;
  mediump float rim_7;
  highp vec4 mask_8;
  highp vec4 color_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture (_MainTex, xlv_TEXCOORD0.xy);
  color_9 = tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture (_Emissive, xlv_TEXCOORD0.xy);
  mask_8 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_7 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = ((_RimColor.xyz * pow (rim_7, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_14;
  tmpvar_14.x = color_9.x;
  tmpvar_14.y = mask_8.x;
  highp vec2 tmpvar_15;
  tmpvar_15.x = color_9.y;
  tmpvar_15.y = mask_8.y;
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_9.z;
  tmpvar_16.y = mask_8.z;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_9.w;
  tmpvar_17.y = mask_8.w;
  highp vec2 tmpvar_18;
  tmpvar_18 = mix (mix (tmpvar_14, tmpvar_15, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_16, tmpvar_17, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_19;
  tmpvar_19 = mix (tmpvar_18.xxx, mix (mix (vec3(clamp ((tmpvar_18.x + ((1.0 - tmpvar_18.y) * pow (tmpvar_18.x, 2.0))), 0.0, 1.0)), tmpvar_2.xyz, tmpvar_18.yyy), tmpvar_2.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_2.w, 0.0, 1.0)));
  tmpvar_3 = tmpvar_19;
  tmpvar_4 = tmpvar_13;
  highp float tmpvar_20;
  tmpvar_20 = tmpvar_18.x;
  tmpvar_5 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_4 * _Opacity);
  tmpvar_4 = tmpvar_21;
  tmpvar_6 = _Opacity;
  lowp float tmpvar_22;
  mediump float lightShadowDataX_23;
  highp float dist_24;
  lowp float tmpvar_25;
  tmpvar_25 = textureProj (_ShadowMapTexture, xlv_TEXCOORD4).x;
  dist_24 = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = _LightShadowData.x;
  lightShadowDataX_23 = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = max (float((dist_24 > (xlv_TEXCOORD4.z / xlv_TEXCOORD4.w))), lightShadowDataX_23);
  tmpvar_22 = tmpvar_27;
  highp vec3 tmpvar_28;
  tmpvar_28 = normalize(xlv_TEXCOORD1);
  mediump vec3 viewDir_29;
  viewDir_29 = tmpvar_28;
  lowp vec4 c_30;
  highp float nh_31;
  lowp float tmpvar_32;
  tmpvar_32 = max (0.0, xlv_TEXCOORD2.z);
  mediump float tmpvar_33;
  tmpvar_33 = max (0.0, normalize((xlv_TEXCOORD2 + viewDir_29)).z);
  nh_31 = tmpvar_33;
  mediump float arg1_34;
  arg1_34 = (_Shininess * 128.0);
  highp float tmpvar_35;
  tmpvar_35 = (pow (nh_31, arg1_34) * tmpvar_5);
  highp vec3 tmpvar_36;
  tmpvar_36 = ((((tmpvar_3 * _LightColor0.xyz) * tmpvar_32) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_35)) * (tmpvar_22 * 2.0));
  c_30.xyz = tmpvar_36;
  highp float tmpvar_37;
  tmpvar_37 = (tmpvar_6 + (((_LightColor0.w * _SpecColor.w) * tmpvar_35) * tmpvar_22));
  c_30.w = tmpvar_37;
  c_1.w = c_30.w;
  c_1.xyz = (c_30.xyz + (tmpvar_3 * xlv_TEXCOORD3));
  c_1.xyz = (c_1.xyz + tmpvar_4);
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES


#ifdef VERTEX

#extension GL_EXT_shadow_samplers : enable
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec3 shlight_3;
  highp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  mat3 tmpvar_7;
  tmpvar_7[0] = _Object2World[0].xyz;
  tmpvar_7[1] = _Object2World[1].xyz;
  tmpvar_7[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_8 = tmpvar_1.xyz;
  tmpvar_9 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_10;
  tmpvar_10[0].x = tmpvar_8.x;
  tmpvar_10[0].y = tmpvar_9.x;
  tmpvar_10[0].z = tmpvar_2.x;
  tmpvar_10[1].x = tmpvar_8.y;
  tmpvar_10[1].y = tmpvar_9.y;
  tmpvar_10[1].z = tmpvar_2.y;
  tmpvar_10[2].x = tmpvar_8.z;
  tmpvar_10[2].y = tmpvar_9.z;
  tmpvar_10[2].z = tmpvar_2.z;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_11;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = _WorldSpaceCameraPos;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = (tmpvar_7 * (tmpvar_2 * unity_Scale.w));
  mediump vec3 tmpvar_14;
  mediump vec4 normal_15;
  normal_15 = tmpvar_13;
  highp float vC_16;
  mediump vec3 x3_17;
  mediump vec3 x2_18;
  mediump vec3 x1_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHAr, normal_15);
  x1_19.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHAg, normal_15);
  x1_19.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHAb, normal_15);
  x1_19.z = tmpvar_22;
  mediump vec4 tmpvar_23;
  tmpvar_23 = (normal_15.xyzz * normal_15.yzzx);
  highp float tmpvar_24;
  tmpvar_24 = dot (unity_SHBr, tmpvar_23);
  x2_18.x = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHBg, tmpvar_23);
  x2_18.y = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHBb, tmpvar_23);
  x2_18.z = tmpvar_26;
  mediump float tmpvar_27;
  tmpvar_27 = ((normal_15.x * normal_15.x) - (normal_15.y * normal_15.y));
  vC_16 = tmpvar_27;
  highp vec3 tmpvar_28;
  tmpvar_28 = (unity_SHC.xyz * vC_16);
  x3_17 = tmpvar_28;
  tmpvar_14 = ((x1_19 + x2_18) + x3_17);
  shlight_3 = tmpvar_14;
  tmpvar_6 = shlight_3;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = (tmpvar_10 * (((_World2Object * tmpvar_12).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

#extension GL_EXT_shadow_samplers : enable
uniform highp vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = xlv_COLOR0;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  lowp float tmpvar_6;
  mediump float rim_7;
  highp vec4 mask_8;
  highp vec4 color_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  color_9 = tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Emissive, xlv_TEXCOORD0.xy);
  mask_8 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_7 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = ((_RimColor.xyz * pow (rim_7, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_14;
  tmpvar_14.x = color_9.x;
  tmpvar_14.y = mask_8.x;
  highp vec2 tmpvar_15;
  tmpvar_15.x = color_9.y;
  tmpvar_15.y = mask_8.y;
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_9.z;
  tmpvar_16.y = mask_8.z;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_9.w;
  tmpvar_17.y = mask_8.w;
  highp vec2 tmpvar_18;
  tmpvar_18 = mix (mix (tmpvar_14, tmpvar_15, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_16, tmpvar_17, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_19;
  tmpvar_19 = mix (tmpvar_18.xxx, mix (mix (vec3(clamp ((tmpvar_18.x + ((1.0 - tmpvar_18.y) * pow (tmpvar_18.x, 2.0))), 0.0, 1.0)), tmpvar_2.xyz, tmpvar_18.yyy), tmpvar_2.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_2.w, 0.0, 1.0)));
  tmpvar_3 = tmpvar_19;
  tmpvar_4 = tmpvar_13;
  highp float tmpvar_20;
  tmpvar_20 = tmpvar_18.x;
  tmpvar_5 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_4 * _Opacity);
  tmpvar_4 = tmpvar_21;
  tmpvar_6 = _Opacity;
  lowp float shadow_22;
  lowp float tmpvar_23;
  tmpvar_23 = shadow2DEXT (_ShadowMapTexture, xlv_TEXCOORD4.xyz);
  highp float tmpvar_24;
  tmpvar_24 = (_LightShadowData.x + (tmpvar_23 * (1.0 - _LightShadowData.x)));
  shadow_22 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = normalize(xlv_TEXCOORD1);
  mediump vec3 viewDir_26;
  viewDir_26 = tmpvar_25;
  lowp vec4 c_27;
  highp float nh_28;
  lowp float tmpvar_29;
  tmpvar_29 = max (0.0, xlv_TEXCOORD2.z);
  mediump float tmpvar_30;
  tmpvar_30 = max (0.0, normalize((xlv_TEXCOORD2 + viewDir_26)).z);
  nh_28 = tmpvar_30;
  mediump float arg1_31;
  arg1_31 = (_Shininess * 128.0);
  highp float tmpvar_32;
  tmpvar_32 = (pow (nh_28, arg1_31) * tmpvar_5);
  highp vec3 tmpvar_33;
  tmpvar_33 = ((((tmpvar_3 * _LightColor0.xyz) * tmpvar_29) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_32)) * (shadow_22 * 2.0));
  c_27.xyz = tmpvar_33;
  highp float tmpvar_34;
  tmpvar_34 = (tmpvar_6 + (((_LightColor0.w * _SpecColor.w) * tmpvar_32) * shadow_22));
  c_27.w = tmpvar_34;
  c_1.w = c_27.w;
  c_1.xyz = (c_27.xyz + (tmpvar_3 * xlv_TEXCOORD3));
  c_1.xyz = (c_1.xyz + tmpvar_4);
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesColor;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
in vec4 _glesMultiTexCoord1;
in vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec3 xlv_TEXCOORD1;
out lowp vec4 xlv_COLOR0;
out lowp vec3 xlv_TEXCOORD2;
out lowp vec3 xlv_TEXCOORD3;
out highp vec4 xlv_TEXCOORD4;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec3 shlight_3;
  highp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  mat3 tmpvar_7;
  tmpvar_7[0] = _Object2World[0].xyz;
  tmpvar_7[1] = _Object2World[1].xyz;
  tmpvar_7[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_8 = tmpvar_1.xyz;
  tmpvar_9 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_10;
  tmpvar_10[0].x = tmpvar_8.x;
  tmpvar_10[0].y = tmpvar_9.x;
  tmpvar_10[0].z = tmpvar_2.x;
  tmpvar_10[1].x = tmpvar_8.y;
  tmpvar_10[1].y = tmpvar_9.y;
  tmpvar_10[1].z = tmpvar_2.y;
  tmpvar_10[2].x = tmpvar_8.z;
  tmpvar_10[2].y = tmpvar_9.z;
  tmpvar_10[2].z = tmpvar_2.z;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_11;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = _WorldSpaceCameraPos;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = (tmpvar_7 * (tmpvar_2 * unity_Scale.w));
  mediump vec3 tmpvar_14;
  mediump vec4 normal_15;
  normal_15 = tmpvar_13;
  highp float vC_16;
  mediump vec3 x3_17;
  mediump vec3 x2_18;
  mediump vec3 x1_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHAr, normal_15);
  x1_19.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHAg, normal_15);
  x1_19.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHAb, normal_15);
  x1_19.z = tmpvar_22;
  mediump vec4 tmpvar_23;
  tmpvar_23 = (normal_15.xyzz * normal_15.yzzx);
  highp float tmpvar_24;
  tmpvar_24 = dot (unity_SHBr, tmpvar_23);
  x2_18.x = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHBg, tmpvar_23);
  x2_18.y = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHBb, tmpvar_23);
  x2_18.z = tmpvar_26;
  mediump float tmpvar_27;
  tmpvar_27 = ((normal_15.x * normal_15.x) - (normal_15.y * normal_15.y));
  vC_16 = tmpvar_27;
  highp vec3 tmpvar_28;
  tmpvar_28 = (unity_SHC.xyz * vC_16);
  x3_17 = tmpvar_28;
  tmpvar_14 = ((x1_19 + x2_18) + x3_17);
  shlight_3 = tmpvar_14;
  tmpvar_6 = shlight_3;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = (tmpvar_10 * (((_World2Object * tmpvar_12).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
in highp vec4 xlv_TEXCOORD0;
in highp vec3 xlv_TEXCOORD1;
in lowp vec4 xlv_COLOR0;
in lowp vec3 xlv_TEXCOORD2;
in lowp vec3 xlv_TEXCOORD3;
in highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = xlv_COLOR0;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  lowp float tmpvar_6;
  mediump float rim_7;
  highp vec4 mask_8;
  highp vec4 color_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture (_MainTex, xlv_TEXCOORD0.xy);
  color_9 = tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture (_Emissive, xlv_TEXCOORD0.xy);
  mask_8 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_7 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = ((_RimColor.xyz * pow (rim_7, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_14;
  tmpvar_14.x = color_9.x;
  tmpvar_14.y = mask_8.x;
  highp vec2 tmpvar_15;
  tmpvar_15.x = color_9.y;
  tmpvar_15.y = mask_8.y;
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_9.z;
  tmpvar_16.y = mask_8.z;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_9.w;
  tmpvar_17.y = mask_8.w;
  highp vec2 tmpvar_18;
  tmpvar_18 = mix (mix (tmpvar_14, tmpvar_15, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_16, tmpvar_17, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_19;
  tmpvar_19 = mix (tmpvar_18.xxx, mix (mix (vec3(clamp ((tmpvar_18.x + ((1.0 - tmpvar_18.y) * pow (tmpvar_18.x, 2.0))), 0.0, 1.0)), tmpvar_2.xyz, tmpvar_18.yyy), tmpvar_2.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_2.w, 0.0, 1.0)));
  tmpvar_3 = tmpvar_19;
  tmpvar_4 = tmpvar_13;
  highp float tmpvar_20;
  tmpvar_20 = tmpvar_18.x;
  tmpvar_5 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_4 * _Opacity);
  tmpvar_4 = tmpvar_21;
  tmpvar_6 = _Opacity;
  lowp float shadow_22;
  mediump float tmpvar_23;
  tmpvar_23 = texture (_ShadowMapTexture, xlv_TEXCOORD4.xyz);
  shadow_22 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_LightShadowData.x + (shadow_22 * (1.0 - _LightShadowData.x)));
  shadow_22 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = normalize(xlv_TEXCOORD1);
  mediump vec3 viewDir_26;
  viewDir_26 = tmpvar_25;
  lowp vec4 c_27;
  highp float nh_28;
  lowp float tmpvar_29;
  tmpvar_29 = max (0.0, xlv_TEXCOORD2.z);
  mediump float tmpvar_30;
  tmpvar_30 = max (0.0, normalize((xlv_TEXCOORD2 + viewDir_26)).z);
  nh_28 = tmpvar_30;
  mediump float arg1_31;
  arg1_31 = (_Shininess * 128.0);
  highp float tmpvar_32;
  tmpvar_32 = (pow (nh_28, arg1_31) * tmpvar_5);
  highp vec3 tmpvar_33;
  tmpvar_33 = ((((tmpvar_3 * _LightColor0.xyz) * tmpvar_29) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_32)) * (shadow_22 * 2.0));
  c_27.xyz = tmpvar_33;
  highp float tmpvar_34;
  tmpvar_34 = (tmpvar_6 + (((_LightColor0.w * _SpecColor.w) * tmpvar_32) * shadow_22));
  c_27.w = tmpvar_34;
  c_1.w = c_27.w;
  c_1.xyz = (c_27.xyz + (tmpvar_3 * xlv_TEXCOORD3));
  c_1.xyz = (c_1.xyz + tmpvar_4);
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES


#ifdef VERTEX

#extension GL_EXT_shadow_samplers : enable
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec3 tmpvar_4;
  highp vec3 tmpvar_5;
  tmpvar_4 = tmpvar_1.xyz;
  tmpvar_5 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_6;
  tmpvar_6[0].x = tmpvar_4.x;
  tmpvar_6[0].y = tmpvar_5.x;
  tmpvar_6[0].z = tmpvar_2.x;
  tmpvar_6[1].x = tmpvar_4.y;
  tmpvar_6[1].y = tmpvar_5.y;
  tmpvar_6[1].z = tmpvar_2.y;
  tmpvar_6[2].x = tmpvar_4.z;
  tmpvar_6[2].y = tmpvar_5.z;
  tmpvar_6[2].z = tmpvar_2.z;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _WorldSpaceCameraPos;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = (tmpvar_6 * (((_World2Object * tmpvar_7).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

#extension GL_EXT_shadow_samplers : enable
uniform highp vec4 _LightShadowData;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
uniform sampler2D unity_Lightmap;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = xlv_COLOR0;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump float rim_6;
  highp vec4 mask_7;
  highp vec4 color_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  color_8 = tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Emissive, xlv_TEXCOORD0.xy);
  mask_7 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_6 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = ((_RimColor.xyz * pow (rim_6, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_13;
  tmpvar_13.x = color_8.x;
  tmpvar_13.y = mask_7.x;
  highp vec2 tmpvar_14;
  tmpvar_14.x = color_8.y;
  tmpvar_14.y = mask_7.y;
  highp vec2 tmpvar_15;
  tmpvar_15.x = color_8.z;
  tmpvar_15.y = mask_7.z;
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_8.w;
  tmpvar_16.y = mask_7.w;
  highp vec2 tmpvar_17;
  tmpvar_17 = mix (mix (tmpvar_13, tmpvar_14, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_15, tmpvar_16, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_18;
  tmpvar_18 = mix (tmpvar_17.xxx, mix (mix (vec3(clamp ((tmpvar_17.x + ((1.0 - tmpvar_17.y) * pow (tmpvar_17.x, 2.0))), 0.0, 1.0)), tmpvar_2.xyz, tmpvar_17.yyy), tmpvar_2.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_2.w, 0.0, 1.0)));
  tmpvar_3 = tmpvar_18;
  tmpvar_4 = tmpvar_12;
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_4 * _Opacity);
  tmpvar_4 = tmpvar_19;
  tmpvar_5 = _Opacity;
  lowp float shadow_20;
  lowp float tmpvar_21;
  tmpvar_21 = shadow2DEXT (_ShadowMapTexture, xlv_TEXCOORD3.xyz);
  highp float tmpvar_22;
  tmpvar_22 = (_LightShadowData.x + (tmpvar_21 * (1.0 - _LightShadowData.x)));
  shadow_20 = tmpvar_22;
  c_1.xyz = (tmpvar_3 * min ((2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD2).xyz), vec3((shadow_20 * 2.0))));
  c_1.w = tmpvar_5;
  c_1.xyz = (c_1.xyz + tmpvar_4);
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesColor;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
in vec4 _glesMultiTexCoord1;
in vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec3 xlv_TEXCOORD1;
out lowp vec4 xlv_COLOR0;
out highp vec2 xlv_TEXCOORD2;
out highp vec4 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec3 tmpvar_4;
  highp vec3 tmpvar_5;
  tmpvar_4 = tmpvar_1.xyz;
  tmpvar_5 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_6;
  tmpvar_6[0].x = tmpvar_4.x;
  tmpvar_6[0].y = tmpvar_5.x;
  tmpvar_6[0].z = tmpvar_2.x;
  tmpvar_6[1].x = tmpvar_4.y;
  tmpvar_6[1].y = tmpvar_5.y;
  tmpvar_6[1].z = tmpvar_2.y;
  tmpvar_6[2].x = tmpvar_4.z;
  tmpvar_6[2].y = tmpvar_5.z;
  tmpvar_6[2].z = tmpvar_2.z;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _WorldSpaceCameraPos;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = (tmpvar_6 * (((_World2Object * tmpvar_7).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec4 _LightShadowData;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
uniform sampler2D unity_Lightmap;
in highp vec4 xlv_TEXCOORD0;
in highp vec3 xlv_TEXCOORD1;
in lowp vec4 xlv_COLOR0;
in highp vec2 xlv_TEXCOORD2;
in highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = xlv_COLOR0;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  mediump float rim_6;
  highp vec4 mask_7;
  highp vec4 color_8;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture (_MainTex, xlv_TEXCOORD0.xy);
  color_8 = tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture (_Emissive, xlv_TEXCOORD0.xy);
  mask_7 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_6 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = ((_RimColor.xyz * pow (rim_6, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_13;
  tmpvar_13.x = color_8.x;
  tmpvar_13.y = mask_7.x;
  highp vec2 tmpvar_14;
  tmpvar_14.x = color_8.y;
  tmpvar_14.y = mask_7.y;
  highp vec2 tmpvar_15;
  tmpvar_15.x = color_8.z;
  tmpvar_15.y = mask_7.z;
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_8.w;
  tmpvar_16.y = mask_7.w;
  highp vec2 tmpvar_17;
  tmpvar_17 = mix (mix (tmpvar_13, tmpvar_14, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_15, tmpvar_16, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_18;
  tmpvar_18 = mix (tmpvar_17.xxx, mix (mix (vec3(clamp ((tmpvar_17.x + ((1.0 - tmpvar_17.y) * pow (tmpvar_17.x, 2.0))), 0.0, 1.0)), tmpvar_2.xyz, tmpvar_17.yyy), tmpvar_2.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_2.w, 0.0, 1.0)));
  tmpvar_3 = tmpvar_18;
  tmpvar_4 = tmpvar_12;
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_4 * _Opacity);
  tmpvar_4 = tmpvar_19;
  tmpvar_5 = _Opacity;
  lowp float shadow_20;
  mediump float tmpvar_21;
  tmpvar_21 = texture (_ShadowMapTexture, xlv_TEXCOORD3.xyz);
  shadow_20 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = (_LightShadowData.x + (shadow_20 * (1.0 - _LightShadowData.x)));
  shadow_20 = tmpvar_22;
  c_1.xyz = (tmpvar_3 * min ((2.0 * texture (unity_Lightmap, xlv_TEXCOORD2).xyz), vec3((shadow_20 * 2.0))));
  c_1.w = tmpvar_5;
  c_1.xyz = (c_1.xyz + tmpvar_4);
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES


#ifdef VERTEX

#extension GL_EXT_shadow_samplers : enable
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec3 tmpvar_4;
  highp vec3 tmpvar_5;
  tmpvar_4 = tmpvar_1.xyz;
  tmpvar_5 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_6;
  tmpvar_6[0].x = tmpvar_4.x;
  tmpvar_6[0].y = tmpvar_5.x;
  tmpvar_6[0].z = tmpvar_2.x;
  tmpvar_6[1].x = tmpvar_4.y;
  tmpvar_6[1].y = tmpvar_5.y;
  tmpvar_6[1].z = tmpvar_2.y;
  tmpvar_6[2].x = tmpvar_4.z;
  tmpvar_6[2].y = tmpvar_5.z;
  tmpvar_6[2].z = tmpvar_2.z;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _WorldSpaceCameraPos;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = (tmpvar_6 * (((_World2Object * tmpvar_7).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

#extension GL_EXT_shadow_samplers : enable
uniform highp vec4 _LightShadowData;
uniform lowp vec4 _SpecColor;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = xlv_COLOR0;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  lowp float tmpvar_6;
  mediump float rim_7;
  highp vec4 mask_8;
  highp vec4 color_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  color_9 = tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Emissive, xlv_TEXCOORD0.xy);
  mask_8 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_7 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = ((_RimColor.xyz * pow (rim_7, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_14;
  tmpvar_14.x = color_9.x;
  tmpvar_14.y = mask_8.x;
  highp vec2 tmpvar_15;
  tmpvar_15.x = color_9.y;
  tmpvar_15.y = mask_8.y;
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_9.z;
  tmpvar_16.y = mask_8.z;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_9.w;
  tmpvar_17.y = mask_8.w;
  highp vec2 tmpvar_18;
  tmpvar_18 = mix (mix (tmpvar_14, tmpvar_15, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_16, tmpvar_17, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_19;
  tmpvar_19 = mix (tmpvar_18.xxx, mix (mix (vec3(clamp ((tmpvar_18.x + ((1.0 - tmpvar_18.y) * pow (tmpvar_18.x, 2.0))), 0.0, 1.0)), tmpvar_2.xyz, tmpvar_18.yyy), tmpvar_2.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_2.w, 0.0, 1.0)));
  tmpvar_3 = tmpvar_19;
  tmpvar_4 = tmpvar_13;
  highp float tmpvar_20;
  tmpvar_20 = tmpvar_18.x;
  tmpvar_5 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_4 * _Opacity);
  tmpvar_4 = tmpvar_21;
  tmpvar_6 = _Opacity;
  lowp float shadow_22;
  lowp float tmpvar_23;
  tmpvar_23 = shadow2DEXT (_ShadowMapTexture, xlv_TEXCOORD3.xyz);
  highp float tmpvar_24;
  tmpvar_24 = (_LightShadowData.x + (tmpvar_23 * (1.0 - _LightShadowData.x)));
  shadow_22 = tmpvar_24;
  c_1.w = 0.0;
  highp vec3 tmpvar_25;
  tmpvar_25 = normalize(xlv_TEXCOORD1);
  mediump vec4 tmpvar_26;
  mediump vec3 viewDir_27;
  viewDir_27 = tmpvar_25;
  mediump vec3 specColor_28;
  highp float nh_29;
  mat3 tmpvar_30;
  tmpvar_30[0].x = 0.816497;
  tmpvar_30[0].y = -0.408248;
  tmpvar_30[0].z = -0.408248;
  tmpvar_30[1].x = 0.0;
  tmpvar_30[1].y = 0.707107;
  tmpvar_30[1].z = -0.707107;
  tmpvar_30[2].x = 0.57735;
  tmpvar_30[2].y = 0.57735;
  tmpvar_30[2].z = 0.57735;
  mediump vec3 scalePerBasisVector_31;
  mediump vec3 lm_32;
  lowp vec3 tmpvar_33;
  tmpvar_33 = (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD2).xyz);
  lm_32 = tmpvar_33;
  lowp vec3 tmpvar_34;
  tmpvar_34 = (2.0 * texture2D (unity_LightmapInd, xlv_TEXCOORD2).xyz);
  scalePerBasisVector_31 = tmpvar_34;
  lm_32 = (lm_32 * dot (clamp ((tmpvar_30 * vec3(0.0, 0.0, 1.0)), 0.0, 1.0), scalePerBasisVector_31));
  vec3 v_35;
  v_35.x = tmpvar_30[0].x;
  v_35.y = tmpvar_30[1].x;
  v_35.z = tmpvar_30[2].x;
  vec3 v_36;
  v_36.x = tmpvar_30[0].y;
  v_36.y = tmpvar_30[1].y;
  v_36.z = tmpvar_30[2].y;
  vec3 v_37;
  v_37.x = tmpvar_30[0].z;
  v_37.y = tmpvar_30[1].z;
  v_37.z = tmpvar_30[2].z;
  mediump float tmpvar_38;
  tmpvar_38 = max (0.0, normalize((normalize((((scalePerBasisVector_31.x * v_35) + (scalePerBasisVector_31.y * v_36)) + (scalePerBasisVector_31.z * v_37))) + viewDir_27)).z);
  nh_29 = tmpvar_38;
  highp float tmpvar_39;
  mediump float arg1_40;
  arg1_40 = (_Shininess * 128.0);
  tmpvar_39 = pow (nh_29, arg1_40);
  highp vec3 tmpvar_41;
  tmpvar_41 = (((lm_32 * _SpecColor.xyz) * tmpvar_5) * tmpvar_39);
  specColor_28 = tmpvar_41;
  highp vec4 tmpvar_42;
  tmpvar_42.xyz = lm_32;
  tmpvar_42.w = tmpvar_39;
  tmpvar_26 = tmpvar_42;
  c_1.xyz = specColor_28;
  lowp vec3 tmpvar_43;
  tmpvar_43 = vec3((shadow_22 * 2.0));
  mediump vec3 tmpvar_44;
  tmpvar_44 = (c_1.xyz + (tmpvar_3 * min (tmpvar_26.xyz, tmpvar_43)));
  c_1.xyz = tmpvar_44;
  c_1.w = tmpvar_6;
  c_1.xyz = (c_1.xyz + tmpvar_4);
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesColor;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
in vec4 _glesMultiTexCoord1;
in vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec3 xlv_TEXCOORD1;
out lowp vec4 xlv_COLOR0;
out highp vec2 xlv_TEXCOORD2;
out highp vec4 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec3 tmpvar_4;
  highp vec3 tmpvar_5;
  tmpvar_4 = tmpvar_1.xyz;
  tmpvar_5 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_6;
  tmpvar_6[0].x = tmpvar_4.x;
  tmpvar_6[0].y = tmpvar_5.x;
  tmpvar_6[0].z = tmpvar_2.x;
  tmpvar_6[1].x = tmpvar_4.y;
  tmpvar_6[1].y = tmpvar_5.y;
  tmpvar_6[1].z = tmpvar_2.y;
  tmpvar_6[2].x = tmpvar_4.z;
  tmpvar_6[2].y = tmpvar_5.z;
  tmpvar_6[2].z = tmpvar_2.z;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _WorldSpaceCameraPos;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = (tmpvar_6 * (((_World2Object * tmpvar_7).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec4 _LightShadowData;
uniform lowp vec4 _SpecColor;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
in highp vec4 xlv_TEXCOORD0;
in highp vec3 xlv_TEXCOORD1;
in lowp vec4 xlv_COLOR0;
in highp vec2 xlv_TEXCOORD2;
in highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = xlv_COLOR0;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  lowp float tmpvar_6;
  mediump float rim_7;
  highp vec4 mask_8;
  highp vec4 color_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture (_MainTex, xlv_TEXCOORD0.xy);
  color_9 = tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture (_Emissive, xlv_TEXCOORD0.xy);
  mask_8 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_7 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = ((_RimColor.xyz * pow (rim_7, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_14;
  tmpvar_14.x = color_9.x;
  tmpvar_14.y = mask_8.x;
  highp vec2 tmpvar_15;
  tmpvar_15.x = color_9.y;
  tmpvar_15.y = mask_8.y;
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_9.z;
  tmpvar_16.y = mask_8.z;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_9.w;
  tmpvar_17.y = mask_8.w;
  highp vec2 tmpvar_18;
  tmpvar_18 = mix (mix (tmpvar_14, tmpvar_15, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_16, tmpvar_17, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_19;
  tmpvar_19 = mix (tmpvar_18.xxx, mix (mix (vec3(clamp ((tmpvar_18.x + ((1.0 - tmpvar_18.y) * pow (tmpvar_18.x, 2.0))), 0.0, 1.0)), tmpvar_2.xyz, tmpvar_18.yyy), tmpvar_2.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_2.w, 0.0, 1.0)));
  tmpvar_3 = tmpvar_19;
  tmpvar_4 = tmpvar_13;
  highp float tmpvar_20;
  tmpvar_20 = tmpvar_18.x;
  tmpvar_5 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_4 * _Opacity);
  tmpvar_4 = tmpvar_21;
  tmpvar_6 = _Opacity;
  lowp float shadow_22;
  mediump float tmpvar_23;
  tmpvar_23 = texture (_ShadowMapTexture, xlv_TEXCOORD3.xyz);
  shadow_22 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_LightShadowData.x + (shadow_22 * (1.0 - _LightShadowData.x)));
  shadow_22 = tmpvar_24;
  c_1.w = 0.0;
  highp vec3 tmpvar_25;
  tmpvar_25 = normalize(xlv_TEXCOORD1);
  mediump vec4 tmpvar_26;
  mediump vec3 viewDir_27;
  viewDir_27 = tmpvar_25;
  mediump vec3 specColor_28;
  highp float nh_29;
  mat3 tmpvar_30;
  tmpvar_30[0].x = 0.816497;
  tmpvar_30[0].y = -0.408248;
  tmpvar_30[0].z = -0.408248;
  tmpvar_30[1].x = 0.0;
  tmpvar_30[1].y = 0.707107;
  tmpvar_30[1].z = -0.707107;
  tmpvar_30[2].x = 0.57735;
  tmpvar_30[2].y = 0.57735;
  tmpvar_30[2].z = 0.57735;
  mediump vec3 scalePerBasisVector_31;
  mediump vec3 lm_32;
  lowp vec3 tmpvar_33;
  tmpvar_33 = (2.0 * texture (unity_Lightmap, xlv_TEXCOORD2).xyz);
  lm_32 = tmpvar_33;
  lowp vec3 tmpvar_34;
  tmpvar_34 = (2.0 * texture (unity_LightmapInd, xlv_TEXCOORD2).xyz);
  scalePerBasisVector_31 = tmpvar_34;
  lm_32 = (lm_32 * dot (clamp ((tmpvar_30 * vec3(0.0, 0.0, 1.0)), 0.0, 1.0), scalePerBasisVector_31));
  vec3 v_35;
  v_35.x = tmpvar_30[0].x;
  v_35.y = tmpvar_30[1].x;
  v_35.z = tmpvar_30[2].x;
  vec3 v_36;
  v_36.x = tmpvar_30[0].y;
  v_36.y = tmpvar_30[1].y;
  v_36.z = tmpvar_30[2].y;
  vec3 v_37;
  v_37.x = tmpvar_30[0].z;
  v_37.y = tmpvar_30[1].z;
  v_37.z = tmpvar_30[2].z;
  mediump float tmpvar_38;
  tmpvar_38 = max (0.0, normalize((normalize((((scalePerBasisVector_31.x * v_35) + (scalePerBasisVector_31.y * v_36)) + (scalePerBasisVector_31.z * v_37))) + viewDir_27)).z);
  nh_29 = tmpvar_38;
  highp float tmpvar_39;
  mediump float arg1_40;
  arg1_40 = (_Shininess * 128.0);
  tmpvar_39 = pow (nh_29, arg1_40);
  highp vec3 tmpvar_41;
  tmpvar_41 = (((lm_32 * _SpecColor.xyz) * tmpvar_5) * tmpvar_39);
  specColor_28 = tmpvar_41;
  highp vec4 tmpvar_42;
  tmpvar_42.xyz = lm_32;
  tmpvar_42.w = tmpvar_39;
  tmpvar_26 = tmpvar_42;
  c_1.xyz = specColor_28;
  lowp vec3 tmpvar_43;
  tmpvar_43 = vec3((shadow_22 * 2.0));
  mediump vec3 tmpvar_44;
  tmpvar_44 = (c_1.xyz + (tmpvar_3 * min (tmpvar_26.xyz, tmpvar_43)));
  c_1.xyz = tmpvar_44;
  c_1.w = tmpvar_6;
  c_1.xyz = (c_1.xyz + tmpvar_4);
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLES


#ifdef VERTEX

#extension GL_EXT_shadow_samplers : enable
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightAtten0;
uniform highp vec4 unity_LightColor[8];
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec3 shlight_3;
  highp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  mat3 tmpvar_7;
  tmpvar_7[0] = _Object2World[0].xyz;
  tmpvar_7[1] = _Object2World[1].xyz;
  tmpvar_7[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_7 * (tmpvar_2 * unity_Scale.w));
  highp vec3 tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_9 = tmpvar_1.xyz;
  tmpvar_10 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_11;
  tmpvar_11[0].x = tmpvar_9.x;
  tmpvar_11[0].y = tmpvar_10.x;
  tmpvar_11[0].z = tmpvar_2.x;
  tmpvar_11[1].x = tmpvar_9.y;
  tmpvar_11[1].y = tmpvar_10.y;
  tmpvar_11[1].z = tmpvar_2.y;
  tmpvar_11[2].x = tmpvar_9.z;
  tmpvar_11[2].y = tmpvar_10.z;
  tmpvar_11[2].z = tmpvar_2.z;
  highp vec3 tmpvar_12;
  tmpvar_12 = (tmpvar_11 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = _WorldSpaceCameraPos;
  highp vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_8;
  mediump vec3 tmpvar_15;
  mediump vec4 normal_16;
  normal_16 = tmpvar_14;
  highp float vC_17;
  mediump vec3 x3_18;
  mediump vec3 x2_19;
  mediump vec3 x1_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHAr, normal_16);
  x1_20.x = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHAg, normal_16);
  x1_20.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHAb, normal_16);
  x1_20.z = tmpvar_23;
  mediump vec4 tmpvar_24;
  tmpvar_24 = (normal_16.xyzz * normal_16.yzzx);
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHBr, tmpvar_24);
  x2_19.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHBg, tmpvar_24);
  x2_19.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHBb, tmpvar_24);
  x2_19.z = tmpvar_27;
  mediump float tmpvar_28;
  tmpvar_28 = ((normal_16.x * normal_16.x) - (normal_16.y * normal_16.y));
  vC_17 = tmpvar_28;
  highp vec3 tmpvar_29;
  tmpvar_29 = (unity_SHC.xyz * vC_17);
  x3_18 = tmpvar_29;
  tmpvar_15 = ((x1_20 + x2_19) + x3_18);
  shlight_3 = tmpvar_15;
  tmpvar_6 = shlight_3;
  highp vec3 tmpvar_30;
  tmpvar_30 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_31;
  tmpvar_31 = (unity_4LightPosX0 - tmpvar_30.x);
  highp vec4 tmpvar_32;
  tmpvar_32 = (unity_4LightPosY0 - tmpvar_30.y);
  highp vec4 tmpvar_33;
  tmpvar_33 = (unity_4LightPosZ0 - tmpvar_30.z);
  highp vec4 tmpvar_34;
  tmpvar_34 = (((tmpvar_31 * tmpvar_31) + (tmpvar_32 * tmpvar_32)) + (tmpvar_33 * tmpvar_33));
  highp vec4 tmpvar_35;
  tmpvar_35 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_31 * tmpvar_8.x) + (tmpvar_32 * tmpvar_8.y)) + (tmpvar_33 * tmpvar_8.z)) * inversesqrt(tmpvar_34))) * (1.0/((1.0 + (tmpvar_34 * unity_4LightAtten0)))));
  highp vec3 tmpvar_36;
  tmpvar_36 = (tmpvar_6 + ((((unity_LightColor[0].xyz * tmpvar_35.x) + (unity_LightColor[1].xyz * tmpvar_35.y)) + (unity_LightColor[2].xyz * tmpvar_35.z)) + (unity_LightColor[3].xyz * tmpvar_35.w)));
  tmpvar_6 = tmpvar_36;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = (tmpvar_11 * (((_World2Object * tmpvar_13).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

#extension GL_EXT_shadow_samplers : enable
uniform highp vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = xlv_COLOR0;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  lowp float tmpvar_6;
  mediump float rim_7;
  highp vec4 mask_8;
  highp vec4 color_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  color_9 = tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Emissive, xlv_TEXCOORD0.xy);
  mask_8 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_7 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = ((_RimColor.xyz * pow (rim_7, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_14;
  tmpvar_14.x = color_9.x;
  tmpvar_14.y = mask_8.x;
  highp vec2 tmpvar_15;
  tmpvar_15.x = color_9.y;
  tmpvar_15.y = mask_8.y;
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_9.z;
  tmpvar_16.y = mask_8.z;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_9.w;
  tmpvar_17.y = mask_8.w;
  highp vec2 tmpvar_18;
  tmpvar_18 = mix (mix (tmpvar_14, tmpvar_15, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_16, tmpvar_17, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_19;
  tmpvar_19 = mix (tmpvar_18.xxx, mix (mix (vec3(clamp ((tmpvar_18.x + ((1.0 - tmpvar_18.y) * pow (tmpvar_18.x, 2.0))), 0.0, 1.0)), tmpvar_2.xyz, tmpvar_18.yyy), tmpvar_2.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_2.w, 0.0, 1.0)));
  tmpvar_3 = tmpvar_19;
  tmpvar_4 = tmpvar_13;
  highp float tmpvar_20;
  tmpvar_20 = tmpvar_18.x;
  tmpvar_5 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_4 * _Opacity);
  tmpvar_4 = tmpvar_21;
  tmpvar_6 = _Opacity;
  lowp float shadow_22;
  lowp float tmpvar_23;
  tmpvar_23 = shadow2DEXT (_ShadowMapTexture, xlv_TEXCOORD4.xyz);
  highp float tmpvar_24;
  tmpvar_24 = (_LightShadowData.x + (tmpvar_23 * (1.0 - _LightShadowData.x)));
  shadow_22 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = normalize(xlv_TEXCOORD1);
  mediump vec3 viewDir_26;
  viewDir_26 = tmpvar_25;
  lowp vec4 c_27;
  highp float nh_28;
  lowp float tmpvar_29;
  tmpvar_29 = max (0.0, xlv_TEXCOORD2.z);
  mediump float tmpvar_30;
  tmpvar_30 = max (0.0, normalize((xlv_TEXCOORD2 + viewDir_26)).z);
  nh_28 = tmpvar_30;
  mediump float arg1_31;
  arg1_31 = (_Shininess * 128.0);
  highp float tmpvar_32;
  tmpvar_32 = (pow (nh_28, arg1_31) * tmpvar_5);
  highp vec3 tmpvar_33;
  tmpvar_33 = ((((tmpvar_3 * _LightColor0.xyz) * tmpvar_29) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_32)) * (shadow_22 * 2.0));
  c_27.xyz = tmpvar_33;
  highp float tmpvar_34;
  tmpvar_34 = (tmpvar_6 + (((_LightColor0.w * _SpecColor.w) * tmpvar_32) * shadow_22));
  c_27.w = tmpvar_34;
  c_1.w = c_27.w;
  c_1.xyz = (c_27.xyz + (tmpvar_3 * xlv_TEXCOORD3));
  c_1.xyz = (c_1.xyz + tmpvar_4);
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "SHADOWS_NATIVE" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesColor;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
in vec4 _glesMultiTexCoord1;
in vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightAtten0;
uniform highp vec4 unity_LightColor[8];
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 unity_World2Shadow[4];
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec3 xlv_TEXCOORD1;
out lowp vec4 xlv_COLOR0;
out lowp vec3 xlv_TEXCOORD2;
out lowp vec3 xlv_TEXCOORD3;
out highp vec4 xlv_TEXCOORD4;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec3 shlight_3;
  highp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  mat3 tmpvar_7;
  tmpvar_7[0] = _Object2World[0].xyz;
  tmpvar_7[1] = _Object2World[1].xyz;
  tmpvar_7[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_7 * (tmpvar_2 * unity_Scale.w));
  highp vec3 tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_9 = tmpvar_1.xyz;
  tmpvar_10 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_11;
  tmpvar_11[0].x = tmpvar_9.x;
  tmpvar_11[0].y = tmpvar_10.x;
  tmpvar_11[0].z = tmpvar_2.x;
  tmpvar_11[1].x = tmpvar_9.y;
  tmpvar_11[1].y = tmpvar_10.y;
  tmpvar_11[1].z = tmpvar_2.y;
  tmpvar_11[2].x = tmpvar_9.z;
  tmpvar_11[2].y = tmpvar_10.z;
  tmpvar_11[2].z = tmpvar_2.z;
  highp vec3 tmpvar_12;
  tmpvar_12 = (tmpvar_11 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = _WorldSpaceCameraPos;
  highp vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_8;
  mediump vec3 tmpvar_15;
  mediump vec4 normal_16;
  normal_16 = tmpvar_14;
  highp float vC_17;
  mediump vec3 x3_18;
  mediump vec3 x2_19;
  mediump vec3 x1_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHAr, normal_16);
  x1_20.x = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHAg, normal_16);
  x1_20.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHAb, normal_16);
  x1_20.z = tmpvar_23;
  mediump vec4 tmpvar_24;
  tmpvar_24 = (normal_16.xyzz * normal_16.yzzx);
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHBr, tmpvar_24);
  x2_19.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHBg, tmpvar_24);
  x2_19.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHBb, tmpvar_24);
  x2_19.z = tmpvar_27;
  mediump float tmpvar_28;
  tmpvar_28 = ((normal_16.x * normal_16.x) - (normal_16.y * normal_16.y));
  vC_17 = tmpvar_28;
  highp vec3 tmpvar_29;
  tmpvar_29 = (unity_SHC.xyz * vC_17);
  x3_18 = tmpvar_29;
  tmpvar_15 = ((x1_20 + x2_19) + x3_18);
  shlight_3 = tmpvar_15;
  tmpvar_6 = shlight_3;
  highp vec3 tmpvar_30;
  tmpvar_30 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_31;
  tmpvar_31 = (unity_4LightPosX0 - tmpvar_30.x);
  highp vec4 tmpvar_32;
  tmpvar_32 = (unity_4LightPosY0 - tmpvar_30.y);
  highp vec4 tmpvar_33;
  tmpvar_33 = (unity_4LightPosZ0 - tmpvar_30.z);
  highp vec4 tmpvar_34;
  tmpvar_34 = (((tmpvar_31 * tmpvar_31) + (tmpvar_32 * tmpvar_32)) + (tmpvar_33 * tmpvar_33));
  highp vec4 tmpvar_35;
  tmpvar_35 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_31 * tmpvar_8.x) + (tmpvar_32 * tmpvar_8.y)) + (tmpvar_33 * tmpvar_8.z)) * inversesqrt(tmpvar_34))) * (1.0/((1.0 + (tmpvar_34 * unity_4LightAtten0)))));
  highp vec3 tmpvar_36;
  tmpvar_36 = (tmpvar_6 + ((((unity_LightColor[0].xyz * tmpvar_35.x) + (unity_LightColor[1].xyz * tmpvar_35.y)) + (unity_LightColor[2].xyz * tmpvar_35.z)) + (unity_LightColor[3].xyz * tmpvar_35.w)));
  tmpvar_6 = tmpvar_36;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = (tmpvar_11 * (((_World2Object * tmpvar_13).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = tmpvar_6;
  xlv_TEXCOORD4 = (unity_World2Shadow[0] * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform highp vec4 _LightShadowData;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform lowp sampler2DShadow _ShadowMapTexture;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
in highp vec4 xlv_TEXCOORD0;
in highp vec3 xlv_TEXCOORD1;
in lowp vec4 xlv_COLOR0;
in lowp vec3 xlv_TEXCOORD2;
in lowp vec3 xlv_TEXCOORD3;
in highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  highp vec4 tmpvar_2;
  tmpvar_2 = xlv_COLOR0;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp float tmpvar_5;
  lowp float tmpvar_6;
  mediump float rim_7;
  highp vec4 mask_8;
  highp vec4 color_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture (_MainTex, xlv_TEXCOORD0.xy);
  color_9 = tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture (_Emissive, xlv_TEXCOORD0.xy);
  mask_8 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_7 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = ((_RimColor.xyz * pow (rim_7, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_14;
  tmpvar_14.x = color_9.x;
  tmpvar_14.y = mask_8.x;
  highp vec2 tmpvar_15;
  tmpvar_15.x = color_9.y;
  tmpvar_15.y = mask_8.y;
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_9.z;
  tmpvar_16.y = mask_8.z;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_9.w;
  tmpvar_17.y = mask_8.w;
  highp vec2 tmpvar_18;
  tmpvar_18 = mix (mix (tmpvar_14, tmpvar_15, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_16, tmpvar_17, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_19;
  tmpvar_19 = mix (tmpvar_18.xxx, mix (mix (vec3(clamp ((tmpvar_18.x + ((1.0 - tmpvar_18.y) * pow (tmpvar_18.x, 2.0))), 0.0, 1.0)), tmpvar_2.xyz, tmpvar_18.yyy), tmpvar_2.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_2.w, 0.0, 1.0)));
  tmpvar_3 = tmpvar_19;
  tmpvar_4 = tmpvar_13;
  highp float tmpvar_20;
  tmpvar_20 = tmpvar_18.x;
  tmpvar_5 = tmpvar_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (tmpvar_4 * _Opacity);
  tmpvar_4 = tmpvar_21;
  tmpvar_6 = _Opacity;
  lowp float shadow_22;
  mediump float tmpvar_23;
  tmpvar_23 = texture (_ShadowMapTexture, xlv_TEXCOORD4.xyz);
  shadow_22 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_LightShadowData.x + (shadow_22 * (1.0 - _LightShadowData.x)));
  shadow_22 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = normalize(xlv_TEXCOORD1);
  mediump vec3 viewDir_26;
  viewDir_26 = tmpvar_25;
  lowp vec4 c_27;
  highp float nh_28;
  lowp float tmpvar_29;
  tmpvar_29 = max (0.0, xlv_TEXCOORD2.z);
  mediump float tmpvar_30;
  tmpvar_30 = max (0.0, normalize((xlv_TEXCOORD2 + viewDir_26)).z);
  nh_28 = tmpvar_30;
  mediump float arg1_31;
  arg1_31 = (_Shininess * 128.0);
  highp float tmpvar_32;
  tmpvar_32 = (pow (nh_28, arg1_31) * tmpvar_5);
  highp vec3 tmpvar_33;
  tmpvar_33 = ((((tmpvar_3 * _LightColor0.xyz) * tmpvar_29) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_32)) * (shadow_22 * 2.0));
  c_27.xyz = tmpvar_33;
  highp float tmpvar_34;
  tmpvar_34 = (tmpvar_6 + (((_LightColor0.w * _SpecColor.w) * tmpvar_32) * shadow_22));
  c_27.w = tmpvar_34;
  c_1.w = c_27.w;
  c_1.xyz = (c_27.xyz + (tmpvar_3 * xlv_TEXCOORD3));
  c_1.xyz = (c_1.xyz + tmpvar_4);
  _glesFragData[0] = c_1;
}



#endif"
}
}
Program "fp" {
SubProgram "opengl " {
// Stats: 56 math, 2 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_Shininess]
Float 3 [_Opacity]
Float 4 [_RimFalloff]
Vector 5 [_RimColor]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
"3.0-!!ARBfp1.0
PARAM c[8] = { program.local[0..5],
		{ 1, 3, 2, 0 },
		{ 128 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[0], texture[1], 2D;
MOV R2.x, R0.y;
DP3 R2.w, fragment.texcoord[1], fragment.texcoord[1];
RSQ R2.w, R2.w;
MOV R2.y, R1;
MOV R0.y, R1.x;
ADD R1.xy, R2, -R0;
MUL_SAT R2.x, fragment.texcoord[0].z, c[6].y;
MAD R0.xy, R2.x, R1, R0;
MOV R1.x, R0.w;
MOV R1.y, R1.w;
MOV R0.w, R1.z;
ADD R1.zw, R1.xyxy, -R0;
MAD_SAT R1.x, fragment.texcoord[0].z, c[6].y, -c[6].z;
MAD R0.zw, R1.x, R1, R0;
ADD R1.xy, R0.zwzw, -R0;
MAD_SAT R0.z, fragment.texcoord[0], c[6].y, -c[6].x;
MAD R1.xy, R0.z, R1, R0;
DP3 R0.w, fragment.texcoord[1], fragment.texcoord[1];
MUL R0.y, R1.x, R1.x;
ADD R0.x, -R1.y, c[6];
MAD_SAT R0.x, R0, R0.y, R1;
ADD R2.xyz, fragment.color.primary, -R0.x;
MAD R0.xyz, R1.y, R2, R0.x;
ADD R2.xyz, fragment.color.primary, -R0;
MAD R2.xyz, fragment.texcoord[0].w, R2, R0;
ADD R2.xyz, R2, -R1.x;
MOV R0.xyz, fragment.texcoord[2];
RSQ R0.w, R0.w;
MAD R0.xyw, fragment.texcoord[1].xyzz, R0.w, R0.xyzz;
DP3 R1.y, R0.xyww, R0.xyww;
MAD R0.xyz, fragment.color.primary.w, R2, R1.x;
RSQ R1.y, R1.y;
MUL R1.y, R1, R0.w;
MOV R0.w, c[7].x;
MUL R2.xyz, R0, c[0];
MAX R1.z, fragment.texcoord[2], c[6].w;
MUL R2.xyz, R2, R1.z;
MAX R1.y, R1, c[6].w;
MUL R0.w, R0, c[2].x;
POW R0.w, R1.y, R0.w;
MUL R0.w, R1.x, R0;
MOV R1, c[1];
MUL R1.xyz, R1, c[0];
MAD R1.xyz, R1, R0.w, R2;
MUL_SAT R2.w, R2, fragment.texcoord[1].z;
ADD R2.x, -R2.w, c[6];
MUL R1.xyz, R1, c[6].z;
MUL R1.w, R1, c[0];
MAD R1.xyz, R0, fragment.texcoord[3], R1;
POW R2.x, R2.x, c[4].x;
MUL R0.xyz, R2.x, c[5];
MUL R0.xyz, R0, c[5].w;
MAD result.color.xyz, R0, c[3].x, R1;
MAD result.color.w, R0, R1, c[3].x;
END
# 56 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 62 math, 2 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_Shininess]
Float 3 [_Opacity]
Float 4 [_RimFalloff]
Vector 5 [_RimColor]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
"ps_3_0
dcl_2d s0
dcl_2d s1
def c6, 1.00000000, 3.00000000, -1.00000000, -2.00000000
def c7, 0.00000000, 128.00000000, 2.00000000, 0
dcl_texcoord0 v0
dcl_texcoord1 v1.xyz
dcl_color0 v2
dcl_texcoord2 v3.xyz
dcl_texcoord3 v4.xyz
texld r0, v0, s0
texld r1, v0, s1
mov r2.x, r0.y
mov r0.y, r1.x
mov r2.y, r1
add r2.xy, r2, -r0
mul_sat r1.x, v0.z, c6.y
mad r0.xy, r1.x, r2, r0
mov r1.x, r0.w
mov r1.y, r1.w
mov r0.w, r1.z
add r1.zw, r1.xyxy, -r0
mad_sat r1.x, v0.z, c6.y, c6.w
mad r0.zw, r1.x, r1, r0
add r1.xy, r0.zwzw, -r0
mad_sat r0.z, v0, c6.y, c6
mad r1.xw, r0.z, r1.yyzx, r0.yyzx
dp3_pp r0.w, v1, v1
mul r0.y, r1.w, r1.w
add r0.x, -r1, c6
mad_sat r0.x, r0, r0.y, r1.w
add r2.xyz, v2, -r0.x
mad r0.xyz, r1.x, r2, r0.x
add r1.xyz, v2, -r0
mad r0.xyz, v0.w, r1, r0
add r1.xyz, r0, -r1.w
mov_sat r0.x, v2.w
mad r1.xyz, r0.x, r1, r1.w
mul_pp r2.xyz, r1, c0
rsq_pp r0.w, r0.w
mov_pp r0.xyz, v3
mad_pp r0.xyz, v1, r0.w, r0
dp3_pp r0.x, r0, r0
max_pp r0.w, v3.z, c7.x
rsq_pp r0.x, r0.x
mul_pp r3.xyz, r2, r0.w
mov_pp r0.y, c2.x
mul_pp r0.x, r0, r0.z
mul_pp r2.y, c7, r0
max_pp r2.x, r0, c7
pow r0, r2.x, r2.y
dp3 r0.y, v1, v1
mov r0.z, r0.x
rsq r0.y, r0.y
mul_sat r0.x, r0.y, v1.z
mov_pp r2.xyz, c0
mul r1.w, r1, r0.z
add r2.w, -r0.x, c6.x
pow_pp r0, r2.w, c4.x
mul_pp r2.xyz, c1, r2
mad r2.xyz, r2, r1.w, r3
mov_pp r0.w, r0.x
mul r2.xyz, r2, c7.z
mad_pp r0.xyz, r1, v4, r2
mul r1.xyz, r0.w, c5
mov_pp r0.w, c0
mul r1.xyz, r1, c5.w
mul_pp r0.w, c1, r0
mad_pp oC0.xyz, r1, c3.x, r0
mad oC0.w, r1, r0, c3.x
"
}
SubProgram "d3d11 " {
// Stats: 44 math, 2 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
ConstBuffer "$Globals" 112
Vector 16 [_LightColor0]
Vector 32 [_SpecColor]
Float 48 [_Shininess]
Float 52 [_Opacity]
Float 56 [_RimFalloff]
Vector 64 [_RimColor]
BindCB  "$Globals" 0
"ps_4_0
eefiecedakepjblaakgdgpjhcpogbfepbgnodjbkabaaaaaaoiahaaaaadaaaaaa
cmaaaaaaoiaaaaaabmabaaaaejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapapaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
meagaaaaeaaaaaaalbabaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaa
gcbaaaadhcbabaaaacaaaaaagcbaaaadpcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
aeaaaaaadiaaaaahbcaabaaaaaaaaaaackbabaaaabaaaaaaabeaaaaaaaaaeaea
dgcaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadgaaaaafkcaabaaa
acaaaaaafganbaaaabaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaabaaaaaadgaaaaaffcaabaaaacaaaaaafgahbaaa
adaaaaaadgaaaaafkcaabaaaabaaaaaaagaibaaaadaaaaaaaaaaaaaipcaabaaa
acaaaaaabgalbaiaebaaaaaaabaaaaaaegaobaaaacaaaaaadcaaaaajdcaabaaa
aaaaaaaaagaabaaaaaaaaaaaegaabaaaacaaaaaabgafbaaaabaaaaaadccaaaap
mcaabaaaaaaaaaaakgbkbaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaeaea
aaaaeaeaaceaaaaaaaaaaaaaaaaaaaaaaaaaaamaaaaaialpdcaaaaajdcaabaaa
abaaaaaakgakbaaaaaaaaaaaogakbaaaacaaaaaalgapbaaaabaaaaaaaaaaaaai
dcaabaaaabaaaaaaegaabaiaebaaaaaaaaaaaaaaegaabaaaabaaaaaadcaaaaaj
dcaabaaaaaaaaaaapgapbaaaaaaaaaaaegaabaaaabaaaaaaegaabaaaaaaaaaaa
aaaaaaaiecaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadp
diaaaaahicaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadccaaaaj
ecaabaaaaaaaaaaackaabaaaaaaaaaaadkaabaaaaaaaaaaabkaabaaaaaaaaaaa
aaaaaaaihcaabaaaabaaaaaakgakbaiaebaaaaaaaaaaaaaaegbcbaaaadaaaaaa
dcaaaaajncaabaaaaaaaaaaaagaabaaaaaaaaaaaagajbaaaabaaaaaakgakbaaa
aaaaaaaaaaaaaaaihcaabaaaabaaaaaaigadbaiaebaaaaaaaaaaaaaaegbcbaaa
adaaaaaadcaaaaajncaabaaaaaaaaaaapgbpbaaaabaaaaaaagajbaaaabaaaaaa
agaobaaaaaaaaaaaaaaaaaaincaabaaaaaaaaaaafgafbaiaebaaaaaaaaaaaaaa
agaobaaaaaaaaaaadgcaaaafbcaabaaaabaaaaaadkbabaaaadaaaaaadcaaaaaj
ncaabaaaaaaaaaaaagaabaaaabaaaaaaagaobaaaaaaaaaaafgafbaaaaaaaaaaa
diaaaaaihcaabaaaabaaaaaaigadbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaa
baaaaaahicaabaaaabaaaaaaegbcbaaaacaaaaaaegbcbaaaacaaaaaaeeaaaaaf
icaabaaaabaaaaaadkaabaaaabaaaaaadcaaaaajhcaabaaaacaaaaaaegbcbaaa
acaaaaaapgapbaaaabaaaaaaegbcbaaaaeaaaaaadiaaaaahicaabaaaabaaaaaa
dkaabaaaabaaaaaackbabaaaacaaaaaadgcaaaaficaabaaaabaaaaaadkaabaaa
abaaaaaaaaaaaaaiicaabaaaabaaaaaadkaabaiaebaaaaaaabaaaaaaabeaaaaa
aaaaiadpcpaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaaiicaabaaa
abaaaaaadkaabaaaabaaaaaackiacaaaaaaaaaaaadaaaaaabjaaaaaficaabaaa
abaaaaaadkaabaaaabaaaaaadiaaaaaihcaabaaaadaaaaaapgapbaaaabaaaaaa
egiccaaaaaaaaaaaaeaaaaaadiaaaaaihcaabaaaadaaaaaaegacbaaaadaaaaaa
pgipcaaaaaaaaaaaaeaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaacaaaaaa
egacbaaaacaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
icaabaaaabaaaaaadkaabaaaabaaaaaackaabaaaacaaaaaadeaaaaahicaabaaa
abaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaaacpaaaaaficaabaaaabaaaaaa
dkaabaaaabaaaaaadiaaaaaibcaabaaaacaaaaaaakiacaaaaaaaaaaaadaaaaaa
abeaaaaaaaaaaaeddiaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaaakaabaaa
acaaaaaabjaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahccaabaaa
aaaaaaaabkaabaaaaaaaaaaadkaabaaaabaaaaaadiaaaaajpcaabaaaacaaaaaa
egiocaaaaaaaaaaaabaaaaaaegiocaaaaaaaaaaaacaaaaaadiaaaaahhcaabaaa
acaaaaaafgafbaaaaaaaaaaaegacbaaaacaaaaaadcaaaaakiccabaaaaaaaaaaa
dkaabaaaacaaaaaabkaabaaaaaaaaaaabkiacaaaaaaaaaaaadaaaaaadeaaaaah
ccaabaaaaaaaaaaackbabaaaaeaaaaaaabeaaaaaaaaaaaaadcaaaaajhcaabaaa
abaaaaaaegacbaaaabaaaaaafgafbaaaaaaaaaaaegacbaaaacaaaaaaaaaaaaah
hcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaa
aaaaaaaaigadbaaaaaaaaaaaegbcbaaaafaaaaaaegacbaaaabaaaaaadcaaaaak
hccabaaaaaaaaaaaegacbaaaadaaaaaafgifcaaaaaaaaaaaadaaaaaaegacbaaa
aaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 39 math, 3 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Float 0 [_Opacity]
Float 1 [_RimFalloff]
Vector 2 [_RimColor]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"3.0-!!ARBfp1.0
PARAM c[4] = { program.local[0..2],
		{ 3, 1, 2, 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[0], texture[1], 2D;
MOV R2.x, R0.y;
MOV R2.y, R1;
MOV R0.y, R1.x;
ADD R1.xy, R2, -R0;
MUL_SAT R2.x, fragment.texcoord[0].z, c[3];
MAD R0.xy, R2.x, R1, R0;
MOV R1.x, R0.w;
MOV R1.y, R1.w;
MOV R0.w, R1.z;
ADD R1.zw, R1.xyxy, -R0;
MAD_SAT R1.x, fragment.texcoord[0].z, c[3], -c[3].z;
MAD R0.zw, R1.x, R1, R0;
ADD R1.xy, R0.zwzw, -R0;
MAD_SAT R0.z, fragment.texcoord[0], c[3].x, -c[3].y;
MAD R2.xy, R0.z, R1, R0;
MUL R0.y, R2.x, R2.x;
ADD R0.x, -R2.y, c[3].y;
MAD_SAT R0.w, R0.x, R0.y, R2.x;
ADD R0.xyz, fragment.color.primary, -R0.w;
MAD R0.xyz, R2.y, R0, R0.w;
DP3 R1.x, fragment.texcoord[1], fragment.texcoord[1];
RSQ R0.w, R1.x;
ADD R1.xyz, fragment.color.primary, -R0;
MAD R0.xyz, fragment.texcoord[0].w, R1, R0;
ADD R0.xyz, R0, -R2.x;
MUL_SAT R0.w, R0, fragment.texcoord[1].z;
ADD R0.w, -R0, c[3].y;
MAD R1.xyz, fragment.color.primary.w, R0, R2.x;
POW R0.w, R0.w, c[1].x;
MUL R2.xyz, R0.w, c[2];
TEX R0, fragment.texcoord[2], texture[2], 2D;
MUL R2.xyz, R2, c[2].w;
MUL R0.xyz, R0.w, R0;
MUL R2.xyz, R2, c[0].x;
MUL R0.xyz, R0, R1;
MAD result.color.xyz, R0, c[3].w, R2;
MOV result.color.w, c[0].x;
END
# 39 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 39 math, 3 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Float 0 [_Opacity]
Float 1 [_RimFalloff]
Vector 2 [_RimColor]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c3, 3.00000000, -1.00000000, -2.00000000, 1.00000000
def c4, 8.00000000, 0, 0, 0
dcl_texcoord0 v0
dcl_texcoord1 v1.xyz
dcl_color0 v2
dcl_texcoord2 v3.xy
texld r0, v0, s0
texld r1, v0, s1
mov r2.x, r0.y
mov r2.y, r1
mov r0.y, r1.x
add r1.xy, r2, -r0
mul_sat r2.x, v0.z, c3
mad r0.xy, r2.x, r1, r0
mov r1.x, r0.w
mov r1.y, r1.w
mov r0.w, r1.z
add r1.zw, r1.xyxy, -r0
mad_sat r1.x, v0.z, c3, c3.z
mad r0.zw, r1.x, r1, r0
add r1.xy, r0.zwzw, -r0
mad_sat r0.z, v0, c3.x, c3.y
mad r1.xw, r0.z, r1.yyzx, r0.yyzx
dp3 r0.z, v1, v1
rsq r0.z, r0.z
mul_sat r1.y, r0.z, v1.z
add r0.x, -r1, c3.w
mul r0.y, r1.w, r1.w
mad_sat r0.w, r0.x, r0.y, r1
add r2.x, -r1.y, c3.w
add r0.xyz, v2, -r0.w
mad r1.xyz, r1.x, r0, r0.w
pow_pp r0, r2.x, c1.x
add r2.xyz, v2, -r1
mad r1.xyz, v0.w, r2, r1
mul r0.xyz, r0.x, c2
mul r2.xyz, r0, c2.w
mov_sat r0.w, v2
add r1.xyz, r1, -r1.w
mad r1.xyz, r0.w, r1, r1.w
texld r0, v3, s2
mul_pp r0.xyz, r0.w, r0
mul_pp r2.xyz, r2, c0.x
mul_pp r0.xyz, r0, r1
mad_pp oC0.xyz, r0, c4.x, r2
mov_pp oC0.w, c0.x
"
}
SubProgram "d3d11 " {
// Stats: 29 math, 3 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
ConstBuffer "$Globals" 128
Float 52 [_Opacity]
Float 56 [_RimFalloff]
Vector 64 [_RimColor]
BindCB  "$Globals" 0
"ps_4_0
eefiecedbkfknefeddlolmfjjojeaehbgdabkdgeabaaaaaaeiagaaaaadaaaaaa
cmaaaaaanaaaaaaaaeabaaaaejfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapapaaaaimaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklklfdeieefcdmafaaaaeaaaaaaaepabaaaafjaaaaaeegiocaaaaaaaaaaa
afaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaad
aagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaadpcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadpcbabaaaadaaaaaagcbaaaad
dcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaadiaaaaah
bcaabaaaaaaaaaaackbabaaaabaaaaaaabeaaaaaaaaaeaeadgcaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaadgaaaaafkcaabaaaacaaaaaafganbaaa
abaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaa
aagabaaaabaaaaaadgaaaaaffcaabaaaacaaaaaafgahbaaaadaaaaaadgaaaaaf
kcaabaaaabaaaaaaagaibaaaadaaaaaaaaaaaaaipcaabaaaacaaaaaabgalbaia
ebaaaaaaabaaaaaaegaobaaaacaaaaaadcaaaaajdcaabaaaaaaaaaaaagaabaaa
aaaaaaaaegaabaaaacaaaaaabgafbaaaabaaaaaadccaaaapmcaabaaaaaaaaaaa
kgbkbaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaeaeaaaaaeaeaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaamaaaaaialpdcaaaaajdcaabaaaabaaaaaakgakbaaa
aaaaaaaaogakbaaaacaaaaaalgapbaaaabaaaaaaaaaaaaaidcaabaaaabaaaaaa
egaabaiaebaaaaaaaaaaaaaaegaabaaaabaaaaaadcaaaaajdcaabaaaaaaaaaaa
pgapbaaaaaaaaaaaegaabaaaabaaaaaaegaabaaaaaaaaaaaaaaaaaaiecaabaaa
aaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaahicaabaaa
aaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadccaaaajecaabaaaaaaaaaaa
ckaabaaaaaaaaaaadkaabaaaaaaaaaaabkaabaaaaaaaaaaaaaaaaaaihcaabaaa
abaaaaaakgakbaiaebaaaaaaaaaaaaaaegbcbaaaadaaaaaadcaaaaajncaabaaa
aaaaaaaaagaabaaaaaaaaaaaagajbaaaabaaaaaakgakbaaaaaaaaaaaaaaaaaai
hcaabaaaabaaaaaaigadbaiaebaaaaaaaaaaaaaaegbcbaaaadaaaaaadcaaaaaj
ncaabaaaaaaaaaaapgbpbaaaabaaaaaaagajbaaaabaaaaaaagaobaaaaaaaaaaa
aaaaaaaincaabaaaaaaaaaaafgafbaiaebaaaaaaaaaaaaaaagaobaaaaaaaaaaa
dgcaaaafbcaabaaaabaaaaaadkbabaaaadaaaaaadcaaaaajhcaabaaaaaaaaaaa
agaabaaaabaaaaaaigadbaaaaaaaaaaafgafbaaaaaaaaaaabaaaaaahicaabaaa
aaaaaaaaegbcbaaaacaaaaaaegbcbaaaacaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadicaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaackbabaaa
acaaaaaaaaaaaaaiicaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpcpaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaaiicaabaaa
aaaaaaaadkaabaaaaaaaaaaackiacaaaaaaaaaaaadaaaaaabjaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaapgapbaaaaaaaaaaa
egiccaaaaaaaaaaaaeaaaaaadiaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaa
pgipcaaaaaaaaaaaaeaaaaaadiaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaa
fgifcaaaaaaaaaaaadaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaaeaaaaaa
eghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaa
acaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaa
pgapbaaaaaaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
acaaaaaaegacbaaaabaaaaaadgaaaaagiccabaaaaaaaaaaabkiacaaaaaaaaaaa
adaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 63 math, 4 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Vector 0 [_SpecColor]
Float 1 [_Shininess]
Float 2 [_Opacity]
Float 3 [_RimFalloff]
Vector 4 [_RimColor]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
SetTexture 3 [unity_LightmapInd] 2D 3
"3.0-!!ARBfp1.0
PARAM c[9] = { program.local[0..4],
		{ 1, 3, 2, 0.57735026 },
		{ 8, -0.40824828, -0.70710677, 0.57735026 },
		{ 0.81649655, 0, 0.57735026, 128 },
		{ -0.40824831, 0.70710677, 0.57735026 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[0], texture[1], 2D;
MOV R2.x, R0.y;
MOV R0.y, R1.x;
MOV R2.y, R1;
ADD R2.xy, R2, -R0;
MUL_SAT R1.x, fragment.texcoord[0].z, c[5].y;
MAD R0.xy, R1.x, R2, R0;
MOV R1.x, R0.w;
MOV R1.y, R1.w;
MOV R0.w, R1.z;
ADD R1.zw, R1.xyxy, -R0;
MAD_SAT R1.x, fragment.texcoord[0].z, c[5].y, -c[5].z;
MAD R0.zw, R1.x, R1, R0;
ADD R1.xy, R0.zwzw, -R0;
MAD_SAT R0.z, fragment.texcoord[0], c[5].y, -c[5].x;
MAD R1.xw, R0.z, R1.yyzx, R0.yyzx;
TEX R0, fragment.texcoord[2], texture[3], 2D;
MUL R2.xyz, R0.w, R0;
MUL R2.xyz, R2, c[6].x;
MUL R3.xyz, R2.y, c[8];
MAD R3.xyz, R2.x, c[7], R3;
MAD R3.xyz, R2.z, c[6].yzww, R3;
DP3 R0.w, R3, R3;
RSQ R2.w, R0.w;
MUL R1.z, R1.w, R1.w;
ADD R1.y, -R1.x, c[5].x;
MAD_SAT R1.y, R1, R1.z, R1.w;
ADD R0.xyz, fragment.color.primary, -R1.y;
MAD R0.xyz, R1.x, R0, R1.y;
ADD R1.xyz, fragment.color.primary, -R0;
MAD R0.xyz, fragment.texcoord[0].w, R1, R0;
ADD R0.xyz, R0, -R1.w;
MAD R1.xyz, fragment.color.primary.w, R0, R1.w;
TEX R0, fragment.texcoord[2], texture[2], 2D;
MUL R0.xyz, R0.w, R0;
DP3 R0.w, R2, c[5].w;
MUL R0.xyz, R0, R0.w;
DP3 R2.x, fragment.texcoord[1], fragment.texcoord[1];
RSQ R0.w, R2.x;
MUL R3.xyz, R2.w, R3;
MAD R2.xyz, fragment.texcoord[1], R0.w, R3;
DP3 R0.w, R2, R2;
MUL R0.xyz, R0, c[6].x;
MUL R3.xyz, R0, c[0];
RSQ R0.w, R0.w;
MUL R3.xyz, R1.w, R3;
MUL R1.w, R0, R2.z;
MAX R2.x, R1.w, c[7].y;
DP3 R0.w, fragment.texcoord[1], fragment.texcoord[1];
RSQ R1.w, R0.w;
MOV R0.w, c[7];
MUL R2.y, R0.w, c[1].x;
MUL_SAT R1.w, R1, fragment.texcoord[1].z;
ADD R0.w, -R1, c[5].x;
POW R1.w, R2.x, R2.y;
POW R0.w, R0.w, c[3].x;
MUL R3.xyz, R3, R1.w;
MAD R0.xyz, R1, R0, R3;
MUL R2.xyz, R0.w, c[4];
MUL R1.xyz, R2, c[4].w;
MAD result.color.xyz, R1, c[2].x, R0;
MOV result.color.w, c[2].x;
END
# 63 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 66 math, 4 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Vector 0 [_SpecColor]
Float 1 [_Shininess]
Float 2 [_Opacity]
Float 3 [_RimFalloff]
Vector 4 [_RimColor]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
SetTexture 3 [unity_LightmapInd] 2D 3
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c5, 1.00000000, 3.00000000, -1.00000000, -2.00000000
def c6, 8.00000000, 0.57735026, -0.40824831, 0.70710677
def c7, 0.81649655, 0.00000000, 0.57735026, 128.00000000
def c8, -0.40824828, -0.70710677, 0.57735026, 0
dcl_texcoord0 v0
dcl_texcoord1 v1.xyz
dcl_color0 v2
dcl_texcoord2 v3.xy
texld r0, v0, s0
texld r1, v0, s1
mov r2.x, r0.y
mov r0.y, r1.x
mov r2.y, r1
add r2.xy, r2, -r0
mul_sat r1.x, v0.z, c5.y
mad r0.xy, r1.x, r2, r0
mov r1.x, r0.w
mov r1.y, r1.w
mov r0.w, r1.z
add r1.zw, r1.xyxy, -r0
mad_sat r1.x, v0.z, c5.y, c5.w
mad r0.zw, r1.x, r1, r0
add r1.xy, r0.zwzw, -r0
mad_sat r0.z, v0, c5.y, c5
mad r4.xy, r0.z, r1, r0
texld r0, v3, s3
mul_pp r2.xyz, r0.w, r0
mul_pp r2.xyz, r2, c6.x
mul r3.xyz, r2.y, c6.zwyw
mad r3.xyz, r2.x, c7, r3
mad r3.xyz, r2.z, c8, r3
dp3 r1.w, r3, r3
rsq r1.w, r1.w
mul r3.xyz, r1.w, r3
mul r1.y, r4.x, r4.x
add r1.x, -r4.y, c5
mad_sat r1.x, r1, r1.y, r4
add r0.xyz, v2, -r1.x
mad r0.xyz, r4.y, r0, r1.x
add r1.xyz, v2, -r0
mad r0.xyz, v0.w, r1, r0
add r0.xyz, r0, -r4.x
mov_sat r0.w, v2
mad r1.xyz, r0.w, r0, r4.x
texld r0, v3, s2
mul_pp r0.xyz, r0.w, r0
dp3_pp r0.w, r2, c6.y
mul_pp r2.xyz, r0, r0.w
dp3_pp r1.w, v1, v1
rsq_pp r0.x, r1.w
mad_pp r0.xyz, v1, r0.x, r3
dp3_pp r0.x, r0, r0
mul_pp r2.xyz, r2, c6.x
mul_pp r3.xyz, r2, c0
rsq_pp r0.x, r0.x
mul_pp r0.y, r0.x, r0.z
max_pp r2.w, r0.y, c7.y
dp3 r0.x, v1, v1
rsq r0.x, r0.x
mul_sat r0.x, r0, v1.z
mul_pp r4.xyz, r4.x, r3
mov_pp r0.y, c1.x
mul_pp r3.x, c7.w, r0.y
add r1.w, -r0.x, c5.x
pow r0, r2.w, r3.x
pow_pp r3, r1.w, c3.x
mov r0.y, r0.x
mov_pp r0.x, r3
mul r3.xyz, r4, r0.y
mul r0.xyz, r0.x, c4
mad_pp r1.xyz, r1, r2, r3
mul r0.xyz, r0, c4.w
mad_pp oC0.xyz, r0, c2.x, r1
mov_pp oC0.w, c2.x
"
}
SubProgram "d3d11 " {
// Stats: 50 math, 4 textures
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
SetTexture 3 [unity_LightmapInd] 2D 3
ConstBuffer "$Globals" 128
Vector 32 [_SpecColor]
Float 48 [_Shininess]
Float 52 [_Opacity]
Float 56 [_RimFalloff]
Vector 64 [_RimColor]
BindCB  "$Globals" 0
"ps_4_0
eefiecedmjjhidpkaiedcojfbbbhphpimfhpcmbkabaaaaaacaajaaaaadaaaaaa
cmaaaaaanaaaaaaaaeabaaaaejfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapapaaaaimaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklklfdeieefcbeaiaaaaeaaaaaaaafacaaaafjaaaaaeegiocaaaaaaaaaaa
afaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaad
aagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaa
ffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaa
gcbaaaadhcbabaaaacaaaaaagcbaaaadpcbabaaaadaaaaaagcbaaaaddcbabaaa
aeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacafaaaaaaefaaaaajpcaabaaa
aaaaaaaaegbabaaaaeaaaaaaeghobaaaadaaaaaaaagabaaaadaaaaaadiaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgapbaaaaaaaaaaadiaaaaakhcaabaaaabaaaaaa
fgafbaaaaaaaaaaaaceaaaaaomafnblopdaedfdpdkmnbddpaaaaaaaadcaaaaam
hcaabaaaabaaaaaaagaabaaaaaaaaaaaaceaaaaaolaffbdpaaaaaaaadkmnbddp
aaaaaaaaegacbaaaabaaaaaadcaaaaamhcaabaaaabaaaaaakgakbaaaaaaaaaaa
aceaaaaaolafnblopdaedflpdkmnbddpaaaaaaaaegacbaaaabaaaaaabaaaaaak
bcaabaaaaaaaaaaaaceaaaaadkmnbddpdkmnbddpdkmnbddpaaaaaaaaegacbaaa
aaaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaa
eeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaabaaaaaahecaabaaaaaaaaaaa
egbcbaaaacaaaaaaegbcbaaaacaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaa
aaaaaaaadiaaaaahpcaabaaaacaaaaaakgakbaaaaaaaaaaacgbjbaaaacaaaaaa
dcaaaaajocaabaaaaaaaaaaaagajbaaaabaaaaaafgafbaaaaaaaaaaafgaobaaa
acaaaaaadgcaaaafbcaabaaaacaaaaaaakaabaaaacaaaaaaaaaaaaaibcaabaaa
abaaaaaaakaabaiaebaaaaaaacaaaaaaabeaaaaaaaaaiadpcpaaaaafbcaabaaa
abaaaaaaakaabaaaabaaaaaadiaaaaaibcaabaaaabaaaaaaakaabaaaabaaaaaa
ckiacaaaaaaaaaaaadaaaaaabjaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaa
diaaaaaihcaabaaaabaaaaaaagaabaaaabaaaaaaegiccaaaaaaaaaaaaeaaaaaa
diaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaaaaaaaaaaaeaaaaaa
baaaaaahccaabaaaaaaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaaeeaaaaaf
ccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaadkaabaaaaaaaaaaadeaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
abeaaaaaaaaaaaaacpaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaai
ecaabaaaaaaaaaaaakiacaaaaaaaaaaaadaaaaaaabeaaaaaaaaaaaeddiaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaackaabaaaaaaaaaaabjaaaaafccaabaaa
aaaaaaaabkaabaaaaaaaaaaadiaaaaahecaabaaaaaaaaaaackbabaaaabaaaaaa
abeaaaaaaaaaeaeadgcaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaaefaaaaaj
pcaabaaaacaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaa
dgaaaaafkcaabaaaadaaaaaafganbaaaacaaaaaaefaaaaajpcaabaaaaeaaaaaa
egbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaadgaaaaaffcaabaaa
adaaaaaafgahbaaaaeaaaaaadgaaaaafkcaabaaaacaaaaaaagaibaaaaeaaaaaa
aaaaaaaipcaabaaaadaaaaaabgalbaiaebaaaaaaacaaaaaaegaobaaaadaaaaaa
dcaaaaajmcaabaaaaaaaaaaakgakbaaaaaaaaaaaagaebaaaadaaaaaafgabbaaa
acaaaaaadccaaaapdcaabaaaacaaaaaakgbkbaaaabaaaaaaaceaaaaaaaaaeaea
aaaaeaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaaamaaaaaialpaaaaaaaaaaaaaaaa
dcaaaaajfcaabaaaacaaaaaaagaabaaaacaaaaaakgalbaaaadaaaaaapgaobaaa
acaaaaaaaaaaaaaifcaabaaaacaaaaaakgalbaiaebaaaaaaaaaaaaaaagacbaaa
acaaaaaadcaaaaajmcaabaaaaaaaaaaafgafbaaaacaaaaaaagaibaaaacaaaaaa
kgaobaaaaaaaaaaaaaaaaaaiicaabaaaabaaaaaackaabaiaebaaaaaaaaaaaaaa
abeaaaaaaaaaiadpdiaaaaahbcaabaaaacaaaaaadkaabaaaaaaaaaaadkaabaaa
aaaaaaaadccaaaajicaabaaaabaaaaaadkaabaaaabaaaaaaakaabaaaacaaaaaa
dkaabaaaaaaaaaaaaaaaaaaihcaabaaaacaaaaaapgapbaiaebaaaaaaabaaaaaa
egbcbaaaadaaaaaadcaaaaajhcaabaaaacaaaaaakgakbaaaaaaaaaaaegacbaaa
acaaaaaapgapbaaaabaaaaaaaaaaaaaihcaabaaaadaaaaaaegacbaiaebaaaaaa
acaaaaaaegbcbaaaadaaaaaadcaaaaajhcaabaaaacaaaaaapgbpbaaaabaaaaaa
egacbaaaadaaaaaaegacbaaaacaaaaaaaaaaaaaihcaabaaaacaaaaaapgapbaia
ebaaaaaaaaaaaaaaegacbaaaacaaaaaadgcaaaafecaabaaaaaaaaaaadkbabaaa
adaaaaaadcaaaaajhcaabaaaacaaaaaakgakbaaaaaaaaaaaegacbaaaacaaaaaa
pgapbaaaaaaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaaaeaaaaaaeghobaaa
acaaaaaaaagabaaaacaaaaaadiaaaaahecaabaaaaaaaaaaadkaabaaaadaaaaaa
abeaaaaaaaaaaaebdiaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaakgakbaaa
aaaaaaaadiaaaaahhcaabaaaadaaaaaaagaabaaaaaaaaaaaegacbaaaadaaaaaa
diaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaadiaaaaai
hcaabaaaadaaaaaaegacbaaaadaaaaaaegiccaaaaaaaaaaaacaaaaaadiaaaaah
ncaabaaaaaaaaaaapgapbaaaaaaaaaaaagajbaaaadaaaaaadcaaaaajhcaabaaa
aaaaaaaaigadbaaaaaaaaaaafgafbaaaaaaaaaaaegacbaaaacaaaaaadcaaaaak
hccabaaaaaaaaaaaegacbaaaabaaaaaafgifcaaaaaaaaaaaadaaaaaaegacbaaa
aaaaaaaadgaaaaagiccabaaaaaaaaaaabkiacaaaaaaaaaaaadaaaaaadoaaaaab
"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 59 math, 3 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_Shininess]
Float 3 [_Opacity]
Float 4 [_RimFalloff]
Vector 5 [_RimColor]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
"3.0-!!ARBfp1.0
PARAM c[8] = { program.local[0..5],
		{ 1, 3, 2, 0 },
		{ 128 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[0], texture[1], 2D;
MOV R2.x, R0.y;
MOV R2.y, R1;
MOV R0.y, R1.x;
ADD R1.xy, R2, -R0;
MUL_SAT R2.x, fragment.texcoord[0].z, c[6].y;
MAD R0.xy, R2.x, R1, R0;
MOV R1.x, R0.w;
MOV R1.y, R1.w;
MOV R0.w, R1.z;
ADD R1.zw, R1.xyxy, -R0;
MAD_SAT R1.x, fragment.texcoord[0].z, c[6].y, -c[6].z;
MAD R0.zw, R1.x, R1, R0;
ADD R1.xy, R0.zwzw, -R0;
MAD_SAT R0.z, fragment.texcoord[0], c[6].y, -c[6].x;
MAD R0.xw, R0.z, R1.yyzx, R0.yyzx;
DP3 R1.w, fragment.texcoord[1], fragment.texcoord[1];
MUL R0.z, R0.w, R0.w;
ADD R0.y, -R0.x, c[6].x;
MAD_SAT R0.y, R0, R0.z, R0.w;
ADD R1.xyz, fragment.color.primary, -R0.y;
MAD R0.xyz, R0.x, R1, R0.y;
ADD R1.xyz, fragment.color.primary, -R0;
MAD R0.xyz, fragment.texcoord[0].w, R1, R0;
ADD R0.xyz, R0, -R0.w;
MAD R0.xyz, fragment.color.primary.w, R0, R0.w;
MUL R2.xyz, R0, c[0];
RSQ R1.w, R1.w;
MOV R1.xyz, fragment.texcoord[2];
MAD R1.xyz, fragment.texcoord[1], R1.w, R1;
DP3 R1.x, R1, R1;
RSQ R1.y, R1.x;
MAX R1.w, fragment.texcoord[2].z, c[6];
MUL R2.xyz, R2, R1.w;
MUL R1.y, R1, R1.z;
MOV R1.x, c[7];
MUL R1.z, R1.x, c[2].x;
MAX R1.x, R1.y, c[6].w;
POW R2.w, R1.x, R1.z;
MOV R1, c[1];
MUL R0.w, R0, R2;
MUL R1.xyz, R1, c[0];
MAD R1.xyz, R1, R0.w, R2;
TXP R2.x, fragment.texcoord[4], texture[2], 2D;
DP3 R2.y, fragment.texcoord[1], fragment.texcoord[1];
RSQ R2.y, R2.y;
MUL R2.z, R2.x, c[6];
MUL R1.xyz, R1, R2.z;
MUL_SAT R2.y, R2, fragment.texcoord[1].z;
MUL R1.w, R1, c[0];
MUL R0.w, R0, R1;
MAD R0.xyz, R0, fragment.texcoord[3], R1;
ADD R2.y, -R2, c[6].x;
POW R1.x, R2.y, c[4].x;
MUL R1.xyz, R1.x, c[5];
MUL R1.xyz, R1, c[5].w;
MAD result.color.xyz, R1, c[3].x, R0;
MAD result.color.w, R2.x, R0, c[3].x;
END
# 59 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 63 math, 3 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_Shininess]
Float 3 [_Opacity]
Float 4 [_RimFalloff]
Vector 5 [_RimColor]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c6, 1.00000000, 3.00000000, -1.00000000, -2.00000000
def c7, 0.00000000, 128.00000000, 2.00000000, 0
dcl_texcoord0 v0
dcl_texcoord1 v1.xyz
dcl_color0 v2
dcl_texcoord2 v3.xyz
dcl_texcoord3 v4.xyz
dcl_texcoord4 v5
texld r0, v0, s0
texld r1, v0, s1
mov r2.x, r0.y
mov r2.y, r1
mov r0.y, r1.x
add r1.xy, r2, -r0
mul_sat r2.x, v0.z, c6.y
mad r0.xy, r2.x, r1, r0
mov r1.x, r0.w
mov r1.y, r1.w
mov r0.w, r1.z
add r1.zw, r1.xyxy, -r0
mad_sat r1.x, v0.z, c6.y, c6.w
mad r0.zw, r1.x, r1, r0
add r1.xy, r0.zwzw, -r0
mad_sat r0.z, v0, c6.y, c6
mad r1.xw, r0.z, r1.yyzx, r0.yyzx
dp3_pp r0.w, v1, v1
mul r0.y, r1.w, r1.w
add r0.x, -r1, c6
mad_sat r0.x, r0, r0.y, r1.w
add r2.xyz, v2, -r0.x
mad r0.xyz, r1.x, r2, r0.x
add r1.xyz, v2, -r0
mad r0.xyz, v0.w, r1, r0
add r1.xyz, r0, -r1.w
rsq_pp r0.w, r0.w
mov_pp r0.xyz, v3
mad_pp r0.xyz, v1, r0.w, r0
dp3_pp r0.x, r0, r0
mov_sat r0.w, v2
mad r1.xyz, r0.w, r1, r1.w
mov_pp r0.y, c2.x
rsq_pp r0.x, r0.x
mul_pp r0.x, r0, r0.z
mul_pp r3.x, c7.y, r0.y
max_pp r2.w, r0.x, c7.x
pow r0, r2.w, r3.x
max_pp r0.y, v3.z, c7.x
mov r0.w, r0.x
mul r1.w, r1, r0
mul_pp r2.xyz, r1, c0
mul_pp r2.xyz, r2, r0.y
mov_pp r0.xyz, c0
mul_pp r0.xyz, c1, r0
dp3 r0.w, v1, v1
rsq r0.w, r0.w
mul_sat r0.w, r0, v1.z
mad r0.xyz, r0, r1.w, r2
texldp r3.x, v5, s2
mul_pp r2.x, r3, c7.z
mul r2.xyz, r0, r2.x
add r2.w, -r0, c6.x
pow_pp r0, r2.w, c4.x
mov_pp r0.y, c0.w
mul_pp r0.w, c1, r0.y
mul r0.xyz, r0.x, c5
mul r0.w, r1, r0
mad_pp r1.xyz, r1, v4, r2
mul r0.xyz, r0, c5.w
mad_pp oC0.xyz, r0, c3.x, r1
mad oC0.w, r3.x, r0, c3.x
"
}
SubProgram "d3d11 " {
// Stats: 46 math, 3 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_Emissive] 2D 2
SetTexture 2 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 176
Vector 16 [_LightColor0]
Vector 32 [_SpecColor]
Float 112 [_Shininess]
Float 116 [_Opacity]
Float 120 [_RimFalloff]
Vector 128 [_RimColor]
BindCB  "$Globals" 0
"ps_4_0
eefiecedajldhmfbfeklhemiofokcgjldbfbfnclabaaaaaaieaiaaaaadaaaaaa
cmaaaaaaaaabaaaadeabaaaaejfdeheommaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaamfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapapaaaalmaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefceiahaaaaeaaaaaaa
ncabaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafkaaaaadaagabaaaaaaaaaaa
fkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaa
gcbaaaadpcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaa
afaaaaaagcbaaaadlcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
afaaaaaadiaaaaahbcaabaaaaaaaaaaackbabaaaabaaaaaaabeaaaaaaaaaeaea
dgcaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadgaaaaafkcaabaaa
acaaaaaafganbaaaabaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaacaaaaaadgaaaaaffcaabaaaacaaaaaafgahbaaa
adaaaaaadgaaaaafkcaabaaaabaaaaaaagaibaaaadaaaaaaaaaaaaaipcaabaaa
acaaaaaabgalbaiaebaaaaaaabaaaaaaegaobaaaacaaaaaadcaaaaajdcaabaaa
aaaaaaaaagaabaaaaaaaaaaaegaabaaaacaaaaaabgafbaaaabaaaaaadccaaaap
mcaabaaaaaaaaaaakgbkbaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaeaea
aaaaeaeaaceaaaaaaaaaaaaaaaaaaaaaaaaaaamaaaaaialpdcaaaaajdcaabaaa
abaaaaaakgakbaaaaaaaaaaaogakbaaaacaaaaaalgapbaaaabaaaaaaaaaaaaai
dcaabaaaabaaaaaaegaabaiaebaaaaaaaaaaaaaaegaabaaaabaaaaaadcaaaaaj
dcaabaaaaaaaaaaapgapbaaaaaaaaaaaegaabaaaabaaaaaaegaabaaaaaaaaaaa
aaaaaaaiecaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadp
diaaaaahicaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadccaaaaj
ecaabaaaaaaaaaaackaabaaaaaaaaaaadkaabaaaaaaaaaaabkaabaaaaaaaaaaa
aaaaaaaihcaabaaaabaaaaaakgakbaiaebaaaaaaaaaaaaaaegbcbaaaadaaaaaa
dcaaaaajncaabaaaaaaaaaaaagaabaaaaaaaaaaaagajbaaaabaaaaaakgakbaaa
aaaaaaaaaaaaaaaihcaabaaaabaaaaaaigadbaiaebaaaaaaaaaaaaaaegbcbaaa
adaaaaaadcaaaaajncaabaaaaaaaaaaapgbpbaaaabaaaaaaagajbaaaabaaaaaa
agaobaaaaaaaaaaaaaaaaaaincaabaaaaaaaaaaafgafbaiaebaaaaaaaaaaaaaa
agaobaaaaaaaaaaadgcaaaafbcaabaaaabaaaaaadkbabaaaadaaaaaadcaaaaaj
ncaabaaaaaaaaaaaagaabaaaabaaaaaaagaobaaaaaaaaaaafgafbaaaaaaaaaaa
diaaaaaihcaabaaaabaaaaaaigadbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaa
diaaaaahncaabaaaaaaaaaaaagaobaaaaaaaaaaaagbjbaaaafaaaaaabaaaaaah
icaabaaaabaaaaaaegbcbaaaacaaaaaaegbcbaaaacaaaaaaeeaaaaaficaabaaa
abaaaaaadkaabaaaabaaaaaadcaaaaajhcaabaaaacaaaaaaegbcbaaaacaaaaaa
pgapbaaaabaaaaaaegbcbaaaaeaaaaaadiaaaaahicaabaaaabaaaaaadkaabaaa
abaaaaaackbabaaaacaaaaaadgcaaaaficaabaaaabaaaaaadkaabaaaabaaaaaa
aaaaaaaiicaabaaaabaaaaaadkaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadp
cpaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaaiicaabaaaabaaaaaa
dkaabaaaabaaaaaackiacaaaaaaaaaaaahaaaaaabjaaaaaficaabaaaabaaaaaa
dkaabaaaabaaaaaadiaaaaaihcaabaaaadaaaaaapgapbaaaabaaaaaaegiccaaa
aaaaaaaaaiaaaaaadiaaaaaihcaabaaaadaaaaaaegacbaaaadaaaaaapgipcaaa
aaaaaaaaaiaaaaaabaaaaaahicaabaaaabaaaaaaegacbaaaacaaaaaaegacbaaa
acaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahicaabaaa
abaaaaaadkaabaaaabaaaaaackaabaaaacaaaaaadeaaaaahicaabaaaabaaaaaa
dkaabaaaabaaaaaaabeaaaaaaaaaaaaacpaaaaaficaabaaaabaaaaaadkaabaaa
abaaaaaadiaaaaaibcaabaaaacaaaaaaakiacaaaaaaaaaaaahaaaaaaabeaaaaa
aaaaaaeddiaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaaakaabaaaacaaaaaa
bjaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahccaabaaaaaaaaaaa
bkaabaaaaaaaaaaadkaabaaaabaaaaaadiaaaaajpcaabaaaacaaaaaaegiocaaa
aaaaaaaaabaaaaaaegiocaaaaaaaaaaaacaaaaaadiaaaaahpcaabaaaacaaaaaa
fgafbaaaaaaaaaaaegaobaaaacaaaaaadeaaaaahccaabaaaaaaaaaaackbabaaa
aeaaaaaaabeaaaaaaaaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaa
fgafbaaaaaaaaaaaegacbaaaacaaaaaaaoaaaaahdcaabaaaacaaaaaaegbabaaa
agaaaaaapgbpbaaaagaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaaacaaaaaa
eghobaaaacaaaaaaaagabaaaaaaaaaaaaaaaaaahccaabaaaaaaaaaaaakaabaaa
aeaaaaaaakaabaaaaeaaaaaadcaaaaakiccabaaaaaaaaaaadkaabaaaacaaaaaa
akaabaaaaeaaaaaabkiacaaaaaaaaaaaahaaaaaadcaaaaajhcaabaaaaaaaaaaa
egacbaaaabaaaaaafgafbaaaaaaaaaaaigadbaaaaaaaaaaadcaaaaakhccabaaa
aaaaaaaaegacbaaaadaaaaaafgifcaaaaaaaaaaaahaaaaaaegacbaaaaaaaaaaa
doaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 45 math, 4 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Float 0 [_Opacity]
Float 1 [_RimFalloff]
Vector 2 [_RimColor]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
"3.0-!!ARBfp1.0
PARAM c[4] = { program.local[0..2],
		{ 3, 1, 2, 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[0], texture[1], 2D;
MOV R2.x, R0.y;
MOV R0.y, R1.x;
MOV R2.y, R1;
ADD R2.xy, R2, -R0;
MUL_SAT R1.x, fragment.texcoord[0].z, c[3];
MAD R0.xy, R1.x, R2, R0;
MOV R1.x, R0.w;
MOV R1.y, R1.w;
MOV R0.w, R1.z;
ADD R1.zw, R1.xyxy, -R0;
MAD_SAT R1.x, fragment.texcoord[0].z, c[3], -c[3].z;
MAD R0.zw, R1.x, R1, R0;
ADD R1.xy, R0.zwzw, -R0;
MAD_SAT R0.z, fragment.texcoord[0], c[3].x, -c[3].y;
MAD R0.xy, R0.z, R1, R0;
MUL R0.w, R0.x, R0.x;
ADD R0.z, -R0.y, c[3].y;
MAD_SAT R0.z, R0, R0.w, R0.x;
ADD R1.xyz, fragment.color.primary, -R0.z;
MAD R1.xyz, R0.y, R1, R0.z;
ADD R2.xyz, fragment.color.primary, -R1;
MAD R1.xyz, fragment.texcoord[0].w, R2, R1;
ADD R1.xyz, R1, -R0.x;
MAD R2.xyz, fragment.color.primary.w, R1, R0.x;
TEX R0, fragment.texcoord[2], texture[3], 2D;
MUL R1.xyz, R0.w, R0;
MUL R3.xyz, R1, c[3].w;
TXP R1.x, fragment.texcoord[3], texture[2], 2D;
MUL R0.xyz, R0, R1.x;
DP3 R1.w, fragment.texcoord[1], fragment.texcoord[1];
RSQ R0.w, R1.w;
MUL_SAT R0.w, R0, fragment.texcoord[1].z;
ADD R0.w, -R0, c[3].y;
POW R0.w, R0.w, c[1].x;
MUL R0.xyz, R0, c[3].z;
MIN R0.xyz, R3, R0;
MUL R3.xyz, R3, R1.x;
MUL R1.yzw, R0.w, c[2].xxyz;
MUL R1.yzw, R1, c[2].w;
MUL R1.xyz, R1.yzww, c[0].x;
MAX R0.xyz, R0, R3;
MAD result.color.xyz, R2, R0, R1;
MOV result.color.w, c[0].x;
END
# 45 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 45 math, 4 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Float 0 [_Opacity]
Float 1 [_RimFalloff]
Vector 2 [_RimColor]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c3, 3.00000000, -1.00000000, -2.00000000, 1.00000000
def c4, 8.00000000, 2.00000000, 0, 0
dcl_texcoord0 v0
dcl_texcoord1 v1.xyz
dcl_color0 v2
dcl_texcoord2 v3.xy
dcl_texcoord3 v4
texld r0, v0, s0
texld r1, v0, s1
mov r2.x, r0.y
mov r0.y, r1.x
mov r2.y, r1
add r2.xy, r2, -r0
mul_sat r1.x, v0.z, c3
mad r0.xy, r1.x, r2, r0
mov r1.x, r0.w
mov r1.y, r1.w
mov r0.w, r1.z
add r1.zw, r1.xyxy, -r0
mad_sat r1.x, v0.z, c3, c3.z
mad r0.zw, r1.x, r1, r0
add r1.xy, r0.zwzw, -r0
mad_sat r0.z, v0, c3.x, c3.y
mad r3.xy, r0.z, r1, r0
mul r0.y, r3.x, r3.x
add r0.x, -r3.y, c3.w
mad_sat r0.x, r0, r0.y, r3
add r1.xyz, v2, -r0.x
mad r2.xyz, r3.y, r1, r0.x
dp3 r0.z, v1, v1
rsq r0.y, r0.z
mul_sat r0.y, r0, v1.z
add r1.w, -r0.y, c3
pow_pp r0, r1.w, c1.x
mov_pp r0.y, r0.x
add r1.xyz, v2, -r2
mad r1.xyz, v0.w, r1, r2
add r1.xyz, r1, -r3.x
mov_sat r0.x, v2.w
mad r1.yzw, r0.x, r1.xxyz, r3.x
mul r3.xyz, r0.y, c2
mul r3.xyz, r3, c2.w
texldp r1.x, v4, s2
texld r0, v3, s3
mul_pp r2.xyz, r0, r1.x
mul_pp r0.xyz, r0.w, r0
mul_pp r0.xyz, r0, c4.x
mul_pp r2.xyz, r2, c4.y
min_pp r2.xyz, r0, r2
mul_pp r0.xyz, r0, r1.x
mul_pp r3.xyz, r3, c0.x
max_pp r0.xyz, r2, r0
mad_pp oC0.xyz, r1.yzww, r0, r3
mov_pp oC0.w, c0.x
"
}
SubProgram "d3d11 " {
// Stats: 35 math, 4 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_Emissive] 2D 2
SetTexture 2 [_ShadowMapTexture] 2D 0
SetTexture 3 [unity_Lightmap] 2D 3
ConstBuffer "$Globals" 192
Float 116 [_Opacity]
Float 120 [_RimFalloff]
Vector 128 [_RimColor]
BindCB  "$Globals" 0
"ps_4_0
eefiecedflojmenefmmbkoodcjneglpdblnkhgcnabaaaaaafeahaaaaadaaaaaa
cmaaaaaaoiaaaaaabmabaaaaejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapapaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaadadaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
daagaaaaeaaaaaaaimabaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fkaaaaadaagabaaaadaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaae
aahabaaaadaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadhcbabaaa
acaaaaaagcbaaaadpcbabaaaadaaaaaagcbaaaaddcbabaaaaeaaaaaagcbaaaad
lcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaadiaaaaah
bcaabaaaaaaaaaaackbabaaaabaaaaaaabeaaaaaaaaaeaeadgcaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaabaaaaaadgaaaaafkcaabaaaacaaaaaafganbaaa
abaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaa
aagabaaaacaaaaaadgaaaaaffcaabaaaacaaaaaafgahbaaaadaaaaaadgaaaaaf
kcaabaaaabaaaaaaagaibaaaadaaaaaaaaaaaaaipcaabaaaacaaaaaabgalbaia
ebaaaaaaabaaaaaaegaobaaaacaaaaaadcaaaaajdcaabaaaaaaaaaaaagaabaaa
aaaaaaaaegaabaaaacaaaaaabgafbaaaabaaaaaadccaaaapmcaabaaaaaaaaaaa
kgbkbaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaeaeaaaaaeaeaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaamaaaaaialpdcaaaaajdcaabaaaabaaaaaakgakbaaa
aaaaaaaaogakbaaaacaaaaaalgapbaaaabaaaaaaaaaaaaaidcaabaaaabaaaaaa
egaabaiaebaaaaaaaaaaaaaaegaabaaaabaaaaaadcaaaaajdcaabaaaaaaaaaaa
pgapbaaaaaaaaaaaegaabaaaabaaaaaaegaabaaaaaaaaaaaaaaaaaaiecaabaaa
aaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaahicaabaaa
aaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadccaaaajecaabaaaaaaaaaaa
ckaabaaaaaaaaaaadkaabaaaaaaaaaaabkaabaaaaaaaaaaaaaaaaaaihcaabaaa
abaaaaaakgakbaiaebaaaaaaaaaaaaaaegbcbaaaadaaaaaadcaaaaajncaabaaa
aaaaaaaaagaabaaaaaaaaaaaagajbaaaabaaaaaakgakbaaaaaaaaaaaaaaaaaai
hcaabaaaabaaaaaaigadbaiaebaaaaaaaaaaaaaaegbcbaaaadaaaaaadcaaaaaj
ncaabaaaaaaaaaaapgbpbaaaabaaaaaaagajbaaaabaaaaaaagaobaaaaaaaaaaa
aaaaaaaincaabaaaaaaaaaaafgafbaiaebaaaaaaaaaaaaaaagaobaaaaaaaaaaa
dgcaaaafbcaabaaaabaaaaaadkbabaaaadaaaaaadcaaaaajhcaabaaaaaaaaaaa
agaabaaaabaaaaaaigadbaaaaaaaaaaafgafbaaaaaaaaaaabaaaaaahicaabaaa
aaaaaaaaegbcbaaaacaaaaaaegbcbaaaacaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadicaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaackbabaaa
acaaaaaaaaaaaaaiicaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpcpaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaaiicaabaaa
aaaaaaaadkaabaaaaaaaaaaackiacaaaaaaaaaaaahaaaaaabjaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaapgapbaaaaaaaaaaa
egiccaaaaaaaaaaaaiaaaaaadiaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaa
pgipcaaaaaaaaaaaaiaaaaaadiaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaa
fgifcaaaaaaaaaaaahaaaaaaaoaaaaahdcaabaaaacaaaaaaegbabaaaafaaaaaa
pgbpbaaaafaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaaeghobaaa
acaaaaaaaagabaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaaakaabaaaacaaaaaa
akaabaaaacaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaaaeaaaaaaeghobaaa
adaaaaaaaagabaaaadaaaaaadiaaaaahocaabaaaacaaaaaapgapbaaaaaaaaaaa
agajbaaaadaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaaadaaaaaaabeaaaaa
aaaaaaebdiaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaapgapbaaaaaaaaaaa
ddaaaaahocaabaaaacaaaaaafgaobaaaacaaaaaaagajbaaaadaaaaaadiaaaaah
hcaabaaaadaaaaaaagaabaaaacaaaaaaegacbaaaadaaaaaadeaaaaahhcaabaaa
acaaaaaajgahbaaaacaaaaaaegacbaaaadaaaaaadcaaaaajhccabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaadgaaaaagiccabaaa
aaaaaaaabkiacaaaaaaaaaaaahaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 69 math, 5 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Vector 0 [_SpecColor]
Float 1 [_Shininess]
Float 2 [_Opacity]
Float 3 [_RimFalloff]
Vector 4 [_RimColor]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
SetTexture 4 [unity_LightmapInd] 2D 4
"3.0-!!ARBfp1.0
PARAM c[9] = { program.local[0..4],
		{ 1, 3, 2, 0.57735026 },
		{ 8, -0.40824828, -0.70710677, 0.57735026 },
		{ 0.81649655, 0, 0.57735026, 128 },
		{ -0.40824831, 0.70710677, 0.57735026 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[0], texture[1], 2D;
MOV R2.x, R0.w;
MOV R0.w, R1.z;
MOV R2.y, R1.w;
ADD R2.xy, R2, -R0.zwzw;
MAD_SAT R1.z, fragment.texcoord[0], c[5].y, -c[5];
MAD R1.zw, R1.z, R2.xyxy, R0;
MOV R0.z, R0.y;
MOV R0.y, R1.x;
MOV R0.w, R1.y;
ADD R1.xy, R0.zwzw, -R0;
MUL_SAT R0.z, fragment.texcoord[0], c[5].y;
MAD R1.xy, R0.z, R1, R0;
TEX R0, fragment.texcoord[2], texture[4], 2D;
MUL R0.xyz, R0.w, R0;
ADD R1.zw, R1, -R1.xyxy;
MAD_SAT R0.w, fragment.texcoord[0].z, c[5].y, -c[5].x;
MAD R3.xw, R0.w, R1.wyzz, R1.yyzx;
MUL R1.xyz, R0, c[6].x;
MUL R0.xyz, R1.y, c[8];
MAD R0.xyz, R1.x, c[7], R0;
MAD R0.xyz, R1.z, c[6].yzww, R0;
ADD R0.w, -R3.x, c[5].x;
MUL R1.w, R3, R3;
MAD_SAT R0.w, R0, R1, R3;
ADD R2.xyz, fragment.color.primary, -R0.w;
MAD R3.xyz, R3.x, R2, R0.w;
DP3 R1.w, R0, R0;
RSQ R1.w, R1.w;
MUL R0.xyz, R1.w, R0;
DP3 R0.w, fragment.texcoord[1], fragment.texcoord[1];
RSQ R0.w, R0.w;
MAD R2.xyz, fragment.texcoord[1], R0.w, R0;
ADD R0.xyz, fragment.color.primary, -R3;
MAD R0.xyz, fragment.texcoord[0].w, R0, R3;
DP3 R0.w, R2, R2;
RSQ R0.w, R0.w;
MUL R0.w, R0, R2.z;
ADD R0.xyz, R0, -R3.w;
DP3 R1.w, R1, c[5].w;
MAD R2.xyz, fragment.color.primary.w, R0, R3.w;
MAX R2.w, R0, c[7].y;
TEX R0, fragment.texcoord[2], texture[3], 2D;
MUL R1.xyz, R0.w, R0;
MUL R1.xyz, R1, R1.w;
MUL R1.yzw, R1.xxyz, c[6].x;
MUL R3.xyz, R1.yzww, c[0];
TXP R1.x, fragment.texcoord[3], texture[2], 2D;
MUL R0.xyz, R0, R1.x;
MOV R0.w, c[7];
MUL R0.w, R0, c[1].x;
MUL R0.xyz, R0, c[5].z;
MIN R0.xyz, R1.yzww, R0;
MUL R1.xyz, R1.yzww, R1.x;
MAX R0.xyz, R0, R1;
POW R0.w, R2.w, R0.w;
MUL R3.xyz, R3.w, R3;
MUL R3.xyz, R3, R0.w;
DP3 R0.w, fragment.texcoord[1], fragment.texcoord[1];
RSQ R0.w, R0.w;
MUL_SAT R0.w, R0, fragment.texcoord[1].z;
ADD R0.w, -R0, c[5].x;
POW R0.w, R0.w, c[3].x;
MUL R1.xyz, R0.w, c[4];
MAD R0.xyz, R2, R0, R3;
MUL R1.xyz, R1, c[4].w;
MAD result.color.xyz, R1, c[2].x, R0;
MOV result.color.w, c[2].x;
END
# 69 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 71 math, 5 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Vector 0 [_SpecColor]
Float 1 [_Shininess]
Float 2 [_Opacity]
Float 3 [_RimFalloff]
Vector 4 [_RimColor]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
SetTexture 4 [unity_LightmapInd] 2D 4
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
def c5, 1.00000000, 3.00000000, -1.00000000, -2.00000000
def c6, 8.00000000, 0.57735026, 2.00000000, 0.00000000
def c7, -0.40824831, 0.70710677, 0.57735026, 128.00000000
def c8, 0.81649655, 0.00000000, 0.57735026, 0
def c9, -0.40824828, -0.70710677, 0.57735026, 0
dcl_texcoord0 v0
dcl_texcoord1 v1.xyz
dcl_color0 v2
dcl_texcoord2 v3.xy
dcl_texcoord3 v4
texld r0, v0, s0
texld r1, v0, s1
mov r2.x, r0.y
mov r0.y, r1.x
mov r2.y, r1
add r2.xy, r2, -r0
mul_sat r1.x, v0.z, c5.y
mad r1.xy, r1.x, r2, r0
mov r0.x, r0.z
mov r2.x, r0.w
mov r2.y, r1.w
mov r0.y, r1.z
add r1.zw, r2.xyxy, -r0.xyxy
mad_sat r0.z, v0, c5.y, c5.w
mad r0.xy, r0.z, r1.zwzw, r0
add r2.xy, r0, -r1
texld r0, v3, s4
mad_sat r1.z, v0, c5.y, c5
mad r3.xw, r1.z, r2.yyzx, r1.yyzx
mul_pp r0.xyz, r0.w, r0
mul_pp r0.xyz, r0, c6.x
mul r1.xyz, r0.y, c7
mad r1.xyz, r0.x, c8, r1
mad r1.xyz, r0.z, c9, r1
add r0.w, -r3.x, c5.x
mul r1.w, r3, r3
mad_sat r0.w, r0, r1, r3
add r2.xyz, v2, -r0.w
mad r2.xyz, r3.x, r2, r0.w
dp3 r0.w, r1, r1
rsq r1.w, r0.w
add r3.xyz, v2, -r2
mad r2.xyz, v0.w, r3, r2
dp3_pp r0.w, v1, v1
mul r1.xyz, r1.w, r1
rsq_pp r0.w, r0.w
mad_pp r1.xyz, v1, r0.w, r1
dp3_pp r0.w, r1, r1
rsq_pp r1.x, r0.w
mov_sat r0.w, v2
add r2.xyz, r2, -r3.w
mad r2.xyz, r0.w, r2, r3.w
mul_pp r0.w, r1.x, r1.z
texld r1, v3, s3
max_pp r2.w, r0, c6
mul_pp r3.xyz, r1.w, r1
mov_pp r0.w, c1.x
dp3_pp r0.x, r0, c6.y
mul_pp r0.xyz, r3, r0.x
mul_pp r3.xyz, r0, c6.x
mul_pp r1.w, c7, r0
pow r0, r2.w, r1.w
mov r0.y, r0.x
mul_pp r4.xyz, r3, c0
mul_pp r4.xyz, r3.w, r4
dp3 r0.x, v1, v1
mul r4.xyz, r4, r0.y
rsq r0.y, r0.x
texldp r0.x, v4, s2
mul_sat r0.y, r0, v1.z
mul_pp r1.xyz, r1, r0.x
add r2.w, -r0.y, c5.x
mul_pp r0.yzw, r1.xxyz, c6.z
pow_pp r1, r2.w, c3.x
min_pp r0.yzw, r3.xxyz, r0
mul_pp r3.xyz, r3, r0.x
max_pp r0.xyz, r0.yzww, r3
mad_pp r2.xyz, r2, r0, r4
mul r1.xyz, r1.x, c4
mul r0.xyz, r1, c4.w
mad_pp oC0.xyz, r0, c2.x, r2
mov_pp oC0.w, c2.x
"
}
SubProgram "d3d11 " {
// Stats: 56 math, 5 textures
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_Emissive] 2D 2
SetTexture 2 [_ShadowMapTexture] 2D 0
SetTexture 3 [unity_Lightmap] 2D 3
SetTexture 4 [unity_LightmapInd] 2D 4
ConstBuffer "$Globals" 192
Vector 32 [_SpecColor]
Float 112 [_Shininess]
Float 116 [_Opacity]
Float 120 [_RimFalloff]
Vector 128 [_RimColor]
BindCB  "$Globals" 0
"ps_4_0
eefiecedpgoacdgjahoaphinpmajbecmmkelgnmmabaaaaaacmakaaaaadaaaaaa
cmaaaaaaoiaaaaaabmabaaaaejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapapaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaadadaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
aiajaaaaeaaaaaaaecacaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaa
aeaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaa
gcbaaaadpcbabaaaadaaaaaagcbaaaaddcbabaaaaeaaaaaagcbaaaadlcbabaaa
afaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacagaaaaaaefaaaaajpcaabaaa
aaaaaaaaegbabaaaaeaaaaaaeghobaaaaeaaaaaaaagabaaaaeaaaaaadiaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgapbaaaaaaaaaaadiaaaaakhcaabaaaabaaaaaa
fgafbaaaaaaaaaaaaceaaaaaomafnblopdaedfdpdkmnbddpaaaaaaaadcaaaaam
hcaabaaaabaaaaaaagaabaaaaaaaaaaaaceaaaaaolaffbdpaaaaaaaadkmnbddp
aaaaaaaaegacbaaaabaaaaaadcaaaaamhcaabaaaabaaaaaakgakbaaaaaaaaaaa
aceaaaaaolafnblopdaedflpdkmnbddpaaaaaaaaegacbaaaabaaaaaabaaaaaak
bcaabaaaaaaaaaaaaceaaaaadkmnbddpdkmnbddpdkmnbddpaaaaaaaaegacbaaa
aaaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaa
eeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaabaaaaaahecaabaaaaaaaaaaa
egbcbaaaacaaaaaaegbcbaaaacaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaa
aaaaaaaadiaaaaahpcaabaaaacaaaaaakgakbaaaaaaaaaaacgbjbaaaacaaaaaa
dcaaaaajocaabaaaaaaaaaaaagajbaaaabaaaaaafgafbaaaaaaaaaaafgaobaaa
acaaaaaadgcaaaafbcaabaaaacaaaaaaakaabaaaacaaaaaaaaaaaaaibcaabaaa
abaaaaaaakaabaiaebaaaaaaacaaaaaaabeaaaaaaaaaiadpcpaaaaafbcaabaaa
abaaaaaaakaabaaaabaaaaaadiaaaaaibcaabaaaabaaaaaaakaabaaaabaaaaaa
ckiacaaaaaaaaaaaahaaaaaabjaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaa
diaaaaaihcaabaaaabaaaaaaagaabaaaabaaaaaaegiccaaaaaaaaaaaaiaaaaaa
diaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaaaaaaaaaaaiaaaaaa
baaaaaahccaabaaaaaaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaaeeaaaaaf
ccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaadkaabaaaaaaaaaaadeaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
abeaaaaaaaaaaaaacpaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaai
ecaabaaaaaaaaaaaakiacaaaaaaaaaaaahaaaaaaabeaaaaaaaaaaaeddiaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaackaabaaaaaaaaaaabjaaaaafccaabaaa
aaaaaaaabkaabaaaaaaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaaeaaaaaa
eghobaaaadaaaaaaaagabaaaadaaaaaadiaaaaahecaabaaaaaaaaaaadkaabaaa
acaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaaadaaaaaaegacbaaaacaaaaaa
kgakbaaaaaaaaaaadiaaaaahncaabaaaaaaaaaaaagaabaaaaaaaaaaaagajbaaa
adaaaaaaaoaaaaahdcaabaaaadaaaaaaegbabaaaafaaaaaapgbpbaaaafaaaaaa
efaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaaacaaaaaaaagabaaa
aaaaaaaaaaaaaaahicaabaaaabaaaaaaakaabaaaadaaaaaaakaabaaaadaaaaaa
diaaaaahhcaabaaaadaaaaaaigadbaaaaaaaaaaaagaabaaaadaaaaaadiaaaaah
hcaabaaaacaaaaaaegacbaaaacaaaaaapgapbaaaabaaaaaaddaaaaahhcaabaaa
acaaaaaaigadbaaaaaaaaaaaegacbaaaacaaaaaadiaaaaaincaabaaaaaaaaaaa
agaobaaaaaaaaaaaagijcaaaaaaaaaaaacaaaaaadeaaaaahhcaabaaaacaaaaaa
egacbaaaadaaaaaaegacbaaaacaaaaaadiaaaaahicaabaaaabaaaaaackbabaaa
abaaaaaaabeaaaaaaaaaeaeadgcaaaaficaabaaaabaaaaaadkaabaaaabaaaaaa
efaaaaajpcaabaaaadaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
abaaaaaadgaaaaafkcaabaaaaeaaaaaafganbaaaadaaaaaaefaaaaajpcaabaaa
afaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaacaaaaaadgaaaaaf
fcaabaaaaeaaaaaafgahbaaaafaaaaaadgaaaaafkcaabaaaadaaaaaaagaibaaa
afaaaaaaaaaaaaaipcaabaaaaeaaaaaabgalbaiaebaaaaaaadaaaaaaegaobaaa
aeaaaaaadcaaaaajdcaabaaaadaaaaaapgapbaaaabaaaaaaegaabaaaaeaaaaaa
bgafbaaaadaaaaaadccaaaapdcaabaaaaeaaaaaakgbkbaaaabaaaaaaaceaaaaa
aaaaeaeaaaaaeaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaaamaaaaaialpaaaaaaaa
aaaaaaaadcaaaaajmcaabaaaadaaaaaaagaabaaaaeaaaaaakgaobaaaaeaaaaaa
pgalbaaaadaaaaaaaaaaaaaimcaabaaaadaaaaaaagaebaiaebaaaaaaadaaaaaa
kgaobaaaadaaaaaadcaaaaajdcaabaaaadaaaaaafgafbaaaaeaaaaaaogakbaaa
adaaaaaaegaabaaaadaaaaaaaaaaaaaiicaabaaaabaaaaaaakaabaiaebaaaaaa
adaaaaaaabeaaaaaaaaaiadpdiaaaaahicaabaaaacaaaaaabkaabaaaadaaaaaa
bkaabaaaadaaaaaadccaaaajicaabaaaabaaaaaadkaabaaaabaaaaaadkaabaaa
acaaaaaabkaabaaaadaaaaaaaaaaaaaihcaabaaaaeaaaaaapgapbaiaebaaaaaa
abaaaaaaegbcbaaaadaaaaaadcaaaaajncaabaaaadaaaaaaagaabaaaadaaaaaa
agajbaaaaeaaaaaapgapbaaaabaaaaaaaaaaaaaihcaabaaaaeaaaaaaigadbaia
ebaaaaaaadaaaaaaegbcbaaaadaaaaaadcaaaaajncaabaaaadaaaaaapgbpbaaa
abaaaaaaagajbaaaaeaaaaaaagaobaaaadaaaaaaaaaaaaaincaabaaaadaaaaaa
fgafbaiaebaaaaaaadaaaaaaagaobaaaadaaaaaadgcaaaaficaabaaaabaaaaaa
dkbabaaaadaaaaaadcaaaaajncaabaaaadaaaaaapgapbaaaabaaaaaaagaobaaa
adaaaaaafgafbaaaadaaaaaadiaaaaahncaabaaaaaaaaaaaagaobaaaaaaaaaaa
fgafbaaaadaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaigadbaaa
adaaaaaadcaaaaajhcaabaaaaaaaaaaaigadbaaaaaaaaaaafgafbaaaaaaaaaaa
egacbaaaacaaaaaadcaaaaakhccabaaaaaaaaaaaegacbaaaabaaaaaafgifcaaa
aaaaaaaaahaaaaaaegacbaaaaaaaaaaadgaaaaagiccabaaaaaaaaaaabkiacaaa
aaaaaaaaahaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
"!!GLES3"
}
}
 }


 // Stats for Vertex shader:
 //       d3d11 : 31 avg math (24..33)
 //        d3d9 : 36 avg math (30..39)
 //      opengl : 33 avg math (27..36)
 // Stats for Fragment shader:
 //       d3d11 : 37 avg math (34..43), 3 avg texture (2..4)
 //        d3d9 : 51 avg math (48..56), 3 avg texture (2..4)
 //      opengl : 52 avg math (47..58), 3 avg texture (2..4)
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardAdd" }
  ZWrite Off
  Fog {
   Color (0,0,0,0)
  }
  Blend One One
Program "vp" {
SubProgram "opengl " {
// Stats: 35 math
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_Scale]
Vector 20 [_MainTex_ST]
Vector 21 [_Emissive_ST]
"3.0-!!ARBvp1.0
PARAM c[22] = { { 1 },
		state.matrix.mvp,
		program.local[5..21] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[17];
MOV R1.w, c[0].x;
MOV R0.xyz, vertex.attrib[14];
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
MAD R2.xyz, R2, c[19].w, -vertex.position;
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[18];
MUL R1.xyz, R1, vertex.attrib[14].w;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R0.xyz, R3, c[19].w, -vertex.position;
DP3 result.texcoord[1].y, R0, R1;
DP3 result.texcoord[1].z, vertex.normal, R0;
DP3 result.texcoord[1].x, R0, vertex.attrib[14];
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[2].y, R1, R2;
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, vertex.attrib[14], R2;
MOV result.color, vertex.color;
DP4 result.texcoord[3].z, R0, c[15];
DP4 result.texcoord[3].y, R0, c[14];
DP4 result.texcoord[3].x, R0, c[13];
MAD result.texcoord[0].zw, vertex.texcoord[1].xyxy, c[21].xyxy, c[21];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 35 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 38 math
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
Vector 19 [_MainTex_ST]
Vector 20 [_Emissive_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_color0 o2
dcl_texcoord1 o3
dcl_texcoord2 o4
dcl_texcoord3 o5
def c21, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mov r0.w, c21.x
mov r0.xyz, c16
dp4 r1.z, r0, c10
dp4 r1.y, r0, c9
dp4 r1.x, r0, c8
mad r3.xyz, r1, c18.w, -v0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r1, v1.w
mov r0, c10
dp4 r4.z, c17, r0
mov r0, c9
dp4 r4.y, c17, r0
mov r1, c8
dp4 r4.x, c17, r1
mad r0.xyz, r4, c18.w, -v0
dp3 o3.y, r0, r2
dp3 o3.z, v2, r0
dp3 o3.x, r0, v1
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 o4.y, r2, r3
dp3 o4.z, v2, r3
dp3 o4.x, v1, r3
mov o2, v5
dp4 o5.z, r0, c14
dp4 o5.y, r0, c13
dp4 o5.x, r0, c12
mad o1.zw, v4.xyxy, c20.xyxy, c20
mad o1.xy, v3, c19, c19.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 33 math
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 176
Matrix 48 [_LightMatrix0]
Vector 144 [_MainTex_ST]
Vector 160 [_Emissive_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedjgoglphcjbppnfjonnindlcghecinaobabaaaaaahiahaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaaknaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefcmaafaaaaeaaaabaahaabaaaa
fjaaaaaeegiocaaaaaaaaaaaalaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaad
pcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaacacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaa
dcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaakaaaaaa
kgiocaaaaaaaaaaaakaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaaafaaaaaa
diaaaaahhcaabaaaaaaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaak
hcaabaaaaaaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaa
aaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgbpbaaaabaaaaaa
diaaaaajhcaabaaaabaaaaaafgifcaaaacaaaaaaaaaaaaaaegiccaaaadaaaaaa
bbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaa
acaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
adaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaadaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaa
adaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaahcccabaaaadaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbccabaaaadaaaaaaegbcbaaa
abaaaaaaegacbaaaabaaaaaabaaaaaaheccabaaaadaaaaaaegbcbaaaacaaaaaa
egacbaaaabaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaabaaaaaaaeaaaaaa
egiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaa
baaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaa
abaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaa
abaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaadaaaaaa
bdaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaaadaaaaaa
beaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaabaaaaaahbccabaaaaeaaaaaaegbcbaaaabaaaaaa
egacbaaaabaaaaaabaaaaaaheccabaaaaeaaaaaaegbcbaaaacaaaaaaegacbaaa
abaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaa
anaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaamaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
aoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaakgakbaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaaaaaaaaaa
agaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "POINT" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec3 tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_6 = tmpvar_1.xyz;
  tmpvar_7 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_8;
  tmpvar_8[0].x = tmpvar_6.x;
  tmpvar_8[0].y = tmpvar_7.x;
  tmpvar_8[0].z = tmpvar_2.x;
  tmpvar_8[1].x = tmpvar_6.y;
  tmpvar_8[1].y = tmpvar_7.y;
  tmpvar_8[1].z = tmpvar_2.y;
  tmpvar_8[2].x = tmpvar_6.z;
  tmpvar_8[2].y = tmpvar_7.z;
  tmpvar_8[2].z = tmpvar_2.z;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_4 = tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_8 * (((_World2Object * tmpvar_10).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_5 = tmpvar_11;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _LightTexture0;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  highp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = xlv_COLOR0;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  mediump float rim_9;
  highp vec4 mask_10;
  highp vec4 color_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  color_11 = tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Emissive, xlv_TEXCOORD0.xy);
  mask_10 = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = (1.0 - clamp (normalize(tmpvar_3).z, 0.0, 1.0));
  rim_9 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((_RimColor.xyz * pow (rim_9, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_11.x;
  tmpvar_16.y = mask_10.x;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_11.y;
  tmpvar_17.y = mask_10.y;
  highp vec2 tmpvar_18;
  tmpvar_18.x = color_11.z;
  tmpvar_18.y = mask_10.z;
  highp vec2 tmpvar_19;
  tmpvar_19.x = color_11.w;
  tmpvar_19.y = mask_10.w;
  highp vec2 tmpvar_20;
  tmpvar_20 = mix (mix (tmpvar_16, tmpvar_17, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_18, tmpvar_19, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_21;
  tmpvar_21 = mix (tmpvar_20.xxx, mix (mix (vec3(clamp ((tmpvar_20.x + ((1.0 - tmpvar_20.y) * pow (tmpvar_20.x, 2.0))), 0.0, 1.0)), tmpvar_4.xyz, tmpvar_20.yyy), tmpvar_4.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_4.w, 0.0, 1.0)));
  tmpvar_5 = tmpvar_21;
  tmpvar_6 = tmpvar_15;
  highp float tmpvar_22;
  tmpvar_22 = tmpvar_20.x;
  tmpvar_7 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_6 * _Opacity);
  tmpvar_6 = tmpvar_23;
  tmpvar_8 = _Opacity;
  mediump vec3 tmpvar_24;
  tmpvar_24 = normalize(xlv_TEXCOORD1);
  lightDir_2 = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = dot (xlv_TEXCOORD3, xlv_TEXCOORD3);
  lowp float atten_26;
  atten_26 = texture2D (_LightTexture0, vec2(tmpvar_25)).w;
  lowp vec4 c_27;
  highp float nh_28;
  lowp float tmpvar_29;
  tmpvar_29 = max (0.0, lightDir_2.z);
  mediump float tmpvar_30;
  tmpvar_30 = max (0.0, normalize((lightDir_2 + normalize(xlv_TEXCOORD2))).z);
  nh_28 = tmpvar_30;
  mediump float arg1_31;
  arg1_31 = (_Shininess * 128.0);
  highp float tmpvar_32;
  tmpvar_32 = (pow (nh_28, arg1_31) * tmpvar_7);
  highp vec3 tmpvar_33;
  tmpvar_33 = ((((tmpvar_5 * _LightColor0.xyz) * tmpvar_29) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_32)) * (atten_26 * 2.0));
  c_27.xyz = tmpvar_33;
  highp float tmpvar_34;
  tmpvar_34 = (tmpvar_8 + (((_LightColor0.w * _SpecColor.w) * tmpvar_32) * atten_26));
  c_27.w = tmpvar_34;
  c_1.xyz = c_27.xyz;
  c_1.w = 0.0;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "POINT" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec3 tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_6 = tmpvar_1.xyz;
  tmpvar_7 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_8;
  tmpvar_8[0].x = tmpvar_6.x;
  tmpvar_8[0].y = tmpvar_7.x;
  tmpvar_8[0].z = tmpvar_2.x;
  tmpvar_8[1].x = tmpvar_6.y;
  tmpvar_8[1].y = tmpvar_7.y;
  tmpvar_8[1].z = tmpvar_2.y;
  tmpvar_8[2].x = tmpvar_6.z;
  tmpvar_8[2].y = tmpvar_7.z;
  tmpvar_8[2].z = tmpvar_2.z;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_4 = tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_8 * (((_World2Object * tmpvar_10).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_5 = tmpvar_11;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _LightTexture0;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  highp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = xlv_COLOR0;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  mediump float rim_9;
  highp vec4 mask_10;
  highp vec4 color_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  color_11 = tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Emissive, xlv_TEXCOORD0.xy);
  mask_10 = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = (1.0 - clamp (normalize(tmpvar_3).z, 0.0, 1.0));
  rim_9 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((_RimColor.xyz * pow (rim_9, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_11.x;
  tmpvar_16.y = mask_10.x;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_11.y;
  tmpvar_17.y = mask_10.y;
  highp vec2 tmpvar_18;
  tmpvar_18.x = color_11.z;
  tmpvar_18.y = mask_10.z;
  highp vec2 tmpvar_19;
  tmpvar_19.x = color_11.w;
  tmpvar_19.y = mask_10.w;
  highp vec2 tmpvar_20;
  tmpvar_20 = mix (mix (tmpvar_16, tmpvar_17, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_18, tmpvar_19, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_21;
  tmpvar_21 = mix (tmpvar_20.xxx, mix (mix (vec3(clamp ((tmpvar_20.x + ((1.0 - tmpvar_20.y) * pow (tmpvar_20.x, 2.0))), 0.0, 1.0)), tmpvar_4.xyz, tmpvar_20.yyy), tmpvar_4.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_4.w, 0.0, 1.0)));
  tmpvar_5 = tmpvar_21;
  tmpvar_6 = tmpvar_15;
  highp float tmpvar_22;
  tmpvar_22 = tmpvar_20.x;
  tmpvar_7 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_6 * _Opacity);
  tmpvar_6 = tmpvar_23;
  tmpvar_8 = _Opacity;
  mediump vec3 tmpvar_24;
  tmpvar_24 = normalize(xlv_TEXCOORD1);
  lightDir_2 = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = dot (xlv_TEXCOORD3, xlv_TEXCOORD3);
  lowp float atten_26;
  atten_26 = texture2D (_LightTexture0, vec2(tmpvar_25)).w;
  lowp vec4 c_27;
  highp float nh_28;
  lowp float tmpvar_29;
  tmpvar_29 = max (0.0, lightDir_2.z);
  mediump float tmpvar_30;
  tmpvar_30 = max (0.0, normalize((lightDir_2 + normalize(xlv_TEXCOORD2))).z);
  nh_28 = tmpvar_30;
  mediump float arg1_31;
  arg1_31 = (_Shininess * 128.0);
  highp float tmpvar_32;
  tmpvar_32 = (pow (nh_28, arg1_31) * tmpvar_7);
  highp vec3 tmpvar_33;
  tmpvar_33 = ((((tmpvar_5 * _LightColor0.xyz) * tmpvar_29) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_32)) * (atten_26 * 2.0));
  c_27.xyz = tmpvar_33;
  highp float tmpvar_34;
  tmpvar_34 = (tmpvar_8 + (((_LightColor0.w * _SpecColor.w) * tmpvar_32) * atten_26));
  c_27.w = tmpvar_34;
  c_1.xyz = c_27.xyz;
  c_1.w = 0.0;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "POINT" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesColor;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
in vec4 _glesMultiTexCoord1;
in vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
out highp vec4 xlv_TEXCOORD0;
out lowp vec4 xlv_COLOR0;
out mediump vec3 xlv_TEXCOORD1;
out mediump vec3 xlv_TEXCOORD2;
out highp vec3 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec3 tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_6 = tmpvar_1.xyz;
  tmpvar_7 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_8;
  tmpvar_8[0].x = tmpvar_6.x;
  tmpvar_8[0].y = tmpvar_7.x;
  tmpvar_8[0].z = tmpvar_2.x;
  tmpvar_8[1].x = tmpvar_6.y;
  tmpvar_8[1].y = tmpvar_7.y;
  tmpvar_8[1].z = tmpvar_2.y;
  tmpvar_8[2].x = tmpvar_6.z;
  tmpvar_8[2].y = tmpvar_7.z;
  tmpvar_8[2].z = tmpvar_2.z;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_4 = tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_8 * (((_World2Object * tmpvar_10).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_5 = tmpvar_11;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _LightTexture0;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
in highp vec4 xlv_TEXCOORD0;
in lowp vec4 xlv_COLOR0;
in mediump vec3 xlv_TEXCOORD1;
in mediump vec3 xlv_TEXCOORD2;
in highp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  highp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = xlv_COLOR0;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  mediump float rim_9;
  highp vec4 mask_10;
  highp vec4 color_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture (_MainTex, xlv_TEXCOORD0.xy);
  color_11 = tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture (_Emissive, xlv_TEXCOORD0.xy);
  mask_10 = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = (1.0 - clamp (normalize(tmpvar_3).z, 0.0, 1.0));
  rim_9 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((_RimColor.xyz * pow (rim_9, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_11.x;
  tmpvar_16.y = mask_10.x;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_11.y;
  tmpvar_17.y = mask_10.y;
  highp vec2 tmpvar_18;
  tmpvar_18.x = color_11.z;
  tmpvar_18.y = mask_10.z;
  highp vec2 tmpvar_19;
  tmpvar_19.x = color_11.w;
  tmpvar_19.y = mask_10.w;
  highp vec2 tmpvar_20;
  tmpvar_20 = mix (mix (tmpvar_16, tmpvar_17, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_18, tmpvar_19, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_21;
  tmpvar_21 = mix (tmpvar_20.xxx, mix (mix (vec3(clamp ((tmpvar_20.x + ((1.0 - tmpvar_20.y) * pow (tmpvar_20.x, 2.0))), 0.0, 1.0)), tmpvar_4.xyz, tmpvar_20.yyy), tmpvar_4.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_4.w, 0.0, 1.0)));
  tmpvar_5 = tmpvar_21;
  tmpvar_6 = tmpvar_15;
  highp float tmpvar_22;
  tmpvar_22 = tmpvar_20.x;
  tmpvar_7 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_6 * _Opacity);
  tmpvar_6 = tmpvar_23;
  tmpvar_8 = _Opacity;
  mediump vec3 tmpvar_24;
  tmpvar_24 = normalize(xlv_TEXCOORD1);
  lightDir_2 = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = dot (xlv_TEXCOORD3, xlv_TEXCOORD3);
  lowp float atten_26;
  atten_26 = texture (_LightTexture0, vec2(tmpvar_25)).w;
  lowp vec4 c_27;
  highp float nh_28;
  lowp float tmpvar_29;
  tmpvar_29 = max (0.0, lightDir_2.z);
  mediump float tmpvar_30;
  tmpvar_30 = max (0.0, normalize((lightDir_2 + normalize(xlv_TEXCOORD2))).z);
  nh_28 = tmpvar_30;
  mediump float arg1_31;
  arg1_31 = (_Shininess * 128.0);
  highp float tmpvar_32;
  tmpvar_32 = (pow (nh_28, arg1_31) * tmpvar_7);
  highp vec3 tmpvar_33;
  tmpvar_33 = ((((tmpvar_5 * _LightColor0.xyz) * tmpvar_29) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_32)) * (atten_26 * 2.0));
  c_27.xyz = tmpvar_33;
  highp float tmpvar_34;
  tmpvar_34 = (tmpvar_8 + (((_LightColor0.w * _SpecColor.w) * tmpvar_32) * atten_26));
  c_27.w = tmpvar_34;
  c_1.xyz = c_27.xyz;
  c_1.w = 0.0;
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 27 math
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_World2Object]
Vector 9 [_WorldSpaceCameraPos]
Vector 10 [_WorldSpaceLightPos0]
Vector 11 [unity_Scale]
Vector 12 [_MainTex_ST]
Vector 13 [_Emissive_ST]
"3.0-!!ARBvp1.0
PARAM c[14] = { { 1 },
		state.matrix.mvp,
		program.local[5..13] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[9];
MOV R1.w, c[0].x;
MOV R0.xyz, vertex.attrib[14];
DP4 R2.z, R1, c[7];
DP4 R2.y, R1, c[6];
DP4 R2.x, R1, c[5];
MAD R2.xyz, R2, c[11].w, -vertex.position;
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[10];
MUL R1.xyz, R1, vertex.attrib[14].w;
DP4 R3.z, R0, c[7];
DP4 R3.y, R0, c[6];
DP4 R3.x, R0, c[5];
DP3 result.texcoord[1].y, R3, R1;
DP3 result.texcoord[2].y, R1, R2;
DP3 result.texcoord[1].z, vertex.normal, R3;
DP3 result.texcoord[1].x, R3, vertex.attrib[14];
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, vertex.attrib[14], R2;
MOV result.color, vertex.color;
MAD result.texcoord[0].zw, vertex.texcoord[1].xyxy, c[13].xyxy, c[13];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[12], c[12].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 27 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 30 math
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_World2Object]
Vector 8 [_WorldSpaceCameraPos]
Vector 9 [_WorldSpaceLightPos0]
Vector 10 [unity_Scale]
Vector 11 [_MainTex_ST]
Vector 12 [_Emissive_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_color0 o2
dcl_texcoord1 o3
dcl_texcoord2 o4
def c13, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mov r0.w, c13.x
mov r0.xyz, c8
dp4 r1.z, r0, c6
dp4 r1.y, r0, c5
dp4 r1.x, r0, c4
mad r3.xyz, r1, c10.w, -v0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r1, v1.w
mov r0, c6
dp4 r4.z, c9, r0
mov r0, c5
mov r1, c4
dp4 r4.y, c9, r0
dp4 r4.x, c9, r1
dp3 o3.y, r4, r2
dp3 o4.y, r2, r3
dp3 o3.z, v2, r4
dp3 o3.x, r4, v1
dp3 o4.z, v2, r3
dp3 o4.x, v1, r3
mov o2, v5
mad o1.zw, v4.xyxy, c12.xyxy, c12
mad o1.xy, v3, c11, c11.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 24 math
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 112
Vector 80 [_MainTex_ST]
Vector 96 [_Emissive_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefieceddpdplkgkljoaajbeomfkdfaamkagejcaabaaaaaapiafaaaaadaaaaaa
cmaaaaaapeaaaaaajiabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaajfaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklfdeieefcfiaeaaaa
eaaaabaabgabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaa
abaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaa
adaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaadcaaaaal
mccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaagaaaaaakgiocaaa
aaaaaaaaagaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaaafaaaaaadiaaaaah
hcaabaaaaaaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaa
aaaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaaaaaaaaa
diaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgbpbaaaabaaaaaadiaaaaaj
hcaabaaaabaaaaaafgifcaaaacaaaaaaaaaaaaaaegiccaaaadaaaaaabbaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaacaaaaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaa
bcaaaaaakgikcaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaa
abaaaaaaegiccaaaadaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
baaaaaahbccabaaaadaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaah
eccabaaaadaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadiaaaaajhcaabaaa
abaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaa
egacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaa
kgikcaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaa
egacbaaaabaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaabaaaaaa
egacbaaaabaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaa
baaaaaahcccabaaaaeaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaah
bccabaaaaeaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaaheccabaaa
aeaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec3 tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_6 = tmpvar_1.xyz;
  tmpvar_7 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_8;
  tmpvar_8[0].x = tmpvar_6.x;
  tmpvar_8[0].y = tmpvar_7.x;
  tmpvar_8[0].z = tmpvar_2.x;
  tmpvar_8[1].x = tmpvar_6.y;
  tmpvar_8[1].y = tmpvar_7.y;
  tmpvar_8[1].z = tmpvar_2.y;
  tmpvar_8[2].x = tmpvar_6.z;
  tmpvar_8[2].y = tmpvar_7.z;
  tmpvar_8[2].z = tmpvar_2.z;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_4 = tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_8 * (((_World2Object * tmpvar_10).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_5 = tmpvar_11;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  highp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = xlv_COLOR0;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  mediump float rim_9;
  highp vec4 mask_10;
  highp vec4 color_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  color_11 = tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Emissive, xlv_TEXCOORD0.xy);
  mask_10 = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = (1.0 - clamp (normalize(tmpvar_3).z, 0.0, 1.0));
  rim_9 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((_RimColor.xyz * pow (rim_9, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_11.x;
  tmpvar_16.y = mask_10.x;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_11.y;
  tmpvar_17.y = mask_10.y;
  highp vec2 tmpvar_18;
  tmpvar_18.x = color_11.z;
  tmpvar_18.y = mask_10.z;
  highp vec2 tmpvar_19;
  tmpvar_19.x = color_11.w;
  tmpvar_19.y = mask_10.w;
  highp vec2 tmpvar_20;
  tmpvar_20 = mix (mix (tmpvar_16, tmpvar_17, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_18, tmpvar_19, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_21;
  tmpvar_21 = mix (tmpvar_20.xxx, mix (mix (vec3(clamp ((tmpvar_20.x + ((1.0 - tmpvar_20.y) * pow (tmpvar_20.x, 2.0))), 0.0, 1.0)), tmpvar_4.xyz, tmpvar_20.yyy), tmpvar_4.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_4.w, 0.0, 1.0)));
  tmpvar_5 = tmpvar_21;
  tmpvar_6 = tmpvar_15;
  highp float tmpvar_22;
  tmpvar_22 = tmpvar_20.x;
  tmpvar_7 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_6 * _Opacity);
  tmpvar_6 = tmpvar_23;
  tmpvar_8 = _Opacity;
  lightDir_2 = xlv_TEXCOORD1;
  lowp vec4 c_24;
  highp float nh_25;
  lowp float tmpvar_26;
  tmpvar_26 = max (0.0, lightDir_2.z);
  mediump float tmpvar_27;
  tmpvar_27 = max (0.0, normalize((lightDir_2 + normalize(xlv_TEXCOORD2))).z);
  nh_25 = tmpvar_27;
  mediump float arg1_28;
  arg1_28 = (_Shininess * 128.0);
  highp float tmpvar_29;
  tmpvar_29 = (pow (nh_25, arg1_28) * tmpvar_7);
  highp vec3 tmpvar_30;
  tmpvar_30 = ((((tmpvar_5 * _LightColor0.xyz) * tmpvar_26) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_29)) * 2.0);
  c_24.xyz = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (tmpvar_8 + ((_LightColor0.w * _SpecColor.w) * tmpvar_29));
  c_24.w = tmpvar_31;
  c_1.xyz = c_24.xyz;
  c_1.w = 0.0;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec3 tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_6 = tmpvar_1.xyz;
  tmpvar_7 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_8;
  tmpvar_8[0].x = tmpvar_6.x;
  tmpvar_8[0].y = tmpvar_7.x;
  tmpvar_8[0].z = tmpvar_2.x;
  tmpvar_8[1].x = tmpvar_6.y;
  tmpvar_8[1].y = tmpvar_7.y;
  tmpvar_8[1].z = tmpvar_2.y;
  tmpvar_8[2].x = tmpvar_6.z;
  tmpvar_8[2].y = tmpvar_7.z;
  tmpvar_8[2].z = tmpvar_2.z;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_4 = tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_8 * (((_World2Object * tmpvar_10).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_5 = tmpvar_11;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  highp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = xlv_COLOR0;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  mediump float rim_9;
  highp vec4 mask_10;
  highp vec4 color_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  color_11 = tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Emissive, xlv_TEXCOORD0.xy);
  mask_10 = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = (1.0 - clamp (normalize(tmpvar_3).z, 0.0, 1.0));
  rim_9 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((_RimColor.xyz * pow (rim_9, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_11.x;
  tmpvar_16.y = mask_10.x;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_11.y;
  tmpvar_17.y = mask_10.y;
  highp vec2 tmpvar_18;
  tmpvar_18.x = color_11.z;
  tmpvar_18.y = mask_10.z;
  highp vec2 tmpvar_19;
  tmpvar_19.x = color_11.w;
  tmpvar_19.y = mask_10.w;
  highp vec2 tmpvar_20;
  tmpvar_20 = mix (mix (tmpvar_16, tmpvar_17, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_18, tmpvar_19, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_21;
  tmpvar_21 = mix (tmpvar_20.xxx, mix (mix (vec3(clamp ((tmpvar_20.x + ((1.0 - tmpvar_20.y) * pow (tmpvar_20.x, 2.0))), 0.0, 1.0)), tmpvar_4.xyz, tmpvar_20.yyy), tmpvar_4.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_4.w, 0.0, 1.0)));
  tmpvar_5 = tmpvar_21;
  tmpvar_6 = tmpvar_15;
  highp float tmpvar_22;
  tmpvar_22 = tmpvar_20.x;
  tmpvar_7 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_6 * _Opacity);
  tmpvar_6 = tmpvar_23;
  tmpvar_8 = _Opacity;
  lightDir_2 = xlv_TEXCOORD1;
  lowp vec4 c_24;
  highp float nh_25;
  lowp float tmpvar_26;
  tmpvar_26 = max (0.0, lightDir_2.z);
  mediump float tmpvar_27;
  tmpvar_27 = max (0.0, normalize((lightDir_2 + normalize(xlv_TEXCOORD2))).z);
  nh_25 = tmpvar_27;
  mediump float arg1_28;
  arg1_28 = (_Shininess * 128.0);
  highp float tmpvar_29;
  tmpvar_29 = (pow (nh_25, arg1_28) * tmpvar_7);
  highp vec3 tmpvar_30;
  tmpvar_30 = ((((tmpvar_5 * _LightColor0.xyz) * tmpvar_26) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_29)) * 2.0);
  c_24.xyz = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (tmpvar_8 + ((_LightColor0.w * _SpecColor.w) * tmpvar_29));
  c_24.w = tmpvar_31;
  c_1.xyz = c_24.xyz;
  c_1.w = 0.0;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesColor;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
in vec4 _glesMultiTexCoord1;
in vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
out highp vec4 xlv_TEXCOORD0;
out lowp vec4 xlv_COLOR0;
out mediump vec3 xlv_TEXCOORD1;
out mediump vec3 xlv_TEXCOORD2;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec3 tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_6 = tmpvar_1.xyz;
  tmpvar_7 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_8;
  tmpvar_8[0].x = tmpvar_6.x;
  tmpvar_8[0].y = tmpvar_7.x;
  tmpvar_8[0].z = tmpvar_2.x;
  tmpvar_8[1].x = tmpvar_6.y;
  tmpvar_8[1].y = tmpvar_7.y;
  tmpvar_8[1].z = tmpvar_2.y;
  tmpvar_8[2].x = tmpvar_6.z;
  tmpvar_8[2].y = tmpvar_7.z;
  tmpvar_8[2].z = tmpvar_2.z;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_4 = tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_8 * (((_World2Object * tmpvar_10).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_5 = tmpvar_11;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
in highp vec4 xlv_TEXCOORD0;
in lowp vec4 xlv_COLOR0;
in mediump vec3 xlv_TEXCOORD1;
in mediump vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  highp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = xlv_COLOR0;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  mediump float rim_9;
  highp vec4 mask_10;
  highp vec4 color_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture (_MainTex, xlv_TEXCOORD0.xy);
  color_11 = tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture (_Emissive, xlv_TEXCOORD0.xy);
  mask_10 = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = (1.0 - clamp (normalize(tmpvar_3).z, 0.0, 1.0));
  rim_9 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((_RimColor.xyz * pow (rim_9, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_11.x;
  tmpvar_16.y = mask_10.x;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_11.y;
  tmpvar_17.y = mask_10.y;
  highp vec2 tmpvar_18;
  tmpvar_18.x = color_11.z;
  tmpvar_18.y = mask_10.z;
  highp vec2 tmpvar_19;
  tmpvar_19.x = color_11.w;
  tmpvar_19.y = mask_10.w;
  highp vec2 tmpvar_20;
  tmpvar_20 = mix (mix (tmpvar_16, tmpvar_17, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_18, tmpvar_19, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_21;
  tmpvar_21 = mix (tmpvar_20.xxx, mix (mix (vec3(clamp ((tmpvar_20.x + ((1.0 - tmpvar_20.y) * pow (tmpvar_20.x, 2.0))), 0.0, 1.0)), tmpvar_4.xyz, tmpvar_20.yyy), tmpvar_4.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_4.w, 0.0, 1.0)));
  tmpvar_5 = tmpvar_21;
  tmpvar_6 = tmpvar_15;
  highp float tmpvar_22;
  tmpvar_22 = tmpvar_20.x;
  tmpvar_7 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_6 * _Opacity);
  tmpvar_6 = tmpvar_23;
  tmpvar_8 = _Opacity;
  lightDir_2 = xlv_TEXCOORD1;
  lowp vec4 c_24;
  highp float nh_25;
  lowp float tmpvar_26;
  tmpvar_26 = max (0.0, lightDir_2.z);
  mediump float tmpvar_27;
  tmpvar_27 = max (0.0, normalize((lightDir_2 + normalize(xlv_TEXCOORD2))).z);
  nh_25 = tmpvar_27;
  mediump float arg1_28;
  arg1_28 = (_Shininess * 128.0);
  highp float tmpvar_29;
  tmpvar_29 = (pow (nh_25, arg1_28) * tmpvar_7);
  highp vec3 tmpvar_30;
  tmpvar_30 = ((((tmpvar_5 * _LightColor0.xyz) * tmpvar_26) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_29)) * 2.0);
  c_24.xyz = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (tmpvar_8 + ((_LightColor0.w * _SpecColor.w) * tmpvar_29));
  c_24.w = tmpvar_31;
  c_1.xyz = c_24.xyz;
  c_1.w = 0.0;
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 36 math
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_Scale]
Vector 20 [_MainTex_ST]
Vector 21 [_Emissive_ST]
"3.0-!!ARBvp1.0
PARAM c[22] = { { 1 },
		state.matrix.mvp,
		program.local[5..21] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[17];
MOV R1.w, c[0].x;
MOV R0.xyz, vertex.attrib[14];
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
MAD R2.xyz, R2, c[19].w, -vertex.position;
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[18];
MUL R1.xyz, R1, vertex.attrib[14].w;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R0.xyz, R3, c[19].w, -vertex.position;
DP4 R0.w, vertex.position, c[8];
DP3 result.texcoord[1].y, R0, R1;
DP3 result.texcoord[1].z, vertex.normal, R0;
DP3 result.texcoord[1].x, R0, vertex.attrib[14];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[2].y, R1, R2;
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, vertex.attrib[14], R2;
MOV result.color, vertex.color;
DP4 result.texcoord[3].w, R0, c[16];
DP4 result.texcoord[3].z, R0, c[15];
DP4 result.texcoord[3].y, R0, c[14];
DP4 result.texcoord[3].x, R0, c[13];
MAD result.texcoord[0].zw, vertex.texcoord[1].xyxy, c[21].xyxy, c[21];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 36 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 39 math
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
Vector 19 [_MainTex_ST]
Vector 20 [_Emissive_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_color0 o2
dcl_texcoord1 o3
dcl_texcoord2 o4
dcl_texcoord3 o5
def c21, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mov r0.w, c21.x
mov r0.xyz, c16
dp4 r1.z, r0, c10
dp4 r1.y, r0, c9
dp4 r1.x, r0, c8
mad r3.xyz, r1, c18.w, -v0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r1, v1.w
mov r0, c10
dp4 r4.z, c17, r0
mov r0, c9
dp4 r4.y, c17, r0
mov r1, c8
dp4 r4.x, c17, r1
mad r0.xyz, r4, c18.w, -v0
dp4 r0.w, v0, c7
dp3 o3.y, r0, r2
dp3 o3.z, v2, r0
dp3 o3.x, r0, v1
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 o4.y, r2, r3
dp3 o4.z, v2, r3
dp3 o4.x, v1, r3
mov o2, v5
dp4 o5.w, r0, c15
dp4 o5.z, r0, c14
dp4 o5.y, r0, c13
dp4 o5.x, r0, c12
mad o1.zw, v4.xyxy, c20.xyxy, c20
mad o1.xy, v3, c19, c19.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 33 math
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 176
Matrix 48 [_LightMatrix0]
Vector 144 [_MainTex_ST]
Vector 160 [_Emissive_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedgfaknjnllhngonbcpkfhefdpnooajpnfabaaaaaahiahaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaaknaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefcmaafaaaaeaaaabaahaabaaaa
fjaaaaaeegiocaaaaaaaaaaaalaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaad
pcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaagiaaaaacacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaa
dcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaakaaaaaa
kgiocaaaaaaaaaaaakaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaaafaaaaaa
diaaaaahhcaabaaaaaaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaak
hcaabaaaaaaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaa
aaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgbpbaaaabaaaaaa
diaaaaajhcaabaaaabaaaaaafgifcaaaacaaaaaaaaaaaaaaegiccaaaadaaaaaa
bbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaa
acaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
adaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaadaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaa
adaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaahcccabaaaadaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbccabaaaadaaaaaaegbcbaaa
abaaaaaaegacbaaaabaaaaaabaaaaaaheccabaaaadaaaaaaegbcbaaaacaaaaaa
egacbaaaabaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaabaaaaaaaeaaaaaa
egiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaa
baaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaa
abaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaa
abaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaadaaaaaa
bdaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaaadaaaaaa
beaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaabaaaaaahbccabaaaaeaaaaaaegbcbaaaabaaaaaa
egacbaaaabaaaaaabaaaaaaheccabaaaaeaaaaaaegbcbaaaacaaaaaaegacbaaa
abaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaa
anaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaamaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
aoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaai
pcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaaaaaaaaaaeaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaaafaaaaaakgakbaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaafaaaaaaegiocaaaaaaaaaaa
agaaaaaapgapbaaaaaaaaaaaegaobaaaabaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "SPOT" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec3 tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_6 = tmpvar_1.xyz;
  tmpvar_7 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_8;
  tmpvar_8[0].x = tmpvar_6.x;
  tmpvar_8[0].y = tmpvar_7.x;
  tmpvar_8[0].z = tmpvar_2.x;
  tmpvar_8[1].x = tmpvar_6.y;
  tmpvar_8[1].y = tmpvar_7.y;
  tmpvar_8[1].z = tmpvar_2.y;
  tmpvar_8[2].x = tmpvar_6.z;
  tmpvar_8[2].y = tmpvar_7.z;
  tmpvar_8[2].z = tmpvar_2.z;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_4 = tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_8 * (((_World2Object * tmpvar_10).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_5 = tmpvar_11;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = (_LightMatrix0 * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  highp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = xlv_COLOR0;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  mediump float rim_9;
  highp vec4 mask_10;
  highp vec4 color_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  color_11 = tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Emissive, xlv_TEXCOORD0.xy);
  mask_10 = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = (1.0 - clamp (normalize(tmpvar_3).z, 0.0, 1.0));
  rim_9 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((_RimColor.xyz * pow (rim_9, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_11.x;
  tmpvar_16.y = mask_10.x;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_11.y;
  tmpvar_17.y = mask_10.y;
  highp vec2 tmpvar_18;
  tmpvar_18.x = color_11.z;
  tmpvar_18.y = mask_10.z;
  highp vec2 tmpvar_19;
  tmpvar_19.x = color_11.w;
  tmpvar_19.y = mask_10.w;
  highp vec2 tmpvar_20;
  tmpvar_20 = mix (mix (tmpvar_16, tmpvar_17, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_18, tmpvar_19, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_21;
  tmpvar_21 = mix (tmpvar_20.xxx, mix (mix (vec3(clamp ((tmpvar_20.x + ((1.0 - tmpvar_20.y) * pow (tmpvar_20.x, 2.0))), 0.0, 1.0)), tmpvar_4.xyz, tmpvar_20.yyy), tmpvar_4.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_4.w, 0.0, 1.0)));
  tmpvar_5 = tmpvar_21;
  tmpvar_6 = tmpvar_15;
  highp float tmpvar_22;
  tmpvar_22 = tmpvar_20.x;
  tmpvar_7 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_6 * _Opacity);
  tmpvar_6 = tmpvar_23;
  tmpvar_8 = _Opacity;
  mediump vec3 tmpvar_24;
  tmpvar_24 = normalize(xlv_TEXCOORD1);
  lightDir_2 = tmpvar_24;
  highp vec2 P_25;
  P_25 = ((xlv_TEXCOORD3.xy / xlv_TEXCOORD3.w) + 0.5);
  highp float tmpvar_26;
  tmpvar_26 = dot (xlv_TEXCOORD3.xyz, xlv_TEXCOORD3.xyz);
  lowp float atten_27;
  atten_27 = ((float((xlv_TEXCOORD3.z > 0.0)) * texture2D (_LightTexture0, P_25).w) * texture2D (_LightTextureB0, vec2(tmpvar_26)).w);
  lowp vec4 c_28;
  highp float nh_29;
  lowp float tmpvar_30;
  tmpvar_30 = max (0.0, lightDir_2.z);
  mediump float tmpvar_31;
  tmpvar_31 = max (0.0, normalize((lightDir_2 + normalize(xlv_TEXCOORD2))).z);
  nh_29 = tmpvar_31;
  mediump float arg1_32;
  arg1_32 = (_Shininess * 128.0);
  highp float tmpvar_33;
  tmpvar_33 = (pow (nh_29, arg1_32) * tmpvar_7);
  highp vec3 tmpvar_34;
  tmpvar_34 = ((((tmpvar_5 * _LightColor0.xyz) * tmpvar_30) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_33)) * (atten_27 * 2.0));
  c_28.xyz = tmpvar_34;
  highp float tmpvar_35;
  tmpvar_35 = (tmpvar_8 + (((_LightColor0.w * _SpecColor.w) * tmpvar_33) * atten_27));
  c_28.w = tmpvar_35;
  c_1.xyz = c_28.xyz;
  c_1.w = 0.0;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "SPOT" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec3 tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_6 = tmpvar_1.xyz;
  tmpvar_7 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_8;
  tmpvar_8[0].x = tmpvar_6.x;
  tmpvar_8[0].y = tmpvar_7.x;
  tmpvar_8[0].z = tmpvar_2.x;
  tmpvar_8[1].x = tmpvar_6.y;
  tmpvar_8[1].y = tmpvar_7.y;
  tmpvar_8[1].z = tmpvar_2.y;
  tmpvar_8[2].x = tmpvar_6.z;
  tmpvar_8[2].y = tmpvar_7.z;
  tmpvar_8[2].z = tmpvar_2.z;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_4 = tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_8 * (((_World2Object * tmpvar_10).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_5 = tmpvar_11;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = (_LightMatrix0 * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  highp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = xlv_COLOR0;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  mediump float rim_9;
  highp vec4 mask_10;
  highp vec4 color_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  color_11 = tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Emissive, xlv_TEXCOORD0.xy);
  mask_10 = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = (1.0 - clamp (normalize(tmpvar_3).z, 0.0, 1.0));
  rim_9 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((_RimColor.xyz * pow (rim_9, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_11.x;
  tmpvar_16.y = mask_10.x;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_11.y;
  tmpvar_17.y = mask_10.y;
  highp vec2 tmpvar_18;
  tmpvar_18.x = color_11.z;
  tmpvar_18.y = mask_10.z;
  highp vec2 tmpvar_19;
  tmpvar_19.x = color_11.w;
  tmpvar_19.y = mask_10.w;
  highp vec2 tmpvar_20;
  tmpvar_20 = mix (mix (tmpvar_16, tmpvar_17, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_18, tmpvar_19, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_21;
  tmpvar_21 = mix (tmpvar_20.xxx, mix (mix (vec3(clamp ((tmpvar_20.x + ((1.0 - tmpvar_20.y) * pow (tmpvar_20.x, 2.0))), 0.0, 1.0)), tmpvar_4.xyz, tmpvar_20.yyy), tmpvar_4.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_4.w, 0.0, 1.0)));
  tmpvar_5 = tmpvar_21;
  tmpvar_6 = tmpvar_15;
  highp float tmpvar_22;
  tmpvar_22 = tmpvar_20.x;
  tmpvar_7 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_6 * _Opacity);
  tmpvar_6 = tmpvar_23;
  tmpvar_8 = _Opacity;
  mediump vec3 tmpvar_24;
  tmpvar_24 = normalize(xlv_TEXCOORD1);
  lightDir_2 = tmpvar_24;
  highp vec2 P_25;
  P_25 = ((xlv_TEXCOORD3.xy / xlv_TEXCOORD3.w) + 0.5);
  highp float tmpvar_26;
  tmpvar_26 = dot (xlv_TEXCOORD3.xyz, xlv_TEXCOORD3.xyz);
  lowp float atten_27;
  atten_27 = ((float((xlv_TEXCOORD3.z > 0.0)) * texture2D (_LightTexture0, P_25).w) * texture2D (_LightTextureB0, vec2(tmpvar_26)).w);
  lowp vec4 c_28;
  highp float nh_29;
  lowp float tmpvar_30;
  tmpvar_30 = max (0.0, lightDir_2.z);
  mediump float tmpvar_31;
  tmpvar_31 = max (0.0, normalize((lightDir_2 + normalize(xlv_TEXCOORD2))).z);
  nh_29 = tmpvar_31;
  mediump float arg1_32;
  arg1_32 = (_Shininess * 128.0);
  highp float tmpvar_33;
  tmpvar_33 = (pow (nh_29, arg1_32) * tmpvar_7);
  highp vec3 tmpvar_34;
  tmpvar_34 = ((((tmpvar_5 * _LightColor0.xyz) * tmpvar_30) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_33)) * (atten_27 * 2.0));
  c_28.xyz = tmpvar_34;
  highp float tmpvar_35;
  tmpvar_35 = (tmpvar_8 + (((_LightColor0.w * _SpecColor.w) * tmpvar_33) * atten_27));
  c_28.w = tmpvar_35;
  c_1.xyz = c_28.xyz;
  c_1.w = 0.0;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "SPOT" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesColor;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
in vec4 _glesMultiTexCoord1;
in vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
out highp vec4 xlv_TEXCOORD0;
out lowp vec4 xlv_COLOR0;
out mediump vec3 xlv_TEXCOORD1;
out mediump vec3 xlv_TEXCOORD2;
out highp vec4 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec3 tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_6 = tmpvar_1.xyz;
  tmpvar_7 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_8;
  tmpvar_8[0].x = tmpvar_6.x;
  tmpvar_8[0].y = tmpvar_7.x;
  tmpvar_8[0].z = tmpvar_2.x;
  tmpvar_8[1].x = tmpvar_6.y;
  tmpvar_8[1].y = tmpvar_7.y;
  tmpvar_8[1].z = tmpvar_2.y;
  tmpvar_8[2].x = tmpvar_6.z;
  tmpvar_8[2].y = tmpvar_7.z;
  tmpvar_8[2].z = tmpvar_2.z;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_4 = tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_8 * (((_World2Object * tmpvar_10).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_5 = tmpvar_11;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = (_LightMatrix0 * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
in highp vec4 xlv_TEXCOORD0;
in lowp vec4 xlv_COLOR0;
in mediump vec3 xlv_TEXCOORD1;
in mediump vec3 xlv_TEXCOORD2;
in highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  highp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = xlv_COLOR0;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  mediump float rim_9;
  highp vec4 mask_10;
  highp vec4 color_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture (_MainTex, xlv_TEXCOORD0.xy);
  color_11 = tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture (_Emissive, xlv_TEXCOORD0.xy);
  mask_10 = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = (1.0 - clamp (normalize(tmpvar_3).z, 0.0, 1.0));
  rim_9 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((_RimColor.xyz * pow (rim_9, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_11.x;
  tmpvar_16.y = mask_10.x;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_11.y;
  tmpvar_17.y = mask_10.y;
  highp vec2 tmpvar_18;
  tmpvar_18.x = color_11.z;
  tmpvar_18.y = mask_10.z;
  highp vec2 tmpvar_19;
  tmpvar_19.x = color_11.w;
  tmpvar_19.y = mask_10.w;
  highp vec2 tmpvar_20;
  tmpvar_20 = mix (mix (tmpvar_16, tmpvar_17, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_18, tmpvar_19, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_21;
  tmpvar_21 = mix (tmpvar_20.xxx, mix (mix (vec3(clamp ((tmpvar_20.x + ((1.0 - tmpvar_20.y) * pow (tmpvar_20.x, 2.0))), 0.0, 1.0)), tmpvar_4.xyz, tmpvar_20.yyy), tmpvar_4.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_4.w, 0.0, 1.0)));
  tmpvar_5 = tmpvar_21;
  tmpvar_6 = tmpvar_15;
  highp float tmpvar_22;
  tmpvar_22 = tmpvar_20.x;
  tmpvar_7 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_6 * _Opacity);
  tmpvar_6 = tmpvar_23;
  tmpvar_8 = _Opacity;
  mediump vec3 tmpvar_24;
  tmpvar_24 = normalize(xlv_TEXCOORD1);
  lightDir_2 = tmpvar_24;
  highp vec2 P_25;
  P_25 = ((xlv_TEXCOORD3.xy / xlv_TEXCOORD3.w) + 0.5);
  highp float tmpvar_26;
  tmpvar_26 = dot (xlv_TEXCOORD3.xyz, xlv_TEXCOORD3.xyz);
  lowp float atten_27;
  atten_27 = ((float((xlv_TEXCOORD3.z > 0.0)) * texture (_LightTexture0, P_25).w) * texture (_LightTextureB0, vec2(tmpvar_26)).w);
  lowp vec4 c_28;
  highp float nh_29;
  lowp float tmpvar_30;
  tmpvar_30 = max (0.0, lightDir_2.z);
  mediump float tmpvar_31;
  tmpvar_31 = max (0.0, normalize((lightDir_2 + normalize(xlv_TEXCOORD2))).z);
  nh_29 = tmpvar_31;
  mediump float arg1_32;
  arg1_32 = (_Shininess * 128.0);
  highp float tmpvar_33;
  tmpvar_33 = (pow (nh_29, arg1_32) * tmpvar_7);
  highp vec3 tmpvar_34;
  tmpvar_34 = ((((tmpvar_5 * _LightColor0.xyz) * tmpvar_30) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_33)) * (atten_27 * 2.0));
  c_28.xyz = tmpvar_34;
  highp float tmpvar_35;
  tmpvar_35 = (tmpvar_8 + (((_LightColor0.w * _SpecColor.w) * tmpvar_33) * atten_27));
  c_28.w = tmpvar_35;
  c_1.xyz = c_28.xyz;
  c_1.w = 0.0;
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 35 math
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_Scale]
Vector 20 [_MainTex_ST]
Vector 21 [_Emissive_ST]
"3.0-!!ARBvp1.0
PARAM c[22] = { { 1 },
		state.matrix.mvp,
		program.local[5..21] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[17];
MOV R1.w, c[0].x;
MOV R0.xyz, vertex.attrib[14];
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
MAD R2.xyz, R2, c[19].w, -vertex.position;
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[18];
MUL R1.xyz, R1, vertex.attrib[14].w;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R0.xyz, R3, c[19].w, -vertex.position;
DP3 result.texcoord[1].y, R0, R1;
DP3 result.texcoord[1].z, vertex.normal, R0;
DP3 result.texcoord[1].x, R0, vertex.attrib[14];
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[2].y, R1, R2;
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, vertex.attrib[14], R2;
MOV result.color, vertex.color;
DP4 result.texcoord[3].z, R0, c[15];
DP4 result.texcoord[3].y, R0, c[14];
DP4 result.texcoord[3].x, R0, c[13];
MAD result.texcoord[0].zw, vertex.texcoord[1].xyxy, c[21].xyxy, c[21];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 35 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 38 math
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
Vector 19 [_MainTex_ST]
Vector 20 [_Emissive_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_color0 o2
dcl_texcoord1 o3
dcl_texcoord2 o4
dcl_texcoord3 o5
def c21, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mov r0.w, c21.x
mov r0.xyz, c16
dp4 r1.z, r0, c10
dp4 r1.y, r0, c9
dp4 r1.x, r0, c8
mad r3.xyz, r1, c18.w, -v0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r1, v1.w
mov r0, c10
dp4 r4.z, c17, r0
mov r0, c9
dp4 r4.y, c17, r0
mov r1, c8
dp4 r4.x, c17, r1
mad r0.xyz, r4, c18.w, -v0
dp3 o3.y, r0, r2
dp3 o3.z, v2, r0
dp3 o3.x, r0, v1
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 o4.y, r2, r3
dp3 o4.z, v2, r3
dp3 o4.x, v1, r3
mov o2, v5
dp4 o5.z, r0, c14
dp4 o5.y, r0, c13
dp4 o5.x, r0, c12
mad o1.zw, v4.xyxy, c20.xyxy, c20
mad o1.xy, v3, c19, c19.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 33 math
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 176
Matrix 48 [_LightMatrix0]
Vector 144 [_MainTex_ST]
Vector 160 [_Emissive_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedjgoglphcjbppnfjonnindlcghecinaobabaaaaaahiahaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaaknaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefcmaafaaaaeaaaabaahaabaaaa
fjaaaaaeegiocaaaaaaaaaaaalaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaad
pcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaacacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaa
dcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaakaaaaaa
kgiocaaaaaaaaaaaakaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaaafaaaaaa
diaaaaahhcaabaaaaaaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaak
hcaabaaaaaaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaa
aaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgbpbaaaabaaaaaa
diaaaaajhcaabaaaabaaaaaafgifcaaaacaaaaaaaaaaaaaaegiccaaaadaaaaaa
bbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaa
acaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
adaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaadaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaa
adaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaahcccabaaaadaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbccabaaaadaaaaaaegbcbaaa
abaaaaaaegacbaaaabaaaaaabaaaaaaheccabaaaadaaaaaaegbcbaaaacaaaaaa
egacbaaaabaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaabaaaaaaaeaaaaaa
egiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaa
baaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaa
abaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaa
abaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaadaaaaaa
bdaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaaadaaaaaa
beaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaabaaaaaahbccabaaaaeaaaaaaegbcbaaaabaaaaaa
egacbaaaabaaaaaabaaaaaaheccabaaaaeaaaaaaegbcbaaaacaaaaaaegacbaaa
abaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaa
anaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaamaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
aoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaakgakbaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaaaaaaaaaa
agaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "POINT_COOKIE" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec3 tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_6 = tmpvar_1.xyz;
  tmpvar_7 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_8;
  tmpvar_8[0].x = tmpvar_6.x;
  tmpvar_8[0].y = tmpvar_7.x;
  tmpvar_8[0].z = tmpvar_2.x;
  tmpvar_8[1].x = tmpvar_6.y;
  tmpvar_8[1].y = tmpvar_7.y;
  tmpvar_8[1].z = tmpvar_2.y;
  tmpvar_8[2].x = tmpvar_6.z;
  tmpvar_8[2].y = tmpvar_7.z;
  tmpvar_8[2].z = tmpvar_2.z;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_4 = tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_8 * (((_World2Object * tmpvar_10).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_5 = tmpvar_11;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform lowp samplerCube _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  highp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = xlv_COLOR0;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  mediump float rim_9;
  highp vec4 mask_10;
  highp vec4 color_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  color_11 = tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Emissive, xlv_TEXCOORD0.xy);
  mask_10 = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = (1.0 - clamp (normalize(tmpvar_3).z, 0.0, 1.0));
  rim_9 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((_RimColor.xyz * pow (rim_9, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_11.x;
  tmpvar_16.y = mask_10.x;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_11.y;
  tmpvar_17.y = mask_10.y;
  highp vec2 tmpvar_18;
  tmpvar_18.x = color_11.z;
  tmpvar_18.y = mask_10.z;
  highp vec2 tmpvar_19;
  tmpvar_19.x = color_11.w;
  tmpvar_19.y = mask_10.w;
  highp vec2 tmpvar_20;
  tmpvar_20 = mix (mix (tmpvar_16, tmpvar_17, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_18, tmpvar_19, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_21;
  tmpvar_21 = mix (tmpvar_20.xxx, mix (mix (vec3(clamp ((tmpvar_20.x + ((1.0 - tmpvar_20.y) * pow (tmpvar_20.x, 2.0))), 0.0, 1.0)), tmpvar_4.xyz, tmpvar_20.yyy), tmpvar_4.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_4.w, 0.0, 1.0)));
  tmpvar_5 = tmpvar_21;
  tmpvar_6 = tmpvar_15;
  highp float tmpvar_22;
  tmpvar_22 = tmpvar_20.x;
  tmpvar_7 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_6 * _Opacity);
  tmpvar_6 = tmpvar_23;
  tmpvar_8 = _Opacity;
  mediump vec3 tmpvar_24;
  tmpvar_24 = normalize(xlv_TEXCOORD1);
  lightDir_2 = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = dot (xlv_TEXCOORD3, xlv_TEXCOORD3);
  lowp float atten_26;
  atten_26 = (texture2D (_LightTextureB0, vec2(tmpvar_25)).w * textureCube (_LightTexture0, xlv_TEXCOORD3).w);
  lowp vec4 c_27;
  highp float nh_28;
  lowp float tmpvar_29;
  tmpvar_29 = max (0.0, lightDir_2.z);
  mediump float tmpvar_30;
  tmpvar_30 = max (0.0, normalize((lightDir_2 + normalize(xlv_TEXCOORD2))).z);
  nh_28 = tmpvar_30;
  mediump float arg1_31;
  arg1_31 = (_Shininess * 128.0);
  highp float tmpvar_32;
  tmpvar_32 = (pow (nh_28, arg1_31) * tmpvar_7);
  highp vec3 tmpvar_33;
  tmpvar_33 = ((((tmpvar_5 * _LightColor0.xyz) * tmpvar_29) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_32)) * (atten_26 * 2.0));
  c_27.xyz = tmpvar_33;
  highp float tmpvar_34;
  tmpvar_34 = (tmpvar_8 + (((_LightColor0.w * _SpecColor.w) * tmpvar_32) * atten_26));
  c_27.w = tmpvar_34;
  c_1.xyz = c_27.xyz;
  c_1.w = 0.0;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "POINT_COOKIE" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec3 tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_6 = tmpvar_1.xyz;
  tmpvar_7 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_8;
  tmpvar_8[0].x = tmpvar_6.x;
  tmpvar_8[0].y = tmpvar_7.x;
  tmpvar_8[0].z = tmpvar_2.x;
  tmpvar_8[1].x = tmpvar_6.y;
  tmpvar_8[1].y = tmpvar_7.y;
  tmpvar_8[1].z = tmpvar_2.y;
  tmpvar_8[2].x = tmpvar_6.z;
  tmpvar_8[2].y = tmpvar_7.z;
  tmpvar_8[2].z = tmpvar_2.z;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_4 = tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_8 * (((_World2Object * tmpvar_10).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_5 = tmpvar_11;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform lowp samplerCube _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  highp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = xlv_COLOR0;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  mediump float rim_9;
  highp vec4 mask_10;
  highp vec4 color_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  color_11 = tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Emissive, xlv_TEXCOORD0.xy);
  mask_10 = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = (1.0 - clamp (normalize(tmpvar_3).z, 0.0, 1.0));
  rim_9 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((_RimColor.xyz * pow (rim_9, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_11.x;
  tmpvar_16.y = mask_10.x;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_11.y;
  tmpvar_17.y = mask_10.y;
  highp vec2 tmpvar_18;
  tmpvar_18.x = color_11.z;
  tmpvar_18.y = mask_10.z;
  highp vec2 tmpvar_19;
  tmpvar_19.x = color_11.w;
  tmpvar_19.y = mask_10.w;
  highp vec2 tmpvar_20;
  tmpvar_20 = mix (mix (tmpvar_16, tmpvar_17, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_18, tmpvar_19, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_21;
  tmpvar_21 = mix (tmpvar_20.xxx, mix (mix (vec3(clamp ((tmpvar_20.x + ((1.0 - tmpvar_20.y) * pow (tmpvar_20.x, 2.0))), 0.0, 1.0)), tmpvar_4.xyz, tmpvar_20.yyy), tmpvar_4.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_4.w, 0.0, 1.0)));
  tmpvar_5 = tmpvar_21;
  tmpvar_6 = tmpvar_15;
  highp float tmpvar_22;
  tmpvar_22 = tmpvar_20.x;
  tmpvar_7 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_6 * _Opacity);
  tmpvar_6 = tmpvar_23;
  tmpvar_8 = _Opacity;
  mediump vec3 tmpvar_24;
  tmpvar_24 = normalize(xlv_TEXCOORD1);
  lightDir_2 = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = dot (xlv_TEXCOORD3, xlv_TEXCOORD3);
  lowp float atten_26;
  atten_26 = (texture2D (_LightTextureB0, vec2(tmpvar_25)).w * textureCube (_LightTexture0, xlv_TEXCOORD3).w);
  lowp vec4 c_27;
  highp float nh_28;
  lowp float tmpvar_29;
  tmpvar_29 = max (0.0, lightDir_2.z);
  mediump float tmpvar_30;
  tmpvar_30 = max (0.0, normalize((lightDir_2 + normalize(xlv_TEXCOORD2))).z);
  nh_28 = tmpvar_30;
  mediump float arg1_31;
  arg1_31 = (_Shininess * 128.0);
  highp float tmpvar_32;
  tmpvar_32 = (pow (nh_28, arg1_31) * tmpvar_7);
  highp vec3 tmpvar_33;
  tmpvar_33 = ((((tmpvar_5 * _LightColor0.xyz) * tmpvar_29) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_32)) * (atten_26 * 2.0));
  c_27.xyz = tmpvar_33;
  highp float tmpvar_34;
  tmpvar_34 = (tmpvar_8 + (((_LightColor0.w * _SpecColor.w) * tmpvar_32) * atten_26));
  c_27.w = tmpvar_34;
  c_1.xyz = c_27.xyz;
  c_1.w = 0.0;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "POINT_COOKIE" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesColor;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
in vec4 _glesMultiTexCoord1;
in vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
out highp vec4 xlv_TEXCOORD0;
out lowp vec4 xlv_COLOR0;
out mediump vec3 xlv_TEXCOORD1;
out mediump vec3 xlv_TEXCOORD2;
out highp vec3 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec3 tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_6 = tmpvar_1.xyz;
  tmpvar_7 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_8;
  tmpvar_8[0].x = tmpvar_6.x;
  tmpvar_8[0].y = tmpvar_7.x;
  tmpvar_8[0].z = tmpvar_2.x;
  tmpvar_8[1].x = tmpvar_6.y;
  tmpvar_8[1].y = tmpvar_7.y;
  tmpvar_8[1].z = tmpvar_2.y;
  tmpvar_8[2].x = tmpvar_6.z;
  tmpvar_8[2].y = tmpvar_7.z;
  tmpvar_8[2].z = tmpvar_2.z;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_4 = tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_8 * (((_World2Object * tmpvar_10).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_5 = tmpvar_11;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform lowp samplerCube _LightTexture0;
uniform sampler2D _LightTextureB0;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
in highp vec4 xlv_TEXCOORD0;
in lowp vec4 xlv_COLOR0;
in mediump vec3 xlv_TEXCOORD1;
in mediump vec3 xlv_TEXCOORD2;
in highp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  highp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = xlv_COLOR0;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  mediump float rim_9;
  highp vec4 mask_10;
  highp vec4 color_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture (_MainTex, xlv_TEXCOORD0.xy);
  color_11 = tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture (_Emissive, xlv_TEXCOORD0.xy);
  mask_10 = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = (1.0 - clamp (normalize(tmpvar_3).z, 0.0, 1.0));
  rim_9 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((_RimColor.xyz * pow (rim_9, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_11.x;
  tmpvar_16.y = mask_10.x;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_11.y;
  tmpvar_17.y = mask_10.y;
  highp vec2 tmpvar_18;
  tmpvar_18.x = color_11.z;
  tmpvar_18.y = mask_10.z;
  highp vec2 tmpvar_19;
  tmpvar_19.x = color_11.w;
  tmpvar_19.y = mask_10.w;
  highp vec2 tmpvar_20;
  tmpvar_20 = mix (mix (tmpvar_16, tmpvar_17, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_18, tmpvar_19, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_21;
  tmpvar_21 = mix (tmpvar_20.xxx, mix (mix (vec3(clamp ((tmpvar_20.x + ((1.0 - tmpvar_20.y) * pow (tmpvar_20.x, 2.0))), 0.0, 1.0)), tmpvar_4.xyz, tmpvar_20.yyy), tmpvar_4.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_4.w, 0.0, 1.0)));
  tmpvar_5 = tmpvar_21;
  tmpvar_6 = tmpvar_15;
  highp float tmpvar_22;
  tmpvar_22 = tmpvar_20.x;
  tmpvar_7 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_6 * _Opacity);
  tmpvar_6 = tmpvar_23;
  tmpvar_8 = _Opacity;
  mediump vec3 tmpvar_24;
  tmpvar_24 = normalize(xlv_TEXCOORD1);
  lightDir_2 = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = dot (xlv_TEXCOORD3, xlv_TEXCOORD3);
  lowp float atten_26;
  atten_26 = (texture (_LightTextureB0, vec2(tmpvar_25)).w * texture (_LightTexture0, xlv_TEXCOORD3).w);
  lowp vec4 c_27;
  highp float nh_28;
  lowp float tmpvar_29;
  tmpvar_29 = max (0.0, lightDir_2.z);
  mediump float tmpvar_30;
  tmpvar_30 = max (0.0, normalize((lightDir_2 + normalize(xlv_TEXCOORD2))).z);
  nh_28 = tmpvar_30;
  mediump float arg1_31;
  arg1_31 = (_Shininess * 128.0);
  highp float tmpvar_32;
  tmpvar_32 = (pow (nh_28, arg1_31) * tmpvar_7);
  highp vec3 tmpvar_33;
  tmpvar_33 = ((((tmpvar_5 * _LightColor0.xyz) * tmpvar_29) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_32)) * (atten_26 * 2.0));
  c_27.xyz = tmpvar_33;
  highp float tmpvar_34;
  tmpvar_34 = (tmpvar_8 + (((_LightColor0.w * _SpecColor.w) * tmpvar_32) * atten_26));
  c_27.w = tmpvar_34;
  c_1.xyz = c_27.xyz;
  c_1.w = 0.0;
  _glesFragData[0] = c_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 33 math
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_Scale]
Vector 20 [_MainTex_ST]
Vector 21 [_Emissive_ST]
"3.0-!!ARBvp1.0
PARAM c[22] = { { 1 },
		state.matrix.mvp,
		program.local[5..21] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[17];
MOV R1.w, c[0].x;
MOV R0.xyz, vertex.attrib[14];
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
MAD R2.xyz, R2, c[19].w, -vertex.position;
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[18];
MUL R1.xyz, R1, vertex.attrib[14].w;
DP4 R3.z, R0, c[11];
DP4 R3.y, R0, c[10];
DP4 R3.x, R0, c[9];
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[1].y, R3, R1;
DP3 result.texcoord[2].y, R1, R2;
DP3 result.texcoord[1].z, vertex.normal, R3;
DP3 result.texcoord[1].x, R3, vertex.attrib[14];
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, vertex.attrib[14], R2;
MOV result.color, vertex.color;
DP4 result.texcoord[3].y, R0, c[14];
DP4 result.texcoord[3].x, R0, c[13];
MAD result.texcoord[0].zw, vertex.texcoord[1].xyxy, c[21].xyxy, c[21];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 33 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 36 math
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
Vector 19 [_MainTex_ST]
Vector 20 [_Emissive_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_color0 o2
dcl_texcoord1 o3
dcl_texcoord2 o4
dcl_texcoord3 o5
def c21, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mov r0.w, c21.x
mov r0.xyz, c16
dp4 r1.z, r0, c10
dp4 r1.y, r0, c9
dp4 r1.x, r0, c8
mad r3.xyz, r1, c18.w, -v0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r1, v1.w
mov r0, c10
dp4 r4.z, c17, r0
mov r0, c9
dp4 r4.y, c17, r0
mov r1, c8
dp4 r4.x, c17, r1
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 o3.y, r4, r2
dp3 o4.y, r2, r3
dp3 o3.z, v2, r4
dp3 o3.x, r4, v1
dp3 o4.z, v2, r3
dp3 o4.x, v1, r3
mov o2, v5
dp4 o5.y, r0, c13
dp4 o5.x, r0, c12
mad o1.zw, v4.xyxy, c20.xyxy, c20
mad o1.xy, v3, c19, c19.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 32 math
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 176
Matrix 48 [_LightMatrix0]
Vector 144 [_MainTex_ST]
Vector 160 [_Emissive_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedcnbmkgdnkjeieimphdpikihecadmncjmabaaaaaaemahaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaaknaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaadamaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefcjeafaaaaeaaaabaagfabaaaa
fjaaaaaeegiocaaaaaaaaaaaalaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaad
pcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagfaaaaaddccabaaaafaaaaaagiaaaaacacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaa
dcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaakaaaaaa
kgiocaaaaaaaaaaaakaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaaafaaaaaa
diaaaaahhcaabaaaaaaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaak
hcaabaaaaaaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaa
aaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgbpbaaaabaaaaaa
diaaaaajhcaabaaaabaaaaaafgifcaaaacaaaaaaaaaaaaaaegiccaaaadaaaaaa
bbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaa
acaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
adaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaadaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaa
egacbaaaabaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahbccabaaaadaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaa
baaaaaaheccabaaaadaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadiaaaaaj
hcaabaaaabaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaa
aeaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaa
bcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaa
abaaaaaaegacbaaaabaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaa
aaaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
baaaaaahbccabaaaaeaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaah
eccabaaaaeaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiacaaaaaaaaaaaaeaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaa
aaaaaaaaadaaaaaaagaabaaaaaaaaaaaegaabaaaabaaaaaadcaaaaakdcaabaaa
aaaaaaaaegiacaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegaabaaaaaaaaaaa
dcaaaaakdccabaaaafaaaaaaegiacaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaa
egaabaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL_COOKIE" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec3 tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_6 = tmpvar_1.xyz;
  tmpvar_7 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_8;
  tmpvar_8[0].x = tmpvar_6.x;
  tmpvar_8[0].y = tmpvar_7.x;
  tmpvar_8[0].z = tmpvar_2.x;
  tmpvar_8[1].x = tmpvar_6.y;
  tmpvar_8[1].y = tmpvar_7.y;
  tmpvar_8[1].z = tmpvar_2.y;
  tmpvar_8[2].x = tmpvar_6.z;
  tmpvar_8[2].y = tmpvar_7.z;
  tmpvar_8[2].z = tmpvar_2.z;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_4 = tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_8 * (((_World2Object * tmpvar_10).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_5 = tmpvar_11;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = (_LightMatrix0 * (_Object2World * _glesVertex)).xy;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _LightTexture0;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  highp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = xlv_COLOR0;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  mediump float rim_9;
  highp vec4 mask_10;
  highp vec4 color_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  color_11 = tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Emissive, xlv_TEXCOORD0.xy);
  mask_10 = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = (1.0 - clamp (normalize(tmpvar_3).z, 0.0, 1.0));
  rim_9 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((_RimColor.xyz * pow (rim_9, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_11.x;
  tmpvar_16.y = mask_10.x;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_11.y;
  tmpvar_17.y = mask_10.y;
  highp vec2 tmpvar_18;
  tmpvar_18.x = color_11.z;
  tmpvar_18.y = mask_10.z;
  highp vec2 tmpvar_19;
  tmpvar_19.x = color_11.w;
  tmpvar_19.y = mask_10.w;
  highp vec2 tmpvar_20;
  tmpvar_20 = mix (mix (tmpvar_16, tmpvar_17, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_18, tmpvar_19, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_21;
  tmpvar_21 = mix (tmpvar_20.xxx, mix (mix (vec3(clamp ((tmpvar_20.x + ((1.0 - tmpvar_20.y) * pow (tmpvar_20.x, 2.0))), 0.0, 1.0)), tmpvar_4.xyz, tmpvar_20.yyy), tmpvar_4.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_4.w, 0.0, 1.0)));
  tmpvar_5 = tmpvar_21;
  tmpvar_6 = tmpvar_15;
  highp float tmpvar_22;
  tmpvar_22 = tmpvar_20.x;
  tmpvar_7 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_6 * _Opacity);
  tmpvar_6 = tmpvar_23;
  tmpvar_8 = _Opacity;
  lightDir_2 = xlv_TEXCOORD1;
  lowp float atten_24;
  atten_24 = texture2D (_LightTexture0, xlv_TEXCOORD3).w;
  lowp vec4 c_25;
  highp float nh_26;
  lowp float tmpvar_27;
  tmpvar_27 = max (0.0, lightDir_2.z);
  mediump float tmpvar_28;
  tmpvar_28 = max (0.0, normalize((lightDir_2 + normalize(xlv_TEXCOORD2))).z);
  nh_26 = tmpvar_28;
  mediump float arg1_29;
  arg1_29 = (_Shininess * 128.0);
  highp float tmpvar_30;
  tmpvar_30 = (pow (nh_26, arg1_29) * tmpvar_7);
  highp vec3 tmpvar_31;
  tmpvar_31 = ((((tmpvar_5 * _LightColor0.xyz) * tmpvar_27) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_30)) * (atten_24 * 2.0));
  c_25.xyz = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = (tmpvar_8 + (((_LightColor0.w * _SpecColor.w) * tmpvar_30) * atten_24));
  c_25.w = tmpvar_32;
  c_1.xyz = c_25.xyz;
  c_1.w = 0.0;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL_COOKIE" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec3 tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_6 = tmpvar_1.xyz;
  tmpvar_7 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_8;
  tmpvar_8[0].x = tmpvar_6.x;
  tmpvar_8[0].y = tmpvar_7.x;
  tmpvar_8[0].z = tmpvar_2.x;
  tmpvar_8[1].x = tmpvar_6.y;
  tmpvar_8[1].y = tmpvar_7.y;
  tmpvar_8[1].z = tmpvar_2.y;
  tmpvar_8[2].x = tmpvar_6.z;
  tmpvar_8[2].y = tmpvar_7.z;
  tmpvar_8[2].z = tmpvar_2.z;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_4 = tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_8 * (((_World2Object * tmpvar_10).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_5 = tmpvar_11;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = (_LightMatrix0 * (_Object2World * _glesVertex)).xy;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _LightTexture0;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
varying highp vec4 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  highp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = xlv_COLOR0;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  mediump float rim_9;
  highp vec4 mask_10;
  highp vec4 color_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  color_11 = tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Emissive, xlv_TEXCOORD0.xy);
  mask_10 = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = (1.0 - clamp (normalize(tmpvar_3).z, 0.0, 1.0));
  rim_9 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((_RimColor.xyz * pow (rim_9, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_11.x;
  tmpvar_16.y = mask_10.x;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_11.y;
  tmpvar_17.y = mask_10.y;
  highp vec2 tmpvar_18;
  tmpvar_18.x = color_11.z;
  tmpvar_18.y = mask_10.z;
  highp vec2 tmpvar_19;
  tmpvar_19.x = color_11.w;
  tmpvar_19.y = mask_10.w;
  highp vec2 tmpvar_20;
  tmpvar_20 = mix (mix (tmpvar_16, tmpvar_17, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_18, tmpvar_19, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_21;
  tmpvar_21 = mix (tmpvar_20.xxx, mix (mix (vec3(clamp ((tmpvar_20.x + ((1.0 - tmpvar_20.y) * pow (tmpvar_20.x, 2.0))), 0.0, 1.0)), tmpvar_4.xyz, tmpvar_20.yyy), tmpvar_4.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_4.w, 0.0, 1.0)));
  tmpvar_5 = tmpvar_21;
  tmpvar_6 = tmpvar_15;
  highp float tmpvar_22;
  tmpvar_22 = tmpvar_20.x;
  tmpvar_7 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_6 * _Opacity);
  tmpvar_6 = tmpvar_23;
  tmpvar_8 = _Opacity;
  lightDir_2 = xlv_TEXCOORD1;
  lowp float atten_24;
  atten_24 = texture2D (_LightTexture0, xlv_TEXCOORD3).w;
  lowp vec4 c_25;
  highp float nh_26;
  lowp float tmpvar_27;
  tmpvar_27 = max (0.0, lightDir_2.z);
  mediump float tmpvar_28;
  tmpvar_28 = max (0.0, normalize((lightDir_2 + normalize(xlv_TEXCOORD2))).z);
  nh_26 = tmpvar_28;
  mediump float arg1_29;
  arg1_29 = (_Shininess * 128.0);
  highp float tmpvar_30;
  tmpvar_30 = (pow (nh_26, arg1_29) * tmpvar_7);
  highp vec3 tmpvar_31;
  tmpvar_31 = ((((tmpvar_5 * _LightColor0.xyz) * tmpvar_27) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_30)) * (atten_24 * 2.0));
  c_25.xyz = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = (tmpvar_8 + (((_LightColor0.w * _SpecColor.w) * tmpvar_30) * atten_24));
  c_25.w = tmpvar_32;
  c_1.xyz = c_25.xyz;
  c_1.w = 0.0;
  gl_FragData[0] = c_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL_COOKIE" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesColor;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
in vec4 _glesMultiTexCoord1;
in vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
out highp vec4 xlv_TEXCOORD0;
out lowp vec4 xlv_COLOR0;
out mediump vec3 xlv_TEXCOORD1;
out mediump vec3 xlv_TEXCOORD2;
out highp vec2 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec3 tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_6 = tmpvar_1.xyz;
  tmpvar_7 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_8;
  tmpvar_8[0].x = tmpvar_6.x;
  tmpvar_8[0].y = tmpvar_7.x;
  tmpvar_8[0].z = tmpvar_2.x;
  tmpvar_8[1].x = tmpvar_6.y;
  tmpvar_8[1].y = tmpvar_7.y;
  tmpvar_8[1].z = tmpvar_2.y;
  tmpvar_8[2].x = tmpvar_6.z;
  tmpvar_8[2].y = tmpvar_7.z;
  tmpvar_8[2].z = tmpvar_2.z;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_4 = tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_8 * (((_World2Object * tmpvar_10).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_5 = tmpvar_11;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
  xlv_TEXCOORD3 = (_LightMatrix0 * (_Object2World * _glesVertex)).xy;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _LightTexture0;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
in highp vec4 xlv_TEXCOORD0;
in lowp vec4 xlv_COLOR0;
in mediump vec3 xlv_TEXCOORD1;
in mediump vec3 xlv_TEXCOORD2;
in highp vec2 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  lowp vec3 lightDir_2;
  highp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = xlv_COLOR0;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  mediump float rim_9;
  highp vec4 mask_10;
  highp vec4 color_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture (_MainTex, xlv_TEXCOORD0.xy);
  color_11 = tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture (_Emissive, xlv_TEXCOORD0.xy);
  mask_10 = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = (1.0 - clamp (normalize(tmpvar_3).z, 0.0, 1.0));
  rim_9 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((_RimColor.xyz * pow (rim_9, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_11.x;
  tmpvar_16.y = mask_10.x;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_11.y;
  tmpvar_17.y = mask_10.y;
  highp vec2 tmpvar_18;
  tmpvar_18.x = color_11.z;
  tmpvar_18.y = mask_10.z;
  highp vec2 tmpvar_19;
  tmpvar_19.x = color_11.w;
  tmpvar_19.y = mask_10.w;
  highp vec2 tmpvar_20;
  tmpvar_20 = mix (mix (tmpvar_16, tmpvar_17, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_18, tmpvar_19, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_21;
  tmpvar_21 = mix (tmpvar_20.xxx, mix (mix (vec3(clamp ((tmpvar_20.x + ((1.0 - tmpvar_20.y) * pow (tmpvar_20.x, 2.0))), 0.0, 1.0)), tmpvar_4.xyz, tmpvar_20.yyy), tmpvar_4.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_4.w, 0.0, 1.0)));
  tmpvar_5 = tmpvar_21;
  tmpvar_6 = tmpvar_15;
  highp float tmpvar_22;
  tmpvar_22 = tmpvar_20.x;
  tmpvar_7 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_6 * _Opacity);
  tmpvar_6 = tmpvar_23;
  tmpvar_8 = _Opacity;
  lightDir_2 = xlv_TEXCOORD1;
  lowp float atten_24;
  atten_24 = texture (_LightTexture0, xlv_TEXCOORD3).w;
  lowp vec4 c_25;
  highp float nh_26;
  lowp float tmpvar_27;
  tmpvar_27 = max (0.0, lightDir_2.z);
  mediump float tmpvar_28;
  tmpvar_28 = max (0.0, normalize((lightDir_2 + normalize(xlv_TEXCOORD2))).z);
  nh_26 = tmpvar_28;
  mediump float arg1_29;
  arg1_29 = (_Shininess * 128.0);
  highp float tmpvar_30;
  tmpvar_30 = (pow (nh_26, arg1_29) * tmpvar_7);
  highp vec3 tmpvar_31;
  tmpvar_31 = ((((tmpvar_5 * _LightColor0.xyz) * tmpvar_27) + ((_LightColor0.xyz * _SpecColor.xyz) * tmpvar_30)) * (atten_24 * 2.0));
  c_25.xyz = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = (tmpvar_8 + (((_LightColor0.w * _SpecColor.w) * tmpvar_30) * atten_24));
  c_25.w = tmpvar_32;
  c_1.xyz = c_25.xyz;
  c_1.w = 0.0;
  _glesFragData[0] = c_1;
}



#endif"
}
}
Program "fp" {
SubProgram "opengl " {
// Stats: 52 math, 3 textures
Keywords { "POINT" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_Shininess]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
SetTexture 2 [_LightTexture0] 2D 2
"3.0-!!ARBfp1.0
PARAM c[6] = { program.local[0..3],
		{ 0, 128, 3, 1 },
		{ 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[0], texture[1], 2D;
MOV R2.x, R0.y;
MOV R2.y, R1;
MOV R0.y, R1.x;
ADD R1.xy, R2, -R0;
MUL_SAT R2.x, fragment.texcoord[0].z, c[4].z;
MAD R0.xy, R2.x, R1, R0;
MOV R1.x, R0.w;
MOV R0.w, R1.z;
MOV R1.y, R1.w;
MUL R1.z, fragment.texcoord[0], c[4];
ADD R1.xy, R1, -R0.zwzw;
ADD_SAT R1.z, R1, -c[5].x;
MAD R0.zw, R1.z, R1.xyxy, R0;
ADD R1.xy, R0.zwzw, -R0;
MAD_SAT R0.z, fragment.texcoord[0], c[4], -c[4].w;
MAD R0.xw, R0.z, R1.yyzx, R0.yyzx;
MUL R0.z, R0.w, R0.w;
ADD R0.y, -R0.x, c[4].w;
MAD_SAT R0.y, R0, R0.z, R0.w;
ADD R1.xyz, fragment.color.primary, -R0.y;
MAD R0.xyz, R0.x, R1, R0.y;
ADD R1.xyz, fragment.color.primary, -R0;
MAD R1.xyz, fragment.texcoord[0].w, R1, R0;
DP3 R1.w, fragment.texcoord[1], fragment.texcoord[1];
RSQ R0.x, R1.w;
ADD R1.xyz, -R0.w, R1;
MAD R1.xyz, fragment.color.primary.w, R1, R0.w;
DP3 R1.w, fragment.texcoord[2], fragment.texcoord[2];
MUL R0.xyz, R0.x, fragment.texcoord[1];
RSQ R1.w, R1.w;
MAD R2.xyz, R1.w, fragment.texcoord[2], R0;
DP3 R0.x, R2, R2;
RSQ R0.x, R0.x;
MUL R0.y, R0.x, R2.z;
MOV R0.x, c[4].y;
MUL R1.xyz, R1, c[0];
MAX R0.y, R0, c[4].x;
MUL R0.x, R0, c[2];
POW R1.w, R0.y, R0.x;
MUL R1.w, R1, R0;
MAX R0.z, R0, c[4].x;
MUL R0.xyz, R1, R0.z;
DP3 R0.w, fragment.texcoord[3], fragment.texcoord[3];
MOV R1.xyz, c[1];
TEX R0.w, R0.w, texture[2], 2D;
MUL R1.xyz, R1, c[0];
MUL R0.w, R0, c[5].x;
MAD R0.xyz, R1, R1.w, R0;
MUL result.color.xyz, R0, R0.w;
MOV result.color.w, c[4].x;
END
# 52 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 51 math, 3 textures
Keywords { "POINT" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_Shininess]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
SetTexture 2 [_LightTexture0] 2D 2
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c3, 0.00000000, 128.00000000, 3.00000000, -1.00000000
def c4, 3.00000000, -2.00000000, 1.00000000, 2.00000000
dcl_texcoord0 v0
dcl_color0 v1
dcl_texcoord1 v2.xyz
dcl_texcoord2 v3.xyz
dcl_texcoord3 v4.xyz
texld r0, v0, s0
texld r1, v0, s1
mov r2.x, r0.y
mov r2.y, r1
mov r0.y, r1.x
add r1.xy, r2, -r0
mul_sat r2.x, v0.z, c3.z
mad r0.xy, r2.x, r1, r0
mov r1.x, r0.w
mov r1.y, r1.w
mov r0.w, r1.z
add r1.zw, r1.xyxy, -r0
mad_sat r1.x, v0.z, c4, c4.y
mad r0.zw, r1.x, r1, r0
add r1.xy, r0.zwzw, -r0
mad_sat r0.z, v0, c3, c3.w
mad r2.xw, r0.z, r1.yyzx, r0.yyzx
mul r0.y, r2.w, r2.w
add r0.x, -r2, c4.z
mad_sat r0.x, r0, r0.y, r2.w
add r1.xyz, v1, -r0.x
mad r0.xyz, r2.x, r1, r0.x
add r1.xyz, v1, -r0
mad r0.xyz, v0.w, r1, r0
dp3_pp r0.w, v2, v2
rsq_pp r1.x, r0.w
dp3_pp r0.w, v3, v3
add r0.xyz, -r2.w, r0
mul_pp r2.xyz, r1.x, v2
rsq_pp r0.w, r0.w
mad_pp r1.xyw, r0.w, v3.xyzz, r2.xyzz
dp3_pp r0.w, r1.xyww, r1.xyww
mov_sat r1.x, v1.w
mad r1.xyz, r1.x, r0, r2.w
rsq_pp r0.x, r0.w
mul_pp r0.x, r0, r1.w
mov_pp r0.y, c2.x
mul_pp r2.x, c3.y, r0.y
max_pp r1.w, r0.x, c3.x
pow r0, r1.w, r2.x
max_pp r0.y, r2.z, c3.x
mul_pp r1.xyz, r1, c0
mul_pp r1.xyz, r1, r0.y
mul r0.y, r0.x, r2.w
dp3 r0.x, v4, v4
texld r0.x, r0.x, s2
mov_pp r2.xyz, c0
mul_pp r0.w, r0.x, c4
mul_pp r2.xyz, c1, r2
mad r0.xyz, r2, r0.y, r1
mul oC0.xyz, r0, r0.w
mov_pp oC0.w, c3.x
"
}
SubProgram "d3d11 " {
// Stats: 38 math, 3 textures
Keywords { "POINT" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_Emissive] 2D 2
SetTexture 2 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 176
Vector 16 [_LightColor0]
Vector 32 [_SpecColor]
Float 112 [_Shininess]
BindCB  "$Globals" 0
"ps_4_0
eefiecedkdgockdbnhcjlajojcodcknhfjgmdmlnabaaaaaageahaaaaadaaaaaa
cmaaaaaaoiaaaaaabmabaaaaejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
eaagaaaaeaaaaaaajaabaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaad
pcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaa
diaaaaahbcaabaaaaaaaaaaackbabaaaabaaaaaaabeaaaaaaaaaeaeadgcaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadgaaaaafkcaabaaaacaaaaaa
fganbaaaabaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaacaaaaaadgaaaaaffcaabaaaacaaaaaafgahbaaaadaaaaaa
dgaaaaafkcaabaaaabaaaaaaagaibaaaadaaaaaaaaaaaaaipcaabaaaacaaaaaa
bgalbaiaebaaaaaaabaaaaaaegaobaaaacaaaaaadcaaaaajdcaabaaaaaaaaaaa
agaabaaaaaaaaaaaegaabaaaacaaaaaabgafbaaaabaaaaaadccaaaapmcaabaaa
aaaaaaaakgbkbaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaeaeaaaaaeaea
aceaaaaaaaaaaaaaaaaaaaaaaaaaaamaaaaaialpdcaaaaajdcaabaaaabaaaaaa
kgakbaaaaaaaaaaaogakbaaaacaaaaaalgapbaaaabaaaaaaaaaaaaaidcaabaaa
abaaaaaaegaabaiaebaaaaaaaaaaaaaaegaabaaaabaaaaaadcaaaaajdcaabaaa
aaaaaaaapgapbaaaaaaaaaaaegaabaaaabaaaaaaegaabaaaaaaaaaaaaaaaaaai
ecaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaah
icaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadccaaaajecaabaaa
aaaaaaaackaabaaaaaaaaaaadkaabaaaaaaaaaaabkaabaaaaaaaaaaaaaaaaaai
hcaabaaaabaaaaaakgakbaiaebaaaaaaaaaaaaaaegbcbaaaacaaaaaadcaaaaaj
ncaabaaaaaaaaaaaagaabaaaaaaaaaaaagajbaaaabaaaaaakgakbaaaaaaaaaaa
aaaaaaaihcaabaaaabaaaaaaigadbaiaebaaaaaaaaaaaaaaegbcbaaaacaaaaaa
dcaaaaajncaabaaaaaaaaaaapgbpbaaaabaaaaaaagajbaaaabaaaaaaagaobaaa
aaaaaaaaaaaaaaaincaabaaaaaaaaaaafgafbaiaebaaaaaaaaaaaaaaagaobaaa
aaaaaaaadgcaaaafbcaabaaaabaaaaaadkbabaaaacaaaaaadcaaaaajncaabaaa
aaaaaaaaagaabaaaabaaaaaaagaobaaaaaaaaaaafgafbaaaaaaaaaaadiaaaaai
ncaabaaaaaaaaaaaagaobaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaabaaaaaah
bcaabaaaabaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaafbcaabaaa
abaaaaaaakaabaaaabaaaaaabaaaaaahccaabaaaabaaaaaaegbcbaaaadaaaaaa
egbcbaaaadaaaaaaeeaaaaafccaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaah
ocaabaaaabaaaaaafgafbaaaabaaaaaaagbjbaaaadaaaaaadcaaaaajhcaabaaa
abaaaaaaegbcbaaaaeaaaaaaagaabaaaabaaaaaajgahbaaaabaaaaaabaaaaaah
bcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaafbcaabaaa
abaaaaaaakaabaaaabaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaa
ckaabaaaabaaaaaadeaaaaakjcaabaaaabaaaaaaagambaaaabaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaacpaaaaafbcaabaaaabaaaaaaakaabaaa
abaaaaaadiaaaaaiccaabaaaabaaaaaaakiacaaaaaaaaaaaahaaaaaaabeaaaaa
aaaaaaeddiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaabkaabaaaabaaaaaa
bjaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahccaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakaabaaaabaaaaaadiaaaaajhcaabaaaabaaaaaaegiccaaa
aaaaaaaaabaaaaaaegiccaaaaaaaaaaaacaaaaaadiaaaaahhcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaaaaaaaaaaigadbaaa
aaaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaabaaaaaahicaabaaaaaaaaaaa
egbcbaaaafaaaaaaegbcbaaaafaaaaaaefaaaaajpcaabaaaabaaaaaapgapbaaa
aaaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaa
akaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaa
doaaaaab"
}
SubProgram "gles " {
Keywords { "POINT" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "POINT" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "POINT" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 47 math, 2 textures
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_Shininess]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
"3.0-!!ARBfp1.0
PARAM c[6] = { program.local[0..3],
		{ 0, 128, 3, 1 },
		{ 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[0], texture[1], 2D;
MOV R2.x, R0.y;
MOV R2.y, R1;
MOV R0.y, R1.x;
ADD R1.xy, R2, -R0;
MUL_SAT R2.x, fragment.texcoord[0].z, c[4].z;
MAD R0.xy, R2.x, R1, R0;
MOV R1.x, R0.w;
MOV R0.w, R1.z;
MOV R1.y, R1.w;
MUL R1.z, fragment.texcoord[0], c[4];
ADD R1.xy, R1, -R0.zwzw;
ADD_SAT R1.z, R1, -c[5].x;
MAD R0.zw, R1.z, R1.xyxy, R0;
ADD R1.xy, R0.zwzw, -R0;
MAD_SAT R0.z, fragment.texcoord[0], c[4], -c[4].w;
MAD R2.xy, R0.z, R1, R0;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
MUL R0.y, R2.x, R2.x;
ADD R0.x, -R2.y, c[4].w;
MAD_SAT R0.x, R0, R0.y, R2;
ADD R1.xyz, fragment.color.primary, -R0.x;
MAD R0.xyz, R2.y, R1, R0.x;
ADD R1.xyz, fragment.color.primary, -R0;
MAD R0.xyz, fragment.texcoord[0].w, R1, R0;
ADD R0.xyz, -R2.x, R0;
MAD R0.xyz, fragment.color.primary.w, R0, R2.x;
RSQ R0.w, R0.w;
MOV R1.xyz, fragment.texcoord[1];
MAD R1.xyz, R0.w, fragment.texcoord[2], R1;
DP3 R0.w, R1, R1;
RSQ R1.x, R0.w;
MOV R0.w, c[4].y;
MUL R1.y, R0.w, c[2].x;
MUL R1.x, R1, R1.z;
MAX R0.w, R1.x, c[4].x;
POW R0.w, R0.w, R1.y;
MOV R1.xyz, c[1];
MUL R0.xyz, R0, c[0];
MAX R1.w, fragment.texcoord[1].z, c[4].x;
MUL R0.xyz, R0, R1.w;
MUL R0.w, R0, R2.x;
MUL R1.xyz, R1, c[0];
MAD R0.xyz, R1, R0.w, R0;
MUL result.color.xyz, R0, c[5].x;
MOV result.color.w, c[4].x;
END
# 47 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 48 math, 2 textures
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_Shininess]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
"ps_3_0
dcl_2d s0
dcl_2d s1
def c3, 0.00000000, 128.00000000, 3.00000000, -1.00000000
def c4, 3.00000000, -2.00000000, 1.00000000, 2.00000000
dcl_texcoord0 v0
dcl_color0 v1
dcl_texcoord1 v2.xyz
dcl_texcoord2 v3.xyz
texld r0, v0, s0
texld r1, v0, s1
mov r2.x, r0.y
mov r2.y, r1
mov r0.y, r1.x
add r1.xy, r2, -r0
mul_sat r2.x, v0.z, c3.z
mad r0.xy, r2.x, r1, r0
mov r1.x, r0.w
mov r1.y, r1.w
mov r0.w, r1.z
add r1.zw, r1.xyxy, -r0
mad_sat r1.x, v0.z, c4, c4.y
mad r0.zw, r1.x, r1, r0
add r1.xy, r0.zwzw, -r0
mad_sat r0.z, v0, c3, c3.w
mad r2.xy, r0.z, r1, r0
dp3_pp r0.w, v3, v3
mul r0.y, r2.x, r2.x
add r0.x, -r2.y, c4.z
mad_sat r0.x, r0, r0.y, r2
add r1.xyz, v1, -r0.x
mad r0.xyz, r2.y, r1, r0.x
add r1.xyz, v1, -r0
mad r0.xyz, v0.w, r1, r0
add r1.xyz, -r2.x, r0
rsq_pp r0.w, r0.w
mov_pp r0.xyz, v2
mad_pp r0.xyz, r0.w, v3, r0
dp3_pp r0.x, r0, r0
mov_sat r0.w, v1
mad r1.xyz, r0.w, r1, r2.x
mov_pp r0.y, c2.x
rsq_pp r0.x, r0.x
mul_pp r0.x, r0, r0.z
mul_pp r1.xyz, r1, c0
mul_pp r2.y, c3, r0
max_pp r1.w, r0.x, c3.x
pow r0, r1.w, r2.y
max_pp r0.y, v2.z, c3.x
mov r0.w, r0.x
mul_pp r1.xyz, r1, r0.y
mov_pp r0.xyz, c0
mul r0.w, r0, r2.x
mul_pp r0.xyz, c1, r0
mad r0.xyz, r0, r0.w, r1
mul oC0.xyz, r0, c4.w
mov_pp oC0.w, c3.x
"
}
SubProgram "d3d11 " {
// Stats: 34 math, 2 textures
Keywords { "DIRECTIONAL" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
ConstBuffer "$Globals" 112
Vector 16 [_LightColor0]
Vector 32 [_SpecColor]
Float 48 [_Shininess]
BindCB  "$Globals" 0
"ps_4_0
eefiecedeenlcnbkiclkbckohjddmnjjefmnaccfabaaaaaaimagaaaaadaaaaaa
cmaaaaaanaaaaaaaaeabaaaaejfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaimaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklklfdeieefciaafaaaaeaaaaaaagaabaaaafjaaaaaeegiocaaaaaaaaaaa
aeaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaad
pcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaa
gcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaa
diaaaaahbcaabaaaaaaaaaaackbabaaaabaaaaaaabeaaaaaaaaaeaeadgcaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadgaaaaafkcaabaaaacaaaaaa
fganbaaaabaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaabaaaaaadgaaaaaffcaabaaaacaaaaaafgahbaaaadaaaaaa
dgaaaaafkcaabaaaabaaaaaaagaibaaaadaaaaaaaaaaaaaipcaabaaaacaaaaaa
bgalbaiaebaaaaaaabaaaaaaegaobaaaacaaaaaadcaaaaajdcaabaaaaaaaaaaa
agaabaaaaaaaaaaaegaabaaaacaaaaaabgafbaaaabaaaaaadccaaaapmcaabaaa
aaaaaaaakgbkbaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaeaeaaaaaeaea
aceaaaaaaaaaaaaaaaaaaaaaaaaaaamaaaaaialpdcaaaaajdcaabaaaabaaaaaa
kgakbaaaaaaaaaaaogakbaaaacaaaaaalgapbaaaabaaaaaaaaaaaaaidcaabaaa
abaaaaaaegaabaiaebaaaaaaaaaaaaaaegaabaaaabaaaaaadcaaaaajdcaabaaa
aaaaaaaapgapbaaaaaaaaaaaegaabaaaabaaaaaaegaabaaaaaaaaaaaaaaaaaai
ecaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaah
icaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadccaaaajecaabaaa
aaaaaaaackaabaaaaaaaaaaadkaabaaaaaaaaaaabkaabaaaaaaaaaaaaaaaaaai
hcaabaaaabaaaaaakgakbaiaebaaaaaaaaaaaaaaegbcbaaaacaaaaaadcaaaaaj
ncaabaaaaaaaaaaaagaabaaaaaaaaaaaagajbaaaabaaaaaakgakbaaaaaaaaaaa
aaaaaaaihcaabaaaabaaaaaaigadbaiaebaaaaaaaaaaaaaaegbcbaaaacaaaaaa
dcaaaaajncaabaaaaaaaaaaapgbpbaaaabaaaaaaagajbaaaabaaaaaaagaobaaa
aaaaaaaaaaaaaaaincaabaaaaaaaaaaafgafbaiaebaaaaaaaaaaaaaaagaobaaa
aaaaaaaadgcaaaafbcaabaaaabaaaaaadkbabaaaacaaaaaadcaaaaajncaabaaa
aaaaaaaaagaabaaaabaaaaaaagaobaaaaaaaaaaafgafbaaaaaaaaaaadiaaaaai
ncaabaaaaaaaaaaaagaobaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaabaaaaaah
bcaabaaaabaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaafbcaabaaa
abaaaaaaakaabaaaabaaaaaadcaaaaajhcaabaaaabaaaaaaegbcbaaaaeaaaaaa
agaabaaaabaaaaaaegbcbaaaadaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaa
abaaaaaaegacbaaaabaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaa
diaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaackaabaaaabaaaaaadeaaaaah
bcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaacpaaaaafbcaabaaa
abaaaaaaakaabaaaabaaaaaadiaaaaaiccaabaaaabaaaaaaakiacaaaaaaaaaaa
adaaaaaaabeaaaaaaaaaaaeddiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaa
bkaabaaaabaaaaaabjaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaabaaaaaadiaaaaajhcaabaaa
abaaaaaaegiccaaaaaaaaaaaabaaaaaaegiccaaaaaaaaaaaacaaaaaadiaaaaah
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegacbaaaabaaaaaadeaaaaahccaabaaa
aaaaaaaackbabaaaadaaaaaaabeaaaaaaaaaaaaadcaaaaajhcaabaaaaaaaaaaa
igadbaaaaaaaaaaafgafbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaahhccabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 58 math, 4 textures
Keywords { "SPOT" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_Shininess]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
SetTexture 2 [_LightTexture0] 2D 2
SetTexture 3 [_LightTextureB0] 2D 3
"3.0-!!ARBfp1.0
PARAM c[6] = { program.local[0..3],
		{ 0, 128, 3, 1 },
		{ 2, 0.5 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[0], texture[1], 2D;
MOV R2.x, R0.y;
MOV R2.y, R1;
MOV R0.y, R1.x;
ADD R1.xy, R2, -R0;
MUL_SAT R2.x, fragment.texcoord[0].z, c[4].z;
MAD R0.xy, R2.x, R1, R0;
MOV R1.x, R0.w;
MOV R0.w, R1.z;
MOV R1.y, R1.w;
MUL R1.z, fragment.texcoord[0], c[4];
ADD R1.xy, R1, -R0.zwzw;
ADD_SAT R1.z, R1, -c[5].x;
MAD R0.zw, R1.z, R1.xyxy, R0;
ADD R1.xy, R0.zwzw, -R0;
MAD_SAT R0.z, fragment.texcoord[0], c[4], -c[4].w;
MAD R0.xw, R0.z, R1.yyzx, R0.yyzx;
MUL R0.z, R0.w, R0.w;
ADD R0.y, -R0.x, c[4].w;
MAD_SAT R0.y, R0, R0.z, R0.w;
ADD R1.xyz, fragment.color.primary, -R0.y;
MAD R0.xyz, R0.x, R1, R0.y;
ADD R1.xyz, fragment.color.primary, -R0;
MAD R1.xyz, fragment.texcoord[0].w, R1, R0;
DP3 R1.w, fragment.texcoord[1], fragment.texcoord[1];
RSQ R0.x, R1.w;
ADD R1.xyz, -R0.w, R1;
MAD R1.xyz, fragment.color.primary.w, R1, R0.w;
DP3 R1.w, fragment.texcoord[2], fragment.texcoord[2];
MUL R0.xyz, R0.x, fragment.texcoord[1];
RSQ R1.w, R1.w;
MAD R2.xyz, R1.w, fragment.texcoord[2], R0;
DP3 R0.x, R2, R2;
RSQ R0.x, R0.x;
MUL R0.y, R0.x, R2.z;
MOV R0.x, c[4].y;
DP3 R1.w, fragment.texcoord[3], fragment.texcoord[3];
MAX R0.y, R0, c[4].x;
MUL R0.x, R0, c[2];
POW R0.x, R0.y, R0.x;
MUL R2.z, R0.x, R0.w;
RCP R0.w, fragment.texcoord[3].w;
MAD R2.xy, fragment.texcoord[3], R0.w, c[5].y;
TEX R0.w, R2, texture[2], 2D;
SLT R2.x, c[4], fragment.texcoord[3].z;
MAX R0.z, R0, c[4].x;
MUL R1.xyz, R1, c[0];
MUL R1.xyz, R1, R0.z;
MOV R0.xyz, c[1];
MUL R0.xyz, R0, c[0];
TEX R1.w, R1.w, texture[3], 2D;
MUL R0.w, R2.x, R0;
MUL R0.w, R0, R1;
MUL R0.w, R0, c[5].x;
MAD R0.xyz, R0, R2.z, R1;
MUL result.color.xyz, R0, R0.w;
MOV result.color.w, c[4].x;
END
# 58 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 56 math, 4 textures
Keywords { "SPOT" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_Shininess]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
SetTexture 2 [_LightTexture0] 2D 2
SetTexture 3 [_LightTextureB0] 2D 3
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c3, 0.00000000, 128.00000000, 3.00000000, -1.00000000
def c4, 3.00000000, -2.00000000, 1.00000000, 0.00000000
def c5, 0.50000000, 2.00000000, 0, 0
dcl_texcoord0 v0
dcl_color0 v1
dcl_texcoord1 v2.xyz
dcl_texcoord2 v3.xyz
dcl_texcoord3 v4
texld r0, v0, s0
texld r1, v0, s1
mov r2.x, r0.y
mov r2.y, r1
mov r0.y, r1.x
add r1.xy, r2, -r0
mul_sat r2.x, v0.z, c3.z
mad r0.xy, r2.x, r1, r0
mov r1.x, r0.w
mov r1.y, r1.w
mov r0.w, r1.z
add r1.zw, r1.xyxy, -r0
mad_sat r1.x, v0.z, c4, c4.y
mad r0.zw, r1.x, r1, r0
add r1.xy, r0.zwzw, -r0
mad_sat r0.z, v0, c3, c3.w
mad r1.xw, r0.z, r1.yyzx, r0.yyzx
mul r0.y, r1.w, r1.w
add r0.x, -r1, c4.z
mad_sat r0.x, r0, r0.y, r1.w
add r2.xyz, v1, -r0.x
mad r0.xyz, r1.x, r2, r0.x
add r1.xyz, v1, -r0
mad r0.xyz, v0.w, r1, r0
dp3_pp r0.w, v2, v2
rsq_pp r1.x, r0.w
mul_pp r2.xyz, r1.x, v2
dp3_pp r0.w, v3, v3
rsq_pp r0.w, r0.w
mad_pp r2.xyw, r0.w, v3.xyzz, r2.xyzz
add r0.xyz, -r1.w, r0
mov_sat r1.x, v1.w
mad r1.xyz, r1.x, r0, r1.w
dp3_pp r0.w, r2.xyww, r2.xyww
rsq_pp r0.x, r0.w
mov_pp r0.y, c2.x
mul_pp r0.x, r0, r2.w
mul_pp r2.y, c3, r0
max_pp r2.x, r0, c3
pow r0, r2.x, r2.y
max_pp r0.y, r2.z, c3.x
mul_pp r1.xyz, r1, c0
mul_pp r2.xyz, r1, r0.y
mul r0.y, r0.x, r1.w
rcp r0.x, v4.w
mad r3.xy, v4, r0.x, c5.x
mov_pp r1.xyz, c0
dp3 r0.x, v4, v4
texld r0.w, r3, s2
cmp r0.z, -v4, c4.w, c4
mul_pp r0.z, r0, r0.w
texld r0.x, r0.x, s3
mul_pp r0.x, r0.z, r0
mul_pp r0.w, r0.x, c5.y
mul_pp r1.xyz, c1, r1
mad r0.xyz, r1, r0.y, r2
mul oC0.xyz, r0, r0.w
mov_pp oC0.w, c3.x
"
}
SubProgram "d3d11 " {
// Stats: 43 math, 4 textures
Keywords { "SPOT" }
SetTexture 0 [_MainTex] 2D 2
SetTexture 1 [_Emissive] 2D 3
SetTexture 2 [_LightTexture0] 2D 0
SetTexture 3 [_LightTextureB0] 2D 1
ConstBuffer "$Globals" 176
Vector 16 [_LightColor0]
Vector 32 [_SpecColor]
Float 112 [_Shininess]
BindCB  "$Globals" 0
"ps_4_0
eefiecedbglmnmkekfdhmoggafgciphlldnhkdoaabaaaaaadmaiaaaaadaaaaaa
cmaaaaaaoiaaaaaabmabaaaaejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
biahaaaaeaaaaaaamgabaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fkaaaaadaagabaaaadaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaae
aahabaaaadaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaa
acaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaad
pcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaadiaaaaah
bcaabaaaaaaaaaaackbabaaaabaaaaaaabeaaaaaaaaaeaeadgcaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaacaaaaaadgaaaaafkcaabaaaacaaaaaafganbaaa
abaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaa
aagabaaaadaaaaaadgaaaaaffcaabaaaacaaaaaafgahbaaaadaaaaaadgaaaaaf
kcaabaaaabaaaaaaagaibaaaadaaaaaaaaaaaaaipcaabaaaacaaaaaabgalbaia
ebaaaaaaabaaaaaaegaobaaaacaaaaaadcaaaaajdcaabaaaaaaaaaaaagaabaaa
aaaaaaaaegaabaaaacaaaaaabgafbaaaabaaaaaadccaaaapmcaabaaaaaaaaaaa
kgbkbaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaeaeaaaaaeaeaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaamaaaaaialpdcaaaaajdcaabaaaabaaaaaakgakbaaa
aaaaaaaaogakbaaaacaaaaaalgapbaaaabaaaaaaaaaaaaaidcaabaaaabaaaaaa
egaabaiaebaaaaaaaaaaaaaaegaabaaaabaaaaaadcaaaaajdcaabaaaaaaaaaaa
pgapbaaaaaaaaaaaegaabaaaabaaaaaaegaabaaaaaaaaaaaaaaaaaaiecaabaaa
aaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaahicaabaaa
aaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadccaaaajecaabaaaaaaaaaaa
ckaabaaaaaaaaaaadkaabaaaaaaaaaaabkaabaaaaaaaaaaaaaaaaaaihcaabaaa
abaaaaaakgakbaiaebaaaaaaaaaaaaaaegbcbaaaacaaaaaadcaaaaajncaabaaa
aaaaaaaaagaabaaaaaaaaaaaagajbaaaabaaaaaakgakbaaaaaaaaaaaaaaaaaai
hcaabaaaabaaaaaaigadbaiaebaaaaaaaaaaaaaaegbcbaaaacaaaaaadcaaaaaj
ncaabaaaaaaaaaaapgbpbaaaabaaaaaaagajbaaaabaaaaaaagaobaaaaaaaaaaa
aaaaaaaincaabaaaaaaaaaaafgafbaiaebaaaaaaaaaaaaaaagaobaaaaaaaaaaa
dgcaaaafbcaabaaaabaaaaaadkbabaaaacaaaaaadcaaaaajncaabaaaaaaaaaaa
agaabaaaabaaaaaaagaobaaaaaaaaaaafgafbaaaaaaaaaaadiaaaaaincaabaaa
aaaaaaaaagaobaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaabaaaaaahbcaabaaa
abaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaafbcaabaaaabaaaaaa
akaabaaaabaaaaaabaaaaaahccaabaaaabaaaaaaegbcbaaaadaaaaaaegbcbaaa
adaaaaaaeeaaaaafccaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaahocaabaaa
abaaaaaafgafbaaaabaaaaaaagbjbaaaadaaaaaadcaaaaajhcaabaaaabaaaaaa
egbcbaaaaeaaaaaaagaabaaaabaaaaaajgahbaaaabaaaaaabaaaaaahbcaabaaa
abaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaafbcaabaaaabaaaaaa
akaabaaaabaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaackaabaaa
abaaaaaadeaaaaakjcaabaaaabaaaaaaagambaaaabaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaacpaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaa
diaaaaaiccaabaaaabaaaaaaakiacaaaaaaaaaaaahaaaaaaabeaaaaaaaaaaaed
diaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaabkaabaaaabaaaaaabjaaaaaf
bcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaaakaabaaaabaaaaaadiaaaaajhcaabaaaabaaaaaaegiccaaaaaaaaaaa
abaaaaaaegiccaaaaaaaaaaaacaaaaaadiaaaaahhcaabaaaabaaaaaafgafbaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaaaaaaaaaaigadbaaaaaaaaaaa
pgapbaaaabaaaaaaegacbaaaabaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaa
afaaaaaapgbpbaaaafaaaaaaaaaaaaakdcaabaaaabaaaaaaegaabaaaabaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
egaabaaaabaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaadbaaaaahicaabaaa
aaaaaaaaabeaaaaaaaaaaaaackbabaaaafaaaaaaabaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaahicaabaaaaaaaaaaadkaabaaa
abaaaaaadkaabaaaaaaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaafaaaaaa
egbcbaaaafaaaaaaefaaaaajpcaabaaaabaaaaaaagaabaaaabaaaaaaeghobaaa
adaaaaaaaagabaaaabaaaaaaapaaaaahicaabaaaaaaaaaaapgapbaaaaaaaaaaa
agaabaaaabaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "SPOT" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "SPOT" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "SPOT" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 54 math, 4 textures
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_Shininess]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_LightTexture0] CUBE 3
"3.0-!!ARBfp1.0
PARAM c[6] = { program.local[0..3],
		{ 0, 128, 3, 1 },
		{ 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[0], texture[1], 2D;
MOV R2.x, R0.y;
MOV R2.y, R1;
MOV R0.y, R1.x;
ADD R1.xy, R2, -R0;
MUL_SAT R2.x, fragment.texcoord[0].z, c[4].z;
MAD R0.xy, R2.x, R1, R0;
MOV R1.x, R0.w;
MOV R0.w, R1.z;
MOV R1.y, R1.w;
MUL R1.z, fragment.texcoord[0], c[4];
ADD R1.xy, R1, -R0.zwzw;
ADD_SAT R1.z, R1, -c[5].x;
MAD R0.zw, R1.z, R1.xyxy, R0;
ADD R1.xy, R0.zwzw, -R0;
MAD_SAT R0.z, fragment.texcoord[0], c[4], -c[4].w;
MAD R0.xw, R0.z, R1.yyzx, R0.yyzx;
MUL R0.z, R0.w, R0.w;
ADD R0.y, -R0.x, c[4].w;
MAD_SAT R0.y, R0, R0.z, R0.w;
ADD R1.xyz, fragment.color.primary, -R0.y;
MAD R0.xyz, R0.x, R1, R0.y;
ADD R1.xyz, fragment.color.primary, -R0;
MAD R1.xyz, fragment.texcoord[0].w, R1, R0;
DP3 R1.w, fragment.texcoord[1], fragment.texcoord[1];
RSQ R0.x, R1.w;
ADD R1.xyz, -R0.w, R1;
MAD R1.xyz, fragment.color.primary.w, R1, R0.w;
DP3 R1.w, fragment.texcoord[2], fragment.texcoord[2];
MUL R0.xyz, R0.x, fragment.texcoord[1];
RSQ R1.w, R1.w;
MAD R2.xyz, R1.w, fragment.texcoord[2], R0;
DP3 R0.x, R2, R2;
RSQ R0.x, R0.x;
MUL R0.y, R0.x, R2.z;
MOV R0.x, c[4].y;
DP3 R1.w, fragment.texcoord[3], fragment.texcoord[3];
MAX R0.y, R0, c[4].x;
MUL R0.x, R0, c[2];
POW R0.x, R0.y, R0.x;
MUL R2.x, R0, R0.w;
MAX R0.z, R0, c[4].x;
MUL R1.xyz, R1, c[0];
MUL R1.xyz, R1, R0.z;
MOV R0.xyz, c[1];
MUL R0.xyz, R0, c[0];
TEX R0.w, fragment.texcoord[3], texture[3], CUBE;
TEX R1.w, R1.w, texture[2], 2D;
MUL R0.w, R1, R0;
MUL R0.w, R0, c[5].x;
MAD R0.xyz, R0, R2.x, R1;
MUL result.color.xyz, R0, R0.w;
MOV result.color.w, c[4].x;
END
# 54 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 52 math, 4 textures
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_Shininess]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_LightTexture0] CUBE 3
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_cube s3
def c3, 0.00000000, 128.00000000, 3.00000000, -1.00000000
def c4, 3.00000000, -2.00000000, 1.00000000, 2.00000000
dcl_texcoord0 v0
dcl_color0 v1
dcl_texcoord1 v2.xyz
dcl_texcoord2 v3.xyz
dcl_texcoord3 v4.xyz
texld r0, v0, s0
texld r1, v0, s1
mov r2.x, r0.y
mov r2.y, r1
mov r0.y, r1.x
add r1.xy, r2, -r0
mul_sat r2.x, v0.z, c3.z
mad r0.xy, r2.x, r1, r0
mov r1.x, r0.w
mov r1.y, r1.w
mov r0.w, r1.z
add r1.zw, r1.xyxy, -r0
mad_sat r1.x, v0.z, c4, c4.y
mad r0.zw, r1.x, r1, r0
add r1.xy, r0.zwzw, -r0
mad_sat r0.z, v0, c3, c3.w
mad r1.xw, r0.z, r1.yyzx, r0.yyzx
mul r0.y, r1.w, r1.w
add r0.x, -r1, c4.z
mad_sat r0.x, r0, r0.y, r1.w
add r2.xyz, v1, -r0.x
mad r0.xyz, r1.x, r2, r0.x
add r1.xyz, v1, -r0
mad r0.xyz, v0.w, r1, r0
dp3_pp r0.w, v2, v2
rsq_pp r1.x, r0.w
mul_pp r2.xyz, r1.x, v2
dp3_pp r0.w, v3, v3
rsq_pp r0.w, r0.w
mad_pp r2.xyw, r0.w, v3.xyzz, r2.xyzz
add r0.xyz, -r1.w, r0
mov_sat r1.x, v1.w
mad r1.xyz, r1.x, r0, r1.w
dp3_pp r0.w, r2.xyww, r2.xyww
rsq_pp r0.x, r0.w
mov_pp r0.y, c2.x
mul_pp r0.x, r0, r2.w
mul_pp r2.y, c3, r0
max_pp r2.x, r0, c3
pow r0, r2.x, r2.y
mul r1.w, r0.x, r1
dp3 r0.x, v4, v4
max_pp r0.y, r2.z, c3.x
mul_pp r1.xyz, r1, c0
mul_pp r2.xyz, r1, r0.y
texld r0.x, r0.x, s2
texld r0.w, v4, s3
mul r0.w, r0.x, r0
mov_pp r1.xyz, c0
mul_pp r0.xyz, c1, r1
mul_pp r0.w, r0, c4
mad r0.xyz, r0, r1.w, r2
mul oC0.xyz, r0, r0.w
mov_pp oC0.w, c3.x
"
}
SubProgram "d3d11 " {
// Stats: 38 math, 4 textures
Keywords { "POINT_COOKIE" }
SetTexture 0 [_MainTex] 2D 2
SetTexture 1 [_Emissive] 2D 3
SetTexture 2 [_LightTextureB0] 2D 1
SetTexture 3 [_LightTexture0] CUBE 0
ConstBuffer "$Globals" 176
Vector 16 [_LightColor0]
Vector 32 [_SpecColor]
Float 112 [_Shininess]
BindCB  "$Globals" 0
"ps_4_0
eefiecedibabblhjhajbjcdenmjhnhapofgokmepabaaaaaakeahaaaaadaaaaaa
cmaaaaaaoiaaaaaabmabaaaaejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
iaagaaaaeaaaaaaakaabaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fkaaaaadaagabaaaadaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafidaaaae
aahabaaaadaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaa
acaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaad
hcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaadiaaaaah
bcaabaaaaaaaaaaackbabaaaabaaaaaaabeaaaaaaaaaeaeadgcaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaacaaaaaadgaaaaafkcaabaaaacaaaaaafganbaaa
abaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaa
aagabaaaadaaaaaadgaaaaaffcaabaaaacaaaaaafgahbaaaadaaaaaadgaaaaaf
kcaabaaaabaaaaaaagaibaaaadaaaaaaaaaaaaaipcaabaaaacaaaaaabgalbaia
ebaaaaaaabaaaaaaegaobaaaacaaaaaadcaaaaajdcaabaaaaaaaaaaaagaabaaa
aaaaaaaaegaabaaaacaaaaaabgafbaaaabaaaaaadccaaaapmcaabaaaaaaaaaaa
kgbkbaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaeaeaaaaaeaeaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaamaaaaaialpdcaaaaajdcaabaaaabaaaaaakgakbaaa
aaaaaaaaogakbaaaacaaaaaalgapbaaaabaaaaaaaaaaaaaidcaabaaaabaaaaaa
egaabaiaebaaaaaaaaaaaaaaegaabaaaabaaaaaadcaaaaajdcaabaaaaaaaaaaa
pgapbaaaaaaaaaaaegaabaaaabaaaaaaegaabaaaaaaaaaaaaaaaaaaiecaabaaa
aaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaahicaabaaa
aaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadccaaaajecaabaaaaaaaaaaa
ckaabaaaaaaaaaaadkaabaaaaaaaaaaabkaabaaaaaaaaaaaaaaaaaaihcaabaaa
abaaaaaakgakbaiaebaaaaaaaaaaaaaaegbcbaaaacaaaaaadcaaaaajncaabaaa
aaaaaaaaagaabaaaaaaaaaaaagajbaaaabaaaaaakgakbaaaaaaaaaaaaaaaaaai
hcaabaaaabaaaaaaigadbaiaebaaaaaaaaaaaaaaegbcbaaaacaaaaaadcaaaaaj
ncaabaaaaaaaaaaapgbpbaaaabaaaaaaagajbaaaabaaaaaaagaobaaaaaaaaaaa
aaaaaaaincaabaaaaaaaaaaafgafbaiaebaaaaaaaaaaaaaaagaobaaaaaaaaaaa
dgcaaaafbcaabaaaabaaaaaadkbabaaaacaaaaaadcaaaaajncaabaaaaaaaaaaa
agaabaaaabaaaaaaagaobaaaaaaaaaaafgafbaaaaaaaaaaadiaaaaaincaabaaa
aaaaaaaaagaobaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaabaaaaaahbcaabaaa
abaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaafbcaabaaaabaaaaaa
akaabaaaabaaaaaabaaaaaahccaabaaaabaaaaaaegbcbaaaadaaaaaaegbcbaaa
adaaaaaaeeaaaaafccaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaahocaabaaa
abaaaaaafgafbaaaabaaaaaaagbjbaaaadaaaaaadcaaaaajhcaabaaaabaaaaaa
egbcbaaaaeaaaaaaagaabaaaabaaaaaajgahbaaaabaaaaaabaaaaaahbcaabaaa
abaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaafbcaabaaaabaaaaaa
akaabaaaabaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaackaabaaa
abaaaaaadeaaaaakjcaabaaaabaaaaaaagambaaaabaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaacpaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaa
diaaaaaiccaabaaaabaaaaaaakiacaaaaaaaaaaaahaaaaaaabeaaaaaaaaaaaed
diaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaabkaabaaaabaaaaaabjaaaaaf
bcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaaakaabaaaabaaaaaadiaaaaajhcaabaaaabaaaaaaegiccaaaaaaaaaaa
abaaaaaaegiccaaaaaaaaaaaacaaaaaadiaaaaahhcaabaaaabaaaaaafgafbaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaaaaaaaaaaigadbaaaaaaaaaaa
pgapbaaaabaaaaaaegacbaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaa
afaaaaaaegbcbaaaafaaaaaaefaaaaajpcaabaaaabaaaaaapgapbaaaaaaaaaaa
eghobaaaacaaaaaaaagabaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegbcbaaa
afaaaaaaeghobaaaadaaaaaaaagabaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaa
agaabaaaabaaaaaapgapbaaaacaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaa
doaaaaab"
}
SubProgram "gles " {
Keywords { "POINT_COOKIE" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "POINT_COOKIE" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "POINT_COOKIE" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 49 math, 3 textures
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_Shininess]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
SetTexture 2 [_LightTexture0] 2D 2
"3.0-!!ARBfp1.0
PARAM c[6] = { program.local[0..3],
		{ 0, 128, 3, 1 },
		{ 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[0], texture[1], 2D;
MOV R2.x, R0.y;
MOV R2.y, R1;
MOV R0.y, R1.x;
ADD R1.xy, R2, -R0;
MUL_SAT R2.x, fragment.texcoord[0].z, c[4].z;
MAD R0.xy, R2.x, R1, R0;
MOV R1.x, R0.w;
MOV R0.w, R1.z;
MOV R1.y, R1.w;
MUL R1.z, fragment.texcoord[0], c[4];
ADD R1.xy, R1, -R0.zwzw;
ADD_SAT R1.z, R1, -c[5].x;
MAD R0.zw, R1.z, R1.xyxy, R0;
ADD R1.xy, R0.zwzw, -R0;
MAD_SAT R0.z, fragment.texcoord[0], c[4], -c[4].w;
MAD R2.xy, R0.z, R1, R0;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
MUL R0.y, R2.x, R2.x;
ADD R0.x, -R2.y, c[4].w;
MAD_SAT R0.x, R0, R0.y, R2;
ADD R1.xyz, fragment.color.primary, -R0.x;
MAD R0.xyz, R2.y, R1, R0.x;
ADD R1.xyz, fragment.color.primary, -R0;
MAD R0.xyz, fragment.texcoord[0].w, R1, R0;
ADD R0.xyz, -R2.x, R0;
MAD R0.xyz, fragment.color.primary.w, R0, R2.x;
RSQ R0.w, R0.w;
MOV R1.xyz, fragment.texcoord[1];
MAD R1.xyz, R0.w, fragment.texcoord[2], R1;
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R1.x, R0.w, R1.z;
MOV R0.w, c[4].y;
MAX R1.x, R1, c[4];
MUL R0.w, R0, c[2].x;
POW R0.w, R1.x, R0.w;
MUL R1.w, R0, R2.x;
TEX R0.w, fragment.texcoord[3], texture[2], 2D;
MAX R1.y, fragment.texcoord[1].z, c[4].x;
MUL R0.xyz, R0, c[0];
MUL R0.xyz, R0, R1.y;
MOV R1.xyz, c[1];
MUL R1.xyz, R1, c[0];
MUL R0.w, R0, c[5].x;
MAD R0.xyz, R1, R1.w, R0;
MUL result.color.xyz, R0, R0.w;
MOV result.color.w, c[4].x;
END
# 49 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 49 math, 3 textures
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_Shininess]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
SetTexture 2 [_LightTexture0] 2D 2
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c3, 0.00000000, 128.00000000, 3.00000000, -1.00000000
def c4, 3.00000000, -2.00000000, 1.00000000, 2.00000000
dcl_texcoord0 v0
dcl_color0 v1
dcl_texcoord1 v2.xyz
dcl_texcoord2 v3.xyz
dcl_texcoord3 v4.xy
texld r0, v0, s0
texld r1, v0, s1
mov r2.x, r0.y
mov r2.y, r1
mov r0.y, r1.x
add r1.xy, r2, -r0
mul_sat r2.x, v0.z, c3.z
mad r0.xy, r2.x, r1, r0
mov r1.x, r0.w
mov r1.y, r1.w
mov r0.w, r1.z
add r1.zw, r1.xyxy, -r0
mad_sat r1.x, v0.z, c4, c4.y
mad r0.zw, r1.x, r1, r0
add r1.xy, r0.zwzw, -r0
mad_sat r0.z, v0, c3, c3.w
mad r2.xy, r0.z, r1, r0
dp3_pp r0.w, v3, v3
mul r0.y, r2.x, r2.x
add r0.x, -r2.y, c4.z
mad_sat r0.x, r0, r0.y, r2
add r1.xyz, v1, -r0.x
mad r0.xyz, r2.y, r1, r0.x
add r1.xyz, v1, -r0
mad r1.xyz, v0.w, r1, r0
rsq_pp r0.w, r0.w
mov_pp r0.xyz, v2
mad_pp r0.xyz, r0.w, v3, r0
dp3_pp r0.x, r0, r0
rsq_pp r0.x, r0.x
mul_pp r0.x, r0, r0.z
max_pp r1.w, r0.x, c3.x
mov_sat r0.y, v1.w
add r1.xyz, -r2.x, r1
mad r1.xyz, r0.y, r1, r2.x
mov_pp r0.y, c2.x
mul_pp r2.y, c3, r0
pow r0, r1.w, r2.y
mov r0.w, r0.x
mul r1.w, r0, r2.x
texld r0.w, v4, s2
mul_pp r1.xyz, r1, c0
max_pp r0.y, v2.z, c3.x
mul_pp r0.xyz, r1, r0.y
mov_pp r1.xyz, c0
mul_pp r1.xyz, c1, r1
mul_pp r0.w, r0, c4
mad r0.xyz, r1, r1.w, r0
mul oC0.xyz, r0, r0.w
mov_pp oC0.w, c3.x
"
}
SubProgram "d3d11 " {
// Stats: 35 math, 3 textures
Keywords { "DIRECTIONAL_COOKIE" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_Emissive] 2D 2
SetTexture 2 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 176
Vector 16 [_LightColor0]
Vector 32 [_SpecColor]
Float 112 [_Shininess]
BindCB  "$Globals" 0
"ps_4_0
eefiecedanfannakmpppgcjfggdfldajobbfieidabaaaaaaamahaaaaadaaaaaa
cmaaaaaaoiaaaaaabmabaaaaejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
oiafaaaaeaaaaaaahkabaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaad
pcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gcbaaaaddcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaa
diaaaaahbcaabaaaaaaaaaaackbabaaaabaaaaaaabeaaaaaaaaaeaeadgcaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadgaaaaafkcaabaaaacaaaaaa
fganbaaaabaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaacaaaaaadgaaaaaffcaabaaaacaaaaaafgahbaaaadaaaaaa
dgaaaaafkcaabaaaabaaaaaaagaibaaaadaaaaaaaaaaaaaipcaabaaaacaaaaaa
bgalbaiaebaaaaaaabaaaaaaegaobaaaacaaaaaadcaaaaajdcaabaaaaaaaaaaa
agaabaaaaaaaaaaaegaabaaaacaaaaaabgafbaaaabaaaaaadccaaaapmcaabaaa
aaaaaaaakgbkbaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaeaeaaaaaeaea
aceaaaaaaaaaaaaaaaaaaaaaaaaaaamaaaaaialpdcaaaaajdcaabaaaabaaaaaa
kgakbaaaaaaaaaaaogakbaaaacaaaaaalgapbaaaabaaaaaaaaaaaaaidcaabaaa
abaaaaaaegaabaiaebaaaaaaaaaaaaaaegaabaaaabaaaaaadcaaaaajdcaabaaa
aaaaaaaapgapbaaaaaaaaaaaegaabaaaabaaaaaaegaabaaaaaaaaaaaaaaaaaai
ecaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaah
icaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadccaaaajecaabaaa
aaaaaaaackaabaaaaaaaaaaadkaabaaaaaaaaaaabkaabaaaaaaaaaaaaaaaaaai
hcaabaaaabaaaaaakgakbaiaebaaaaaaaaaaaaaaegbcbaaaacaaaaaadcaaaaaj
ncaabaaaaaaaaaaaagaabaaaaaaaaaaaagajbaaaabaaaaaakgakbaaaaaaaaaaa
aaaaaaaihcaabaaaabaaaaaaigadbaiaebaaaaaaaaaaaaaaegbcbaaaacaaaaaa
dcaaaaajncaabaaaaaaaaaaapgbpbaaaabaaaaaaagajbaaaabaaaaaaagaobaaa
aaaaaaaaaaaaaaaincaabaaaaaaaaaaafgafbaiaebaaaaaaaaaaaaaaagaobaaa
aaaaaaaadgcaaaafbcaabaaaabaaaaaadkbabaaaacaaaaaadcaaaaajncaabaaa
aaaaaaaaagaabaaaabaaaaaaagaobaaaaaaaaaaafgafbaaaaaaaaaaadiaaaaai
ncaabaaaaaaaaaaaagaobaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaabaaaaaah
bcaabaaaabaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaafbcaabaaa
abaaaaaaakaabaaaabaaaaaadcaaaaajhcaabaaaabaaaaaaegbcbaaaaeaaaaaa
agaabaaaabaaaaaaegbcbaaaadaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaa
abaaaaaaegacbaaaabaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaa
diaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaackaabaaaabaaaaaadeaaaaah
bcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaacpaaaaafbcaabaaa
abaaaaaaakaabaaaabaaaaaadiaaaaaiccaabaaaabaaaaaaakiacaaaaaaaaaaa
ahaaaaaaabeaaaaaaaaaaaeddiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaa
bkaabaaaabaaaaaabjaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaabaaaaaadiaaaaajhcaabaaa
abaaaaaaegiccaaaaaaaaaaaabaaaaaaegiccaaaaaaaaaaaacaaaaaadiaaaaah
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegacbaaaabaaaaaadeaaaaahccaabaaa
aaaaaaaackbabaaaadaaaaaaabeaaaaaaaaaaaaadcaaaaajhcaabaaaaaaaaaaa
igadbaaaaaaaaaaafgafbaaaaaaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaafaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaaaaaaaaah
icaabaaaaaaaaaaadkaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaahhccabaaa
aaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "DIRECTIONAL_COOKIE" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL_COOKIE" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL_COOKIE" }
"!!GLES3"
}
}
 }


 // Stats for Vertex shader:
 //       d3d11 : 19 math
 //        d3d9 : 21 math
 //      opengl : 20 math
 // Stats for Fragment shader:
 //       d3d11 : 1 math
 //        d3d9 : 5 math
 //      opengl : 5 math
 Pass {
  Name "PREPASS"
  Tags { "LIGHTMODE"="PrePassBase" }
  Fog { Mode Off }
  Blend SrcAlpha OneMinusSrcAlpha
Program "vp" {
SubProgram "opengl " {
// Stats: 20 math
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Vector 9 [unity_Scale]
"3.0-!!ARBvp1.0
PARAM c[10] = { program.local[0],
		state.matrix.mvp,
		program.local[5..9] };
TEMP R0;
TEMP R1;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R1.xyz, R0, vertex.attrib[14].w;
DP3 R0.y, R1, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[0].xyz, R0, c[9].w;
DP3 R0.y, R1, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[1].xyz, R0, c[9].w;
DP3 R0.y, R1, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[2].xyz, R0, c[9].w;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 20 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 21 math
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [unity_Scale]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r1.xyz, r0, v1.w
dp3 r0.y, r1, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul o1.xyz, r0, c8.w
dp3 r0.y, r1, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul o2.xyz, r0, c8.w
dp3 r0.y, r1, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul o3.xyz, r0, c8.w
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
// Stats: 19 math
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "tangent" TexCoord2
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "UnityPerDraw" 0
"vs_4_0
eefiecedjocloobkcnbfmoalkdicjglokcphnmlaabaaaaaacmafaaaaadaaaaaa
cmaaaaaapeaaaaaahmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoiaaaaaaaaeaaaaaa
aiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahaiaaaaheaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefc
kiadaaaaeaaaabaaokaaaaaafjaaaaaeegiocaaaaaaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadhccabaaaabaaaaaagfaaaaad
hccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagiaaaaacadaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaaaaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaaaaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaaaaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaa
jgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaajgbebaaa
acaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgbpbaaaabaaaaaadgaaaaagbcaabaaaabaaaaaa
akiacaaaaaaaaaaaamaaaaaadgaaaaagccaabaaaabaaaaaaakiacaaaaaaaaaaa
anaaaaaadgaaaaagecaabaaaabaaaaaaakiacaaaaaaaaaaaaoaaaaaabaaaaaah
ccaabaaaacaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaa
acaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaaacaaaaaa
egbcbaaaacaaaaaaegacbaaaabaaaaaadiaaaaaihccabaaaabaaaaaaegacbaaa
acaaaaaapgipcaaaaaaaaaaabeaaaaaadgaaaaagbcaabaaaabaaaaaabkiacaaa
aaaaaaaaamaaaaaadgaaaaagccaabaaaabaaaaaabkiacaaaaaaaaaaaanaaaaaa
dgaaaaagecaabaaaabaaaaaabkiacaaaaaaaaaaaaoaaaaaabaaaaaahccaabaaa
acaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaacaaaaaa
egbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaaacaaaaaaegbcbaaa
acaaaaaaegacbaaaabaaaaaadiaaaaaihccabaaaacaaaaaaegacbaaaacaaaaaa
pgipcaaaaaaaaaaabeaaaaaadgaaaaagbcaabaaaabaaaaaackiacaaaaaaaaaaa
amaaaaaadgaaaaagccaabaaaabaaaaaackiacaaaaaaaaaaaanaaaaaadgaaaaag
ecaabaaaabaaaaaackiacaaaaaaaaaaaaoaaaaaabaaaaaahccaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaa
abaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaaaaaaaaaaegbcbaaaacaaaaaa
egacbaaaabaaaaaadiaaaaaihccabaaaadaaaaaaegacbaaaaaaaaaaapgipcaaa
aaaaaaaabeaaaaaadoaaaaab"
}
SubProgram "gles " {
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesTANGENT;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  highp vec3 tmpvar_4;
  tmpvar_3 = tmpvar_1.xyz;
  tmpvar_4 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_5;
  tmpvar_5[0].x = tmpvar_3.x;
  tmpvar_5[0].y = tmpvar_4.x;
  tmpvar_5[0].z = tmpvar_2.x;
  tmpvar_5[1].x = tmpvar_3.y;
  tmpvar_5[1].y = tmpvar_4.y;
  tmpvar_5[1].z = tmpvar_2.y;
  tmpvar_5[2].x = tmpvar_3.z;
  tmpvar_5[2].y = tmpvar_4.z;
  tmpvar_5[2].z = tmpvar_2.z;
  vec3 v_6;
  v_6.x = _Object2World[0].x;
  v_6.y = _Object2World[1].x;
  v_6.z = _Object2World[2].x;
  vec3 v_7;
  v_7.x = _Object2World[0].y;
  v_7.y = _Object2World[1].y;
  v_7.z = _Object2World[2].y;
  vec3 v_8;
  v_8.x = _Object2World[0].z;
  v_8.y = _Object2World[1].z;
  v_8.z = _Object2World[2].z;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = ((tmpvar_5 * v_6) * unity_Scale.w);
  xlv_TEXCOORD1 = ((tmpvar_5 * v_7) * unity_Scale.w);
  xlv_TEXCOORD2 = ((tmpvar_5 * v_8) * unity_Scale.w);
}



#endif
#ifdef FRAGMENT

uniform mediump float _Shininess;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 res_1;
  lowp vec3 worldN_2;
  highp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  mediump float rim_5;
  highp float tmpvar_6;
  tmpvar_6 = (1.0 - clamp (normalize(tmpvar_3).z, 0.0, 1.0));
  rim_5 = tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_7 = ((_RimColor.xyz * pow (rim_5, _RimFalloff)) * _RimColor.w);
  tmpvar_4 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_4 * _Opacity);
  tmpvar_4 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = xlv_TEXCOORD0.z;
  worldN_2.x = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = xlv_TEXCOORD1.z;
  worldN_2.y = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = xlv_TEXCOORD2.z;
  worldN_2.z = tmpvar_11;
  res_1.xyz = ((worldN_2 * 0.5) + 0.5);
  res_1.w = _Shininess;
  gl_FragData[0] = res_1;
}



#endif"
}
SubProgram "glesdesktop " {
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesTANGENT;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  highp vec3 tmpvar_4;
  tmpvar_3 = tmpvar_1.xyz;
  tmpvar_4 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_5;
  tmpvar_5[0].x = tmpvar_3.x;
  tmpvar_5[0].y = tmpvar_4.x;
  tmpvar_5[0].z = tmpvar_2.x;
  tmpvar_5[1].x = tmpvar_3.y;
  tmpvar_5[1].y = tmpvar_4.y;
  tmpvar_5[1].z = tmpvar_2.y;
  tmpvar_5[2].x = tmpvar_3.z;
  tmpvar_5[2].y = tmpvar_4.z;
  tmpvar_5[2].z = tmpvar_2.z;
  vec3 v_6;
  v_6.x = _Object2World[0].x;
  v_6.y = _Object2World[1].x;
  v_6.z = _Object2World[2].x;
  vec3 v_7;
  v_7.x = _Object2World[0].y;
  v_7.y = _Object2World[1].y;
  v_7.z = _Object2World[2].y;
  vec3 v_8;
  v_8.x = _Object2World[0].z;
  v_8.y = _Object2World[1].z;
  v_8.z = _Object2World[2].z;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = ((tmpvar_5 * v_6) * unity_Scale.w);
  xlv_TEXCOORD1 = ((tmpvar_5 * v_7) * unity_Scale.w);
  xlv_TEXCOORD2 = ((tmpvar_5 * v_8) * unity_Scale.w);
}



#endif
#ifdef FRAGMENT

uniform mediump float _Shininess;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 res_1;
  lowp vec3 worldN_2;
  highp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  mediump float rim_5;
  highp float tmpvar_6;
  tmpvar_6 = (1.0 - clamp (normalize(tmpvar_3).z, 0.0, 1.0));
  rim_5 = tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_7 = ((_RimColor.xyz * pow (rim_5, _RimFalloff)) * _RimColor.w);
  tmpvar_4 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_4 * _Opacity);
  tmpvar_4 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = xlv_TEXCOORD0.z;
  worldN_2.x = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = xlv_TEXCOORD1.z;
  worldN_2.y = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = xlv_TEXCOORD2.z;
  worldN_2.z = tmpvar_11;
  res_1.xyz = ((worldN_2 * 0.5) + 0.5);
  res_1.w = _Shininess;
  gl_FragData[0] = res_1;
}



#endif"
}
SubProgram "gles3 " {
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec3 _glesNormal;
in vec4 _glesTANGENT;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp vec4 unity_Scale;
out highp vec3 xlv_TEXCOORD0;
out highp vec3 xlv_TEXCOORD1;
out highp vec3 xlv_TEXCOORD2;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec3 tmpvar_3;
  highp vec3 tmpvar_4;
  tmpvar_3 = tmpvar_1.xyz;
  tmpvar_4 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_5;
  tmpvar_5[0].x = tmpvar_3.x;
  tmpvar_5[0].y = tmpvar_4.x;
  tmpvar_5[0].z = tmpvar_2.x;
  tmpvar_5[1].x = tmpvar_3.y;
  tmpvar_5[1].y = tmpvar_4.y;
  tmpvar_5[1].z = tmpvar_2.y;
  tmpvar_5[2].x = tmpvar_3.z;
  tmpvar_5[2].y = tmpvar_4.z;
  tmpvar_5[2].z = tmpvar_2.z;
  vec3 v_6;
  v_6.x = _Object2World[0].x;
  v_6.y = _Object2World[1].x;
  v_6.z = _Object2World[2].x;
  vec3 v_7;
  v_7.x = _Object2World[0].y;
  v_7.y = _Object2World[1].y;
  v_7.z = _Object2World[2].y;
  vec3 v_8;
  v_8.x = _Object2World[0].z;
  v_8.y = _Object2World[1].z;
  v_8.z = _Object2World[2].z;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_TEXCOORD0 = ((tmpvar_5 * v_6) * unity_Scale.w);
  xlv_TEXCOORD1 = ((tmpvar_5 * v_7) * unity_Scale.w);
  xlv_TEXCOORD2 = ((tmpvar_5 * v_8) * unity_Scale.w);
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform mediump float _Shininess;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
in highp vec3 xlv_TEXCOORD0;
in highp vec3 xlv_TEXCOORD1;
in highp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 res_1;
  lowp vec3 worldN_2;
  highp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  mediump float rim_5;
  highp float tmpvar_6;
  tmpvar_6 = (1.0 - clamp (normalize(tmpvar_3).z, 0.0, 1.0));
  rim_5 = tmpvar_6;
  highp vec3 tmpvar_7;
  tmpvar_7 = ((_RimColor.xyz * pow (rim_5, _RimFalloff)) * _RimColor.w);
  tmpvar_4 = tmpvar_7;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_4 * _Opacity);
  tmpvar_4 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = xlv_TEXCOORD0.z;
  worldN_2.x = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = xlv_TEXCOORD1.z;
  worldN_2.y = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = xlv_TEXCOORD2.z;
  worldN_2.z = tmpvar_11;
  res_1.xyz = ((worldN_2 * 0.5) + 0.5);
  res_1.w = _Shininess;
  _glesFragData[0] = res_1;
}



#endif"
}
}
Program "fp" {
SubProgram "opengl " {
// Stats: 5 math
Float 0 [_Shininess]
"3.0-!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0.5 } };
TEMP R0;
MOV R0.z, fragment.texcoord[2];
MOV R0.x, fragment.texcoord[0].z;
MOV R0.y, fragment.texcoord[1].z;
MAD result.color.xyz, R0, c[1].x, c[1].x;
MOV result.color.w, c[0].x;
END
# 5 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 5 math
Float 0 [_Shininess]
"ps_3_0
def c1, 0.50000000, 0, 0, 0
dcl_texcoord0 v0.xyz
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
mov_pp r0.z, v2
mov_pp r0.x, v0.z
mov_pp r0.y, v1.z
mad_pp oC0.xyz, r0, c1.x, c1.x
mov_pp oC0.w, c0.x
"
}
SubProgram "d3d11 " {
// Stats: 1 math
ConstBuffer "$Globals" 80
Float 48 [_Shininess]
BindCB  "$Globals" 0
"ps_4_0
eefiecedpiobmejhbbnccmpkimokndkmjifneodbabaaaaaaneabaaaaadaaaaaa
cmaaaaaaleaaaaaaoiaaaaaaejfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahaeaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaeaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaeaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefcoeaaaaaaeaaaaaaadjaaaaaafjaaaaaeegiocaaa
aaaaaaaaaeaaaaaagcbaaaadecbabaaaabaaaaaagcbaaaadecbabaaaacaaaaaa
gcbaaaadecbabaaaadaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacabaaaaaa
dgaaaaafbcaabaaaaaaaaaaackbabaaaabaaaaaadgaaaaafccaabaaaaaaaaaaa
ckbabaaaacaaaaaadgaaaaafecaabaaaaaaaaaaackbabaaaadaaaaaadcaaaaap
hccabaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadp
aaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadgaaaaagiccabaaa
aaaaaaaaakiacaaaaaaaaaaaadaaaaaadoaaaaab"
}
SubProgram "gles " {
"!!GLES"
}
SubProgram "glesdesktop " {
"!!GLES"
}
SubProgram "gles3 " {
"!!GLES3"
}
}
 }


 // Stats for Vertex shader:
 //       d3d11 : 29 avg math (21..35)
 //        d3d9 : 35 avg math (27..44)
 //      opengl : 34 avg math (26..43)
 // Stats for Fragment shader:
 //       d3d11 : 42 avg math (33..54), 4 avg texture (3..5)
 //        d3d9 : 55 avg math (43..71), 4 avg texture (3..5)
 //      opengl : 55 avg math (42..70), 4 avg texture (3..5)
 Pass {
  Name "PREPASS"
  Tags { "LIGHTMODE"="PrePassFinal" }
  ZWrite Off
  Blend SrcAlpha OneMinusSrcAlpha
Program "vp" {
SubProgram "opengl " {
// Stats: 43 math
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_ProjectionParams]
Vector 15 [unity_SHAr]
Vector 16 [unity_SHAg]
Vector 17 [unity_SHAb]
Vector 18 [unity_SHBr]
Vector 19 [unity_SHBg]
Vector 20 [unity_SHBb]
Vector 21 [unity_SHC]
Vector 22 [unity_Scale]
Vector 23 [_MainTex_ST]
Vector 24 [_Emissive_ST]
"3.0-!!ARBvp1.0
PARAM c[25] = { { 1, 0.5 },
		state.matrix.mvp,
		program.local[5..24] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[22].w;
DP3 R2.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[17];
DP4 R2.y, R0, c[16];
DP4 R2.x, R0, c[15];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[20];
DP4 R3.x, R1, c[18];
DP4 R3.y, R1, c[19];
ADD R2.xyz, R2, R3;
MAD R0.w, R0.x, R0.x, -R0.y;
MUL R3.xyz, R0.w, c[21];
MOV R1.xyz, vertex.attrib[14];
MUL R0.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R1.zxyw, -R0;
MUL R0.xyz, R0, vertex.attrib[14].w;
MOV R1.xyz, c[13];
ADD result.texcoord[3].xyz, R2, R3;
MOV R1.w, c[0].x;
DP4 R0.w, vertex.position, c[4];
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
MAD R2.xyz, R2, c[22].w, -vertex.position;
DP3 result.texcoord[1].y, R2, R0;
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].y;
MUL R1.y, R1, c[14].x;
DP3 result.texcoord[1].z, vertex.normal, R2;
DP3 result.texcoord[1].x, R2, vertex.attrib[14];
ADD result.texcoord[2].xy, R1, R1.z;
MOV result.position, R0;
MOV result.color, vertex.color;
MOV result.texcoord[2].zw, R0;
MAD result.texcoord[0].zw, vertex.texcoord[1].xyxy, c[24].xyxy, c[24];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[23], c[23].zwzw;
END
# 43 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 44 math
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_ProjectionParams]
Vector 14 [_ScreenParams]
Vector 15 [unity_SHAr]
Vector 16 [unity_SHAg]
Vector 17 [unity_SHAb]
Vector 18 [unity_SHBr]
Vector 19 [unity_SHBg]
Vector 20 [unity_SHBb]
Vector 21 [unity_SHC]
Vector 22 [unity_Scale]
Vector 23 [_MainTex_ST]
Vector 24 [_Emissive_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_color0 o3
dcl_texcoord2 o4
dcl_texcoord3 o5
def c25, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mul r1.xyz, v2, c22.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c25.x
dp4 r2.z, r0, c17
dp4 r2.y, r0, c16
dp4 r2.x, r0, c15
mul r0.y, r2.w, r2.w
mad r0.w, r0.x, r0.x, -r0.y
dp4 r3.z, r1, c20
dp4 r3.y, r1, c19
dp4 r3.x, r1, c18
add r2.xyz, r2, r3
mul r3.xyz, r0.w, c21
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r0.xyz, r0, v1.w
mov r1.xyz, c12
add o5.xyz, r2, r3
mov r1.w, c25.x
dp4 r0.w, v0, c3
dp4 r2.z, r1, c10
dp4 r2.x, r1, c8
dp4 r2.y, r1, c9
mad r2.xyz, r2, c22.w, -v0
dp3 o2.y, r2, r0
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c25.y
mul r1.y, r1, c13.x
dp3 o2.z, v2, r2
dp3 o2.x, r2, v1
mad o4.xy, r1.z, c14.zwzw, r1
mov o0, r0
mov o3, v5
mov o4.zw, r0
mad o1.zw, v4.xyxy, c24.xyxy, c24
mad o1.xy, v3, c23, c23.zwzw
"
}
SubProgram "d3d11 " {
// Stats: 35 math
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 128
Vector 80 [_MainTex_ST]
Vector 96 [_Emissive_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedefibnoonkakmnlfplhacibjpofngpilbabaaaaaaleahaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefcpmafaaaaeaaaabaahpabaaaa
fjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaa
fjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaad
pcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaad
pccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaacaeaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaadcaaaaalmccabaaaabaaaaaa
agbebaaaaeaaaaaaagiecaaaaaaaaaaaagaaaaaakgiocaaaaaaaaaaaagaaaaaa
diaaaaahhcaabaaaabaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaak
hcaabaaaabaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaa
abaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgbpbaaaabaaaaaa
diaaaaajhcaabaaaacaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaa
bbaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaa
abaaaaaaaeaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaa
adaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaacaaaaaaaaaaaaai
hcaabaaaacaaaaaaegacbaaaacaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaal
hcaabaaaacaaaaaaegacbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaia
ebaaaaaaaaaaaaaabaaaaaahcccabaaaacaaaaaaegacbaaaabaaaaaaegacbaaa
acaaaaaabaaaaaahbccabaaaacaaaaaaegbcbaaaabaaaaaaegacbaaaacaaaaaa
baaaaaaheccabaaaacaaaaaaegbcbaaaacaaaaaaegacbaaaacaaaaaadgaaaaaf
pccabaaaadaaaaaaegbobaaaafaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaa
aaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaa
aeaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaaeaaaaaakgakbaaaabaaaaaa
mgaabaaaabaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaa
adaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaa
adaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaa
agaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
adaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaaficaabaaa
aaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaabaaaaaaegiocaaaacaaaaaa
cgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaaabaaaaaaegiocaaaacaaaaaa
chaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaaabaaaaaaegiocaaaacaaaaaa
ciaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaajgacbaaaaaaaaaaa
egakbaaaaaaaaaaabbaaaaaibcaabaaaadaaaaaaegiocaaaacaaaaaacjaaaaaa
egaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaaegiocaaaacaaaaaackaaaaaa
egaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaaegiocaaaacaaaaaaclaaaaaa
egaobaaaacaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaa
adaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaa
dcaaaaakbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaia
ebaaaaaaaaaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaaacaaaaaacmaaaaaa
agaabaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  highp vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_5 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_5.zw;
  mat3 tmpvar_9;
  tmpvar_9[0] = _Object2World[0].xyz;
  tmpvar_9[1] = _Object2World[1].xyz;
  tmpvar_9[2] = _Object2World[2].xyz;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = (tmpvar_9 * (tmpvar_2 * unity_Scale.w));
  mediump vec3 tmpvar_11;
  mediump vec4 normal_12;
  normal_12 = tmpvar_10;
  highp float vC_13;
  mediump vec3 x3_14;
  mediump vec3 x2_15;
  mediump vec3 x1_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAr, normal_12);
  x1_16.x = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHAg, normal_12);
  x1_16.y = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHAb, normal_12);
  x1_16.z = tmpvar_19;
  mediump vec4 tmpvar_20;
  tmpvar_20 = (normal_12.xyzz * normal_12.yzzx);
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBr, tmpvar_20);
  x2_15.x = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHBg, tmpvar_20);
  x2_15.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHBb, tmpvar_20);
  x2_15.z = tmpvar_23;
  mediump float tmpvar_24;
  tmpvar_24 = ((normal_12.x * normal_12.x) - (normal_12.y * normal_12.y));
  vC_13 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (unity_SHC.xyz * vC_13);
  x3_14 = tmpvar_25;
  tmpvar_11 = ((x1_16 + x2_15) + x3_14);
  tmpvar_4 = tmpvar_11;
  highp vec3 tmpvar_26;
  highp vec3 tmpvar_27;
  tmpvar_26 = tmpvar_1.xyz;
  tmpvar_27 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_28;
  tmpvar_28[0].x = tmpvar_26.x;
  tmpvar_28[0].y = tmpvar_27.x;
  tmpvar_28[0].z = tmpvar_2.x;
  tmpvar_28[1].x = tmpvar_26.y;
  tmpvar_28[1].y = tmpvar_27.y;
  tmpvar_28[1].z = tmpvar_2.y;
  tmpvar_28[2].x = tmpvar_26.z;
  tmpvar_28[2].y = tmpvar_27.z;
  tmpvar_28[2].z = tmpvar_2.z;
  highp vec4 tmpvar_29;
  tmpvar_29.w = 1.0;
  tmpvar_29.xyz = _WorldSpaceCameraPos;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = (tmpvar_28 * (((_World2Object * tmpvar_29).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = o_6;
  xlv_TEXCOORD3 = tmpvar_4;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
uniform sampler2D _LightBuffer;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = xlv_COLOR0;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  mediump float rim_9;
  highp vec4 mask_10;
  highp vec4 color_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  color_11 = tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Emissive, xlv_TEXCOORD0.xy);
  mask_10 = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_9 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((_RimColor.xyz * pow (rim_9, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_11.x;
  tmpvar_16.y = mask_10.x;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_11.y;
  tmpvar_17.y = mask_10.y;
  highp vec2 tmpvar_18;
  tmpvar_18.x = color_11.z;
  tmpvar_18.y = mask_10.z;
  highp vec2 tmpvar_19;
  tmpvar_19.x = color_11.w;
  tmpvar_19.y = mask_10.w;
  highp vec2 tmpvar_20;
  tmpvar_20 = mix (mix (tmpvar_16, tmpvar_17, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_18, tmpvar_19, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_21;
  tmpvar_21 = mix (tmpvar_20.xxx, mix (mix (vec3(clamp ((tmpvar_20.x + ((1.0 - tmpvar_20.y) * pow (tmpvar_20.x, 2.0))), 0.0, 1.0)), tmpvar_4.xyz, tmpvar_20.yyy), tmpvar_4.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_4.w, 0.0, 1.0)));
  tmpvar_5 = tmpvar_21;
  tmpvar_6 = tmpvar_15;
  highp float tmpvar_22;
  tmpvar_22 = tmpvar_20.x;
  tmpvar_7 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_6 * _Opacity);
  tmpvar_6 = tmpvar_23;
  tmpvar_8 = _Opacity;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_3 = tmpvar_24;
  mediump vec4 tmpvar_25;
  tmpvar_25 = -(log2(max (light_3, vec4(0.001, 0.001, 0.001, 0.001))));
  light_3.w = tmpvar_25.w;
  highp vec3 tmpvar_26;
  tmpvar_26 = (tmpvar_25.xyz + xlv_TEXCOORD3);
  light_3.xyz = tmpvar_26;
  lowp vec4 c_27;
  lowp float spec_28;
  mediump float tmpvar_29;
  tmpvar_29 = (tmpvar_25.w * tmpvar_7);
  spec_28 = tmpvar_29;
  mediump vec3 tmpvar_30;
  tmpvar_30 = ((tmpvar_5 * light_3.xyz) + ((light_3.xyz * _SpecColor.xyz) * spec_28));
  c_27.xyz = tmpvar_30;
  c_27.w = (tmpvar_8 + (spec_28 * _SpecColor.w));
  c_2 = c_27;
  c_2.xyz = (c_2.xyz + tmpvar_6);
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  highp vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_5 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_5.zw;
  mat3 tmpvar_9;
  tmpvar_9[0] = _Object2World[0].xyz;
  tmpvar_9[1] = _Object2World[1].xyz;
  tmpvar_9[2] = _Object2World[2].xyz;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = (tmpvar_9 * (tmpvar_2 * unity_Scale.w));
  mediump vec3 tmpvar_11;
  mediump vec4 normal_12;
  normal_12 = tmpvar_10;
  highp float vC_13;
  mediump vec3 x3_14;
  mediump vec3 x2_15;
  mediump vec3 x1_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAr, normal_12);
  x1_16.x = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHAg, normal_12);
  x1_16.y = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHAb, normal_12);
  x1_16.z = tmpvar_19;
  mediump vec4 tmpvar_20;
  tmpvar_20 = (normal_12.xyzz * normal_12.yzzx);
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBr, tmpvar_20);
  x2_15.x = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHBg, tmpvar_20);
  x2_15.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHBb, tmpvar_20);
  x2_15.z = tmpvar_23;
  mediump float tmpvar_24;
  tmpvar_24 = ((normal_12.x * normal_12.x) - (normal_12.y * normal_12.y));
  vC_13 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (unity_SHC.xyz * vC_13);
  x3_14 = tmpvar_25;
  tmpvar_11 = ((x1_16 + x2_15) + x3_14);
  tmpvar_4 = tmpvar_11;
  highp vec3 tmpvar_26;
  highp vec3 tmpvar_27;
  tmpvar_26 = tmpvar_1.xyz;
  tmpvar_27 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_28;
  tmpvar_28[0].x = tmpvar_26.x;
  tmpvar_28[0].y = tmpvar_27.x;
  tmpvar_28[0].z = tmpvar_2.x;
  tmpvar_28[1].x = tmpvar_26.y;
  tmpvar_28[1].y = tmpvar_27.y;
  tmpvar_28[1].z = tmpvar_2.y;
  tmpvar_28[2].x = tmpvar_26.z;
  tmpvar_28[2].y = tmpvar_27.z;
  tmpvar_28[2].z = tmpvar_2.z;
  highp vec4 tmpvar_29;
  tmpvar_29.w = 1.0;
  tmpvar_29.xyz = _WorldSpaceCameraPos;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = (tmpvar_28 * (((_World2Object * tmpvar_29).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = o_6;
  xlv_TEXCOORD3 = tmpvar_4;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
uniform sampler2D _LightBuffer;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = xlv_COLOR0;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  mediump float rim_9;
  highp vec4 mask_10;
  highp vec4 color_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  color_11 = tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Emissive, xlv_TEXCOORD0.xy);
  mask_10 = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_9 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((_RimColor.xyz * pow (rim_9, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_11.x;
  tmpvar_16.y = mask_10.x;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_11.y;
  tmpvar_17.y = mask_10.y;
  highp vec2 tmpvar_18;
  tmpvar_18.x = color_11.z;
  tmpvar_18.y = mask_10.z;
  highp vec2 tmpvar_19;
  tmpvar_19.x = color_11.w;
  tmpvar_19.y = mask_10.w;
  highp vec2 tmpvar_20;
  tmpvar_20 = mix (mix (tmpvar_16, tmpvar_17, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_18, tmpvar_19, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_21;
  tmpvar_21 = mix (tmpvar_20.xxx, mix (mix (vec3(clamp ((tmpvar_20.x + ((1.0 - tmpvar_20.y) * pow (tmpvar_20.x, 2.0))), 0.0, 1.0)), tmpvar_4.xyz, tmpvar_20.yyy), tmpvar_4.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_4.w, 0.0, 1.0)));
  tmpvar_5 = tmpvar_21;
  tmpvar_6 = tmpvar_15;
  highp float tmpvar_22;
  tmpvar_22 = tmpvar_20.x;
  tmpvar_7 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_6 * _Opacity);
  tmpvar_6 = tmpvar_23;
  tmpvar_8 = _Opacity;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_3 = tmpvar_24;
  mediump vec4 tmpvar_25;
  tmpvar_25 = -(log2(max (light_3, vec4(0.001, 0.001, 0.001, 0.001))));
  light_3.w = tmpvar_25.w;
  highp vec3 tmpvar_26;
  tmpvar_26 = (tmpvar_25.xyz + xlv_TEXCOORD3);
  light_3.xyz = tmpvar_26;
  lowp vec4 c_27;
  lowp float spec_28;
  mediump float tmpvar_29;
  tmpvar_29 = (tmpvar_25.w * tmpvar_7);
  spec_28 = tmpvar_29;
  mediump vec3 tmpvar_30;
  tmpvar_30 = ((tmpvar_5 * light_3.xyz) + ((light_3.xyz * _SpecColor.xyz) * spec_28));
  c_27.xyz = tmpvar_30;
  c_27.w = (tmpvar_8 + (spec_28 * _SpecColor.w));
  c_2 = c_27;
  c_2.xyz = (c_2.xyz + tmpvar_6);
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesColor;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
in vec4 _glesMultiTexCoord1;
in vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec3 xlv_TEXCOORD1;
out lowp vec4 xlv_COLOR0;
out highp vec4 xlv_TEXCOORD2;
out highp vec3 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  highp vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_5 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_5.zw;
  mat3 tmpvar_9;
  tmpvar_9[0] = _Object2World[0].xyz;
  tmpvar_9[1] = _Object2World[1].xyz;
  tmpvar_9[2] = _Object2World[2].xyz;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = (tmpvar_9 * (tmpvar_2 * unity_Scale.w));
  mediump vec3 tmpvar_11;
  mediump vec4 normal_12;
  normal_12 = tmpvar_10;
  highp float vC_13;
  mediump vec3 x3_14;
  mediump vec3 x2_15;
  mediump vec3 x1_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAr, normal_12);
  x1_16.x = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHAg, normal_12);
  x1_16.y = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHAb, normal_12);
  x1_16.z = tmpvar_19;
  mediump vec4 tmpvar_20;
  tmpvar_20 = (normal_12.xyzz * normal_12.yzzx);
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBr, tmpvar_20);
  x2_15.x = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHBg, tmpvar_20);
  x2_15.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHBb, tmpvar_20);
  x2_15.z = tmpvar_23;
  mediump float tmpvar_24;
  tmpvar_24 = ((normal_12.x * normal_12.x) - (normal_12.y * normal_12.y));
  vC_13 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (unity_SHC.xyz * vC_13);
  x3_14 = tmpvar_25;
  tmpvar_11 = ((x1_16 + x2_15) + x3_14);
  tmpvar_4 = tmpvar_11;
  highp vec3 tmpvar_26;
  highp vec3 tmpvar_27;
  tmpvar_26 = tmpvar_1.xyz;
  tmpvar_27 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_28;
  tmpvar_28[0].x = tmpvar_26.x;
  tmpvar_28[0].y = tmpvar_27.x;
  tmpvar_28[0].z = tmpvar_2.x;
  tmpvar_28[1].x = tmpvar_26.y;
  tmpvar_28[1].y = tmpvar_27.y;
  tmpvar_28[1].z = tmpvar_2.y;
  tmpvar_28[2].x = tmpvar_26.z;
  tmpvar_28[2].y = tmpvar_27.z;
  tmpvar_28[2].z = tmpvar_2.z;
  highp vec4 tmpvar_29;
  tmpvar_29.w = 1.0;
  tmpvar_29.xyz = _WorldSpaceCameraPos;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = (tmpvar_28 * (((_World2Object * tmpvar_29).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = o_6;
  xlv_TEXCOORD3 = tmpvar_4;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
uniform sampler2D _LightBuffer;
in highp vec4 xlv_TEXCOORD0;
in highp vec3 xlv_TEXCOORD1;
in lowp vec4 xlv_COLOR0;
in highp vec4 xlv_TEXCOORD2;
in highp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = xlv_COLOR0;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  mediump float rim_9;
  highp vec4 mask_10;
  highp vec4 color_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture (_MainTex, xlv_TEXCOORD0.xy);
  color_11 = tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture (_Emissive, xlv_TEXCOORD0.xy);
  mask_10 = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_9 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((_RimColor.xyz * pow (rim_9, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_11.x;
  tmpvar_16.y = mask_10.x;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_11.y;
  tmpvar_17.y = mask_10.y;
  highp vec2 tmpvar_18;
  tmpvar_18.x = color_11.z;
  tmpvar_18.y = mask_10.z;
  highp vec2 tmpvar_19;
  tmpvar_19.x = color_11.w;
  tmpvar_19.y = mask_10.w;
  highp vec2 tmpvar_20;
  tmpvar_20 = mix (mix (tmpvar_16, tmpvar_17, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_18, tmpvar_19, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_21;
  tmpvar_21 = mix (tmpvar_20.xxx, mix (mix (vec3(clamp ((tmpvar_20.x + ((1.0 - tmpvar_20.y) * pow (tmpvar_20.x, 2.0))), 0.0, 1.0)), tmpvar_4.xyz, tmpvar_20.yyy), tmpvar_4.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_4.w, 0.0, 1.0)));
  tmpvar_5 = tmpvar_21;
  tmpvar_6 = tmpvar_15;
  highp float tmpvar_22;
  tmpvar_22 = tmpvar_20.x;
  tmpvar_7 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_6 * _Opacity);
  tmpvar_6 = tmpvar_23;
  tmpvar_8 = _Opacity;
  lowp vec4 tmpvar_24;
  tmpvar_24 = textureProj (_LightBuffer, xlv_TEXCOORD2);
  light_3 = tmpvar_24;
  mediump vec4 tmpvar_25;
  tmpvar_25 = -(log2(max (light_3, vec4(0.001, 0.001, 0.001, 0.001))));
  light_3.w = tmpvar_25.w;
  highp vec3 tmpvar_26;
  tmpvar_26 = (tmpvar_25.xyz + xlv_TEXCOORD3);
  light_3.xyz = tmpvar_26;
  lowp vec4 c_27;
  lowp float spec_28;
  mediump float tmpvar_29;
  tmpvar_29 = (tmpvar_25.w * tmpvar_7);
  spec_28 = tmpvar_29;
  mediump vec3 tmpvar_30;
  tmpvar_30 = ((tmpvar_5 * light_3.xyz) + ((light_3.xyz * _SpecColor.xyz) * spec_28));
  c_27.xyz = tmpvar_30;
  c_27.w = (tmpvar_8 + (spec_28 * _SpecColor.w));
  c_2 = c_27;
  c_2.xyz = (c_2.xyz + tmpvar_6);
  tmpvar_1 = c_2;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 35 math
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_ProjectionParams]
Vector 19 [unity_ShadowFadeCenterAndType]
Vector 20 [unity_Scale]
Vector 21 [unity_LightmapST]
Vector 22 [_MainTex_ST]
Vector 23 [_Emissive_ST]
"3.0-!!ARBvp1.0
PARAM c[24] = { { 1, 0.5 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..23] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R0.xyz, R0, vertex.attrib[14].w;
MOV R1.xyz, c[17];
MOV R1.w, c[0].x;
DP4 R0.w, vertex.position, c[8];
DP4 R2.z, R1, c[15];
DP4 R2.x, R1, c[13];
DP4 R2.y, R1, c[14];
MAD R2.xyz, R2, c[20].w, -vertex.position;
DP3 result.texcoord[1].y, R2, R0;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
MUL R1.xyz, R0.xyww, c[0].y;
MUL R1.y, R1, c[18].x;
ADD result.texcoord[2].xy, R1, R1.z;
MOV result.position, R0;
MOV R0.x, c[0];
ADD R0.y, R0.x, -c[19].w;
DP4 R0.x, vertex.position, c[3];
DP4 R1.z, vertex.position, c[11];
DP4 R1.x, vertex.position, c[9];
DP4 R1.y, vertex.position, c[10];
ADD R1.xyz, R1, -c[19];
DP3 result.texcoord[1].z, vertex.normal, R2;
DP3 result.texcoord[1].x, R2, vertex.attrib[14];
MOV result.color, vertex.color;
MOV result.texcoord[2].zw, R0;
MUL result.texcoord[4].xyz, R1, c[19].w;
MAD result.texcoord[0].zw, vertex.texcoord[1].xyxy, c[23].xyxy, c[23];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[22], c[22].zwzw;
MAD result.texcoord[3].xy, vertex.texcoord[1], c[21], c[21].zwzw;
MUL result.texcoord[4].w, -R0.x, R0.y;
END
# 35 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 36 math
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_ProjectionParams]
Vector 18 [_ScreenParams]
Vector 19 [unity_ShadowFadeCenterAndType]
Vector 20 [unity_Scale]
Vector 21 [unity_LightmapST]
Vector 22 [_MainTex_ST]
Vector 23 [_Emissive_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_color0 o3
dcl_texcoord2 o4
dcl_texcoord3 o5
dcl_texcoord4 o6
def c24, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r0.xyz, r0, v1.w
mov r1.xyz, c16
mov r1.w, c24.x
dp4 r0.w, v0, c7
dp4 r2.z, r1, c14
dp4 r2.x, r1, c12
dp4 r2.y, r1, c13
mad r2.xyz, r2, c20.w, -v0
dp3 o2.y, r2, r0
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
mul r1.xyz, r0.xyww, c24.y
mul r1.y, r1, c17.x
mad o4.xy, r1.z, c18.zwzw, r1
mov o0, r0
mov r0.x, c19.w
add r0.y, c24.x, -r0.x
dp4 r0.x, v0, c2
dp4 r1.z, v0, c10
dp4 r1.x, v0, c8
dp4 r1.y, v0, c9
add r1.xyz, r1, -c19
dp3 o2.z, v2, r2
dp3 o2.x, r2, v1
mov o3, v5
mov o4.zw, r0
mul o6.xyz, r1, c19.w
mad o1.zw, v4.xyxy, c23.xyxy, c23
mad o1.xy, v3, c22, c22.zwzw
mad o5.xy, v4, c21, c21.zwzw
mul o6.w, -r0.x, r0.y
"
}
SubProgram "d3d11 " {
// Stats: 33 math
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 160
Vector 80 [unity_LightmapST]
Vector 96 [_MainTex_ST]
Vector 112 [_Emissive_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityShadows" 416
Vector 400 [unity_ShadowFadeCenterAndType]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [glstate_matrix_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityShadows" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedphgidfggbhcpfmidlinkhnlhbeibhdafabaaaaaaleahaaaaadaaaaaa
cmaaaaaapeaaaaaamiabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheommaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaamfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaadamaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaagaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklfdeieefcoeafaaaaeaaaabaahjabaaaafjaaaaaeegiocaaa
aaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaa
acaaaaaabkaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaadpcbabaaaafaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaad
hccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaa
gfaaaaaddccabaaaafaaaaaagfaaaaadpccabaaaagaaaaaagiaaaaacadaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaadcaaaaalmccabaaa
abaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaahaaaaaakgiocaaaaaaaaaaa
ahaaaaaadiaaaaahhcaabaaaabaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaa
dcaaaaakhcaabaaaabaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaia
ebaaaaaaabaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgbpbaaa
abaaaaaadiaaaaajhcaabaaaacaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaa
adaaaaaabbaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaadaaaaaabaaaaaaa
agiacaaaabaaaaaaaeaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaa
egiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaacaaaaaa
aaaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaegiccaaaadaaaaaabdaaaaaa
dcaaaaalhcaabaaaacaaaaaaegacbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaa
egbcbaiaebaaaaaaaaaaaaaabaaaaaahcccabaaaacaaaaaaegacbaaaabaaaaaa
egacbaaaacaaaaaabaaaaaahbccabaaaacaaaaaaegbcbaaaabaaaaaaegacbaaa
acaaaaaabaaaaaaheccabaaaacaaaaaaegbcbaaaacaaaaaaegacbaaaacaaaaaa
dgaaaaafpccabaaaadaaaaaaegbobaaaafaaaaaadiaaaaaiccaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaa
agahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaaf
mccabaaaaeaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaaeaaaaaakgakbaaa
abaaaaaamgaabaaaabaaaaaadcaaaaaldccabaaaafaaaaaaegbabaaaaeaaaaaa
egiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaadiaaaaaihcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaa
egacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegiccaiaebaaaaaaacaaaaaabjaaaaaadiaaaaaihccabaaaagaaaaaa
egacbaaaaaaaaaaapgipcaaaacaaaaaabjaaaaaadiaaaaaibcaabaaaaaaaaaaa
bkbabaaaaaaaaaaackiacaaaadaaaaaaafaaaaaadcaaaaakbcaabaaaaaaaaaaa
ckiacaaaadaaaaaaaeaaaaaaakbabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaak
bcaabaaaaaaaaaaackiacaaaadaaaaaaagaaaaaackbabaaaaaaaaaaaakaabaaa
aaaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaaadaaaaaaahaaaaaadkbabaaa
aaaaaaaaakaabaaaaaaaaaaaaaaaaaajccaabaaaaaaaaaaadkiacaiaebaaaaaa
acaaaaaabjaaaaaaabeaaaaaaaaaiadpdiaaaaaiiccabaaaagaaaaaabkaabaaa
aaaaaaaaakaabaiaebaaaaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 glstate_matrix_modelview0;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_5 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_5.zw;
  tmpvar_4.xyz = (((_Object2World * _glesVertex).xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  tmpvar_4.w = (-((glstate_matrix_modelview0 * _glesVertex).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  highp vec3 tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_9 = tmpvar_1.xyz;
  tmpvar_10 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_11;
  tmpvar_11[0].x = tmpvar_9.x;
  tmpvar_11[0].y = tmpvar_10.x;
  tmpvar_11[0].z = tmpvar_2.x;
  tmpvar_11[1].x = tmpvar_9.y;
  tmpvar_11[1].y = tmpvar_10.y;
  tmpvar_11[1].z = tmpvar_2.y;
  tmpvar_11[2].x = tmpvar_9.z;
  tmpvar_11[2].y = tmpvar_10.z;
  tmpvar_11[2].z = tmpvar_2.z;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = _WorldSpaceCameraPos;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = (tmpvar_11 * (((_World2Object * tmpvar_12).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = o_6;
  xlv_TEXCOORD3 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD4 = tmpvar_4;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
uniform sampler2D _LightBuffer;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
uniform highp vec4 unity_LightmapFade;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec3 lmIndirect_3;
  mediump vec3 lmFull_4;
  mediump float lmFade_5;
  mediump vec4 light_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = xlv_COLOR0;
  lowp vec3 tmpvar_8;
  lowp vec3 tmpvar_9;
  lowp float tmpvar_10;
  lowp float tmpvar_11;
  mediump float rim_12;
  highp vec4 mask_13;
  highp vec4 color_14;
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  color_14 = tmpvar_15;
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_Emissive, xlv_TEXCOORD0.xy);
  mask_13 = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_12 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = ((_RimColor.xyz * pow (rim_12, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_19;
  tmpvar_19.x = color_14.x;
  tmpvar_19.y = mask_13.x;
  highp vec2 tmpvar_20;
  tmpvar_20.x = color_14.y;
  tmpvar_20.y = mask_13.y;
  highp vec2 tmpvar_21;
  tmpvar_21.x = color_14.z;
  tmpvar_21.y = mask_13.z;
  highp vec2 tmpvar_22;
  tmpvar_22.x = color_14.w;
  tmpvar_22.y = mask_13.w;
  highp vec2 tmpvar_23;
  tmpvar_23 = mix (mix (tmpvar_19, tmpvar_20, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_21, tmpvar_22, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_24;
  tmpvar_24 = mix (tmpvar_23.xxx, mix (mix (vec3(clamp ((tmpvar_23.x + ((1.0 - tmpvar_23.y) * pow (tmpvar_23.x, 2.0))), 0.0, 1.0)), tmpvar_7.xyz, tmpvar_23.yyy), tmpvar_7.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_7.w, 0.0, 1.0)));
  tmpvar_8 = tmpvar_24;
  tmpvar_9 = tmpvar_18;
  highp float tmpvar_25;
  tmpvar_25 = tmpvar_23.x;
  tmpvar_10 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26 = (tmpvar_9 * _Opacity);
  tmpvar_9 = tmpvar_26;
  tmpvar_11 = _Opacity;
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_6 = tmpvar_27;
  mediump vec4 tmpvar_28;
  tmpvar_28 = -(log2(max (light_6, vec4(0.001, 0.001, 0.001, 0.001))));
  light_6.w = tmpvar_28.w;
  highp float tmpvar_29;
  tmpvar_29 = ((sqrt(dot (xlv_TEXCOORD4, xlv_TEXCOORD4)) * unity_LightmapFade.z) + unity_LightmapFade.w);
  lmFade_5 = tmpvar_29;
  lowp vec3 tmpvar_30;
  tmpvar_30 = (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD3).xyz);
  lmFull_4 = tmpvar_30;
  lowp vec3 tmpvar_31;
  tmpvar_31 = (2.0 * texture2D (unity_LightmapInd, xlv_TEXCOORD3).xyz);
  lmIndirect_3 = tmpvar_31;
  light_6.xyz = (tmpvar_28.xyz + mix (lmIndirect_3, lmFull_4, vec3(clamp (lmFade_5, 0.0, 1.0))));
  lowp vec4 c_32;
  lowp float spec_33;
  mediump float tmpvar_34;
  tmpvar_34 = (tmpvar_28.w * tmpvar_10);
  spec_33 = tmpvar_34;
  mediump vec3 tmpvar_35;
  tmpvar_35 = ((tmpvar_8 * light_6.xyz) + ((light_6.xyz * _SpecColor.xyz) * spec_33));
  c_32.xyz = tmpvar_35;
  c_32.w = (tmpvar_11 + (spec_33 * _SpecColor.w));
  c_2 = c_32;
  c_2.xyz = (c_2.xyz + tmpvar_9);
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 glstate_matrix_modelview0;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_5 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_5.zw;
  tmpvar_4.xyz = (((_Object2World * _glesVertex).xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  tmpvar_4.w = (-((glstate_matrix_modelview0 * _glesVertex).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  highp vec3 tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_9 = tmpvar_1.xyz;
  tmpvar_10 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_11;
  tmpvar_11[0].x = tmpvar_9.x;
  tmpvar_11[0].y = tmpvar_10.x;
  tmpvar_11[0].z = tmpvar_2.x;
  tmpvar_11[1].x = tmpvar_9.y;
  tmpvar_11[1].y = tmpvar_10.y;
  tmpvar_11[1].z = tmpvar_2.y;
  tmpvar_11[2].x = tmpvar_9.z;
  tmpvar_11[2].y = tmpvar_10.z;
  tmpvar_11[2].z = tmpvar_2.z;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = _WorldSpaceCameraPos;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = (tmpvar_11 * (((_World2Object * tmpvar_12).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = o_6;
  xlv_TEXCOORD3 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD4 = tmpvar_4;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
uniform sampler2D _LightBuffer;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
uniform highp vec4 unity_LightmapFade;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec3 lmIndirect_3;
  mediump vec3 lmFull_4;
  mediump float lmFade_5;
  mediump vec4 light_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = xlv_COLOR0;
  lowp vec3 tmpvar_8;
  lowp vec3 tmpvar_9;
  lowp float tmpvar_10;
  lowp float tmpvar_11;
  mediump float rim_12;
  highp vec4 mask_13;
  highp vec4 color_14;
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  color_14 = tmpvar_15;
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_Emissive, xlv_TEXCOORD0.xy);
  mask_13 = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_12 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = ((_RimColor.xyz * pow (rim_12, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_19;
  tmpvar_19.x = color_14.x;
  tmpvar_19.y = mask_13.x;
  highp vec2 tmpvar_20;
  tmpvar_20.x = color_14.y;
  tmpvar_20.y = mask_13.y;
  highp vec2 tmpvar_21;
  tmpvar_21.x = color_14.z;
  tmpvar_21.y = mask_13.z;
  highp vec2 tmpvar_22;
  tmpvar_22.x = color_14.w;
  tmpvar_22.y = mask_13.w;
  highp vec2 tmpvar_23;
  tmpvar_23 = mix (mix (tmpvar_19, tmpvar_20, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_21, tmpvar_22, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_24;
  tmpvar_24 = mix (tmpvar_23.xxx, mix (mix (vec3(clamp ((tmpvar_23.x + ((1.0 - tmpvar_23.y) * pow (tmpvar_23.x, 2.0))), 0.0, 1.0)), tmpvar_7.xyz, tmpvar_23.yyy), tmpvar_7.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_7.w, 0.0, 1.0)));
  tmpvar_8 = tmpvar_24;
  tmpvar_9 = tmpvar_18;
  highp float tmpvar_25;
  tmpvar_25 = tmpvar_23.x;
  tmpvar_10 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26 = (tmpvar_9 * _Opacity);
  tmpvar_9 = tmpvar_26;
  tmpvar_11 = _Opacity;
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_6 = tmpvar_27;
  mediump vec4 tmpvar_28;
  tmpvar_28 = -(log2(max (light_6, vec4(0.001, 0.001, 0.001, 0.001))));
  light_6.w = tmpvar_28.w;
  lowp vec4 tmpvar_29;
  tmpvar_29 = texture2D (unity_Lightmap, xlv_TEXCOORD3);
  lowp vec4 tmpvar_30;
  tmpvar_30 = texture2D (unity_LightmapInd, xlv_TEXCOORD3);
  highp float tmpvar_31;
  tmpvar_31 = ((sqrt(dot (xlv_TEXCOORD4, xlv_TEXCOORD4)) * unity_LightmapFade.z) + unity_LightmapFade.w);
  lmFade_5 = tmpvar_31;
  lowp vec3 tmpvar_32;
  tmpvar_32 = ((8.0 * tmpvar_29.w) * tmpvar_29.xyz);
  lmFull_4 = tmpvar_32;
  lowp vec3 tmpvar_33;
  tmpvar_33 = ((8.0 * tmpvar_30.w) * tmpvar_30.xyz);
  lmIndirect_3 = tmpvar_33;
  light_6.xyz = (tmpvar_28.xyz + mix (lmIndirect_3, lmFull_4, vec3(clamp (lmFade_5, 0.0, 1.0))));
  lowp vec4 c_34;
  lowp float spec_35;
  mediump float tmpvar_36;
  tmpvar_36 = (tmpvar_28.w * tmpvar_10);
  spec_35 = tmpvar_36;
  mediump vec3 tmpvar_37;
  tmpvar_37 = ((tmpvar_8 * light_6.xyz) + ((light_6.xyz * _SpecColor.xyz) * spec_35));
  c_34.xyz = tmpvar_37;
  c_34.w = (tmpvar_11 + (spec_35 * _SpecColor.w));
  c_2 = c_34;
  c_2.xyz = (c_2.xyz + tmpvar_9);
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesColor;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
in vec4 _glesMultiTexCoord1;
in vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 glstate_matrix_modelview0;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec3 xlv_TEXCOORD1;
out lowp vec4 xlv_COLOR0;
out highp vec4 xlv_TEXCOORD2;
out highp vec2 xlv_TEXCOORD3;
out highp vec4 xlv_TEXCOORD4;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_5 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_5.zw;
  tmpvar_4.xyz = (((_Object2World * _glesVertex).xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  tmpvar_4.w = (-((glstate_matrix_modelview0 * _glesVertex).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  highp vec3 tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_9 = tmpvar_1.xyz;
  tmpvar_10 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_11;
  tmpvar_11[0].x = tmpvar_9.x;
  tmpvar_11[0].y = tmpvar_10.x;
  tmpvar_11[0].z = tmpvar_2.x;
  tmpvar_11[1].x = tmpvar_9.y;
  tmpvar_11[1].y = tmpvar_10.y;
  tmpvar_11[1].z = tmpvar_2.y;
  tmpvar_11[2].x = tmpvar_9.z;
  tmpvar_11[2].y = tmpvar_10.z;
  tmpvar_11[2].z = tmpvar_2.z;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = _WorldSpaceCameraPos;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = (tmpvar_11 * (((_World2Object * tmpvar_12).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = o_6;
  xlv_TEXCOORD3 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD4 = tmpvar_4;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
uniform sampler2D _LightBuffer;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
uniform highp vec4 unity_LightmapFade;
in highp vec4 xlv_TEXCOORD0;
in highp vec3 xlv_TEXCOORD1;
in lowp vec4 xlv_COLOR0;
in highp vec4 xlv_TEXCOORD2;
in highp vec2 xlv_TEXCOORD3;
in highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec3 lmIndirect_3;
  mediump vec3 lmFull_4;
  mediump float lmFade_5;
  mediump vec4 light_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = xlv_COLOR0;
  lowp vec3 tmpvar_8;
  lowp vec3 tmpvar_9;
  lowp float tmpvar_10;
  lowp float tmpvar_11;
  mediump float rim_12;
  highp vec4 mask_13;
  highp vec4 color_14;
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture (_MainTex, xlv_TEXCOORD0.xy);
  color_14 = tmpvar_15;
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture (_Emissive, xlv_TEXCOORD0.xy);
  mask_13 = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_12 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = ((_RimColor.xyz * pow (rim_12, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_19;
  tmpvar_19.x = color_14.x;
  tmpvar_19.y = mask_13.x;
  highp vec2 tmpvar_20;
  tmpvar_20.x = color_14.y;
  tmpvar_20.y = mask_13.y;
  highp vec2 tmpvar_21;
  tmpvar_21.x = color_14.z;
  tmpvar_21.y = mask_13.z;
  highp vec2 tmpvar_22;
  tmpvar_22.x = color_14.w;
  tmpvar_22.y = mask_13.w;
  highp vec2 tmpvar_23;
  tmpvar_23 = mix (mix (tmpvar_19, tmpvar_20, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_21, tmpvar_22, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_24;
  tmpvar_24 = mix (tmpvar_23.xxx, mix (mix (vec3(clamp ((tmpvar_23.x + ((1.0 - tmpvar_23.y) * pow (tmpvar_23.x, 2.0))), 0.0, 1.0)), tmpvar_7.xyz, tmpvar_23.yyy), tmpvar_7.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_7.w, 0.0, 1.0)));
  tmpvar_8 = tmpvar_24;
  tmpvar_9 = tmpvar_18;
  highp float tmpvar_25;
  tmpvar_25 = tmpvar_23.x;
  tmpvar_10 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26 = (tmpvar_9 * _Opacity);
  tmpvar_9 = tmpvar_26;
  tmpvar_11 = _Opacity;
  lowp vec4 tmpvar_27;
  tmpvar_27 = textureProj (_LightBuffer, xlv_TEXCOORD2);
  light_6 = tmpvar_27;
  mediump vec4 tmpvar_28;
  tmpvar_28 = -(log2(max (light_6, vec4(0.001, 0.001, 0.001, 0.001))));
  light_6.w = tmpvar_28.w;
  highp float tmpvar_29;
  tmpvar_29 = ((sqrt(dot (xlv_TEXCOORD4, xlv_TEXCOORD4)) * unity_LightmapFade.z) + unity_LightmapFade.w);
  lmFade_5 = tmpvar_29;
  lowp vec3 tmpvar_30;
  tmpvar_30 = (2.0 * texture (unity_Lightmap, xlv_TEXCOORD3).xyz);
  lmFull_4 = tmpvar_30;
  lowp vec3 tmpvar_31;
  tmpvar_31 = (2.0 * texture (unity_LightmapInd, xlv_TEXCOORD3).xyz);
  lmIndirect_3 = tmpvar_31;
  light_6.xyz = (tmpvar_28.xyz + mix (lmIndirect_3, lmFull_4, vec3(clamp (lmFade_5, 0.0, 1.0))));
  lowp vec4 c_32;
  lowp float spec_33;
  mediump float tmpvar_34;
  tmpvar_34 = (tmpvar_28.w * tmpvar_10);
  spec_33 = tmpvar_34;
  mediump vec3 tmpvar_35;
  tmpvar_35 = ((tmpvar_8 * light_6.xyz) + ((light_6.xyz * _SpecColor.xyz) * spec_33));
  c_32.xyz = tmpvar_35;
  c_32.w = (tmpvar_11 + (spec_33 * _SpecColor.w));
  c_2 = c_32;
  c_2.xyz = (c_2.xyz + tmpvar_9);
  tmpvar_1 = c_2;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 26 math
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_World2Object]
Vector 9 [_WorldSpaceCameraPos]
Vector 10 [_ProjectionParams]
Vector 11 [unity_Scale]
Vector 12 [unity_LightmapST]
Vector 13 [_MainTex_ST]
Vector 14 [_Emissive_ST]
"3.0-!!ARBvp1.0
PARAM c[15] = { { 1, 0.5 },
		state.matrix.mvp,
		program.local[5..14] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R0.xyz, R0, vertex.attrib[14].w;
MOV R1.xyz, c[9];
MOV R1.w, c[0].x;
DP4 R0.w, vertex.position, c[4];
DP4 R2.z, R1, c[7];
DP4 R2.x, R1, c[5];
DP4 R2.y, R1, c[6];
MAD R2.xyz, R2, c[11].w, -vertex.position;
DP3 result.texcoord[1].y, R2, R0;
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].y;
MUL R1.y, R1, c[10].x;
DP3 result.texcoord[1].z, vertex.normal, R2;
DP3 result.texcoord[1].x, R2, vertex.attrib[14];
ADD result.texcoord[2].xy, R1, R1.z;
MOV result.position, R0;
MOV result.color, vertex.color;
MOV result.texcoord[2].zw, R0;
MAD result.texcoord[0].zw, vertex.texcoord[1].xyxy, c[14].xyxy, c[14];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[13], c[13].zwzw;
MAD result.texcoord[3].xy, vertex.texcoord[1], c[12], c[12].zwzw;
END
# 26 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 27 math
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_World2Object]
Vector 8 [_WorldSpaceCameraPos]
Vector 9 [_ProjectionParams]
Vector 10 [_ScreenParams]
Vector 11 [unity_Scale]
Vector 12 [unity_LightmapST]
Vector 13 [_MainTex_ST]
Vector 14 [_Emissive_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_color0 o3
dcl_texcoord2 o4
dcl_texcoord3 o5
def c15, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r0.xyz, r0, v1.w
mov r1.xyz, c8
mov r1.w, c15.x
dp4 r0.w, v0, c3
dp4 r2.z, r1, c6
dp4 r2.x, r1, c4
dp4 r2.y, r1, c5
mad r2.xyz, r2, c11.w, -v0
dp3 o2.y, r2, r0
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c15.y
mul r1.y, r1, c9.x
dp3 o2.z, v2, r2
dp3 o2.x, r2, v1
mad o4.xy, r1.z, c10.zwzw, r1
mov o0, r0
mov o3, v5
mov o4.zw, r0
mad o1.zw, v4.xyxy, c14.xyxy, c14
mad o1.xy, v3, c13, c13.zwzw
mad o5.xy, v4, c12, c12.zwzw
"
}
SubProgram "d3d11 " {
// Stats: 21 math
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 160
Vector 80 [unity_LightmapST]
Vector 96 [_MainTex_ST]
Vector 112 [_Emissive_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedadibmkgeopmjnppgipficfcliahgmoohabaaaaaamiafaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaadamaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefcbaaeaaaaeaaaabaaaeabaaaa
fjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaa
fjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
pcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaa
gfaaaaadpccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagfaaaaaddccabaaa
afaaaaaagiaaaaacadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaa
agaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaa
ahaaaaaakgiocaaaaaaaaaaaahaaaaaadiaaaaahhcaabaaaabaaaaaajgbebaaa
abaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaabaaaaaajgbebaaaacaaaaaa
cgbjbaaaabaaaaaaegacbaiaebaaaaaaabaaaaaadiaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaapgbpbaaaabaaaaaadiaaaaajhcaabaaaacaaaaaafgifcaaa
abaaaaaaaeaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaaacaaaaaa
egiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaacaaaaaa
dcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaaabaaaaaa
aeaaaaaaegacbaaaacaaaaaaaaaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaa
egiccaaaacaaaaaabdaaaaaadcaaaaalhcaabaaaacaaaaaaegacbaaaacaaaaaa
pgipcaaaacaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaahcccabaaa
acaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaabaaaaaahbccabaaaacaaaaaa
egbcbaaaabaaaaaaegacbaaaacaaaaaabaaaaaaheccabaaaacaaaaaaegbcbaaa
acaaaaaaegacbaaaacaaaaaadgaaaaafpccabaaaadaaaaaaegbobaaaafaaaaaa
diaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaa
diaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaa
aaaaaadpaaaaaadpdgaaaaafmccabaaaaeaaaaaakgaobaaaaaaaaaaaaaaaaaah
dccabaaaaeaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadcaaaaaldccabaaa
afaaaaaaegbabaaaaeaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaa
afaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec4 o_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = tmpvar_6.x;
  tmpvar_7.y = (tmpvar_6.y * _ProjectionParams.x);
  o_5.xy = (tmpvar_7 + tmpvar_6.w);
  o_5.zw = tmpvar_4.zw;
  highp vec3 tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_8 = tmpvar_1.xyz;
  tmpvar_9 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_10;
  tmpvar_10[0].x = tmpvar_8.x;
  tmpvar_10[0].y = tmpvar_9.x;
  tmpvar_10[0].z = tmpvar_2.x;
  tmpvar_10[1].x = tmpvar_8.y;
  tmpvar_10[1].y = tmpvar_9.y;
  tmpvar_10[1].z = tmpvar_2.y;
  tmpvar_10[2].x = tmpvar_8.z;
  tmpvar_10[2].y = tmpvar_9.z;
  tmpvar_10[2].z = tmpvar_2.z;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = (tmpvar_10 * (((_World2Object * tmpvar_11).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = o_5;
  xlv_TEXCOORD3 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _SpecColor;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
uniform sampler2D _LightBuffer;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = xlv_COLOR0;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  mediump float rim_9;
  highp vec4 mask_10;
  highp vec4 color_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  color_11 = tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Emissive, xlv_TEXCOORD0.xy);
  mask_10 = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_9 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((_RimColor.xyz * pow (rim_9, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_11.x;
  tmpvar_16.y = mask_10.x;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_11.y;
  tmpvar_17.y = mask_10.y;
  highp vec2 tmpvar_18;
  tmpvar_18.x = color_11.z;
  tmpvar_18.y = mask_10.z;
  highp vec2 tmpvar_19;
  tmpvar_19.x = color_11.w;
  tmpvar_19.y = mask_10.w;
  highp vec2 tmpvar_20;
  tmpvar_20 = mix (mix (tmpvar_16, tmpvar_17, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_18, tmpvar_19, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_21;
  tmpvar_21 = mix (tmpvar_20.xxx, mix (mix (vec3(clamp ((tmpvar_20.x + ((1.0 - tmpvar_20.y) * pow (tmpvar_20.x, 2.0))), 0.0, 1.0)), tmpvar_4.xyz, tmpvar_20.yyy), tmpvar_4.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_4.w, 0.0, 1.0)));
  tmpvar_5 = tmpvar_21;
  tmpvar_6 = tmpvar_15;
  highp float tmpvar_22;
  tmpvar_22 = tmpvar_20.x;
  tmpvar_7 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_6 * _Opacity);
  tmpvar_6 = tmpvar_23;
  tmpvar_8 = _Opacity;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_3 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = normalize(xlv_TEXCOORD1);
  mediump vec4 tmpvar_26;
  mediump vec3 viewDir_27;
  viewDir_27 = tmpvar_25;
  highp float nh_28;
  mat3 tmpvar_29;
  tmpvar_29[0].x = 0.816497;
  tmpvar_29[0].y = -0.408248;
  tmpvar_29[0].z = -0.408248;
  tmpvar_29[1].x = 0.0;
  tmpvar_29[1].y = 0.707107;
  tmpvar_29[1].z = -0.707107;
  tmpvar_29[2].x = 0.57735;
  tmpvar_29[2].y = 0.57735;
  tmpvar_29[2].z = 0.57735;
  mediump vec3 scalePerBasisVector_30;
  mediump vec3 lm_31;
  lowp vec3 tmpvar_32;
  tmpvar_32 = (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD3).xyz);
  lm_31 = tmpvar_32;
  lowp vec3 tmpvar_33;
  tmpvar_33 = (2.0 * texture2D (unity_LightmapInd, xlv_TEXCOORD3).xyz);
  scalePerBasisVector_30 = tmpvar_33;
  lm_31 = (lm_31 * dot (clamp ((tmpvar_29 * vec3(0.0, 0.0, 1.0)), 0.0, 1.0), scalePerBasisVector_30));
  vec3 v_34;
  v_34.x = tmpvar_29[0].x;
  v_34.y = tmpvar_29[1].x;
  v_34.z = tmpvar_29[2].x;
  vec3 v_35;
  v_35.x = tmpvar_29[0].y;
  v_35.y = tmpvar_29[1].y;
  v_35.z = tmpvar_29[2].y;
  vec3 v_36;
  v_36.x = tmpvar_29[0].z;
  v_36.y = tmpvar_29[1].z;
  v_36.z = tmpvar_29[2].z;
  mediump float tmpvar_37;
  tmpvar_37 = max (0.0, normalize((normalize((((scalePerBasisVector_30.x * v_34) + (scalePerBasisVector_30.y * v_35)) + (scalePerBasisVector_30.z * v_36))) + viewDir_27)).z);
  nh_28 = tmpvar_37;
  mediump float arg1_38;
  arg1_38 = (_Shininess * 128.0);
  highp vec4 tmpvar_39;
  tmpvar_39.xyz = lm_31;
  tmpvar_39.w = pow (nh_28, arg1_38);
  tmpvar_26 = tmpvar_39;
  mediump vec4 tmpvar_40;
  tmpvar_40 = (-(log2(max (light_3, vec4(0.001, 0.001, 0.001, 0.001)))) + tmpvar_26);
  light_3 = tmpvar_40;
  lowp vec4 c_41;
  lowp float spec_42;
  mediump float tmpvar_43;
  tmpvar_43 = (tmpvar_40.w * tmpvar_7);
  spec_42 = tmpvar_43;
  mediump vec3 tmpvar_44;
  tmpvar_44 = ((tmpvar_5 * tmpvar_40.xyz) + ((tmpvar_40.xyz * _SpecColor.xyz) * spec_42));
  c_41.xyz = tmpvar_44;
  c_41.w = (tmpvar_8 + (spec_42 * _SpecColor.w));
  c_2 = c_41;
  c_2.xyz = (c_2.xyz + tmpvar_6);
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec4 o_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = tmpvar_6.x;
  tmpvar_7.y = (tmpvar_6.y * _ProjectionParams.x);
  o_5.xy = (tmpvar_7 + tmpvar_6.w);
  o_5.zw = tmpvar_4.zw;
  highp vec3 tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_8 = tmpvar_1.xyz;
  tmpvar_9 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_10;
  tmpvar_10[0].x = tmpvar_8.x;
  tmpvar_10[0].y = tmpvar_9.x;
  tmpvar_10[0].z = tmpvar_2.x;
  tmpvar_10[1].x = tmpvar_8.y;
  tmpvar_10[1].y = tmpvar_9.y;
  tmpvar_10[1].z = tmpvar_2.y;
  tmpvar_10[2].x = tmpvar_8.z;
  tmpvar_10[2].y = tmpvar_9.z;
  tmpvar_10[2].z = tmpvar_2.z;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = (tmpvar_10 * (((_World2Object * tmpvar_11).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = o_5;
  xlv_TEXCOORD3 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _SpecColor;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
uniform sampler2D _LightBuffer;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = xlv_COLOR0;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  mediump float rim_9;
  highp vec4 mask_10;
  highp vec4 color_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  color_11 = tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Emissive, xlv_TEXCOORD0.xy);
  mask_10 = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_9 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((_RimColor.xyz * pow (rim_9, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_11.x;
  tmpvar_16.y = mask_10.x;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_11.y;
  tmpvar_17.y = mask_10.y;
  highp vec2 tmpvar_18;
  tmpvar_18.x = color_11.z;
  tmpvar_18.y = mask_10.z;
  highp vec2 tmpvar_19;
  tmpvar_19.x = color_11.w;
  tmpvar_19.y = mask_10.w;
  highp vec2 tmpvar_20;
  tmpvar_20 = mix (mix (tmpvar_16, tmpvar_17, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_18, tmpvar_19, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_21;
  tmpvar_21 = mix (tmpvar_20.xxx, mix (mix (vec3(clamp ((tmpvar_20.x + ((1.0 - tmpvar_20.y) * pow (tmpvar_20.x, 2.0))), 0.0, 1.0)), tmpvar_4.xyz, tmpvar_20.yyy), tmpvar_4.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_4.w, 0.0, 1.0)));
  tmpvar_5 = tmpvar_21;
  tmpvar_6 = tmpvar_15;
  highp float tmpvar_22;
  tmpvar_22 = tmpvar_20.x;
  tmpvar_7 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_6 * _Opacity);
  tmpvar_6 = tmpvar_23;
  tmpvar_8 = _Opacity;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_3 = tmpvar_24;
  lowp vec4 tmpvar_25;
  tmpvar_25 = texture2D (unity_Lightmap, xlv_TEXCOORD3);
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (unity_LightmapInd, xlv_TEXCOORD3);
  highp vec3 tmpvar_27;
  tmpvar_27 = normalize(xlv_TEXCOORD1);
  mediump vec4 tmpvar_28;
  mediump vec3 viewDir_29;
  viewDir_29 = tmpvar_27;
  highp float nh_30;
  mat3 tmpvar_31;
  tmpvar_31[0].x = 0.816497;
  tmpvar_31[0].y = -0.408248;
  tmpvar_31[0].z = -0.408248;
  tmpvar_31[1].x = 0.0;
  tmpvar_31[1].y = 0.707107;
  tmpvar_31[1].z = -0.707107;
  tmpvar_31[2].x = 0.57735;
  tmpvar_31[2].y = 0.57735;
  tmpvar_31[2].z = 0.57735;
  mediump vec3 scalePerBasisVector_32;
  mediump vec3 lm_33;
  lowp vec3 tmpvar_34;
  tmpvar_34 = ((8.0 * tmpvar_25.w) * tmpvar_25.xyz);
  lm_33 = tmpvar_34;
  lowp vec3 tmpvar_35;
  tmpvar_35 = ((8.0 * tmpvar_26.w) * tmpvar_26.xyz);
  scalePerBasisVector_32 = tmpvar_35;
  lm_33 = (lm_33 * dot (clamp ((tmpvar_31 * vec3(0.0, 0.0, 1.0)), 0.0, 1.0), scalePerBasisVector_32));
  vec3 v_36;
  v_36.x = tmpvar_31[0].x;
  v_36.y = tmpvar_31[1].x;
  v_36.z = tmpvar_31[2].x;
  vec3 v_37;
  v_37.x = tmpvar_31[0].y;
  v_37.y = tmpvar_31[1].y;
  v_37.z = tmpvar_31[2].y;
  vec3 v_38;
  v_38.x = tmpvar_31[0].z;
  v_38.y = tmpvar_31[1].z;
  v_38.z = tmpvar_31[2].z;
  mediump float tmpvar_39;
  tmpvar_39 = max (0.0, normalize((normalize((((scalePerBasisVector_32.x * v_36) + (scalePerBasisVector_32.y * v_37)) + (scalePerBasisVector_32.z * v_38))) + viewDir_29)).z);
  nh_30 = tmpvar_39;
  mediump float arg1_40;
  arg1_40 = (_Shininess * 128.0);
  highp vec4 tmpvar_41;
  tmpvar_41.xyz = lm_33;
  tmpvar_41.w = pow (nh_30, arg1_40);
  tmpvar_28 = tmpvar_41;
  mediump vec4 tmpvar_42;
  tmpvar_42 = (-(log2(max (light_3, vec4(0.001, 0.001, 0.001, 0.001)))) + tmpvar_28);
  light_3 = tmpvar_42;
  lowp vec4 c_43;
  lowp float spec_44;
  mediump float tmpvar_45;
  tmpvar_45 = (tmpvar_42.w * tmpvar_7);
  spec_44 = tmpvar_45;
  mediump vec3 tmpvar_46;
  tmpvar_46 = ((tmpvar_5 * tmpvar_42.xyz) + ((tmpvar_42.xyz * _SpecColor.xyz) * spec_44));
  c_43.xyz = tmpvar_46;
  c_43.w = (tmpvar_8 + (spec_44 * _SpecColor.w));
  c_2 = c_43;
  c_2.xyz = (c_2.xyz + tmpvar_6);
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesColor;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
in vec4 _glesMultiTexCoord1;
in vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec3 xlv_TEXCOORD1;
out lowp vec4 xlv_COLOR0;
out highp vec4 xlv_TEXCOORD2;
out highp vec2 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec4 o_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = tmpvar_6.x;
  tmpvar_7.y = (tmpvar_6.y * _ProjectionParams.x);
  o_5.xy = (tmpvar_7 + tmpvar_6.w);
  o_5.zw = tmpvar_4.zw;
  highp vec3 tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_8 = tmpvar_1.xyz;
  tmpvar_9 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_10;
  tmpvar_10[0].x = tmpvar_8.x;
  tmpvar_10[0].y = tmpvar_9.x;
  tmpvar_10[0].z = tmpvar_2.x;
  tmpvar_10[1].x = tmpvar_8.y;
  tmpvar_10[1].y = tmpvar_9.y;
  tmpvar_10[1].z = tmpvar_2.y;
  tmpvar_10[2].x = tmpvar_8.z;
  tmpvar_10[2].y = tmpvar_9.z;
  tmpvar_10[2].z = tmpvar_2.z;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = (tmpvar_10 * (((_World2Object * tmpvar_11).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = o_5;
  xlv_TEXCOORD3 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform lowp vec4 _SpecColor;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
uniform sampler2D _LightBuffer;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
in highp vec4 xlv_TEXCOORD0;
in highp vec3 xlv_TEXCOORD1;
in lowp vec4 xlv_COLOR0;
in highp vec4 xlv_TEXCOORD2;
in highp vec2 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = xlv_COLOR0;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  mediump float rim_9;
  highp vec4 mask_10;
  highp vec4 color_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture (_MainTex, xlv_TEXCOORD0.xy);
  color_11 = tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture (_Emissive, xlv_TEXCOORD0.xy);
  mask_10 = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_9 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((_RimColor.xyz * pow (rim_9, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_11.x;
  tmpvar_16.y = mask_10.x;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_11.y;
  tmpvar_17.y = mask_10.y;
  highp vec2 tmpvar_18;
  tmpvar_18.x = color_11.z;
  tmpvar_18.y = mask_10.z;
  highp vec2 tmpvar_19;
  tmpvar_19.x = color_11.w;
  tmpvar_19.y = mask_10.w;
  highp vec2 tmpvar_20;
  tmpvar_20 = mix (mix (tmpvar_16, tmpvar_17, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_18, tmpvar_19, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_21;
  tmpvar_21 = mix (tmpvar_20.xxx, mix (mix (vec3(clamp ((tmpvar_20.x + ((1.0 - tmpvar_20.y) * pow (tmpvar_20.x, 2.0))), 0.0, 1.0)), tmpvar_4.xyz, tmpvar_20.yyy), tmpvar_4.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_4.w, 0.0, 1.0)));
  tmpvar_5 = tmpvar_21;
  tmpvar_6 = tmpvar_15;
  highp float tmpvar_22;
  tmpvar_22 = tmpvar_20.x;
  tmpvar_7 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_6 * _Opacity);
  tmpvar_6 = tmpvar_23;
  tmpvar_8 = _Opacity;
  lowp vec4 tmpvar_24;
  tmpvar_24 = textureProj (_LightBuffer, xlv_TEXCOORD2);
  light_3 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = normalize(xlv_TEXCOORD1);
  mediump vec4 tmpvar_26;
  mediump vec3 viewDir_27;
  viewDir_27 = tmpvar_25;
  highp float nh_28;
  mat3 tmpvar_29;
  tmpvar_29[0].x = 0.816497;
  tmpvar_29[0].y = -0.408248;
  tmpvar_29[0].z = -0.408248;
  tmpvar_29[1].x = 0.0;
  tmpvar_29[1].y = 0.707107;
  tmpvar_29[1].z = -0.707107;
  tmpvar_29[2].x = 0.57735;
  tmpvar_29[2].y = 0.57735;
  tmpvar_29[2].z = 0.57735;
  mediump vec3 scalePerBasisVector_30;
  mediump vec3 lm_31;
  lowp vec3 tmpvar_32;
  tmpvar_32 = (2.0 * texture (unity_Lightmap, xlv_TEXCOORD3).xyz);
  lm_31 = tmpvar_32;
  lowp vec3 tmpvar_33;
  tmpvar_33 = (2.0 * texture (unity_LightmapInd, xlv_TEXCOORD3).xyz);
  scalePerBasisVector_30 = tmpvar_33;
  lm_31 = (lm_31 * dot (clamp ((tmpvar_29 * vec3(0.0, 0.0, 1.0)), 0.0, 1.0), scalePerBasisVector_30));
  vec3 v_34;
  v_34.x = tmpvar_29[0].x;
  v_34.y = tmpvar_29[1].x;
  v_34.z = tmpvar_29[2].x;
  vec3 v_35;
  v_35.x = tmpvar_29[0].y;
  v_35.y = tmpvar_29[1].y;
  v_35.z = tmpvar_29[2].y;
  vec3 v_36;
  v_36.x = tmpvar_29[0].z;
  v_36.y = tmpvar_29[1].z;
  v_36.z = tmpvar_29[2].z;
  mediump float tmpvar_37;
  tmpvar_37 = max (0.0, normalize((normalize((((scalePerBasisVector_30.x * v_34) + (scalePerBasisVector_30.y * v_35)) + (scalePerBasisVector_30.z * v_36))) + viewDir_27)).z);
  nh_28 = tmpvar_37;
  mediump float arg1_38;
  arg1_38 = (_Shininess * 128.0);
  highp vec4 tmpvar_39;
  tmpvar_39.xyz = lm_31;
  tmpvar_39.w = pow (nh_28, arg1_38);
  tmpvar_26 = tmpvar_39;
  mediump vec4 tmpvar_40;
  tmpvar_40 = (-(log2(max (light_3, vec4(0.001, 0.001, 0.001, 0.001)))) + tmpvar_26);
  light_3 = tmpvar_40;
  lowp vec4 c_41;
  lowp float spec_42;
  mediump float tmpvar_43;
  tmpvar_43 = (tmpvar_40.w * tmpvar_7);
  spec_42 = tmpvar_43;
  mediump vec3 tmpvar_44;
  tmpvar_44 = ((tmpvar_5 * tmpvar_40.xyz) + ((tmpvar_40.xyz * _SpecColor.xyz) * spec_42));
  c_41.xyz = tmpvar_44;
  c_41.w = (tmpvar_8 + (spec_42 * _SpecColor.w));
  c_2 = c_41;
  c_2.xyz = (c_2.xyz + tmpvar_6);
  tmpvar_1 = c_2;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 43 math
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_ProjectionParams]
Vector 15 [unity_SHAr]
Vector 16 [unity_SHAg]
Vector 17 [unity_SHAb]
Vector 18 [unity_SHBr]
Vector 19 [unity_SHBg]
Vector 20 [unity_SHBb]
Vector 21 [unity_SHC]
Vector 22 [unity_Scale]
Vector 23 [_MainTex_ST]
Vector 24 [_Emissive_ST]
"3.0-!!ARBvp1.0
PARAM c[25] = { { 1, 0.5 },
		state.matrix.mvp,
		program.local[5..24] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[22].w;
DP3 R2.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[17];
DP4 R2.y, R0, c[16];
DP4 R2.x, R0, c[15];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[20];
DP4 R3.x, R1, c[18];
DP4 R3.y, R1, c[19];
ADD R2.xyz, R2, R3;
MAD R0.w, R0.x, R0.x, -R0.y;
MUL R3.xyz, R0.w, c[21];
MOV R1.xyz, vertex.attrib[14];
MUL R0.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R1.zxyw, -R0;
MUL R0.xyz, R0, vertex.attrib[14].w;
MOV R1.xyz, c[13];
ADD result.texcoord[3].xyz, R2, R3;
MOV R1.w, c[0].x;
DP4 R0.w, vertex.position, c[4];
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
MAD R2.xyz, R2, c[22].w, -vertex.position;
DP3 result.texcoord[1].y, R2, R0;
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].y;
MUL R1.y, R1, c[14].x;
DP3 result.texcoord[1].z, vertex.normal, R2;
DP3 result.texcoord[1].x, R2, vertex.attrib[14];
ADD result.texcoord[2].xy, R1, R1.z;
MOV result.position, R0;
MOV result.color, vertex.color;
MOV result.texcoord[2].zw, R0;
MAD result.texcoord[0].zw, vertex.texcoord[1].xyxy, c[24].xyxy, c[24];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[23], c[23].zwzw;
END
# 43 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 44 math
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_ProjectionParams]
Vector 14 [_ScreenParams]
Vector 15 [unity_SHAr]
Vector 16 [unity_SHAg]
Vector 17 [unity_SHAb]
Vector 18 [unity_SHBr]
Vector 19 [unity_SHBg]
Vector 20 [unity_SHBb]
Vector 21 [unity_SHC]
Vector 22 [unity_Scale]
Vector 23 [_MainTex_ST]
Vector 24 [_Emissive_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_color0 o3
dcl_texcoord2 o4
dcl_texcoord3 o5
def c25, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mul r1.xyz, v2, c22.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c25.x
dp4 r2.z, r0, c17
dp4 r2.y, r0, c16
dp4 r2.x, r0, c15
mul r0.y, r2.w, r2.w
mad r0.w, r0.x, r0.x, -r0.y
dp4 r3.z, r1, c20
dp4 r3.y, r1, c19
dp4 r3.x, r1, c18
add r2.xyz, r2, r3
mul r3.xyz, r0.w, c21
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r0.xyz, r0, v1.w
mov r1.xyz, c12
add o5.xyz, r2, r3
mov r1.w, c25.x
dp4 r0.w, v0, c3
dp4 r2.z, r1, c10
dp4 r2.x, r1, c8
dp4 r2.y, r1, c9
mad r2.xyz, r2, c22.w, -v0
dp3 o2.y, r2, r0
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c25.y
mul r1.y, r1, c13.x
dp3 o2.z, v2, r2
dp3 o2.x, r2, v1
mad o4.xy, r1.z, c14.zwzw, r1
mov o0, r0
mov o3, v5
mov o4.zw, r0
mad o1.zw, v4.xyxy, c24.xyxy, c24
mad o1.xy, v3, c23, c23.zwzw
"
}
SubProgram "d3d11 " {
// Stats: 35 math
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 128
Vector 80 [_MainTex_ST]
Vector 96 [_Emissive_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedefibnoonkakmnlfplhacibjpofngpilbabaaaaaaleahaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefcpmafaaaaeaaaabaahpabaaaa
fjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaa
fjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaad
pcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaad
pccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaacaeaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaadcaaaaalmccabaaaabaaaaaa
agbebaaaaeaaaaaaagiecaaaaaaaaaaaagaaaaaakgiocaaaaaaaaaaaagaaaaaa
diaaaaahhcaabaaaabaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaak
hcaabaaaabaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaa
abaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgbpbaaaabaaaaaa
diaaaaajhcaabaaaacaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaa
bbaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaa
abaaaaaaaeaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaa
adaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaacaaaaaaaaaaaaai
hcaabaaaacaaaaaaegacbaaaacaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaal
hcaabaaaacaaaaaaegacbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaia
ebaaaaaaaaaaaaaabaaaaaahcccabaaaacaaaaaaegacbaaaabaaaaaaegacbaaa
acaaaaaabaaaaaahbccabaaaacaaaaaaegbcbaaaabaaaaaaegacbaaaacaaaaaa
baaaaaaheccabaaaacaaaaaaegbcbaaaacaaaaaaegacbaaaacaaaaaadgaaaaaf
pccabaaaadaaaaaaegbobaaaafaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaa
aaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaa
aeaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaaeaaaaaakgakbaaaabaaaaaa
mgaabaaaabaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaa
adaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaa
adaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaa
agaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
adaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaaficaabaaa
aaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaabaaaaaaegiocaaaacaaaaaa
cgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaaabaaaaaaegiocaaaacaaaaaa
chaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaaabaaaaaaegiocaaaacaaaaaa
ciaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaajgacbaaaaaaaaaaa
egakbaaaaaaaaaaabbaaaaaibcaabaaaadaaaaaaegiocaaaacaaaaaacjaaaaaa
egaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaaegiocaaaacaaaaaackaaaaaa
egaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaaegiocaaaacaaaaaaclaaaaaa
egaobaaaacaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaa
adaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaa
dcaaaaakbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaia
ebaaaaaaaaaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaaacaaaaaacmaaaaaa
agaabaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  highp vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_5 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_5.zw;
  mat3 tmpvar_9;
  tmpvar_9[0] = _Object2World[0].xyz;
  tmpvar_9[1] = _Object2World[1].xyz;
  tmpvar_9[2] = _Object2World[2].xyz;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = (tmpvar_9 * (tmpvar_2 * unity_Scale.w));
  mediump vec3 tmpvar_11;
  mediump vec4 normal_12;
  normal_12 = tmpvar_10;
  highp float vC_13;
  mediump vec3 x3_14;
  mediump vec3 x2_15;
  mediump vec3 x1_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAr, normal_12);
  x1_16.x = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHAg, normal_12);
  x1_16.y = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHAb, normal_12);
  x1_16.z = tmpvar_19;
  mediump vec4 tmpvar_20;
  tmpvar_20 = (normal_12.xyzz * normal_12.yzzx);
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBr, tmpvar_20);
  x2_15.x = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHBg, tmpvar_20);
  x2_15.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHBb, tmpvar_20);
  x2_15.z = tmpvar_23;
  mediump float tmpvar_24;
  tmpvar_24 = ((normal_12.x * normal_12.x) - (normal_12.y * normal_12.y));
  vC_13 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (unity_SHC.xyz * vC_13);
  x3_14 = tmpvar_25;
  tmpvar_11 = ((x1_16 + x2_15) + x3_14);
  tmpvar_4 = tmpvar_11;
  highp vec3 tmpvar_26;
  highp vec3 tmpvar_27;
  tmpvar_26 = tmpvar_1.xyz;
  tmpvar_27 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_28;
  tmpvar_28[0].x = tmpvar_26.x;
  tmpvar_28[0].y = tmpvar_27.x;
  tmpvar_28[0].z = tmpvar_2.x;
  tmpvar_28[1].x = tmpvar_26.y;
  tmpvar_28[1].y = tmpvar_27.y;
  tmpvar_28[1].z = tmpvar_2.y;
  tmpvar_28[2].x = tmpvar_26.z;
  tmpvar_28[2].y = tmpvar_27.z;
  tmpvar_28[2].z = tmpvar_2.z;
  highp vec4 tmpvar_29;
  tmpvar_29.w = 1.0;
  tmpvar_29.xyz = _WorldSpaceCameraPos;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = (tmpvar_28 * (((_World2Object * tmpvar_29).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = o_6;
  xlv_TEXCOORD3 = tmpvar_4;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
uniform sampler2D _LightBuffer;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = xlv_COLOR0;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  mediump float rim_9;
  highp vec4 mask_10;
  highp vec4 color_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  color_11 = tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Emissive, xlv_TEXCOORD0.xy);
  mask_10 = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_9 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((_RimColor.xyz * pow (rim_9, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_11.x;
  tmpvar_16.y = mask_10.x;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_11.y;
  tmpvar_17.y = mask_10.y;
  highp vec2 tmpvar_18;
  tmpvar_18.x = color_11.z;
  tmpvar_18.y = mask_10.z;
  highp vec2 tmpvar_19;
  tmpvar_19.x = color_11.w;
  tmpvar_19.y = mask_10.w;
  highp vec2 tmpvar_20;
  tmpvar_20 = mix (mix (tmpvar_16, tmpvar_17, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_18, tmpvar_19, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_21;
  tmpvar_21 = mix (tmpvar_20.xxx, mix (mix (vec3(clamp ((tmpvar_20.x + ((1.0 - tmpvar_20.y) * pow (tmpvar_20.x, 2.0))), 0.0, 1.0)), tmpvar_4.xyz, tmpvar_20.yyy), tmpvar_4.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_4.w, 0.0, 1.0)));
  tmpvar_5 = tmpvar_21;
  tmpvar_6 = tmpvar_15;
  highp float tmpvar_22;
  tmpvar_22 = tmpvar_20.x;
  tmpvar_7 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_6 * _Opacity);
  tmpvar_6 = tmpvar_23;
  tmpvar_8 = _Opacity;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_3 = tmpvar_24;
  mediump vec4 tmpvar_25;
  tmpvar_25 = max (light_3, vec4(0.001, 0.001, 0.001, 0.001));
  light_3.w = tmpvar_25.w;
  highp vec3 tmpvar_26;
  tmpvar_26 = (tmpvar_25.xyz + xlv_TEXCOORD3);
  light_3.xyz = tmpvar_26;
  lowp vec4 c_27;
  lowp float spec_28;
  mediump float tmpvar_29;
  tmpvar_29 = (tmpvar_25.w * tmpvar_7);
  spec_28 = tmpvar_29;
  mediump vec3 tmpvar_30;
  tmpvar_30 = ((tmpvar_5 * light_3.xyz) + ((light_3.xyz * _SpecColor.xyz) * spec_28));
  c_27.xyz = tmpvar_30;
  c_27.w = (tmpvar_8 + (spec_28 * _SpecColor.w));
  c_2 = c_27;
  c_2.xyz = (c_2.xyz + tmpvar_6);
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  highp vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_5 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_5.zw;
  mat3 tmpvar_9;
  tmpvar_9[0] = _Object2World[0].xyz;
  tmpvar_9[1] = _Object2World[1].xyz;
  tmpvar_9[2] = _Object2World[2].xyz;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = (tmpvar_9 * (tmpvar_2 * unity_Scale.w));
  mediump vec3 tmpvar_11;
  mediump vec4 normal_12;
  normal_12 = tmpvar_10;
  highp float vC_13;
  mediump vec3 x3_14;
  mediump vec3 x2_15;
  mediump vec3 x1_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAr, normal_12);
  x1_16.x = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHAg, normal_12);
  x1_16.y = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHAb, normal_12);
  x1_16.z = tmpvar_19;
  mediump vec4 tmpvar_20;
  tmpvar_20 = (normal_12.xyzz * normal_12.yzzx);
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBr, tmpvar_20);
  x2_15.x = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHBg, tmpvar_20);
  x2_15.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHBb, tmpvar_20);
  x2_15.z = tmpvar_23;
  mediump float tmpvar_24;
  tmpvar_24 = ((normal_12.x * normal_12.x) - (normal_12.y * normal_12.y));
  vC_13 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (unity_SHC.xyz * vC_13);
  x3_14 = tmpvar_25;
  tmpvar_11 = ((x1_16 + x2_15) + x3_14);
  tmpvar_4 = tmpvar_11;
  highp vec3 tmpvar_26;
  highp vec3 tmpvar_27;
  tmpvar_26 = tmpvar_1.xyz;
  tmpvar_27 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_28;
  tmpvar_28[0].x = tmpvar_26.x;
  tmpvar_28[0].y = tmpvar_27.x;
  tmpvar_28[0].z = tmpvar_2.x;
  tmpvar_28[1].x = tmpvar_26.y;
  tmpvar_28[1].y = tmpvar_27.y;
  tmpvar_28[1].z = tmpvar_2.y;
  tmpvar_28[2].x = tmpvar_26.z;
  tmpvar_28[2].y = tmpvar_27.z;
  tmpvar_28[2].z = tmpvar_2.z;
  highp vec4 tmpvar_29;
  tmpvar_29.w = 1.0;
  tmpvar_29.xyz = _WorldSpaceCameraPos;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = (tmpvar_28 * (((_World2Object * tmpvar_29).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = o_6;
  xlv_TEXCOORD3 = tmpvar_4;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
uniform sampler2D _LightBuffer;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = xlv_COLOR0;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  mediump float rim_9;
  highp vec4 mask_10;
  highp vec4 color_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  color_11 = tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Emissive, xlv_TEXCOORD0.xy);
  mask_10 = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_9 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((_RimColor.xyz * pow (rim_9, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_11.x;
  tmpvar_16.y = mask_10.x;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_11.y;
  tmpvar_17.y = mask_10.y;
  highp vec2 tmpvar_18;
  tmpvar_18.x = color_11.z;
  tmpvar_18.y = mask_10.z;
  highp vec2 tmpvar_19;
  tmpvar_19.x = color_11.w;
  tmpvar_19.y = mask_10.w;
  highp vec2 tmpvar_20;
  tmpvar_20 = mix (mix (tmpvar_16, tmpvar_17, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_18, tmpvar_19, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_21;
  tmpvar_21 = mix (tmpvar_20.xxx, mix (mix (vec3(clamp ((tmpvar_20.x + ((1.0 - tmpvar_20.y) * pow (tmpvar_20.x, 2.0))), 0.0, 1.0)), tmpvar_4.xyz, tmpvar_20.yyy), tmpvar_4.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_4.w, 0.0, 1.0)));
  tmpvar_5 = tmpvar_21;
  tmpvar_6 = tmpvar_15;
  highp float tmpvar_22;
  tmpvar_22 = tmpvar_20.x;
  tmpvar_7 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_6 * _Opacity);
  tmpvar_6 = tmpvar_23;
  tmpvar_8 = _Opacity;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_3 = tmpvar_24;
  mediump vec4 tmpvar_25;
  tmpvar_25 = max (light_3, vec4(0.001, 0.001, 0.001, 0.001));
  light_3.w = tmpvar_25.w;
  highp vec3 tmpvar_26;
  tmpvar_26 = (tmpvar_25.xyz + xlv_TEXCOORD3);
  light_3.xyz = tmpvar_26;
  lowp vec4 c_27;
  lowp float spec_28;
  mediump float tmpvar_29;
  tmpvar_29 = (tmpvar_25.w * tmpvar_7);
  spec_28 = tmpvar_29;
  mediump vec3 tmpvar_30;
  tmpvar_30 = ((tmpvar_5 * light_3.xyz) + ((light_3.xyz * _SpecColor.xyz) * spec_28));
  c_27.xyz = tmpvar_30;
  c_27.w = (tmpvar_8 + (spec_28 * _SpecColor.w));
  c_2 = c_27;
  c_2.xyz = (c_2.xyz + tmpvar_6);
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesColor;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
in vec4 _glesMultiTexCoord1;
in vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHC;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec3 xlv_TEXCOORD1;
out lowp vec4 xlv_COLOR0;
out highp vec4 xlv_TEXCOORD2;
out highp vec3 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  highp vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_5 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_5.zw;
  mat3 tmpvar_9;
  tmpvar_9[0] = _Object2World[0].xyz;
  tmpvar_9[1] = _Object2World[1].xyz;
  tmpvar_9[2] = _Object2World[2].xyz;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = (tmpvar_9 * (tmpvar_2 * unity_Scale.w));
  mediump vec3 tmpvar_11;
  mediump vec4 normal_12;
  normal_12 = tmpvar_10;
  highp float vC_13;
  mediump vec3 x3_14;
  mediump vec3 x2_15;
  mediump vec3 x1_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAr, normal_12);
  x1_16.x = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHAg, normal_12);
  x1_16.y = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHAb, normal_12);
  x1_16.z = tmpvar_19;
  mediump vec4 tmpvar_20;
  tmpvar_20 = (normal_12.xyzz * normal_12.yzzx);
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBr, tmpvar_20);
  x2_15.x = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHBg, tmpvar_20);
  x2_15.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHBb, tmpvar_20);
  x2_15.z = tmpvar_23;
  mediump float tmpvar_24;
  tmpvar_24 = ((normal_12.x * normal_12.x) - (normal_12.y * normal_12.y));
  vC_13 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (unity_SHC.xyz * vC_13);
  x3_14 = tmpvar_25;
  tmpvar_11 = ((x1_16 + x2_15) + x3_14);
  tmpvar_4 = tmpvar_11;
  highp vec3 tmpvar_26;
  highp vec3 tmpvar_27;
  tmpvar_26 = tmpvar_1.xyz;
  tmpvar_27 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_28;
  tmpvar_28[0].x = tmpvar_26.x;
  tmpvar_28[0].y = tmpvar_27.x;
  tmpvar_28[0].z = tmpvar_2.x;
  tmpvar_28[1].x = tmpvar_26.y;
  tmpvar_28[1].y = tmpvar_27.y;
  tmpvar_28[1].z = tmpvar_2.y;
  tmpvar_28[2].x = tmpvar_26.z;
  tmpvar_28[2].y = tmpvar_27.z;
  tmpvar_28[2].z = tmpvar_2.z;
  highp vec4 tmpvar_29;
  tmpvar_29.w = 1.0;
  tmpvar_29.xyz = _WorldSpaceCameraPos;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = (tmpvar_28 * (((_World2Object * tmpvar_29).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = o_6;
  xlv_TEXCOORD3 = tmpvar_4;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
uniform sampler2D _LightBuffer;
in highp vec4 xlv_TEXCOORD0;
in highp vec3 xlv_TEXCOORD1;
in lowp vec4 xlv_COLOR0;
in highp vec4 xlv_TEXCOORD2;
in highp vec3 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = xlv_COLOR0;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  mediump float rim_9;
  highp vec4 mask_10;
  highp vec4 color_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture (_MainTex, xlv_TEXCOORD0.xy);
  color_11 = tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture (_Emissive, xlv_TEXCOORD0.xy);
  mask_10 = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_9 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((_RimColor.xyz * pow (rim_9, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_11.x;
  tmpvar_16.y = mask_10.x;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_11.y;
  tmpvar_17.y = mask_10.y;
  highp vec2 tmpvar_18;
  tmpvar_18.x = color_11.z;
  tmpvar_18.y = mask_10.z;
  highp vec2 tmpvar_19;
  tmpvar_19.x = color_11.w;
  tmpvar_19.y = mask_10.w;
  highp vec2 tmpvar_20;
  tmpvar_20 = mix (mix (tmpvar_16, tmpvar_17, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_18, tmpvar_19, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_21;
  tmpvar_21 = mix (tmpvar_20.xxx, mix (mix (vec3(clamp ((tmpvar_20.x + ((1.0 - tmpvar_20.y) * pow (tmpvar_20.x, 2.0))), 0.0, 1.0)), tmpvar_4.xyz, tmpvar_20.yyy), tmpvar_4.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_4.w, 0.0, 1.0)));
  tmpvar_5 = tmpvar_21;
  tmpvar_6 = tmpvar_15;
  highp float tmpvar_22;
  tmpvar_22 = tmpvar_20.x;
  tmpvar_7 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_6 * _Opacity);
  tmpvar_6 = tmpvar_23;
  tmpvar_8 = _Opacity;
  lowp vec4 tmpvar_24;
  tmpvar_24 = textureProj (_LightBuffer, xlv_TEXCOORD2);
  light_3 = tmpvar_24;
  mediump vec4 tmpvar_25;
  tmpvar_25 = max (light_3, vec4(0.001, 0.001, 0.001, 0.001));
  light_3.w = tmpvar_25.w;
  highp vec3 tmpvar_26;
  tmpvar_26 = (tmpvar_25.xyz + xlv_TEXCOORD3);
  light_3.xyz = tmpvar_26;
  lowp vec4 c_27;
  lowp float spec_28;
  mediump float tmpvar_29;
  tmpvar_29 = (tmpvar_25.w * tmpvar_7);
  spec_28 = tmpvar_29;
  mediump vec3 tmpvar_30;
  tmpvar_30 = ((tmpvar_5 * light_3.xyz) + ((light_3.xyz * _SpecColor.xyz) * spec_28));
  c_27.xyz = tmpvar_30;
  c_27.w = (tmpvar_8 + (spec_28 * _SpecColor.w));
  c_2 = c_27;
  c_2.xyz = (c_2.xyz + tmpvar_6);
  tmpvar_1 = c_2;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 35 math
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_ProjectionParams]
Vector 19 [unity_ShadowFadeCenterAndType]
Vector 20 [unity_Scale]
Vector 21 [unity_LightmapST]
Vector 22 [_MainTex_ST]
Vector 23 [_Emissive_ST]
"3.0-!!ARBvp1.0
PARAM c[24] = { { 1, 0.5 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..23] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R0.xyz, R0, vertex.attrib[14].w;
MOV R1.xyz, c[17];
MOV R1.w, c[0].x;
DP4 R0.w, vertex.position, c[8];
DP4 R2.z, R1, c[15];
DP4 R2.x, R1, c[13];
DP4 R2.y, R1, c[14];
MAD R2.xyz, R2, c[20].w, -vertex.position;
DP3 result.texcoord[1].y, R2, R0;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
MUL R1.xyz, R0.xyww, c[0].y;
MUL R1.y, R1, c[18].x;
ADD result.texcoord[2].xy, R1, R1.z;
MOV result.position, R0;
MOV R0.x, c[0];
ADD R0.y, R0.x, -c[19].w;
DP4 R0.x, vertex.position, c[3];
DP4 R1.z, vertex.position, c[11];
DP4 R1.x, vertex.position, c[9];
DP4 R1.y, vertex.position, c[10];
ADD R1.xyz, R1, -c[19];
DP3 result.texcoord[1].z, vertex.normal, R2;
DP3 result.texcoord[1].x, R2, vertex.attrib[14];
MOV result.color, vertex.color;
MOV result.texcoord[2].zw, R0;
MUL result.texcoord[4].xyz, R1, c[19].w;
MAD result.texcoord[0].zw, vertex.texcoord[1].xyxy, c[23].xyxy, c[23];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[22], c[22].zwzw;
MAD result.texcoord[3].xy, vertex.texcoord[1], c[21], c[21].zwzw;
MUL result.texcoord[4].w, -R0.x, R0.y;
END
# 35 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 36 math
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_ProjectionParams]
Vector 18 [_ScreenParams]
Vector 19 [unity_ShadowFadeCenterAndType]
Vector 20 [unity_Scale]
Vector 21 [unity_LightmapST]
Vector 22 [_MainTex_ST]
Vector 23 [_Emissive_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_color0 o3
dcl_texcoord2 o4
dcl_texcoord3 o5
dcl_texcoord4 o6
def c24, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r0.xyz, r0, v1.w
mov r1.xyz, c16
mov r1.w, c24.x
dp4 r0.w, v0, c7
dp4 r2.z, r1, c14
dp4 r2.x, r1, c12
dp4 r2.y, r1, c13
mad r2.xyz, r2, c20.w, -v0
dp3 o2.y, r2, r0
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
mul r1.xyz, r0.xyww, c24.y
mul r1.y, r1, c17.x
mad o4.xy, r1.z, c18.zwzw, r1
mov o0, r0
mov r0.x, c19.w
add r0.y, c24.x, -r0.x
dp4 r0.x, v0, c2
dp4 r1.z, v0, c10
dp4 r1.x, v0, c8
dp4 r1.y, v0, c9
add r1.xyz, r1, -c19
dp3 o2.z, v2, r2
dp3 o2.x, r2, v1
mov o3, v5
mov o4.zw, r0
mul o6.xyz, r1, c19.w
mad o1.zw, v4.xyxy, c23.xyxy, c23
mad o1.xy, v3, c22, c22.zwzw
mad o5.xy, v4, c21, c21.zwzw
mul o6.w, -r0.x, r0.y
"
}
SubProgram "d3d11 " {
// Stats: 33 math
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 160
Vector 80 [unity_LightmapST]
Vector 96 [_MainTex_ST]
Vector 112 [_Emissive_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityShadows" 416
Vector 400 [unity_ShadowFadeCenterAndType]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [glstate_matrix_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityShadows" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedphgidfggbhcpfmidlinkhnlhbeibhdafabaaaaaaleahaaaaadaaaaaa
cmaaaaaapeaaaaaamiabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheommaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaamfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaadamaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaagaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklfdeieefcoeafaaaaeaaaabaahjabaaaafjaaaaaeegiocaaa
aaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaa
acaaaaaabkaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaadpcbabaaaafaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaad
hccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaa
gfaaaaaddccabaaaafaaaaaagfaaaaadpccabaaaagaaaaaagiaaaaacadaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaadcaaaaalmccabaaa
abaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaahaaaaaakgiocaaaaaaaaaaa
ahaaaaaadiaaaaahhcaabaaaabaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaa
dcaaaaakhcaabaaaabaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaia
ebaaaaaaabaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgbpbaaa
abaaaaaadiaaaaajhcaabaaaacaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaa
adaaaaaabbaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaadaaaaaabaaaaaaa
agiacaaaabaaaaaaaeaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaa
egiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaacaaaaaa
aaaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaegiccaaaadaaaaaabdaaaaaa
dcaaaaalhcaabaaaacaaaaaaegacbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaa
egbcbaiaebaaaaaaaaaaaaaabaaaaaahcccabaaaacaaaaaaegacbaaaabaaaaaa
egacbaaaacaaaaaabaaaaaahbccabaaaacaaaaaaegbcbaaaabaaaaaaegacbaaa
acaaaaaabaaaaaaheccabaaaacaaaaaaegbcbaaaacaaaaaaegacbaaaacaaaaaa
dgaaaaafpccabaaaadaaaaaaegbobaaaafaaaaaadiaaaaaiccaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaa
agahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaaf
mccabaaaaeaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaaeaaaaaakgakbaaa
abaaaaaamgaabaaaabaaaaaadcaaaaaldccabaaaafaaaaaaegbabaaaaeaaaaaa
egiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaadiaaaaaihcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaa
egacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegiccaiaebaaaaaaacaaaaaabjaaaaaadiaaaaaihccabaaaagaaaaaa
egacbaaaaaaaaaaapgipcaaaacaaaaaabjaaaaaadiaaaaaibcaabaaaaaaaaaaa
bkbabaaaaaaaaaaackiacaaaadaaaaaaafaaaaaadcaaaaakbcaabaaaaaaaaaaa
ckiacaaaadaaaaaaaeaaaaaaakbabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaak
bcaabaaaaaaaaaaackiacaaaadaaaaaaagaaaaaackbabaaaaaaaaaaaakaabaaa
aaaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaaadaaaaaaahaaaaaadkbabaaa
aaaaaaaaakaabaaaaaaaaaaaaaaaaaajccaabaaaaaaaaaaadkiacaiaebaaaaaa
acaaaaaabjaaaaaaabeaaaaaaaaaiadpdiaaaaaiiccabaaaagaaaaaabkaabaaa
aaaaaaaaakaabaiaebaaaaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 glstate_matrix_modelview0;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_5 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_5.zw;
  tmpvar_4.xyz = (((_Object2World * _glesVertex).xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  tmpvar_4.w = (-((glstate_matrix_modelview0 * _glesVertex).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  highp vec3 tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_9 = tmpvar_1.xyz;
  tmpvar_10 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_11;
  tmpvar_11[0].x = tmpvar_9.x;
  tmpvar_11[0].y = tmpvar_10.x;
  tmpvar_11[0].z = tmpvar_2.x;
  tmpvar_11[1].x = tmpvar_9.y;
  tmpvar_11[1].y = tmpvar_10.y;
  tmpvar_11[1].z = tmpvar_2.y;
  tmpvar_11[2].x = tmpvar_9.z;
  tmpvar_11[2].y = tmpvar_10.z;
  tmpvar_11[2].z = tmpvar_2.z;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = _WorldSpaceCameraPos;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = (tmpvar_11 * (((_World2Object * tmpvar_12).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = o_6;
  xlv_TEXCOORD3 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD4 = tmpvar_4;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
uniform sampler2D _LightBuffer;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
uniform highp vec4 unity_LightmapFade;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec3 lmIndirect_3;
  mediump vec3 lmFull_4;
  mediump float lmFade_5;
  mediump vec4 light_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = xlv_COLOR0;
  lowp vec3 tmpvar_8;
  lowp vec3 tmpvar_9;
  lowp float tmpvar_10;
  lowp float tmpvar_11;
  mediump float rim_12;
  highp vec4 mask_13;
  highp vec4 color_14;
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  color_14 = tmpvar_15;
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_Emissive, xlv_TEXCOORD0.xy);
  mask_13 = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_12 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = ((_RimColor.xyz * pow (rim_12, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_19;
  tmpvar_19.x = color_14.x;
  tmpvar_19.y = mask_13.x;
  highp vec2 tmpvar_20;
  tmpvar_20.x = color_14.y;
  tmpvar_20.y = mask_13.y;
  highp vec2 tmpvar_21;
  tmpvar_21.x = color_14.z;
  tmpvar_21.y = mask_13.z;
  highp vec2 tmpvar_22;
  tmpvar_22.x = color_14.w;
  tmpvar_22.y = mask_13.w;
  highp vec2 tmpvar_23;
  tmpvar_23 = mix (mix (tmpvar_19, tmpvar_20, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_21, tmpvar_22, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_24;
  tmpvar_24 = mix (tmpvar_23.xxx, mix (mix (vec3(clamp ((tmpvar_23.x + ((1.0 - tmpvar_23.y) * pow (tmpvar_23.x, 2.0))), 0.0, 1.0)), tmpvar_7.xyz, tmpvar_23.yyy), tmpvar_7.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_7.w, 0.0, 1.0)));
  tmpvar_8 = tmpvar_24;
  tmpvar_9 = tmpvar_18;
  highp float tmpvar_25;
  tmpvar_25 = tmpvar_23.x;
  tmpvar_10 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26 = (tmpvar_9 * _Opacity);
  tmpvar_9 = tmpvar_26;
  tmpvar_11 = _Opacity;
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_6 = tmpvar_27;
  mediump vec4 tmpvar_28;
  tmpvar_28 = max (light_6, vec4(0.001, 0.001, 0.001, 0.001));
  light_6.w = tmpvar_28.w;
  highp float tmpvar_29;
  tmpvar_29 = ((sqrt(dot (xlv_TEXCOORD4, xlv_TEXCOORD4)) * unity_LightmapFade.z) + unity_LightmapFade.w);
  lmFade_5 = tmpvar_29;
  lowp vec3 tmpvar_30;
  tmpvar_30 = (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD3).xyz);
  lmFull_4 = tmpvar_30;
  lowp vec3 tmpvar_31;
  tmpvar_31 = (2.0 * texture2D (unity_LightmapInd, xlv_TEXCOORD3).xyz);
  lmIndirect_3 = tmpvar_31;
  light_6.xyz = (tmpvar_28.xyz + mix (lmIndirect_3, lmFull_4, vec3(clamp (lmFade_5, 0.0, 1.0))));
  lowp vec4 c_32;
  lowp float spec_33;
  mediump float tmpvar_34;
  tmpvar_34 = (tmpvar_28.w * tmpvar_10);
  spec_33 = tmpvar_34;
  mediump vec3 tmpvar_35;
  tmpvar_35 = ((tmpvar_8 * light_6.xyz) + ((light_6.xyz * _SpecColor.xyz) * spec_33));
  c_32.xyz = tmpvar_35;
  c_32.w = (tmpvar_11 + (spec_33 * _SpecColor.w));
  c_2 = c_32;
  c_2.xyz = (c_2.xyz + tmpvar_9);
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 glstate_matrix_modelview0;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_5 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_5.zw;
  tmpvar_4.xyz = (((_Object2World * _glesVertex).xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  tmpvar_4.w = (-((glstate_matrix_modelview0 * _glesVertex).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  highp vec3 tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_9 = tmpvar_1.xyz;
  tmpvar_10 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_11;
  tmpvar_11[0].x = tmpvar_9.x;
  tmpvar_11[0].y = tmpvar_10.x;
  tmpvar_11[0].z = tmpvar_2.x;
  tmpvar_11[1].x = tmpvar_9.y;
  tmpvar_11[1].y = tmpvar_10.y;
  tmpvar_11[1].z = tmpvar_2.y;
  tmpvar_11[2].x = tmpvar_9.z;
  tmpvar_11[2].y = tmpvar_10.z;
  tmpvar_11[2].z = tmpvar_2.z;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = _WorldSpaceCameraPos;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = (tmpvar_11 * (((_World2Object * tmpvar_12).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = o_6;
  xlv_TEXCOORD3 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD4 = tmpvar_4;
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
uniform sampler2D _LightBuffer;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
uniform highp vec4 unity_LightmapFade;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec3 lmIndirect_3;
  mediump vec3 lmFull_4;
  mediump float lmFade_5;
  mediump vec4 light_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = xlv_COLOR0;
  lowp vec3 tmpvar_8;
  lowp vec3 tmpvar_9;
  lowp float tmpvar_10;
  lowp float tmpvar_11;
  mediump float rim_12;
  highp vec4 mask_13;
  highp vec4 color_14;
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  color_14 = tmpvar_15;
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_Emissive, xlv_TEXCOORD0.xy);
  mask_13 = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_12 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = ((_RimColor.xyz * pow (rim_12, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_19;
  tmpvar_19.x = color_14.x;
  tmpvar_19.y = mask_13.x;
  highp vec2 tmpvar_20;
  tmpvar_20.x = color_14.y;
  tmpvar_20.y = mask_13.y;
  highp vec2 tmpvar_21;
  tmpvar_21.x = color_14.z;
  tmpvar_21.y = mask_13.z;
  highp vec2 tmpvar_22;
  tmpvar_22.x = color_14.w;
  tmpvar_22.y = mask_13.w;
  highp vec2 tmpvar_23;
  tmpvar_23 = mix (mix (tmpvar_19, tmpvar_20, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_21, tmpvar_22, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_24;
  tmpvar_24 = mix (tmpvar_23.xxx, mix (mix (vec3(clamp ((tmpvar_23.x + ((1.0 - tmpvar_23.y) * pow (tmpvar_23.x, 2.0))), 0.0, 1.0)), tmpvar_7.xyz, tmpvar_23.yyy), tmpvar_7.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_7.w, 0.0, 1.0)));
  tmpvar_8 = tmpvar_24;
  tmpvar_9 = tmpvar_18;
  highp float tmpvar_25;
  tmpvar_25 = tmpvar_23.x;
  tmpvar_10 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26 = (tmpvar_9 * _Opacity);
  tmpvar_9 = tmpvar_26;
  tmpvar_11 = _Opacity;
  lowp vec4 tmpvar_27;
  tmpvar_27 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_6 = tmpvar_27;
  mediump vec4 tmpvar_28;
  tmpvar_28 = max (light_6, vec4(0.001, 0.001, 0.001, 0.001));
  light_6.w = tmpvar_28.w;
  lowp vec4 tmpvar_29;
  tmpvar_29 = texture2D (unity_Lightmap, xlv_TEXCOORD3);
  lowp vec4 tmpvar_30;
  tmpvar_30 = texture2D (unity_LightmapInd, xlv_TEXCOORD3);
  highp float tmpvar_31;
  tmpvar_31 = ((sqrt(dot (xlv_TEXCOORD4, xlv_TEXCOORD4)) * unity_LightmapFade.z) + unity_LightmapFade.w);
  lmFade_5 = tmpvar_31;
  lowp vec3 tmpvar_32;
  tmpvar_32 = ((8.0 * tmpvar_29.w) * tmpvar_29.xyz);
  lmFull_4 = tmpvar_32;
  lowp vec3 tmpvar_33;
  tmpvar_33 = ((8.0 * tmpvar_30.w) * tmpvar_30.xyz);
  lmIndirect_3 = tmpvar_33;
  light_6.xyz = (tmpvar_28.xyz + mix (lmIndirect_3, lmFull_4, vec3(clamp (lmFade_5, 0.0, 1.0))));
  lowp vec4 c_34;
  lowp float spec_35;
  mediump float tmpvar_36;
  tmpvar_36 = (tmpvar_28.w * tmpvar_10);
  spec_35 = tmpvar_36;
  mediump vec3 tmpvar_37;
  tmpvar_37 = ((tmpvar_8 * light_6.xyz) + ((light_6.xyz * _SpecColor.xyz) * spec_35));
  c_34.xyz = tmpvar_37;
  c_34.w = (tmpvar_11 + (spec_35 * _SpecColor.w));
  c_2 = c_34;
  c_2.xyz = (c_2.xyz + tmpvar_9);
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesColor;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
in vec4 _glesMultiTexCoord1;
in vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 glstate_matrix_modelview0;
uniform highp mat4 _Object2World;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec3 xlv_TEXCOORD1;
out lowp vec4 xlv_COLOR0;
out highp vec4 xlv_TEXCOORD2;
out highp vec2 xlv_TEXCOORD3;
out highp vec4 xlv_TEXCOORD4;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_5 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_5.zw;
  tmpvar_4.xyz = (((_Object2World * _glesVertex).xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  tmpvar_4.w = (-((glstate_matrix_modelview0 * _glesVertex).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  highp vec3 tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_9 = tmpvar_1.xyz;
  tmpvar_10 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_11;
  tmpvar_11[0].x = tmpvar_9.x;
  tmpvar_11[0].y = tmpvar_10.x;
  tmpvar_11[0].z = tmpvar_2.x;
  tmpvar_11[1].x = tmpvar_9.y;
  tmpvar_11[1].y = tmpvar_10.y;
  tmpvar_11[1].z = tmpvar_2.y;
  tmpvar_11[2].x = tmpvar_9.z;
  tmpvar_11[2].y = tmpvar_10.z;
  tmpvar_11[2].z = tmpvar_2.z;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = _WorldSpaceCameraPos;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = (tmpvar_11 * (((_World2Object * tmpvar_12).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = o_6;
  xlv_TEXCOORD3 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD4 = tmpvar_4;
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform lowp vec4 _SpecColor;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
uniform sampler2D _LightBuffer;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
uniform highp vec4 unity_LightmapFade;
in highp vec4 xlv_TEXCOORD0;
in highp vec3 xlv_TEXCOORD1;
in lowp vec4 xlv_COLOR0;
in highp vec4 xlv_TEXCOORD2;
in highp vec2 xlv_TEXCOORD3;
in highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec3 lmIndirect_3;
  mediump vec3 lmFull_4;
  mediump float lmFade_5;
  mediump vec4 light_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = xlv_COLOR0;
  lowp vec3 tmpvar_8;
  lowp vec3 tmpvar_9;
  lowp float tmpvar_10;
  lowp float tmpvar_11;
  mediump float rim_12;
  highp vec4 mask_13;
  highp vec4 color_14;
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture (_MainTex, xlv_TEXCOORD0.xy);
  color_14 = tmpvar_15;
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture (_Emissive, xlv_TEXCOORD0.xy);
  mask_13 = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_12 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = ((_RimColor.xyz * pow (rim_12, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_19;
  tmpvar_19.x = color_14.x;
  tmpvar_19.y = mask_13.x;
  highp vec2 tmpvar_20;
  tmpvar_20.x = color_14.y;
  tmpvar_20.y = mask_13.y;
  highp vec2 tmpvar_21;
  tmpvar_21.x = color_14.z;
  tmpvar_21.y = mask_13.z;
  highp vec2 tmpvar_22;
  tmpvar_22.x = color_14.w;
  tmpvar_22.y = mask_13.w;
  highp vec2 tmpvar_23;
  tmpvar_23 = mix (mix (tmpvar_19, tmpvar_20, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_21, tmpvar_22, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_24;
  tmpvar_24 = mix (tmpvar_23.xxx, mix (mix (vec3(clamp ((tmpvar_23.x + ((1.0 - tmpvar_23.y) * pow (tmpvar_23.x, 2.0))), 0.0, 1.0)), tmpvar_7.xyz, tmpvar_23.yyy), tmpvar_7.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_7.w, 0.0, 1.0)));
  tmpvar_8 = tmpvar_24;
  tmpvar_9 = tmpvar_18;
  highp float tmpvar_25;
  tmpvar_25 = tmpvar_23.x;
  tmpvar_10 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26 = (tmpvar_9 * _Opacity);
  tmpvar_9 = tmpvar_26;
  tmpvar_11 = _Opacity;
  lowp vec4 tmpvar_27;
  tmpvar_27 = textureProj (_LightBuffer, xlv_TEXCOORD2);
  light_6 = tmpvar_27;
  mediump vec4 tmpvar_28;
  tmpvar_28 = max (light_6, vec4(0.001, 0.001, 0.001, 0.001));
  light_6.w = tmpvar_28.w;
  highp float tmpvar_29;
  tmpvar_29 = ((sqrt(dot (xlv_TEXCOORD4, xlv_TEXCOORD4)) * unity_LightmapFade.z) + unity_LightmapFade.w);
  lmFade_5 = tmpvar_29;
  lowp vec3 tmpvar_30;
  tmpvar_30 = (2.0 * texture (unity_Lightmap, xlv_TEXCOORD3).xyz);
  lmFull_4 = tmpvar_30;
  lowp vec3 tmpvar_31;
  tmpvar_31 = (2.0 * texture (unity_LightmapInd, xlv_TEXCOORD3).xyz);
  lmIndirect_3 = tmpvar_31;
  light_6.xyz = (tmpvar_28.xyz + mix (lmIndirect_3, lmFull_4, vec3(clamp (lmFade_5, 0.0, 1.0))));
  lowp vec4 c_32;
  lowp float spec_33;
  mediump float tmpvar_34;
  tmpvar_34 = (tmpvar_28.w * tmpvar_10);
  spec_33 = tmpvar_34;
  mediump vec3 tmpvar_35;
  tmpvar_35 = ((tmpvar_8 * light_6.xyz) + ((light_6.xyz * _SpecColor.xyz) * spec_33));
  c_32.xyz = tmpvar_35;
  c_32.w = (tmpvar_11 + (spec_33 * _SpecColor.w));
  c_2 = c_32;
  c_2.xyz = (c_2.xyz + tmpvar_9);
  tmpvar_1 = c_2;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "opengl " {
// Stats: 26 math
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_World2Object]
Vector 9 [_WorldSpaceCameraPos]
Vector 10 [_ProjectionParams]
Vector 11 [unity_Scale]
Vector 12 [unity_LightmapST]
Vector 13 [_MainTex_ST]
Vector 14 [_Emissive_ST]
"3.0-!!ARBvp1.0
PARAM c[15] = { { 1, 0.5 },
		state.matrix.mvp,
		program.local[5..14] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R0.xyz, R0, vertex.attrib[14].w;
MOV R1.xyz, c[9];
MOV R1.w, c[0].x;
DP4 R0.w, vertex.position, c[4];
DP4 R2.z, R1, c[7];
DP4 R2.x, R1, c[5];
DP4 R2.y, R1, c[6];
MAD R2.xyz, R2, c[11].w, -vertex.position;
DP3 result.texcoord[1].y, R2, R0;
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].y;
MUL R1.y, R1, c[10].x;
DP3 result.texcoord[1].z, vertex.normal, R2;
DP3 result.texcoord[1].x, R2, vertex.attrib[14];
ADD result.texcoord[2].xy, R1, R1.z;
MOV result.position, R0;
MOV result.color, vertex.color;
MOV result.texcoord[2].zw, R0;
MAD result.texcoord[0].zw, vertex.texcoord[1].xyxy, c[14].xyxy, c[14];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[13], c[13].zwzw;
MAD result.texcoord[3].xy, vertex.texcoord[1], c[12], c[12].zwzw;
END
# 26 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 27 math
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_World2Object]
Vector 8 [_WorldSpaceCameraPos]
Vector 9 [_ProjectionParams]
Vector 10 [_ScreenParams]
Vector 11 [unity_Scale]
Vector 12 [unity_LightmapST]
Vector 13 [_MainTex_ST]
Vector 14 [_Emissive_ST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_color0 o3
dcl_texcoord2 o4
dcl_texcoord3 o5
def c15, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r0.xyz, r0, v1.w
mov r1.xyz, c8
mov r1.w, c15.x
dp4 r0.w, v0, c3
dp4 r2.z, r1, c6
dp4 r2.x, r1, c4
dp4 r2.y, r1, c5
mad r2.xyz, r2, c11.w, -v0
dp3 o2.y, r2, r0
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c15.y
mul r1.y, r1, c9.x
dp3 o2.z, v2, r2
dp3 o2.x, r2, v1
mad o4.xy, r1.z, c10.zwzw, r1
mov o0, r0
mov o3, v5
mov o4.zw, r0
mad o1.zw, v4.xyxy, c14.xyxy, c14
mad o1.xy, v3, c13, c13.zwzw
mad o5.xy, v4, c12, c12.zwzw
"
}
SubProgram "d3d11 " {
// Stats: 21 math
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 160
Vector 80 [unity_LightmapST]
Vector 96 [_MainTex_ST]
Vector 112 [_Emissive_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedadibmkgeopmjnppgipficfcliahgmoohabaaaaaamiafaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaadamaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefcbaaeaaaaeaaaabaaaeabaaaa
fjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaa
fjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
pcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaa
gfaaaaadpccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagfaaaaaddccabaaa
afaaaaaagiaaaaacadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaa
agaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaa
ahaaaaaakgiocaaaaaaaaaaaahaaaaaadiaaaaahhcaabaaaabaaaaaajgbebaaa
abaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaabaaaaaajgbebaaaacaaaaaa
cgbjbaaaabaaaaaaegacbaiaebaaaaaaabaaaaaadiaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaapgbpbaaaabaaaaaadiaaaaajhcaabaaaacaaaaaafgifcaaa
abaaaaaaaeaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaaacaaaaaa
egiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaacaaaaaa
dcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaaabaaaaaa
aeaaaaaaegacbaaaacaaaaaaaaaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaa
egiccaaaacaaaaaabdaaaaaadcaaaaalhcaabaaaacaaaaaaegacbaaaacaaaaaa
pgipcaaaacaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaahcccabaaa
acaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaabaaaaaahbccabaaaacaaaaaa
egbcbaaaabaaaaaaegacbaaaacaaaaaabaaaaaaheccabaaaacaaaaaaegbcbaaa
acaaaaaaegacbaaaacaaaaaadgaaaaafpccabaaaadaaaaaaegbobaaaafaaaaaa
diaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaa
diaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaa
aaaaaadpaaaaaadpdgaaaaafmccabaaaaeaaaaaakgaobaaaaaaaaaaaaaaaaaah
dccabaaaaeaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadcaaaaaldccabaaa
afaaaaaaegbabaaaaeaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaa
afaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec4 o_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = tmpvar_6.x;
  tmpvar_7.y = (tmpvar_6.y * _ProjectionParams.x);
  o_5.xy = (tmpvar_7 + tmpvar_6.w);
  o_5.zw = tmpvar_4.zw;
  highp vec3 tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_8 = tmpvar_1.xyz;
  tmpvar_9 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_10;
  tmpvar_10[0].x = tmpvar_8.x;
  tmpvar_10[0].y = tmpvar_9.x;
  tmpvar_10[0].z = tmpvar_2.x;
  tmpvar_10[1].x = tmpvar_8.y;
  tmpvar_10[1].y = tmpvar_9.y;
  tmpvar_10[1].z = tmpvar_2.y;
  tmpvar_10[2].x = tmpvar_8.z;
  tmpvar_10[2].y = tmpvar_9.z;
  tmpvar_10[2].z = tmpvar_2.z;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = (tmpvar_10 * (((_World2Object * tmpvar_11).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = o_5;
  xlv_TEXCOORD3 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _SpecColor;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
uniform sampler2D _LightBuffer;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = xlv_COLOR0;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  mediump float rim_9;
  highp vec4 mask_10;
  highp vec4 color_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  color_11 = tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Emissive, xlv_TEXCOORD0.xy);
  mask_10 = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_9 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((_RimColor.xyz * pow (rim_9, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_11.x;
  tmpvar_16.y = mask_10.x;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_11.y;
  tmpvar_17.y = mask_10.y;
  highp vec2 tmpvar_18;
  tmpvar_18.x = color_11.z;
  tmpvar_18.y = mask_10.z;
  highp vec2 tmpvar_19;
  tmpvar_19.x = color_11.w;
  tmpvar_19.y = mask_10.w;
  highp vec2 tmpvar_20;
  tmpvar_20 = mix (mix (tmpvar_16, tmpvar_17, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_18, tmpvar_19, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_21;
  tmpvar_21 = mix (tmpvar_20.xxx, mix (mix (vec3(clamp ((tmpvar_20.x + ((1.0 - tmpvar_20.y) * pow (tmpvar_20.x, 2.0))), 0.0, 1.0)), tmpvar_4.xyz, tmpvar_20.yyy), tmpvar_4.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_4.w, 0.0, 1.0)));
  tmpvar_5 = tmpvar_21;
  tmpvar_6 = tmpvar_15;
  highp float tmpvar_22;
  tmpvar_22 = tmpvar_20.x;
  tmpvar_7 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_6 * _Opacity);
  tmpvar_6 = tmpvar_23;
  tmpvar_8 = _Opacity;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_3 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = normalize(xlv_TEXCOORD1);
  mediump vec4 tmpvar_26;
  mediump vec3 viewDir_27;
  viewDir_27 = tmpvar_25;
  highp float nh_28;
  mat3 tmpvar_29;
  tmpvar_29[0].x = 0.816497;
  tmpvar_29[0].y = -0.408248;
  tmpvar_29[0].z = -0.408248;
  tmpvar_29[1].x = 0.0;
  tmpvar_29[1].y = 0.707107;
  tmpvar_29[1].z = -0.707107;
  tmpvar_29[2].x = 0.57735;
  tmpvar_29[2].y = 0.57735;
  tmpvar_29[2].z = 0.57735;
  mediump vec3 scalePerBasisVector_30;
  mediump vec3 lm_31;
  lowp vec3 tmpvar_32;
  tmpvar_32 = (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD3).xyz);
  lm_31 = tmpvar_32;
  lowp vec3 tmpvar_33;
  tmpvar_33 = (2.0 * texture2D (unity_LightmapInd, xlv_TEXCOORD3).xyz);
  scalePerBasisVector_30 = tmpvar_33;
  lm_31 = (lm_31 * dot (clamp ((tmpvar_29 * vec3(0.0, 0.0, 1.0)), 0.0, 1.0), scalePerBasisVector_30));
  vec3 v_34;
  v_34.x = tmpvar_29[0].x;
  v_34.y = tmpvar_29[1].x;
  v_34.z = tmpvar_29[2].x;
  vec3 v_35;
  v_35.x = tmpvar_29[0].y;
  v_35.y = tmpvar_29[1].y;
  v_35.z = tmpvar_29[2].y;
  vec3 v_36;
  v_36.x = tmpvar_29[0].z;
  v_36.y = tmpvar_29[1].z;
  v_36.z = tmpvar_29[2].z;
  mediump float tmpvar_37;
  tmpvar_37 = max (0.0, normalize((normalize((((scalePerBasisVector_30.x * v_34) + (scalePerBasisVector_30.y * v_35)) + (scalePerBasisVector_30.z * v_36))) + viewDir_27)).z);
  nh_28 = tmpvar_37;
  mediump float arg1_38;
  arg1_38 = (_Shininess * 128.0);
  highp vec4 tmpvar_39;
  tmpvar_39.xyz = lm_31;
  tmpvar_39.w = pow (nh_28, arg1_38);
  tmpvar_26 = tmpvar_39;
  mediump vec4 tmpvar_40;
  tmpvar_40 = (max (light_3, vec4(0.001, 0.001, 0.001, 0.001)) + tmpvar_26);
  light_3 = tmpvar_40;
  lowp vec4 c_41;
  lowp float spec_42;
  mediump float tmpvar_43;
  tmpvar_43 = (tmpvar_40.w * tmpvar_7);
  spec_42 = tmpvar_43;
  mediump vec3 tmpvar_44;
  tmpvar_44 = ((tmpvar_5 * tmpvar_40.xyz) + ((tmpvar_40.xyz * _SpecColor.xyz) * spec_42));
  c_41.xyz = tmpvar_44;
  c_41.w = (tmpvar_8 + (spec_42 * _SpecColor.w));
  c_2 = c_41;
  c_2.xyz = (c_2.xyz + tmpvar_6);
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "glesdesktop " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
"!!GLES


#ifdef VERTEX

attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec4 o_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = tmpvar_6.x;
  tmpvar_7.y = (tmpvar_6.y * _ProjectionParams.x);
  o_5.xy = (tmpvar_7 + tmpvar_6.w);
  o_5.zw = tmpvar_4.zw;
  highp vec3 tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_8 = tmpvar_1.xyz;
  tmpvar_9 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_10;
  tmpvar_10[0].x = tmpvar_8.x;
  tmpvar_10[0].y = tmpvar_9.x;
  tmpvar_10[0].z = tmpvar_2.x;
  tmpvar_10[1].x = tmpvar_8.y;
  tmpvar_10[1].y = tmpvar_9.y;
  tmpvar_10[1].z = tmpvar_2.y;
  tmpvar_10[2].x = tmpvar_8.z;
  tmpvar_10[2].y = tmpvar_9.z;
  tmpvar_10[2].z = tmpvar_2.z;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = (tmpvar_10 * (((_World2Object * tmpvar_11).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = o_5;
  xlv_TEXCOORD3 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

uniform lowp vec4 _SpecColor;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
uniform sampler2D _LightBuffer;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = xlv_COLOR0;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  mediump float rim_9;
  highp vec4 mask_10;
  highp vec4 color_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_MainTex, xlv_TEXCOORD0.xy);
  color_11 = tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Emissive, xlv_TEXCOORD0.xy);
  mask_10 = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_9 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((_RimColor.xyz * pow (rim_9, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_11.x;
  tmpvar_16.y = mask_10.x;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_11.y;
  tmpvar_17.y = mask_10.y;
  highp vec2 tmpvar_18;
  tmpvar_18.x = color_11.z;
  tmpvar_18.y = mask_10.z;
  highp vec2 tmpvar_19;
  tmpvar_19.x = color_11.w;
  tmpvar_19.y = mask_10.w;
  highp vec2 tmpvar_20;
  tmpvar_20 = mix (mix (tmpvar_16, tmpvar_17, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_18, tmpvar_19, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_21;
  tmpvar_21 = mix (tmpvar_20.xxx, mix (mix (vec3(clamp ((tmpvar_20.x + ((1.0 - tmpvar_20.y) * pow (tmpvar_20.x, 2.0))), 0.0, 1.0)), tmpvar_4.xyz, tmpvar_20.yyy), tmpvar_4.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_4.w, 0.0, 1.0)));
  tmpvar_5 = tmpvar_21;
  tmpvar_6 = tmpvar_15;
  highp float tmpvar_22;
  tmpvar_22 = tmpvar_20.x;
  tmpvar_7 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_6 * _Opacity);
  tmpvar_6 = tmpvar_23;
  tmpvar_8 = _Opacity;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2DProj (_LightBuffer, xlv_TEXCOORD2);
  light_3 = tmpvar_24;
  lowp vec4 tmpvar_25;
  tmpvar_25 = texture2D (unity_Lightmap, xlv_TEXCOORD3);
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (unity_LightmapInd, xlv_TEXCOORD3);
  highp vec3 tmpvar_27;
  tmpvar_27 = normalize(xlv_TEXCOORD1);
  mediump vec4 tmpvar_28;
  mediump vec3 viewDir_29;
  viewDir_29 = tmpvar_27;
  highp float nh_30;
  mat3 tmpvar_31;
  tmpvar_31[0].x = 0.816497;
  tmpvar_31[0].y = -0.408248;
  tmpvar_31[0].z = -0.408248;
  tmpvar_31[1].x = 0.0;
  tmpvar_31[1].y = 0.707107;
  tmpvar_31[1].z = -0.707107;
  tmpvar_31[2].x = 0.57735;
  tmpvar_31[2].y = 0.57735;
  tmpvar_31[2].z = 0.57735;
  mediump vec3 scalePerBasisVector_32;
  mediump vec3 lm_33;
  lowp vec3 tmpvar_34;
  tmpvar_34 = ((8.0 * tmpvar_25.w) * tmpvar_25.xyz);
  lm_33 = tmpvar_34;
  lowp vec3 tmpvar_35;
  tmpvar_35 = ((8.0 * tmpvar_26.w) * tmpvar_26.xyz);
  scalePerBasisVector_32 = tmpvar_35;
  lm_33 = (lm_33 * dot (clamp ((tmpvar_31 * vec3(0.0, 0.0, 1.0)), 0.0, 1.0), scalePerBasisVector_32));
  vec3 v_36;
  v_36.x = tmpvar_31[0].x;
  v_36.y = tmpvar_31[1].x;
  v_36.z = tmpvar_31[2].x;
  vec3 v_37;
  v_37.x = tmpvar_31[0].y;
  v_37.y = tmpvar_31[1].y;
  v_37.z = tmpvar_31[2].y;
  vec3 v_38;
  v_38.x = tmpvar_31[0].z;
  v_38.y = tmpvar_31[1].z;
  v_38.z = tmpvar_31[2].z;
  mediump float tmpvar_39;
  tmpvar_39 = max (0.0, normalize((normalize((((scalePerBasisVector_32.x * v_36) + (scalePerBasisVector_32.y * v_37)) + (scalePerBasisVector_32.z * v_38))) + viewDir_29)).z);
  nh_30 = tmpvar_39;
  mediump float arg1_40;
  arg1_40 = (_Shininess * 128.0);
  highp vec4 tmpvar_41;
  tmpvar_41.xyz = lm_33;
  tmpvar_41.w = pow (nh_30, arg1_40);
  tmpvar_28 = tmpvar_41;
  mediump vec4 tmpvar_42;
  tmpvar_42 = (max (light_3, vec4(0.001, 0.001, 0.001, 0.001)) + tmpvar_28);
  light_3 = tmpvar_42;
  lowp vec4 c_43;
  lowp float spec_44;
  mediump float tmpvar_45;
  tmpvar_45 = (tmpvar_42.w * tmpvar_7);
  spec_44 = tmpvar_45;
  mediump vec3 tmpvar_46;
  tmpvar_46 = ((tmpvar_5 * tmpvar_42.xyz) + ((tmpvar_42.xyz * _SpecColor.xyz) * spec_44));
  c_43.xyz = tmpvar_46;
  c_43.w = (tmpvar_8 + (spec_44 * _SpecColor.w));
  c_2 = c_43;
  c_2.xyz = (c_2.xyz + tmpvar_6);
  tmpvar_1 = c_2;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}
SubProgram "gles3 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
"!!GLES3#version 300 es


#ifdef VERTEX

in vec4 _glesVertex;
in vec4 _glesColor;
in vec3 _glesNormal;
in vec4 _glesMultiTexCoord0;
in vec4 _glesMultiTexCoord1;
in vec4 _glesTANGENT;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 glstate_matrix_mvp;
uniform highp mat4 _World2Object;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Emissive_ST;
out highp vec4 xlv_TEXCOORD0;
out highp vec3 xlv_TEXCOORD1;
out lowp vec4 xlv_COLOR0;
out highp vec4 xlv_TEXCOORD2;
out highp vec2 xlv_TEXCOORD3;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize(_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize(_glesNormal);
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (glstate_matrix_mvp * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord1.xy * _Emissive_ST.xy) + _Emissive_ST.zw);
  highp vec4 o_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = tmpvar_6.x;
  tmpvar_7.y = (tmpvar_6.y * _ProjectionParams.x);
  o_5.xy = (tmpvar_7 + tmpvar_6.w);
  o_5.zw = tmpvar_4.zw;
  highp vec3 tmpvar_8;
  highp vec3 tmpvar_9;
  tmpvar_8 = tmpvar_1.xyz;
  tmpvar_9 = (((tmpvar_2.yzx * tmpvar_1.zxy) - (tmpvar_2.zxy * tmpvar_1.yzx)) * _glesTANGENT.w);
  highp mat3 tmpvar_10;
  tmpvar_10[0].x = tmpvar_8.x;
  tmpvar_10[0].y = tmpvar_9.x;
  tmpvar_10[0].z = tmpvar_2.x;
  tmpvar_10[1].x = tmpvar_8.y;
  tmpvar_10[1].y = tmpvar_9.y;
  tmpvar_10[1].z = tmpvar_2.y;
  tmpvar_10[2].x = tmpvar_8.z;
  tmpvar_10[2].y = tmpvar_9.z;
  tmpvar_10[2].z = tmpvar_2.z;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = (tmpvar_10 * (((_World2Object * tmpvar_11).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD2 = o_5;
  xlv_TEXCOORD3 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

out mediump vec4 _glesFragData[4];
uniform lowp vec4 _SpecColor;
uniform mediump float _Shininess;
uniform sampler2D _MainTex;
uniform sampler2D _Emissive;
uniform highp float _Opacity;
uniform highp float _RimFalloff;
uniform highp vec4 _RimColor;
uniform sampler2D _LightBuffer;
uniform sampler2D unity_Lightmap;
uniform sampler2D unity_LightmapInd;
in highp vec4 xlv_TEXCOORD0;
in highp vec3 xlv_TEXCOORD1;
in lowp vec4 xlv_COLOR0;
in highp vec4 xlv_TEXCOORD2;
in highp vec2 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c_2;
  mediump vec4 light_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = xlv_COLOR0;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  mediump float rim_9;
  highp vec4 mask_10;
  highp vec4 color_11;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture (_MainTex, xlv_TEXCOORD0.xy);
  color_11 = tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture (_Emissive, xlv_TEXCOORD0.xy);
  mask_10 = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = (1.0 - clamp (normalize(xlv_TEXCOORD1).z, 0.0, 1.0));
  rim_9 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((_RimColor.xyz * pow (rim_9, _RimFalloff)) * _RimColor.w);
  highp vec2 tmpvar_16;
  tmpvar_16.x = color_11.x;
  tmpvar_16.y = mask_10.x;
  highp vec2 tmpvar_17;
  tmpvar_17.x = color_11.y;
  tmpvar_17.y = mask_10.y;
  highp vec2 tmpvar_18;
  tmpvar_18.x = color_11.z;
  tmpvar_18.y = mask_10.z;
  highp vec2 tmpvar_19;
  tmpvar_19.x = color_11.w;
  tmpvar_19.y = mask_10.w;
  highp vec2 tmpvar_20;
  tmpvar_20 = mix (mix (tmpvar_16, tmpvar_17, vec2(clamp ((xlv_TEXCOORD0.z * 3.0), 0.0, 1.0))), mix (tmpvar_18, tmpvar_19, vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 2.0), 0.0, 1.0))), vec2(clamp (((xlv_TEXCOORD0.z * 3.0) - 1.0), 0.0, 1.0)));
  highp vec3 tmpvar_21;
  tmpvar_21 = mix (tmpvar_20.xxx, mix (mix (vec3(clamp ((tmpvar_20.x + ((1.0 - tmpvar_20.y) * pow (tmpvar_20.x, 2.0))), 0.0, 1.0)), tmpvar_4.xyz, tmpvar_20.yyy), tmpvar_4.xyz, xlv_TEXCOORD0.www), vec3(clamp (tmpvar_4.w, 0.0, 1.0)));
  tmpvar_5 = tmpvar_21;
  tmpvar_6 = tmpvar_15;
  highp float tmpvar_22;
  tmpvar_22 = tmpvar_20.x;
  tmpvar_7 = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (tmpvar_6 * _Opacity);
  tmpvar_6 = tmpvar_23;
  tmpvar_8 = _Opacity;
  lowp vec4 tmpvar_24;
  tmpvar_24 = textureProj (_LightBuffer, xlv_TEXCOORD2);
  light_3 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = normalize(xlv_TEXCOORD1);
  mediump vec4 tmpvar_26;
  mediump vec3 viewDir_27;
  viewDir_27 = tmpvar_25;
  highp float nh_28;
  mat3 tmpvar_29;
  tmpvar_29[0].x = 0.816497;
  tmpvar_29[0].y = -0.408248;
  tmpvar_29[0].z = -0.408248;
  tmpvar_29[1].x = 0.0;
  tmpvar_29[1].y = 0.707107;
  tmpvar_29[1].z = -0.707107;
  tmpvar_29[2].x = 0.57735;
  tmpvar_29[2].y = 0.57735;
  tmpvar_29[2].z = 0.57735;
  mediump vec3 scalePerBasisVector_30;
  mediump vec3 lm_31;
  lowp vec3 tmpvar_32;
  tmpvar_32 = (2.0 * texture (unity_Lightmap, xlv_TEXCOORD3).xyz);
  lm_31 = tmpvar_32;
  lowp vec3 tmpvar_33;
  tmpvar_33 = (2.0 * texture (unity_LightmapInd, xlv_TEXCOORD3).xyz);
  scalePerBasisVector_30 = tmpvar_33;
  lm_31 = (lm_31 * dot (clamp ((tmpvar_29 * vec3(0.0, 0.0, 1.0)), 0.0, 1.0), scalePerBasisVector_30));
  vec3 v_34;
  v_34.x = tmpvar_29[0].x;
  v_34.y = tmpvar_29[1].x;
  v_34.z = tmpvar_29[2].x;
  vec3 v_35;
  v_35.x = tmpvar_29[0].y;
  v_35.y = tmpvar_29[1].y;
  v_35.z = tmpvar_29[2].y;
  vec3 v_36;
  v_36.x = tmpvar_29[0].z;
  v_36.y = tmpvar_29[1].z;
  v_36.z = tmpvar_29[2].z;
  mediump float tmpvar_37;
  tmpvar_37 = max (0.0, normalize((normalize((((scalePerBasisVector_30.x * v_34) + (scalePerBasisVector_30.y * v_35)) + (scalePerBasisVector_30.z * v_36))) + viewDir_27)).z);
  nh_28 = tmpvar_37;
  mediump float arg1_38;
  arg1_38 = (_Shininess * 128.0);
  highp vec4 tmpvar_39;
  tmpvar_39.xyz = lm_31;
  tmpvar_39.w = pow (nh_28, arg1_38);
  tmpvar_26 = tmpvar_39;
  mediump vec4 tmpvar_40;
  tmpvar_40 = (max (light_3, vec4(0.001, 0.001, 0.001, 0.001)) + tmpvar_26);
  light_3 = tmpvar_40;
  lowp vec4 c_41;
  lowp float spec_42;
  mediump float tmpvar_43;
  tmpvar_43 = (tmpvar_40.w * tmpvar_7);
  spec_42 = tmpvar_43;
  mediump vec3 tmpvar_44;
  tmpvar_44 = ((tmpvar_5 * tmpvar_40.xyz) + ((tmpvar_40.xyz * _SpecColor.xyz) * spec_42));
  c_41.xyz = tmpvar_44;
  c_41.w = (tmpvar_8 + (spec_42 * _SpecColor.w));
  c_2 = c_41;
  c_2.xyz = (c_2.xyz + tmpvar_6);
  tmpvar_1 = c_2;
  _glesFragData[0] = tmpvar_1;
}



#endif"
}
}
Program "fp" {
SubProgram "opengl " {
// Stats: 46 math, 3 textures
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Vector 0 [_SpecColor]
Float 1 [_Opacity]
Float 2 [_RimFalloff]
Vector 3 [_RimColor]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
"3.0-!!ARBfp1.0
PARAM c[5] = { program.local[0..3],
		{ 1, 3, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[0], texture[1], 2D;
MOV R2.x, R0.y;
MOV R0.y, R1.x;
MOV R2.y, R1;
ADD R2.xy, R2, -R0;
MUL_SAT R1.x, fragment.texcoord[0].z, c[4].y;
MAD R0.xy, R1.x, R2, R0;
MOV R1.x, R0.w;
MOV R1.y, R1.w;
MOV R0.w, R1.z;
ADD R1.zw, R1.xyxy, -R0;
MAD_SAT R1.x, fragment.texcoord[0].z, c[4].y, -c[4].z;
MAD R0.zw, R1.x, R1, R0;
ADD R1.xy, R0.zwzw, -R0;
MAD_SAT R0.z, fragment.texcoord[0], c[4].y, -c[4].x;
MAD R2.xy, R0.z, R1, R0;
DP3 R1.w, fragment.texcoord[1], fragment.texcoord[1];
RSQ R1.w, R1.w;
MUL_SAT R1.w, R1, fragment.texcoord[1].z;
ADD R1.w, -R1, c[4].x;
MUL R0.y, R2.x, R2.x;
ADD R0.x, -R2.y, c[4];
MAD_SAT R0.x, R0, R0.y, R2;
ADD R1.xyz, fragment.color.primary, -R0.x;
MAD R0.xyz, R2.y, R1, R0.x;
ADD R1.xyz, fragment.color.primary, -R0;
MAD R1.xyz, fragment.texcoord[0].w, R1, R0;
TXP R0, fragment.texcoord[2], texture[2], 2D;
ADD R1.xyz, R1, -R2.x;
LG2 R0.w, R0.w;
MAD R1.xyz, fragment.color.primary.w, R1, R2.x;
MUL R0.w, R2.x, -R0;
LG2 R0.x, R0.x;
LG2 R0.y, R0.y;
LG2 R0.z, R0.z;
ADD R2.xyz, -R0, fragment.texcoord[3];
MUL R0.xyz, R2, c[0];
MUL R3.xyz, R0, R0.w;
POW R1.w, R1.w, c[2].x;
MUL R0.xyz, R1.w, c[3];
MOV R1.w, c[1].x;
MAD R1.xyz, R1, R2, R3;
MUL R0.xyz, R0, c[3].w;
MAD result.color.xyz, R0, c[1].x, R1;
MAD result.color.w, R0, c[0], R1;
END
# 46 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 46 math, 3 textures
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Vector 0 [_SpecColor]
Float 1 [_Opacity]
Float 2 [_RimFalloff]
Vector 3 [_RimColor]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c4, 1.00000000, 3.00000000, -1.00000000, -2.00000000
dcl_texcoord0 v0
dcl_texcoord1 v1.xyz
dcl_color0 v2
dcl_texcoord2 v3
dcl_texcoord3 v4.xyz
texld r0, v0, s0
texld r1, v0, s1
mov r2.x, r0.y
mov r0.y, r1.x
mov r2.y, r1
add r2.xy, r2, -r0
mul_sat r1.x, v0.z, c4.y
mad r0.xy, r1.x, r2, r0
mov r1.x, r0.w
mov r1.y, r1.w
mov r0.w, r1.z
add r1.zw, r1.xyxy, -r0
mad_sat r1.x, v0.z, c4.y, c4.w
mad r0.zw, r1.x, r1, r0
add r1.xy, r0.zwzw, -r0
mad_sat r0.z, v0, c4.y, c4
mad r0.xy, r0.z, r1, r0
mul r0.w, r0.x, r0.x
add r0.z, -r0.y, c4.x
mad_sat r0.z, r0, r0.w, r0.x
add r1.xyz, v2, -r0.z
mad r1.xyz, r0.y, r1, r0.z
add r2.xyz, v2, -r1
mad r1.xyz, v0.w, r2, r1
dp3 r0.y, v1, v1
rsq r0.y, r0.y
mul_sat r0.y, r0, v1.z
add r1.xyz, r1, -r0.x
mov_sat r0.z, v2.w
mad r2.xyz, r0.z, r1, r0.x
texldp r1, v3, s2
log_pp r0.z, r1.w
mul_pp r1.w, r0.x, -r0.z
add r2.w, -r0.y, c4.x
pow_pp r0, r2.w, c2.x
mul r0.xyz, r0.x, c3
mov_pp r0.w, c1.x
log_pp r1.x, r1.x
log_pp r1.z, r1.z
log_pp r1.y, r1.y
add_pp r1.xyz, -r1, v4
mul_pp r3.xyz, r1, c0
mul_pp r3.xyz, r3, r1.w
mad_pp r1.xyz, r2, r1, r3
mul r0.xyz, r0, c3.w
mad_pp oC0.xyz, r0, c1.x, r1
mad_pp oC0.w, r1, c0, r0
"
}
SubProgram "d3d11 " {
// Stats: 34 math, 3 textures
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
ConstBuffer "$Globals" 128
Vector 32 [_SpecColor]
Float 52 [_Opacity]
Float 56 [_RimFalloff]
Vector 64 [_RimColor]
BindCB  "$Globals" 0
"ps_4_0
eefiecedhjgalabjjcaidibjfabfhidmfpplkkgiabaaaaaapmagaaaaadaaaaaa
cmaaaaaaoiaaaaaabmabaaaaejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapapaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapalaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
niafaaaaeaaaaaaahgabaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaad
hcbabaaaacaaaaaagcbaaaadpcbabaaaadaaaaaagcbaaaadlcbabaaaaeaaaaaa
gcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaa
diaaaaahbcaabaaaaaaaaaaackbabaaaabaaaaaaabeaaaaaaaaaeaeadgcaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadgaaaaafkcaabaaaacaaaaaa
fganbaaaabaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaabaaaaaadgaaaaaffcaabaaaacaaaaaafgahbaaaadaaaaaa
dgaaaaafkcaabaaaabaaaaaaagaibaaaadaaaaaaaaaaaaaipcaabaaaacaaaaaa
bgalbaiaebaaaaaaabaaaaaaegaobaaaacaaaaaadcaaaaajdcaabaaaaaaaaaaa
agaabaaaaaaaaaaaegaabaaaacaaaaaabgafbaaaabaaaaaadccaaaapmcaabaaa
aaaaaaaakgbkbaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaeaeaaaaaeaea
aceaaaaaaaaaaaaaaaaaaaaaaaaaaamaaaaaialpdcaaaaajdcaabaaaabaaaaaa
kgakbaaaaaaaaaaaogakbaaaacaaaaaalgapbaaaabaaaaaaaaaaaaaidcaabaaa
abaaaaaaegaabaiaebaaaaaaaaaaaaaaegaabaaaabaaaaaadcaaaaajdcaabaaa
aaaaaaaapgapbaaaaaaaaaaaegaabaaaabaaaaaaegaabaaaaaaaaaaaaaaaaaai
ecaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaah
icaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadccaaaajecaabaaa
aaaaaaaackaabaaaaaaaaaaadkaabaaaaaaaaaaabkaabaaaaaaaaaaaaaaaaaai
hcaabaaaabaaaaaakgakbaiaebaaaaaaaaaaaaaaegbcbaaaadaaaaaadcaaaaaj
ncaabaaaaaaaaaaaagaabaaaaaaaaaaaagajbaaaabaaaaaakgakbaaaaaaaaaaa
aaaaaaaihcaabaaaabaaaaaaigadbaiaebaaaaaaaaaaaaaaegbcbaaaadaaaaaa
dcaaaaajncaabaaaaaaaaaaapgbpbaaaabaaaaaaagajbaaaabaaaaaaagaobaaa
aaaaaaaaaaaaaaaincaabaaaaaaaaaaafgafbaiaebaaaaaaaaaaaaaaagaobaaa
aaaaaaaadgcaaaafbcaabaaaabaaaaaadkbabaaaadaaaaaadcaaaaajncaabaaa
aaaaaaaaagaabaaaabaaaaaaagaobaaaaaaaaaaafgafbaaaaaaaaaaaaoaaaaah
dcaabaaaabaaaaaaegbabaaaaeaaaaaapgbpbaaaaeaaaaaaefaaaaajpcaabaaa
abaaaaaaegaabaaaabaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaacpaaaaaf
pcaabaaaabaaaaaaegaobaaaabaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaa
aaaaaaaadkaabaiaebaaaaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaia
ebaaaaaaabaaaaaaegbcbaaaafaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaa
abaaaaaaegiccaaaaaaaaaaaacaaaaaadiaaaaahhcaabaaaacaaaaaafgafbaaa
aaaaaaaaegacbaaaacaaaaaadcaaaaaliccabaaaaaaaaaaabkaabaaaaaaaaaaa
dkiacaaaaaaaaaaaacaaaaaabkiacaaaaaaaaaaaadaaaaaadcaaaaajhcaabaaa
aaaaaaaaigadbaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaabaaaaaah
icaabaaaaaaaaaaaegbcbaaaacaaaaaaegbcbaaaacaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadicaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
ckbabaaaacaaaaaaaaaaaaaiicaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaa
abeaaaaaaaaaiadpcpaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaai
icaabaaaaaaaaaaadkaabaaaaaaaaaaackiacaaaaaaaaaaaadaaaaaabjaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaapgapbaaa
aaaaaaaaegiccaaaaaaaaaaaaeaaaaaadiaaaaaihcaabaaaabaaaaaaegacbaaa
abaaaaaapgipcaaaaaaaaaaaaeaaaaaadcaaaaakhccabaaaaaaaaaaaegacbaaa
abaaaaaafgifcaaaaaaaaaaaadaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 57 math, 5 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Vector 0 [_SpecColor]
Float 1 [_Opacity]
Float 2 [_RimFalloff]
Vector 3 [_RimColor]
Vector 4 [unity_LightmapFade]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
SetTexture 4 [unity_LightmapInd] 2D 4
"3.0-!!ARBfp1.0
PARAM c[6] = { program.local[0..4],
		{ 1, 3, 2, 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[0], texture[1], 2D;
MOV R2.x, R0.y;
MOV R0.y, R1.x;
MOV R2.y, R1;
ADD R2.xy, R2, -R0;
MUL_SAT R1.x, fragment.texcoord[0].z, c[5].y;
MAD R0.xy, R1.x, R2, R0;
MOV R1.x, R0.w;
MOV R1.y, R1.w;
MOV R0.w, R1.z;
ADD R1.zw, R1.xyxy, -R0;
MAD_SAT R1.x, fragment.texcoord[0].z, c[5].y, -c[5].z;
MAD R0.zw, R1.x, R1, R0;
ADD R1.xy, R0.zwzw, -R0;
MAD_SAT R0.z, fragment.texcoord[0], c[5].y, -c[5].x;
MAD R2.xw, R0.z, R1.yyzx, R0.yyzx;
MUL R0.y, R2.w, R2.w;
ADD R0.x, -R2, c[5];
MAD_SAT R0.x, R0, R0.y, R2.w;
ADD R1.xyz, fragment.color.primary, -R0.x;
MAD R0.xyz, R2.x, R1, R0.x;
ADD R1.xyz, fragment.color.primary, -R0;
MAD R0.xyz, fragment.texcoord[0].w, R1, R0;
ADD R0.xyz, R0, -R2.w;
MAD R2.xyz, fragment.color.primary.w, R0, R2.w;
TEX R0, fragment.texcoord[3], texture[3], 2D;
MUL R0.xyz, R0.w, R0;
TEX R1, fragment.texcoord[3], texture[4], 2D;
MUL R1.xyz, R1.w, R1;
MUL R1.xyz, R1, c[5].w;
DP4 R0.w, fragment.texcoord[4], fragment.texcoord[4];
RSQ R0.w, R0.w;
RCP R1.w, R0.w;
MAD R3.xyz, R0, c[5].w, -R1;
TXP R0, fragment.texcoord[2], texture[2], 2D;
MAD_SAT R1.w, R1, c[4].z, c[4];
MAD R1.xyz, R1.w, R3, R1;
DP3 R1.w, fragment.texcoord[1], fragment.texcoord[1];
RSQ R1.w, R1.w;
MUL_SAT R1.w, R1, fragment.texcoord[1].z;
LG2 R0.w, R0.w;
ADD R1.w, -R1, c[5].x;
MUL R0.w, R2, -R0;
POW R1.w, R1.w, c[2].x;
LG2 R0.x, R0.x;
LG2 R0.y, R0.y;
LG2 R0.z, R0.z;
ADD R0.xyz, -R0, R1;
MUL R1.xyz, R0, c[0];
MUL R3.xyz, R1, R0.w;
MUL R1.xyz, R1.w, c[3];
MOV R1.w, c[1].x;
MAD R0.xyz, R2, R0, R3;
MUL R1.xyz, R1, c[3].w;
MAD result.color.xyz, R1, c[1].x, R0;
MAD result.color.w, R0, c[0], R1;
END
# 57 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 55 math, 5 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Vector 0 [_SpecColor]
Float 1 [_Opacity]
Float 2 [_RimFalloff]
Vector 3 [_RimColor]
Vector 4 [unity_LightmapFade]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
SetTexture 4 [unity_LightmapInd] 2D 4
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
def c5, 1.00000000, 3.00000000, -1.00000000, -2.00000000
def c6, 8.00000000, 0, 0, 0
dcl_texcoord0 v0
dcl_texcoord1 v1.xyz
dcl_color0 v2
dcl_texcoord2 v3
dcl_texcoord3 v4.xy
dcl_texcoord4 v5
texld r0, v0, s0
texld r1, v0, s1
mov r2.x, r0.y
mov r0.y, r1.x
mov r2.y, r1
add r2.xy, r2, -r0
mul_sat r1.x, v0.z, c5.y
mad r0.xy, r1.x, r2, r0
mov r1.x, r0.w
mov r1.y, r1.w
mov r0.w, r1.z
add r1.zw, r1.xyxy, -r0
mad_sat r1.x, v0.z, c5.y, c5.w
mad r0.zw, r1.x, r1, r0
add r1.xy, r0.zwzw, -r0
mad_sat r0.z, v0, c5.y, c5
mad r2.xw, r0.z, r1.yyzx, r0.yyzx
mul r0.y, r2.w, r2.w
add r0.x, -r2, c5
mad_sat r0.x, r0, r0.y, r2.w
add r1.xyz, v2, -r0.x
mad r0.xyz, r2.x, r1, r0.x
add r1.xyz, v2, -r0
mad r0.xyz, v0.w, r1, r0
add r1.xyz, r0, -r2.w
mov_sat r0.x, v2.w
mad r2.xyz, r0.x, r1, r2.w
texld r0, v4, s3
texld r1, v4, s4
mul_pp r0.xyz, r0.w, r0
mul_pp r1.xyz, r1.w, r1
mul_pp r3.xyz, r1, c6.x
texldp r1, v3, s2
dp4 r0.w, v5, v5
rsq r0.w, r0.w
rcp r0.w, r0.w
mad_pp r0.xyz, r0, c6.x, -r3
mad_sat r0.w, r0, c4.z, c4
mad_pp r0.xyz, r0.w, r0, r3
dp3 r0.w, v1, v1
rsq r0.w, r0.w
mul_sat r0.w, r0, v1.z
log_pp r1.x, r1.x
log_pp r1.y, r1.y
log_pp r1.z, r1.z
add_pp r1.xyz, -r1, r0
add r3.w, -r0, c5.x
pow_pp r0, r3.w, c2.x
log_pp r0.y, r1.w
mul_pp r0.w, r2, -r0.y
mul_pp r3.xyz, r1, c0
mul_pp r3.xyz, r3, r0.w
mul r0.xyz, r0.x, c3
mov_pp r1.w, c1.x
mad_pp r1.xyz, r2, r1, r3
mul r0.xyz, r0, c3.w
mad_pp oC0.xyz, r0, c1.x, r1
mad_pp oC0.w, r0, c0, r1
"
}
SubProgram "d3d11 " {
// Stats: 42 math, 5 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
SetTexture 4 [unity_LightmapInd] 2D 4
ConstBuffer "$Globals" 160
Vector 32 [_SpecColor]
Float 52 [_Opacity]
Float 56 [_RimFalloff]
Vector 64 [_RimColor]
Vector 128 [unity_LightmapFade]
BindCB  "$Globals" 0
"ps_4_0
eefiecedkjhkoajofoonfclnfnpiplfacbakapgnabaaaaaajmaiaaaaadaaaaaa
cmaaaaaaaaabaaaadeabaaaaejfdeheommaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaamfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapapaaaalmaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapalaaaalmaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaadadaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcgaahaaaaeaaaaaaa
niabaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafkaaaaadaagabaaaaaaaaaaa
fkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaa
adaaaaaafkaaaaadaagabaaaaeaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaa
fibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaa
gcbaaaadpcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadpcbabaaa
adaaaaaagcbaaaadlcbabaaaaeaaaaaagcbaaaaddcbabaaaafaaaaaagcbaaaad
pcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaadiaaaaah
bcaabaaaaaaaaaaackbabaaaabaaaaaaabeaaaaaaaaaeaeadgcaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaadgaaaaafkcaabaaaacaaaaaafganbaaa
abaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaa
aagabaaaabaaaaaadgaaaaaffcaabaaaacaaaaaafgahbaaaadaaaaaadgaaaaaf
kcaabaaaabaaaaaaagaibaaaadaaaaaaaaaaaaaipcaabaaaacaaaaaabgalbaia
ebaaaaaaabaaaaaaegaobaaaacaaaaaadcaaaaajdcaabaaaaaaaaaaaagaabaaa
aaaaaaaaegaabaaaacaaaaaabgafbaaaabaaaaaadccaaaapmcaabaaaaaaaaaaa
kgbkbaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaeaeaaaaaeaeaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaamaaaaaialpdcaaaaajdcaabaaaabaaaaaakgakbaaa
aaaaaaaaogakbaaaacaaaaaalgapbaaaabaaaaaaaaaaaaaidcaabaaaabaaaaaa
egaabaiaebaaaaaaaaaaaaaaegaabaaaabaaaaaadcaaaaajdcaabaaaaaaaaaaa
pgapbaaaaaaaaaaaegaabaaaabaaaaaaegaabaaaaaaaaaaaaaaaaaaiecaabaaa
aaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaahicaabaaa
aaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadccaaaajecaabaaaaaaaaaaa
ckaabaaaaaaaaaaadkaabaaaaaaaaaaabkaabaaaaaaaaaaaaaaaaaaihcaabaaa
abaaaaaakgakbaiaebaaaaaaaaaaaaaaegbcbaaaadaaaaaadcaaaaajncaabaaa
aaaaaaaaagaabaaaaaaaaaaaagajbaaaabaaaaaakgakbaaaaaaaaaaaaaaaaaai
hcaabaaaabaaaaaaigadbaiaebaaaaaaaaaaaaaaegbcbaaaadaaaaaadcaaaaaj
ncaabaaaaaaaaaaapgbpbaaaabaaaaaaagajbaaaabaaaaaaagaobaaaaaaaaaaa
aaaaaaaincaabaaaaaaaaaaafgafbaiaebaaaaaaaaaaaaaaagaobaaaaaaaaaaa
dgcaaaafbcaabaaaabaaaaaadkbabaaaadaaaaaadcaaaaajncaabaaaaaaaaaaa
agaabaaaabaaaaaaagaobaaaaaaaaaaafgafbaaaaaaaaaaabbaaaaahbcaabaaa
abaaaaaaegbobaaaagaaaaaaegbobaaaagaaaaaaelaaaaafbcaabaaaabaaaaaa
akaabaaaabaaaaaadccaaaalbcaabaaaabaaaaaaakaabaaaabaaaaaackiacaaa
aaaaaaaaaiaaaaaadkiacaaaaaaaaaaaaiaaaaaaefaaaaajpcaabaaaacaaaaaa
egbabaaaafaaaaaaeghobaaaaeaaaaaaaagabaaaaeaaaaaadiaaaaahccaabaaa
abaaaaaadkaabaaaacaaaaaaabeaaaaaaaaaaaebdiaaaaahocaabaaaabaaaaaa
agajbaaaacaaaaaafgafbaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaa
afaaaaaaeghobaaaadaaaaaaaagabaaaadaaaaaadiaaaaahicaabaaaacaaaaaa
dkaabaaaacaaaaaaabeaaaaaaaaaaaebdcaaaaakhcaabaaaacaaaaaapgapbaaa
acaaaaaaegacbaaaacaaaaaajgahbaiaebaaaaaaabaaaaaadcaaaaajhcaabaaa
abaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaajgahbaaaabaaaaaaaoaaaaah
dcaabaaaacaaaaaaegbabaaaaeaaaaaapgbpbaaaaeaaaaaaefaaaaajpcaabaaa
acaaaaaaegaabaaaacaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaacpaaaaaf
pcaabaaaacaaaaaaegaobaaaacaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaaa
abaaaaaaegacbaiaebaaaaaaacaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaa
aaaaaaaadkaabaiaebaaaaaaacaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaa
abaaaaaaegiccaaaaaaaaaaaacaaaaaadiaaaaahhcaabaaaacaaaaaafgafbaaa
aaaaaaaaegacbaaaacaaaaaadcaaaaaliccabaaaaaaaaaaabkaabaaaaaaaaaaa
dkiacaaaaaaaaaaaacaaaaaabkiacaaaaaaaaaaaadaaaaaadcaaaaajhcaabaaa
aaaaaaaaigadbaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaabaaaaaah
icaabaaaaaaaaaaaegbcbaaaacaaaaaaegbcbaaaacaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadicaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
ckbabaaaacaaaaaaaaaaaaaiicaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaa
abeaaaaaaaaaiadpcpaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaai
icaabaaaaaaaaaaadkaabaaaaaaaaaaackiacaaaaaaaaaaaadaaaaaabjaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaapgapbaaa
aaaaaaaaegiccaaaaaaaaaaaaeaaaaaadiaaaaaihcaabaaaabaaaaaaegacbaaa
abaaaaaapgipcaaaaaaaaaaaaeaaaaaadcaaaaakhccabaaaaaaaaaaaegacbaaa
abaaaaaafgifcaaaaaaaaaaaadaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 70 math, 5 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Vector 0 [_SpecColor]
Float 1 [_Shininess]
Float 2 [_Opacity]
Float 3 [_RimFalloff]
Vector 4 [_RimColor]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
SetTexture 4 [unity_LightmapInd] 2D 4
"3.0-!!ARBfp1.0
PARAM c[9] = { program.local[0..4],
		{ 1, 3, 2, 0.57735026 },
		{ 8, -0.40824828, -0.70710677, 0.57735026 },
		{ 0.81649655, 0, 0.57735026, 128 },
		{ -0.40824831, 0.70710677, 0.57735026 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[0], texture[1], 2D;
MOV R2.x, R0.y;
MOV R0.y, R1.x;
MOV R2.y, R1;
ADD R2.xy, R2, -R0;
MUL_SAT R1.x, fragment.texcoord[0].z, c[5].y;
MAD R0.xy, R1.x, R2, R0;
MOV R1.x, R0.w;
MOV R1.y, R1.w;
MOV R0.w, R1.z;
ADD R1.zw, R1.xyxy, -R0;
MAD_SAT R1.x, fragment.texcoord[0].z, c[5].y, -c[5].z;
MAD R0.zw, R1.x, R1, R0;
ADD R1.xy, R0.zwzw, -R0;
MAD_SAT R0.z, fragment.texcoord[0], c[5].y, -c[5].x;
MAD R3.xy, R0.z, R1, R0;
TEX R0, fragment.texcoord[3], texture[4], 2D;
MUL R1.xyz, R0.w, R0;
MUL R1.xyz, R1, c[6].x;
MUL R2.xyz, R1.y, c[8];
MAD R2.xyz, R1.x, c[7], R2;
ADD R1.w, -R3.y, c[5].x;
MUL R0.x, R3, R3;
MAD_SAT R0.w, R1, R0.x, R3.x;
ADD R0.xyz, fragment.color.primary, -R0.w;
MAD R0.xyz, R3.y, R0, R0.w;
MAD R3.yzw, R1.z, c[6], R2.xxyz;
ADD R2.xyz, fragment.color.primary, -R0;
DP3 R0.w, R3.yzww, R3.yzww;
RSQ R1.w, R0.w;
MAD R0.xyz, fragment.texcoord[0].w, R2, R0;
DP3 R0.w, fragment.texcoord[1], fragment.texcoord[1];
ADD R0.xyz, R0, -R3.x;
MUL R2.xyz, R1.w, R3.yzww;
RSQ R0.w, R0.w;
MAD R2.xyw, fragment.texcoord[1].xyzz, R0.w, R2.xyzz;
DP3 R0.w, R2.xyww, R2.xyww;
MAD R2.xyz, fragment.color.primary.w, R0, R3.x;
RSQ R0.y, R0.w;
MUL R0.y, R0, R2.w;
MOV R0.x, c[7].w;
MUL R0.z, R0.x, c[1].x;
MAX R0.x, R0.y, c[7].y;
POW R1.w, R0.x, R0.z;
TEX R0, fragment.texcoord[3], texture[3], 2D;
DP3 R2.w, fragment.texcoord[1], fragment.texcoord[1];
MUL R0.xyz, R0.w, R0;
DP3 R1.x, R1, c[5].w;
MUL R1.xyz, R0, R1.x;
TXP R0, fragment.texcoord[2], texture[2], 2D;
MUL R1.xyz, R1, c[6].x;
LG2 R0.x, R0.x;
LG2 R0.y, R0.y;
LG2 R0.z, R0.z;
LG2 R0.w, R0.w;
ADD R0, -R0, R1;
RSQ R2.w, R2.w;
MUL_SAT R1.w, R2, fragment.texcoord[1].z;
ADD R1.w, -R1, c[5].x;
MUL R1.xyz, R0, c[0];
MUL R0.w, R3.x, R0;
MUL R3.xyz, R1, R0.w;
POW R1.w, R1.w, c[3].x;
MUL R1.xyz, R1.w, c[4];
MOV R1.w, c[2].x;
MAD R0.xyz, R2, R0, R3;
MUL R1.xyz, R1, c[4].w;
MAD result.color.xyz, R1, c[2].x, R0;
MAD result.color.w, R0, c[0], R1;
END
# 70 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 71 math, 5 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Vector 0 [_SpecColor]
Float 1 [_Shininess]
Float 2 [_Opacity]
Float 3 [_RimFalloff]
Vector 4 [_RimColor]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
SetTexture 4 [unity_LightmapInd] 2D 4
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
def c5, 1.00000000, 3.00000000, -1.00000000, -2.00000000
def c6, 8.00000000, 0.57735026, -0.40824831, 0.70710677
def c7, 0.81649655, 0.00000000, 0.57735026, 128.00000000
def c8, -0.40824828, -0.70710677, 0.57735026, 0
dcl_texcoord0 v0
dcl_texcoord1 v1.xyz
dcl_color0 v2
dcl_texcoord2 v3
dcl_texcoord3 v4.xy
texld r0, v0, s0
texld r1, v0, s1
mov r2.x, r0.w
mov r0.w, r1.z
mov r2.y, r1.w
add r2.xy, r2, -r0.zwzw
mad_sat r1.z, v0, c5.y, c5.w
mad r0.zw, r1.z, r2.xyxy, r0
mov r1.z, r0.y
mov r0.y, r1.x
mov r1.w, r1.y
add r1.zw, r1, -r0.xyxy
mul_sat r1.x, v0.z, c5.y
mad r0.xy, r1.x, r1.zwzw, r0
texld r1, v4, s4
mul_pp r1.xyz, r1.w, r1
mul_pp r1.xyz, r1, c6.x
add r0.zw, r0, -r0.xyxy
mad_sat r1.w, v0.z, c5.y, c5.z
mad r3.xy, r1.w, r0.zwzw, r0
mul r0.xyz, r1.y, c6.zwyw
mad r0.xyz, r1.x, c7, r0
mad r2.xyz, r1.z, c8, r0
mul r1.w, r3.x, r3.x
add r0.w, -r3.y, c5.x
mad_sat r0.w, r0, r1, r3.x
add r0.xyz, v2, -r0.w
mad r0.xyz, r3.y, r0, r0.w
dp3 r1.w, r2, r2
rsq r1.w, r1.w
dp3_pp r0.w, v1, v1
mul r2.xyz, r1.w, r2
rsq_pp r0.w, r0.w
mad_pp r3.yzw, v1.xxyz, r0.w, r2.xxyz
add r2.xyz, v2, -r0
mad r2.xyz, v0.w, r2, r0
dp3_pp r0.w, r3.yzww, r3.yzww
rsq_pp r0.x, r0.w
mov_pp r0.y, c1.x
mul_pp r0.x, r0, r3.w
mul_pp r2.w, c7, r0.y
max_pp r1.w, r0.x, c7.y
pow r0, r1.w, r2.w
add r0.xyz, r2, -r3.x
mov_sat r1.w, v2
dp3 r2.w, v1, v1
rsq r2.w, r2.w
mul_sat r2.w, r2, v1.z
mad r2.xyz, r1.w, r0, r3.x
mov r1.w, r0
texld r0, v4, s3
mul_pp r0.xyz, r0.w, r0
dp3_pp r1.x, r1, c6.y
mul_pp r1.xyz, r0, r1.x
texldp r0, v3, s2
log_pp r0.x, r0.x
log_pp r0.y, r0.y
log_pp r0.z, r0.z
log_pp r0.w, r0.w
mul_pp r1.xyz, r1, c6.x
add_pp r1, -r0, r1
add r2.w, -r2, c5.x
pow_pp r0, r2.w, c3.x
mul_pp r0.yzw, r1.xxyz, c0.xxyz
mul_pp r1.w, r3.x, r1
mul_pp r3.xyz, r0.yzww, r1.w
mul r0.xyz, r0.x, c4
mov_pp r0.w, c2.x
mad_pp r1.xyz, r2, r1, r3
mul r0.xyz, r0, c4.w
mad_pp oC0.xyz, r0, c2.x, r1
mad_pp oC0.w, r1, c0, r0
"
}
SubProgram "d3d11 " {
// Stats: 54 math, 5 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
SetTexture 4 [unity_LightmapInd] 2D 4
ConstBuffer "$Globals" 160
Vector 32 [_SpecColor]
Float 48 [_Shininess]
Float 52 [_Opacity]
Float 56 [_RimFalloff]
Vector 64 [_RimColor]
BindCB  "$Globals" 0
"ps_4_0
eefiecedgjfiljjnpjjdfgdfdhgdeedbhfigdepjabaaaaaaoiajaaaaadaaaaaa
cmaaaaaaoiaaaaaabmabaaaaejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapapaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapalaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
meaiaaaaeaaaaaaadbacaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaa
aeaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaa
gcbaaaadpcbabaaaadaaaaaagcbaaaadlcbabaaaaeaaaaaagcbaaaaddcbabaaa
afaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacagaaaaaadiaaaaahbcaabaaa
aaaaaaaackbabaaaabaaaaaaabeaaaaaaaaaeaeadgcaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaadgaaaaafkcaabaaaacaaaaaafganbaaaabaaaaaa
efaaaaajpcaabaaaadaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaa
abaaaaaadgaaaaaffcaabaaaacaaaaaafgahbaaaadaaaaaadgaaaaafkcaabaaa
abaaaaaaagaibaaaadaaaaaaaaaaaaaipcaabaaaacaaaaaabgalbaiaebaaaaaa
abaaaaaaegaobaaaacaaaaaadcaaaaajdcaabaaaaaaaaaaaagaabaaaaaaaaaaa
egaabaaaacaaaaaabgafbaaaabaaaaaadccaaaapmcaabaaaaaaaaaaakgbkbaaa
abaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaeaeaaaaaeaeaaceaaaaaaaaaaaaa
aaaaaaaaaaaaaamaaaaaialpdcaaaaajdcaabaaaabaaaaaakgakbaaaaaaaaaaa
ogakbaaaacaaaaaalgapbaaaabaaaaaaaaaaaaaidcaabaaaabaaaaaaegaabaia
ebaaaaaaaaaaaaaaegaabaaaabaaaaaadcaaaaajdcaabaaaaaaaaaaapgapbaaa
aaaaaaaaegaabaaaabaaaaaaegaabaaaaaaaaaaaaaaaaaaiecaabaaaaaaaaaaa
akaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaahicaabaaaaaaaaaaa
bkaabaaaaaaaaaaabkaabaaaaaaaaaaadccaaaajecaabaaaaaaaaaaackaabaaa
aaaaaaaadkaabaaaaaaaaaaabkaabaaaaaaaaaaaaaaaaaaihcaabaaaabaaaaaa
kgakbaiaebaaaaaaaaaaaaaaegbcbaaaadaaaaaadcaaaaajncaabaaaaaaaaaaa
agaabaaaaaaaaaaaagajbaaaabaaaaaakgakbaaaaaaaaaaaaaaaaaaihcaabaaa
abaaaaaaigadbaiaebaaaaaaaaaaaaaaegbcbaaaadaaaaaadcaaaaajncaabaaa
aaaaaaaapgbpbaaaabaaaaaaagajbaaaabaaaaaaagaobaaaaaaaaaaaaaaaaaai
ncaabaaaaaaaaaaafgafbaiaebaaaaaaaaaaaaaaagaobaaaaaaaaaaadgcaaaaf
bcaabaaaabaaaaaadkbabaaaadaaaaaadcaaaaajncaabaaaaaaaaaaaagaabaaa
abaaaaaaagaobaaaaaaaaaaafgafbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaafaaaaaaeghobaaaaeaaaaaaaagabaaaaeaaaaaadiaaaaahicaabaaa
abaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaapgapbaaaabaaaaaadiaaaaakhcaabaaaacaaaaaafgafbaaa
abaaaaaaaceaaaaaomafnblopdaedfdpdkmnbddpaaaaaaaadcaaaaamhcaabaaa
acaaaaaaagaabaaaabaaaaaaaceaaaaaolaffbdpaaaaaaaadkmnbddpaaaaaaaa
egacbaaaacaaaaaadcaaaaamhcaabaaaacaaaaaakgakbaaaabaaaaaaaceaaaaa
olafnblopdaedflpdkmnbddpaaaaaaaaegacbaaaacaaaaaabaaaaaakbcaabaaa
abaaaaaaaceaaaaadkmnbddpdkmnbddpdkmnbddpaaaaaaaaegacbaaaabaaaaaa
baaaaaahccaabaaaabaaaaaaegacbaaaacaaaaaaegacbaaaacaaaaaaeeaaaaaf
ccaabaaaabaaaaaabkaabaaaabaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaa
acaaaaaaegbcbaaaacaaaaaaeeaaaaafecaabaaaabaaaaaackaabaaaabaaaaaa
diaaaaahpcaabaaaadaaaaaakgakbaaaabaaaaaacgbjbaaaacaaaaaadcaaaaaj
ocaabaaaabaaaaaaagajbaaaacaaaaaafgafbaaaabaaaaaafgaobaaaadaaaaaa
dgcaaaafbcaabaaaadaaaaaaakaabaaaadaaaaaaaaaaaaaibcaabaaaacaaaaaa
akaabaiaebaaaaaaadaaaaaaabeaaaaaaaaaiadpcpaaaaafbcaabaaaacaaaaaa
akaabaaaacaaaaaadiaaaaaibcaabaaaacaaaaaaakaabaaaacaaaaaackiacaaa
aaaaaaaaadaaaaaabjaaaaafbcaabaaaacaaaaaaakaabaaaacaaaaaadiaaaaai
hcaabaaaacaaaaaaagaabaaaacaaaaaaegiccaaaaaaaaaaaaeaaaaaadiaaaaai
hcaabaaaacaaaaaaegacbaaaacaaaaaapgipcaaaaaaaaaaaaeaaaaaabaaaaaah
ccaabaaaabaaaaaajgahbaaaabaaaaaajgahbaaaabaaaaaaeeaaaaafccaabaaa
abaaaaaabkaabaaaabaaaaaadiaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaa
dkaabaaaabaaaaaadeaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaaabeaaaaa
aaaaaaaacpaaaaafccaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaaiecaabaaa
abaaaaaaakiacaaaaaaaaaaaadaaaaaaabeaaaaaaaaaaaeddiaaaaahccaabaaa
abaaaaaabkaabaaaabaaaaaackaabaaaabaaaaaabjaaaaaficaabaaaadaaaaaa
bkaabaaaabaaaaaaaoaaaaahgcaabaaaabaaaaaaagbbbaaaaeaaaaaapgbpbaaa
aeaaaaaaefaaaaajpcaabaaaaeaaaaaajgafbaaaabaaaaaaeghobaaaacaaaaaa
aagabaaaacaaaaaacpaaaaafpcaabaaaaeaaaaaaegaobaaaaeaaaaaaefaaaaaj
pcaabaaaafaaaaaaegbabaaaafaaaaaaeghobaaaadaaaaaaaagabaaaadaaaaaa
diaaaaahccaabaaaabaaaaaadkaabaaaafaaaaaaabeaaaaaaaaaaaebdiaaaaah
ocaabaaaabaaaaaaagajbaaaafaaaaaafgafbaaaabaaaaaadiaaaaahhcaabaaa
adaaaaaaagaabaaaabaaaaaajgahbaaaabaaaaaaaaaaaaaipcaabaaaabaaaaaa
egaobaaaadaaaaaaegaobaiaebaaaaaaaeaaaaaadiaaaaahccaabaaaaaaaaaaa
bkaabaaaaaaaaaaadkaabaaaabaaaaaadiaaaaaihcaabaaaadaaaaaaegacbaaa
abaaaaaaegiccaaaaaaaaaaaacaaaaaadiaaaaahhcaabaaaadaaaaaafgafbaaa
aaaaaaaaegacbaaaadaaaaaadcaaaaaliccabaaaaaaaaaaabkaabaaaaaaaaaaa
dkiacaaaaaaaaaaaacaaaaaabkiacaaaaaaaaaaaadaaaaaadcaaaaajhcaabaaa
aaaaaaaaigadbaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaadcaaaaak
hccabaaaaaaaaaaaegacbaaaacaaaaaafgifcaaaaaaaaaaaadaaaaaaegacbaaa
aaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 42 math, 3 textures
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Vector 0 [_SpecColor]
Float 1 [_Opacity]
Float 2 [_RimFalloff]
Vector 3 [_RimColor]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
"3.0-!!ARBfp1.0
PARAM c[5] = { program.local[0..3],
		{ 1, 3, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[0], texture[1], 2D;
MOV R2.x, R0.y;
MOV R0.y, R1.x;
MOV R2.y, R1;
ADD R2.xy, R2, -R0;
MUL_SAT R1.x, fragment.texcoord[0].z, c[4].y;
MAD R0.xy, R1.x, R2, R0;
MOV R1.x, R0.w;
MOV R1.y, R1.w;
MOV R0.w, R1.z;
ADD R1.zw, R1.xyxy, -R0;
MAD_SAT R1.x, fragment.texcoord[0].z, c[4].y, -c[4].z;
MAD R0.zw, R1.x, R1, R0;
ADD R1.xy, R0.zwzw, -R0;
MAD_SAT R0.z, fragment.texcoord[0], c[4].y, -c[4].x;
MAD R2.xy, R0.z, R1, R0;
DP3 R1.w, fragment.texcoord[1], fragment.texcoord[1];
RSQ R1.w, R1.w;
MUL_SAT R1.w, R1, fragment.texcoord[1].z;
ADD R1.w, -R1, c[4].x;
MUL R0.y, R2.x, R2.x;
ADD R0.x, -R2.y, c[4];
MAD_SAT R0.x, R0, R0.y, R2;
ADD R1.xyz, fragment.color.primary, -R0.x;
MAD R0.xyz, R2.y, R1, R0.x;
ADD R1.xyz, fragment.color.primary, -R0;
MAD R0.xyz, fragment.texcoord[0].w, R1, R0;
ADD R0.xyz, R0, -R2.x;
MAD R1.xyz, fragment.color.primary.w, R0, R2.x;
TXP R0, fragment.texcoord[2], texture[2], 2D;
MUL R0.w, R2.x, R0;
ADD R2.xyz, R0, fragment.texcoord[3];
MUL R0.xyz, R2, c[0];
MUL R3.xyz, R0, R0.w;
POW R1.w, R1.w, c[2].x;
MUL R0.xyz, R1.w, c[3];
MOV R1.w, c[1].x;
MAD R1.xyz, R1, R2, R3;
MUL R0.xyz, R0, c[3].w;
MAD result.color.xyz, R0, c[1].x, R1;
MAD result.color.w, R0, c[0], R1;
END
# 42 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 43 math, 3 textures
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Vector 0 [_SpecColor]
Float 1 [_Opacity]
Float 2 [_RimFalloff]
Vector 3 [_RimColor]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c4, 1.00000000, 3.00000000, -1.00000000, -2.00000000
dcl_texcoord0 v0
dcl_texcoord1 v1.xyz
dcl_color0 v2
dcl_texcoord2 v3
dcl_texcoord3 v4.xyz
texld r0, v0, s0
texld r1, v0, s1
mov r2.x, r0.y
mov r0.y, r1.x
mov r2.y, r1
add r2.xy, r2, -r0
mul_sat r1.x, v0.z, c4.y
mad r0.xy, r1.x, r2, r0
mov r1.x, r0.w
mov r1.y, r1.w
mov r0.w, r1.z
add r1.zw, r1.xyxy, -r0
mad_sat r1.x, v0.z, c4.y, c4.w
mad r0.zw, r1.x, r1, r0
add r1.xy, r0.zwzw, -r0
mad_sat r0.z, v0, c4.y, c4
mad r3.xy, r0.z, r1, r0
mul r0.y, r3.x, r3.x
add r0.x, -r3.y, c4
mad_sat r0.x, r0, r0.y, r3
add r1.xyz, v2, -r0.x
mad r1.xyz, r3.y, r1, r0.x
add r2.xyz, v2, -r1
mad r1.xyz, v0.w, r2, r1
dp3 r0.x, v1, v1
rsq r0.x, r0.x
mul_sat r0.x, r0, v1.z
add r1.xyz, r1, -r3.x
mov_sat r0.y, v2.w
mad r2.xyz, r0.y, r1, r3.x
texldp r1, v3, s2
add r2.w, -r0.x, c4.x
pow_pp r0, r2.w, c2.x
mul_pp r0.w, r3.x, r1
mov_pp r1.w, r0.x
add_pp r1.xyz, r1, v4
mul_pp r0.xyz, r1, c0
mul_pp r3.xyz, r0, r0.w
mul r0.xyz, r1.w, c3
mov_pp r1.w, c1.x
mad_pp r1.xyz, r2, r1, r3
mul r0.xyz, r0, c3.w
mad_pp oC0.xyz, r0, c1.x, r1
mad_pp oC0.w, r0, c0, r1
"
}
SubProgram "d3d11 " {
// Stats: 33 math, 3 textures
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
ConstBuffer "$Globals" 128
Vector 32 [_SpecColor]
Float 52 [_Opacity]
Float 56 [_RimFalloff]
Vector 64 [_RimColor]
BindCB  "$Globals" 0
"ps_4_0
eefiecedegfogjhecjimiikanaldgdbgbmfkpiioabaaaaaaoaagaaaaadaaaaaa
cmaaaaaaoiaaaaaabmabaaaaejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapapaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapalaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
lmafaaaaeaaaaaaagpabaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaad
hcbabaaaacaaaaaagcbaaaadpcbabaaaadaaaaaagcbaaaadlcbabaaaaeaaaaaa
gcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaa
diaaaaahbcaabaaaaaaaaaaackbabaaaabaaaaaaabeaaaaaaaaaeaeadgcaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadgaaaaafkcaabaaaacaaaaaa
fganbaaaabaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaabaaaaaadgaaaaaffcaabaaaacaaaaaafgahbaaaadaaaaaa
dgaaaaafkcaabaaaabaaaaaaagaibaaaadaaaaaaaaaaaaaipcaabaaaacaaaaaa
bgalbaiaebaaaaaaabaaaaaaegaobaaaacaaaaaadcaaaaajdcaabaaaaaaaaaaa
agaabaaaaaaaaaaaegaabaaaacaaaaaabgafbaaaabaaaaaadccaaaapmcaabaaa
aaaaaaaakgbkbaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaeaeaaaaaeaea
aceaaaaaaaaaaaaaaaaaaaaaaaaaaamaaaaaialpdcaaaaajdcaabaaaabaaaaaa
kgakbaaaaaaaaaaaogakbaaaacaaaaaalgapbaaaabaaaaaaaaaaaaaidcaabaaa
abaaaaaaegaabaiaebaaaaaaaaaaaaaaegaabaaaabaaaaaadcaaaaajdcaabaaa
aaaaaaaapgapbaaaaaaaaaaaegaabaaaabaaaaaaegaabaaaaaaaaaaaaaaaaaai
ecaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaah
icaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadccaaaajecaabaaa
aaaaaaaackaabaaaaaaaaaaadkaabaaaaaaaaaaabkaabaaaaaaaaaaaaaaaaaai
hcaabaaaabaaaaaakgakbaiaebaaaaaaaaaaaaaaegbcbaaaadaaaaaadcaaaaaj
ncaabaaaaaaaaaaaagaabaaaaaaaaaaaagajbaaaabaaaaaakgakbaaaaaaaaaaa
aaaaaaaihcaabaaaabaaaaaaigadbaiaebaaaaaaaaaaaaaaegbcbaaaadaaaaaa
dcaaaaajncaabaaaaaaaaaaapgbpbaaaabaaaaaaagajbaaaabaaaaaaagaobaaa
aaaaaaaaaaaaaaaincaabaaaaaaaaaaafgafbaiaebaaaaaaaaaaaaaaagaobaaa
aaaaaaaadgcaaaafbcaabaaaabaaaaaadkbabaaaadaaaaaadcaaaaajncaabaaa
aaaaaaaaagaabaaaabaaaaaaagaobaaaaaaaaaaafgafbaaaaaaaaaaaaoaaaaah
dcaabaaaabaaaaaaegbabaaaaeaaaaaapgbpbaaaaeaaaaaaefaaaaajpcaabaaa
abaaaaaaegaabaaaabaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaadkaabaaaabaaaaaaaaaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaaegbcbaaaafaaaaaadiaaaaaihcaabaaaacaaaaaa
egacbaaaabaaaaaaegiccaaaaaaaaaaaacaaaaaadiaaaaahhcaabaaaacaaaaaa
fgafbaaaaaaaaaaaegacbaaaacaaaaaadcaaaaaliccabaaaaaaaaaaabkaabaaa
aaaaaaaadkiacaaaaaaaaaaaacaaaaaabkiacaaaaaaaaaaaadaaaaaadcaaaaaj
hcaabaaaaaaaaaaaigadbaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaa
baaaaaahicaabaaaaaaaaaaaegbcbaaaacaaaaaaegbcbaaaacaaaaaaeeaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaadicaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaackbabaaaacaaaaaaaaaaaaaiicaabaaaaaaaaaaadkaabaiaebaaaaaa
aaaaaaaaabeaaaaaaaaaiadpcpaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaaiicaabaaaaaaaaaaadkaabaaaaaaaaaaackiacaaaaaaaaaaaadaaaaaa
bjaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaa
pgapbaaaaaaaaaaaegiccaaaaaaaaaaaaeaaaaaadiaaaaaihcaabaaaabaaaaaa
egacbaaaabaaaaaapgipcaaaaaaaaaaaaeaaaaaadcaaaaakhccabaaaaaaaaaaa
egacbaaaabaaaaaafgifcaaaaaaaaaaaadaaaaaaegacbaaaaaaaaaaadoaaaaab
"
}
SubProgram "gles " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 53 math, 5 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Vector 0 [_SpecColor]
Float 1 [_Opacity]
Float 2 [_RimFalloff]
Vector 3 [_RimColor]
Vector 4 [unity_LightmapFade]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
SetTexture 4 [unity_LightmapInd] 2D 4
"3.0-!!ARBfp1.0
PARAM c[6] = { program.local[0..4],
		{ 1, 3, 2, 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[0], texture[1], 2D;
MOV R2.x, R0.y;
MOV R0.y, R1.x;
MOV R2.y, R1;
ADD R2.xy, R2, -R0;
MUL_SAT R1.x, fragment.texcoord[0].z, c[5].y;
MAD R0.xy, R1.x, R2, R0;
MOV R1.x, R0.w;
MOV R1.y, R1.w;
MOV R0.w, R1.z;
ADD R1.zw, R1.xyxy, -R0;
MAD_SAT R1.x, fragment.texcoord[0].z, c[5].y, -c[5].z;
MAD R0.zw, R1.x, R1, R0;
ADD R1.xy, R0.zwzw, -R0;
MAD_SAT R0.z, fragment.texcoord[0], c[5].y, -c[5].x;
MAD R0.xy, R0.z, R1, R0;
MUL R0.w, R0.x, R0.x;
ADD R0.z, -R0.y, c[5].x;
MAD_SAT R0.z, R0, R0.w, R0.x;
ADD R1.xyz, fragment.color.primary, -R0.z;
MAD R1.xyz, R0.y, R1, R0.z;
ADD R2.xyz, fragment.color.primary, -R1;
MAD R1.xyz, fragment.texcoord[0].w, R2, R1;
ADD R1.xyz, R1, -R0.x;
TXP R2, fragment.texcoord[2], texture[2], 2D;
MAD R3.xyz, fragment.color.primary.w, R1, R0.x;
MUL R2.w, R0.x, R2;
TEX R1, fragment.texcoord[3], texture[4], 2D;
TEX R0, fragment.texcoord[3], texture[3], 2D;
MUL R1.xyz, R1.w, R1;
MUL R0.xyz, R0.w, R0;
MUL R1.xyz, R1, c[5].w;
DP4 R0.w, fragment.texcoord[4], fragment.texcoord[4];
RSQ R1.w, R0.w;
DP3 R0.w, fragment.texcoord[1], fragment.texcoord[1];
RCP R1.w, R1.w;
RSQ R0.w, R0.w;
MUL_SAT R0.w, R0, fragment.texcoord[1].z;
ADD R0.w, -R0, c[5].x;
MAD R0.xyz, R0, c[5].w, -R1;
MAD_SAT R1.w, R1, c[4].z, c[4];
MAD R0.xyz, R1.w, R0, R1;
ADD R1.xyz, R2, R0;
MUL R0.xyz, R1, c[0];
MUL R2.xyz, R0, R2.w;
POW R0.w, R0.w, c[2].x;
MUL R0.xyz, R0.w, c[3];
MOV R0.w, c[1].x;
MAD R1.xyz, R3, R1, R2;
MUL R0.xyz, R0, c[3].w;
MAD result.color.xyz, R0, c[1].x, R1;
MAD result.color.w, R2, c[0], R0;
END
# 53 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 51 math, 5 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Vector 0 [_SpecColor]
Float 1 [_Opacity]
Float 2 [_RimFalloff]
Vector 3 [_RimColor]
Vector 4 [unity_LightmapFade]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
SetTexture 4 [unity_LightmapInd] 2D 4
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
def c5, 1.00000000, 3.00000000, -1.00000000, -2.00000000
def c6, 8.00000000, 0, 0, 0
dcl_texcoord0 v0
dcl_texcoord1 v1.xyz
dcl_color0 v2
dcl_texcoord2 v3
dcl_texcoord3 v4.xy
dcl_texcoord4 v5
texld r0, v0, s0
texld r1, v0, s1
mov r2.x, r0.y
mov r0.y, r1.x
mov r2.y, r1
dp4 r2.w, v5, v5
rsq r2.w, r2.w
add r2.xy, r2, -r0
mul_sat r1.x, v0.z, c5.y
mad r0.xy, r1.x, r2, r0
mov r1.x, r0.w
mov r1.y, r1.w
mov r0.w, r1.z
add r1.zw, r1.xyxy, -r0
mad_sat r1.x, v0.z, c5.y, c5.w
mad r0.zw, r1.x, r1, r0
add r1.xy, r0.zwzw, -r0
mad_sat r0.z, v0, c5.y, c5
mad r3.xy, r0.z, r1, r0
mul r0.y, r3.x, r3.x
add r0.x, -r3.y, c5
mad_sat r0.x, r0, r0.y, r3
add r1.xyz, v2, -r0.x
mad r0.xyz, r3.y, r1, r0.x
add r1.xyz, v2, -r0
mad r0.xyz, v0.w, r1, r0
add r1.xyz, r0, -r3.x
mov_sat r0.x, v2.w
mad r2.xyz, r0.x, r1, r3.x
texldp r0, v3, s2
mul_pp r0.w, r3.x, r0
texld r1, v4, s4
mul_pp r3.xyz, r1.w, r1
texld r1, v4, s3
mul_pp r1.xyz, r1.w, r1
mul_pp r3.xyz, r3, c6.x
dp3 r1.w, v1, v1
rsq r1.w, r1.w
mad_pp r1.xyz, r1, c6.x, -r3
mul_sat r1.w, r1, v1.z
rcp r3.w, r2.w
add r2.w, -r1, c5.x
mad_sat r1.w, r3, c4.z, c4
mad_pp r3.xyz, r1.w, r1, r3
add_pp r0.xyz, r0, r3
pow_pp r1, r2.w, c2.x
mul_pp r3.xyz, r0, c0
mul_pp r3.xyz, r3, r0.w
mul r1.xyz, r1.x, c3
mov_pp r1.w, c1.x
mad_pp r0.xyz, r2, r0, r3
mul r1.xyz, r1, c3.w
mad_pp oC0.xyz, r1, c1.x, r0
mad_pp oC0.w, r0, c0, r1
"
}
SubProgram "d3d11 " {
// Stats: 41 math, 5 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
SetTexture 4 [unity_LightmapInd] 2D 4
ConstBuffer "$Globals" 160
Vector 32 [_SpecColor]
Float 52 [_Opacity]
Float 56 [_RimFalloff]
Vector 64 [_RimColor]
Vector 128 [unity_LightmapFade]
BindCB  "$Globals" 0
"ps_4_0
eefiecedfjhdmjhklmhikbfeplgedlheaamhccmoabaaaaaaiaaiaaaaadaaaaaa
cmaaaaaaaaabaaaadeabaaaaejfdeheommaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaamfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapapaaaalmaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapalaaaalmaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaadadaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefceeahaaaaeaaaaaaa
nbabaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafkaaaaadaagabaaaaaaaaaaa
fkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaa
adaaaaaafkaaaaadaagabaaaaeaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaa
fibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaa
gcbaaaadpcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadpcbabaaa
adaaaaaagcbaaaadlcbabaaaaeaaaaaagcbaaaaddcbabaaaafaaaaaagcbaaaad
pcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaadiaaaaah
bcaabaaaaaaaaaaackbabaaaabaaaaaaabeaaaaaaaaaeaeadgcaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaadgaaaaafkcaabaaaacaaaaaafganbaaa
abaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaa
aagabaaaabaaaaaadgaaaaaffcaabaaaacaaaaaafgahbaaaadaaaaaadgaaaaaf
kcaabaaaabaaaaaaagaibaaaadaaaaaaaaaaaaaipcaabaaaacaaaaaabgalbaia
ebaaaaaaabaaaaaaegaobaaaacaaaaaadcaaaaajdcaabaaaaaaaaaaaagaabaaa
aaaaaaaaegaabaaaacaaaaaabgafbaaaabaaaaaadccaaaapmcaabaaaaaaaaaaa
kgbkbaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaeaeaaaaaeaeaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaamaaaaaialpdcaaaaajdcaabaaaabaaaaaakgakbaaa
aaaaaaaaogakbaaaacaaaaaalgapbaaaabaaaaaaaaaaaaaidcaabaaaabaaaaaa
egaabaiaebaaaaaaaaaaaaaaegaabaaaabaaaaaadcaaaaajdcaabaaaaaaaaaaa
pgapbaaaaaaaaaaaegaabaaaabaaaaaaegaabaaaaaaaaaaaaaaaaaaiecaabaaa
aaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaahicaabaaa
aaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadccaaaajecaabaaaaaaaaaaa
ckaabaaaaaaaaaaadkaabaaaaaaaaaaabkaabaaaaaaaaaaaaaaaaaaihcaabaaa
abaaaaaakgakbaiaebaaaaaaaaaaaaaaegbcbaaaadaaaaaadcaaaaajncaabaaa
aaaaaaaaagaabaaaaaaaaaaaagajbaaaabaaaaaakgakbaaaaaaaaaaaaaaaaaai
hcaabaaaabaaaaaaigadbaiaebaaaaaaaaaaaaaaegbcbaaaadaaaaaadcaaaaaj
ncaabaaaaaaaaaaapgbpbaaaabaaaaaaagajbaaaabaaaaaaagaobaaaaaaaaaaa
aaaaaaaincaabaaaaaaaaaaafgafbaiaebaaaaaaaaaaaaaaagaobaaaaaaaaaaa
dgcaaaafbcaabaaaabaaaaaadkbabaaaadaaaaaadcaaaaajncaabaaaaaaaaaaa
agaabaaaabaaaaaaagaobaaaaaaaaaaafgafbaaaaaaaaaaabbaaaaahbcaabaaa
abaaaaaaegbobaaaagaaaaaaegbobaaaagaaaaaaelaaaaafbcaabaaaabaaaaaa
akaabaaaabaaaaaadccaaaalbcaabaaaabaaaaaaakaabaaaabaaaaaackiacaaa
aaaaaaaaaiaaaaaadkiacaaaaaaaaaaaaiaaaaaaefaaaaajpcaabaaaacaaaaaa
egbabaaaafaaaaaaeghobaaaaeaaaaaaaagabaaaaeaaaaaadiaaaaahccaabaaa
abaaaaaadkaabaaaacaaaaaaabeaaaaaaaaaaaebdiaaaaahocaabaaaabaaaaaa
agajbaaaacaaaaaafgafbaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaa
afaaaaaaeghobaaaadaaaaaaaagabaaaadaaaaaadiaaaaahicaabaaaacaaaaaa
dkaabaaaacaaaaaaabeaaaaaaaaaaaebdcaaaaakhcaabaaaacaaaaaapgapbaaa
acaaaaaaegacbaaaacaaaaaajgahbaiaebaaaaaaabaaaaaadcaaaaajhcaabaaa
abaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaajgahbaaaabaaaaaaaoaaaaah
dcaabaaaacaaaaaaegbabaaaaeaaaaaapgbpbaaaaeaaaaaaefaaaaajpcaabaaa
acaaaaaaegaabaaaacaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaaaaaaaaah
hcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaadiaaaaahccaabaaa
aaaaaaaabkaabaaaaaaaaaaadkaabaaaacaaaaaadiaaaaaihcaabaaaacaaaaaa
egacbaaaabaaaaaaegiccaaaaaaaaaaaacaaaaaadiaaaaahhcaabaaaacaaaaaa
fgafbaaaaaaaaaaaegacbaaaacaaaaaadcaaaaaliccabaaaaaaaaaaabkaabaaa
aaaaaaaadkiacaaaaaaaaaaaacaaaaaabkiacaaaaaaaaaaaadaaaaaadcaaaaaj
hcaabaaaaaaaaaaaigadbaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaa
baaaaaahicaabaaaaaaaaaaaegbcbaaaacaaaaaaegbcbaaaacaaaaaaeeaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaadicaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaackbabaaaacaaaaaaaaaaaaaiicaabaaaaaaaaaaadkaabaiaebaaaaaa
aaaaaaaaabeaaaaaaaaaiadpcpaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaaiicaabaaaaaaaaaaadkaabaaaaaaaaaaackiacaaaaaaaaaaaadaaaaaa
bjaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaa
pgapbaaaaaaaaaaaegiccaaaaaaaaaaaaeaaaaaadiaaaaaihcaabaaaabaaaaaa
egacbaaaabaaaaaapgipcaaaaaaaaaaaaeaaaaaadcaaaaakhccabaaaaaaaaaaa
egacbaaaabaaaaaafgifcaaaaaaaaaaaadaaaaaaegacbaaaaaaaaaaadoaaaaab
"
}
SubProgram "gles " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
"!!GLES3"
}
SubProgram "opengl " {
// Stats: 67 math, 5 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Vector 0 [_SpecColor]
Float 1 [_Shininess]
Float 2 [_Opacity]
Float 3 [_RimFalloff]
Vector 4 [_RimColor]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
SetTexture 4 [unity_LightmapInd] 2D 4
"3.0-!!ARBfp1.0
PARAM c[9] = { program.local[0..4],
		{ 1, 3, 2, 0.57735026 },
		{ 8, -0.40824828, -0.70710677, 0.57735026 },
		{ 0.81649655, 0, 0.57735026, 128 },
		{ -0.40824831, 0.70710677, 0.57735026 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[0], texture[1], 2D;
MOV R2.x, R0.y;
MOV R0.y, R1.x;
MOV R2.y, R1;
ADD R2.xy, R2, -R0;
MUL_SAT R1.x, fragment.texcoord[0].z, c[5].y;
MAD R1.xy, R1.x, R2, R0;
MOV R0.x, R0.z;
MOV R2.x, R0.w;
MOV R2.y, R1.w;
MOV R0.y, R1.z;
ADD R1.zw, R2.xyxy, -R0.xyxy;
MAD_SAT R0.z, fragment.texcoord[0], c[5].y, -c[5];
MAD R0.xy, R0.z, R1.zwzw, R0;
ADD R2.xy, R0, -R1;
TEX R0, fragment.texcoord[3], texture[4], 2D;
MAD_SAT R1.z, fragment.texcoord[0], c[5].y, -c[5].x;
MAD R2.xw, R1.z, R2.yyzx, R1.yyzx;
MUL R0.xyz, R0.w, R0;
MUL R0.xyz, R0, c[6].x;
MUL R1.xyz, R0.y, c[8];
MAD R1.xyz, R0.x, c[7], R1;
MAD R1.xyz, R0.z, c[6].yzww, R1;
ADD R0.w, -R2.x, c[5].x;
MUL R1.w, R2, R2;
MAD_SAT R0.w, R0, R1, R2;
ADD R3.xyz, fragment.color.primary, -R0.w;
MAD R2.xyz, R2.x, R3, R0.w;
ADD R3.xyz, fragment.color.primary, -R2;
MAD R2.xyz, fragment.texcoord[0].w, R3, R2;
DP3 R0.w, R1, R1;
RSQ R1.w, R0.w;
DP3 R0.w, fragment.texcoord[1], fragment.texcoord[1];
ADD R2.xyz, R2, -R2.w;
DP3 R3.x, fragment.texcoord[1], fragment.texcoord[1];
MUL R1.xyz, R1.w, R1;
RSQ R0.w, R0.w;
MAD R1.xyz, fragment.texcoord[1], R0.w, R1;
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R0.w, R0, R1.z;
TEX R1, fragment.texcoord[3], texture[3], 2D;
MUL R1.xyz, R1.w, R1;
MOV R1.w, c[7];
DP3 R0.x, R0, c[5].w;
MUL R0.xyz, R1, R0.x;
MUL R1.xyz, R0, c[6].x;
MAX R0.w, R0, c[7].y;
MUL R1.w, R1, c[1].x;
POW R1.w, R0.w, R1.w;
TXP R0, fragment.texcoord[2], texture[2], 2D;
ADD R0, R0, R1;
RSQ R3.x, R3.x;
MUL_SAT R1.x, R3, fragment.texcoord[1].z;
ADD R1.w, -R1.x, c[5].x;
MUL R1.xyz, R0, c[0];
MUL R0.w, R2, R0;
POW R1.w, R1.w, c[3].x;
MUL R3.xyz, R1, R0.w;
MUL R1.xyz, R1.w, c[4];
MAD R2.xyz, fragment.color.primary.w, R2, R2.w;
MOV R1.w, c[2].x;
MAD R0.xyz, R2, R0, R3;
MUL R1.xyz, R1, c[4].w;
MAD result.color.xyz, R1, c[2].x, R0;
MAD result.color.w, R0, c[0], R1;
END
# 67 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
// Stats: 68 math, 5 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Vector 0 [_SpecColor]
Float 1 [_Shininess]
Float 2 [_Opacity]
Float 3 [_RimFalloff]
Vector 4 [_RimColor]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
SetTexture 4 [unity_LightmapInd] 2D 4
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
def c5, 1.00000000, 3.00000000, -1.00000000, -2.00000000
def c6, 8.00000000, 0.57735026, -0.40824831, 0.70710677
def c7, 0.81649655, 0.00000000, 0.57735026, 128.00000000
def c8, -0.40824828, -0.70710677, 0.57735026, 0
dcl_texcoord0 v0
dcl_texcoord1 v1.xyz
dcl_color0 v2
dcl_texcoord2 v3
dcl_texcoord3 v4.xy
texld r0, v0, s0
texld r1, v0, s1
mov r2.x, r0.y
mov r0.y, r1.x
mov r2.y, r1
add r2.xy, r2, -r0
mul_sat r1.x, v0.z, c5.y
mad r1.xy, r1.x, r2, r0
mov r0.x, r0.z
mov r2.x, r0.w
mov r2.y, r1.w
mov r0.y, r1.z
add r1.zw, r2.xyxy, -r0.xyxy
mad_sat r0.z, v0, c5.y, c5.w
mad r0.xy, r0.z, r1.zwzw, r0
add r2.xy, r0, -r1
texld r0, v4, s4
mad_sat r1.z, v0, c5.y, c5
mad r3.xy, r1.z, r2, r1
mul_pp r0.xyz, r0.w, r0
mul_pp r1.xyz, r0, c6.x
mul r0.xyz, r1.y, c6.zwyw
mad r0.xyz, r1.x, c7, r0
mul r1.w, r3.x, r3.x
add r0.w, -r3.y, c5.x
mad_sat r0.w, r0, r1, r3.x
add r2.xyz, v2, -r0.w
mad r2.xyz, r3.y, r2, r0.w
mad r0.xyz, r1.z, c8, r0
dp3 r0.w, r0, r0
rsq r1.w, r0.w
add r3.yzw, v2.xxyz, -r2.xxyz
dp3_pp r0.w, v1, v1
mad r2.xyz, v0.w, r3.yzww, r2
mul r0.xyz, r1.w, r0
rsq_pp r0.w, r0.w
mad_pp r0.xyz, v1, r0.w, r0
dp3_pp r1.w, r0, r0
add r0.xyw, r2.xyzz, -r3.x
rsq_pp r1.w, r1.w
mul_pp r0.z, r1.w, r0
mov_pp r2.x, c1
mul_pp r1.w, c7, r2.x
max_pp r0.z, r0, c7.y
pow r2, r0.z, r1.w
mov_sat r0.z, v2.w
mad r2.xyz, r0.z, r0.xyww, r3.x
texld r0, v4, s3
mul_pp r0.xyz, r0.w, r0
dp3_pp r1.x, r1, c6.y
mul_pp r0.xyz, r0, r1.x
dp3 r0.w, v1, v1
mov r1.w, r2
rsq r0.w, r0.w
mul_sat r2.w, r0, v1.z
mul_pp r1.xyz, r0, c6.x
texldp r0, v3, s2
add_pp r1, r0, r1
add r2.w, -r2, c5.x
pow_pp r0, r2.w, c3.x
mul_pp r0.w, r3.x, r1
mul_pp r3.xyz, r1, c0
mul_pp r3.xyz, r3, r0.w
mul r0.xyz, r0.x, c4
mov_pp r1.w, c2.x
mad_pp r1.xyz, r2, r1, r3
mul r0.xyz, r0, c4.w
mad_pp oC0.xyz, r0, c2.x, r1
mad_pp oC0.w, r0, c0, r1
"
}
SubProgram "d3d11 " {
// Stats: 53 math, 5 textures
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Emissive] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
SetTexture 4 [unity_LightmapInd] 2D 4
ConstBuffer "$Globals" 160
Vector 32 [_SpecColor]
Float 48 [_Shininess]
Float 52 [_Opacity]
Float 56 [_RimFalloff]
Vector 64 [_RimColor]
BindCB  "$Globals" 0
"ps_4_0
eefiecedblfkdlmkiglhcngahfemcdamfeooppodabaaaaaanaajaaaaadaaaaaa
cmaaaaaaoiaaaaaabmabaaaaejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapapaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapalaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
kmaiaaaaeaaaaaaaclacaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaa
aeaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaa
gcbaaaadpcbabaaaadaaaaaagcbaaaadlcbabaaaaeaaaaaagcbaaaaddcbabaaa
afaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacagaaaaaadiaaaaahbcaabaaa
aaaaaaaackbabaaaabaaaaaaabeaaaaaaaaaeaeadgcaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaadgaaaaafkcaabaaaacaaaaaafganbaaaabaaaaaa
efaaaaajpcaabaaaadaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaa
abaaaaaadgaaaaaffcaabaaaacaaaaaafgahbaaaadaaaaaadgaaaaafkcaabaaa
abaaaaaaagaibaaaadaaaaaaaaaaaaaipcaabaaaacaaaaaabgalbaiaebaaaaaa
abaaaaaaegaobaaaacaaaaaadcaaaaajdcaabaaaaaaaaaaaagaabaaaaaaaaaaa
egaabaaaacaaaaaabgafbaaaabaaaaaadccaaaapmcaabaaaaaaaaaaakgbkbaaa
abaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaeaeaaaaaeaeaaceaaaaaaaaaaaaa
aaaaaaaaaaaaaamaaaaaialpdcaaaaajdcaabaaaabaaaaaakgakbaaaaaaaaaaa
ogakbaaaacaaaaaalgapbaaaabaaaaaaaaaaaaaidcaabaaaabaaaaaaegaabaia
ebaaaaaaaaaaaaaaegaabaaaabaaaaaadcaaaaajdcaabaaaaaaaaaaapgapbaaa
aaaaaaaaegaabaaaabaaaaaaegaabaaaaaaaaaaaaaaaaaaiecaabaaaaaaaaaaa
akaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaahicaabaaaaaaaaaaa
bkaabaaaaaaaaaaabkaabaaaaaaaaaaadccaaaajecaabaaaaaaaaaaackaabaaa
aaaaaaaadkaabaaaaaaaaaaabkaabaaaaaaaaaaaaaaaaaaihcaabaaaabaaaaaa
kgakbaiaebaaaaaaaaaaaaaaegbcbaaaadaaaaaadcaaaaajncaabaaaaaaaaaaa
agaabaaaaaaaaaaaagajbaaaabaaaaaakgakbaaaaaaaaaaaaaaaaaaihcaabaaa
abaaaaaaigadbaiaebaaaaaaaaaaaaaaegbcbaaaadaaaaaadcaaaaajncaabaaa
aaaaaaaapgbpbaaaabaaaaaaagajbaaaabaaaaaaagaobaaaaaaaaaaaaaaaaaai
ncaabaaaaaaaaaaafgafbaiaebaaaaaaaaaaaaaaagaobaaaaaaaaaaadgcaaaaf
bcaabaaaabaaaaaadkbabaaaadaaaaaadcaaaaajncaabaaaaaaaaaaaagaabaaa
abaaaaaaagaobaaaaaaaaaaafgafbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaafaaaaaaeghobaaaaeaaaaaaaagabaaaaeaaaaaadiaaaaahicaabaaa
abaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaapgapbaaaabaaaaaadiaaaaakhcaabaaaacaaaaaafgafbaaa
abaaaaaaaceaaaaaomafnblopdaedfdpdkmnbddpaaaaaaaadcaaaaamhcaabaaa
acaaaaaaagaabaaaabaaaaaaaceaaaaaolaffbdpaaaaaaaadkmnbddpaaaaaaaa
egacbaaaacaaaaaadcaaaaamhcaabaaaacaaaaaakgakbaaaabaaaaaaaceaaaaa
olafnblopdaedflpdkmnbddpaaaaaaaaegacbaaaacaaaaaabaaaaaakbcaabaaa
abaaaaaaaceaaaaadkmnbddpdkmnbddpdkmnbddpaaaaaaaaegacbaaaabaaaaaa
baaaaaahccaabaaaabaaaaaaegacbaaaacaaaaaaegacbaaaacaaaaaaeeaaaaaf
ccaabaaaabaaaaaabkaabaaaabaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaa
acaaaaaaegbcbaaaacaaaaaaeeaaaaafecaabaaaabaaaaaackaabaaaabaaaaaa
diaaaaahpcaabaaaadaaaaaakgakbaaaabaaaaaacgbjbaaaacaaaaaadcaaaaaj
ocaabaaaabaaaaaaagajbaaaacaaaaaafgafbaaaabaaaaaafgaobaaaadaaaaaa
dgcaaaafbcaabaaaadaaaaaaakaabaaaadaaaaaaaaaaaaaibcaabaaaacaaaaaa
akaabaiaebaaaaaaadaaaaaaabeaaaaaaaaaiadpcpaaaaafbcaabaaaacaaaaaa
akaabaaaacaaaaaadiaaaaaibcaabaaaacaaaaaaakaabaaaacaaaaaackiacaaa
aaaaaaaaadaaaaaabjaaaaafbcaabaaaacaaaaaaakaabaaaacaaaaaadiaaaaai
hcaabaaaacaaaaaaagaabaaaacaaaaaaegiccaaaaaaaaaaaaeaaaaaadiaaaaai
hcaabaaaacaaaaaaegacbaaaacaaaaaapgipcaaaaaaaaaaaaeaaaaaabaaaaaah
ccaabaaaabaaaaaajgahbaaaabaaaaaajgahbaaaabaaaaaaeeaaaaafccaabaaa
abaaaaaabkaabaaaabaaaaaadiaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaa
dkaabaaaabaaaaaadeaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaaabeaaaaa
aaaaaaaacpaaaaafccaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaaiecaabaaa
abaaaaaaakiacaaaaaaaaaaaadaaaaaaabeaaaaaaaaaaaeddiaaaaahccaabaaa
abaaaaaabkaabaaaabaaaaaackaabaaaabaaaaaabjaaaaaficaabaaaadaaaaaa
bkaabaaaabaaaaaaaoaaaaahgcaabaaaabaaaaaaagbbbaaaaeaaaaaapgbpbaaa
aeaaaaaaefaaaaajpcaabaaaaeaaaaaajgafbaaaabaaaaaaeghobaaaacaaaaaa
aagabaaaacaaaaaaefaaaaajpcaabaaaafaaaaaaegbabaaaafaaaaaaeghobaaa
adaaaaaaaagabaaaadaaaaaadiaaaaahccaabaaaabaaaaaadkaabaaaafaaaaaa
abeaaaaaaaaaaaebdiaaaaahocaabaaaabaaaaaaagajbaaaafaaaaaafgafbaaa
abaaaaaadiaaaaahhcaabaaaadaaaaaaagaabaaaabaaaaaajgahbaaaabaaaaaa
aaaaaaahpcaabaaaabaaaaaaegaobaaaadaaaaaaegaobaaaaeaaaaaadiaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaadkaabaaaabaaaaaadiaaaaaihcaabaaa
adaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaaacaaaaaadiaaaaahhcaabaaa
adaaaaaafgafbaaaaaaaaaaaegacbaaaadaaaaaadcaaaaaliccabaaaaaaaaaaa
bkaabaaaaaaaaaaadkiacaaaaaaaaaaaacaaaaaabkiacaaaaaaaaaaaadaaaaaa
dcaaaaajhcaabaaaaaaaaaaaigadbaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
adaaaaaadcaaaaakhccabaaaaaaaaaaaegacbaaaacaaaaaafgifcaaaaaaaaaaa
adaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "gles " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
"!!GLES"
}
SubProgram "glesdesktop " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
"!!GLES"
}
SubProgram "gles3 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
"!!GLES3"
}
}
 }
}
Fallback "Diffuse"
}