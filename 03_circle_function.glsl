float circle(vec2 uv,vec2 p, float r, float blur){
    float d=length(uv-p);
    float c=smoothstep(r,r-blur,d);
    
    return c;
}
void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    
    vec2 uv = fragCoord/iResolution.xy;
    uv=uv-0.5;
    uv.x*=iResolution.x/iResolution.y;
       
    float c=circle(uv,vec2(0.0,0.0), 0.1, 0.01);
    fragColor=vec4(vec3(c),1.0);
}