float DrawCircle(float2 uv, float radius){
  float distance = length(uv - 0.5);
  return distance < radius ? 1 : 0;
}

float DrawSmoothCircle(float2 uv, float radius){
  float distance = length(uv - 0.5);
  return distance < radius ? smoothstep(radius, 0, distance) : 0;
}