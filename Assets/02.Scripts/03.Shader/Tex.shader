Shader "Custom/Tex"
{
    Properties
    {
      _MainTex("Albedo (RGB)", 2D) = "white"{}
      _MainTex2("Albedo (RGB)", 2D) = "white"{}
      _lerp("Lerp Ratio", Range(0,1)) = 0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        CGPROGRAM
        #pragma surface surf Standard
        #pragma target 3.0

        sampler2D _MainTex;
        sampler2D _MainTex2;
        float _lerp;

        struct Input
        {
          float2 uv_MainTex;
        };

        UNITY_INSTANCING_BUFFER_START(Props)
        UNITY_INSTANCING_BUFFER_END(Props)

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
          fixed4 c = tex2D(_MainTex, IN.uv_MainTex);
          fixed4 d = tex2D(_MainTex2, IN.uv_MainTex);
          //  o.Albedo = c.rbg;
          // o.Albedo = lerp(c.rgb, d.rgb, _lerp);

          if(IN.uv_MainTex.x >=0.5 && IN.uv_MainTex.y >= 0.5){
            o.Albedo = c.rgb;
          }
          else{
            o.Albedo = (c.r + c.b + c.g) / 3;
          }
          o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
