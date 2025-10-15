// Input:
// Size (Size of Blur)
// Texture
// TexRes (Width, Height)
// UV
// NumDirections
// Quality

///////////////////////////////////////////////////

float2 Pi2 = 6.28318530718;

// Calculate 2D blur radius in UV Space <--- Converting Pixel Blur Size into UV Space
float2 Radius = Size / TexRes.xy;

// Start with a center pixel (Texel)
float3 blur = Texture2DSample (Texture, TextureSampler, UV).xyz;

//Ensures that NumDirections us never less than one.
// max(float, float) <--- Function built into HLSL.
//the function will return NumDirections if it's greater than 1
// or return 1 if NumDirections is less or equal than 1
NumDirections = max(NumDirections, 1.0);

// Loop over directions in a circle
// Spreading blur rays in a circular pattern from the center
for (float d=0.0; d < Pi2; d+=Pi2/NumDirections)
{
    // Sample along each blur ray <-- Takes Multiple Steps outwards along each direction
    for(float i = 1.0/Quality; i < 1; i+= 1.0/Quality)
    {
        float2 coords = UV + float2(cos(d), sin(d)) * Radius * i;
        blur += Texture2DSample (Texture, TextureSampler, coords).xyz;

    }
}

blur /= (Quality * NumDirections) + 1.0;

return blur;