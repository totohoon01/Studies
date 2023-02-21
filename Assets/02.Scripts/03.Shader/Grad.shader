Shader "Custom/Grad"
{
    Properties
    {
      _MainTex("Main Texture", 2D) = "white" {}
      _X("X", Range(0,1)) = 0
      _Y("Y", Range(0,1)) = 0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows

        sampler2D _MainTex;
        float _X;
        float _Y;
        
        struct Input
        {
            float2 uv_MainTex;
        };

        UNITY_INSTANCING_BUFFER_START(Props)
        UNITY_INSTANCING_BUFFER_END(Props)

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D (_MainTex, float2(IN.uv_MainTex.x, IN.uv_MainTex.y + _Time.y));
            o.Albedo = c.rgb;
            // o.Emission = float3(IN.uv_MainTex.x + _X, IN.uv_MainTex.y + _Y, 0);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
