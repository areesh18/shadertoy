void mainImage(out vec4 fragColor,in vec2 fragCoord)
{
    
    vec2 uv=fragCoord/iResolution.xy;
    uv=uv-.5;
    uv.x*=iResolution.x/iResolution.y;
    
    float d=length(uv);
    float r=.3;
    float c=smoothstep(r,r-.1,d);
    fragColor=vec4(vec3(c),1.);
}