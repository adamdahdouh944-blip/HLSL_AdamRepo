//NEW PANNER MATERIAl//
//Inputs:
// - UV
// - Speed
// - Texture
// - OffsetTex
// - Time

float2 coords = UV + (Time * Speed); //Adding an Offset to our UVs

//Texture2DSample ---> returns a float4
//
// .r or .x ---> Red Channel
// .g or .y ---> Blue Channel
// .b or .z ---> Green Channel
// .a or .w ---> Alpha Channel

float2 OffsetTex = Texture2DSample(OffsetTex, OffsetTexSampler, coords).xy;

float2 finalCoords = UV + OffsetTex;

return Texture2DSample(Texture, TextureSampler, coords);