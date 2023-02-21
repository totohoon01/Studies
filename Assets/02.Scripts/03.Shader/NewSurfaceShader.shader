Shader "Custom/NewSurfaceShader"
{
    Properties
    {
        _Red ("Red", Range(0,1)) = 1
        _Green ("Green", Range(0,1)) = 1
        _Blue ("Blue", Range(0,1)) = 1
        _Alpha ("Alpha", Range(0,1)) = 1
    }
    SubShader
    {
        Tags { "RenderType"="Transparent" "Queue" = "Transparent" }

        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows alpha:blend

        sampler2D _MainTex;

        struct Input
        {
          float4 color;
        };

        float _Red;
        float _Green;
        float _Blue;
        float _Alpha;

        UNITY_INSTANCING_BUFFER_START(Props)
        UNITY_INSTANCING_BUFFER_END(Props)

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            o.Albedo = float3(_Red, _Green, _Blue);
            o.Alpha = float(_Alpha);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
