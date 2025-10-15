// Inputs:
// Texture
// UV
// Dist
// SampleNum


float3 blur = Texture2DSample(Texture, TextureSampler, UV);

for (int i=0; i<SampleNum; i++) // C/C++ style for loop
{
    ///// Sample Horizontal Texels/////

    // We are sampling to the right of the Texel
    blur += Texture2DSample(Texture, TextureSampler, UV + float2( i*Dist, 0));

    // We are sampling to the Left of the Texel
    blur += Texture2DSample(Texture, TextureSampler, UV - float2( i*Dist, 0));


    ///// Sample Vertical Texels/////

    // We are sampling to the down of the Texel
    blur += Texture2DSample(Texture, TextureSampler, UV + float2( 0, i*Dist));

    // We are sampling to the up of the Texel
    blur += Texture2DSample(Texture, TextureSampler, UV - float2( 0, i*Dist));
}

blur /= (4 * SampleNum) + 1;
return blur;