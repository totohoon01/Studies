Shader "Custom/Vertex"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _MainTex2 ("Albedo (RGB)", 2D) = "white" {}
        _MainTex3 ("Albedo (RGB)", 2D) = "white" {}
        _MainTex4 ("Albedo (RGB)", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard noAmbient

        sampler2D _MainTex;
        sampler2D _MainTex2;
        sampler2D _MainTex3;
        sampler2D _MainTex4;

        struct Input
        {
            float2 uv_MainTex;
            //버텍스 컬러 값 받아오기
            float4 color:COLOR;
        };
        UNITY_INSTANCING_BUFFER_START(Props)
        UNITY_INSTANCING_BUFFER_END(Props)

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
            fixed4 d = tex2D (_MainTex2, IN.uv_MainTex);
            fixed4 e = tex2D (_MainTex3, IN.uv_MainTex);
            fixed4 f = tex2D (_MainTex4, IN.uv_MainTex);

            // o.Albedo = c.rgb;
            // o.Emission = IN.color.rgb;

            //멀티 텍스쳐링
            // o.Albedo = lerp(c.rgb, d.rgb, IN.color.r);
            // o.Albedo = lerp(o.Albedo, e.rgb, IN.color.g);
            // o.Albedo = lerp(o.Albedo, f.rgb, IN.color.b);
            
            //Masking
            // o.Albedo = (c.rgb * IN.color.r) + (d.rgb * IN.color.g) + (e.rgb * IN.color.b);
            o.Albedo = (IN.color.r + IN.color.g + IN.color.b) * f.rgb;
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
