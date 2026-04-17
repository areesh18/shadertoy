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
       
    float c=circle(uv,vec2(0.0,0.0), 0.4, 0.01);
    c-=circle(uv,vec2(-0.13,0.2), 0.07, 0.01);
    c-=circle(uv,vec2(0.13,0.2), 0.07, 0.01);
    vec3 col=vec3(1.0,1.0,0.0);
    col=col*c;
    fragColor=vec4(col,1.0);
}