float smoothBand(float start,float end,float blur,float t){
    float halfBlur=blur*0.5;
    float leftEdge=smoothstep(start-halfBlur,start+halfBlur,t);
    float rightEdge=smoothstep(end+halfBlur,end-halfBlur,t);
    return leftEdge*rightEdge;
}
void mainImage(out vec4 fragColor,in vec2 fragCoord){
    vec2 uv=fragCoord/iResolution.xy;
    uv-=.5;
    
    float mask1=smoothBand(-.2,.2,.05,uv.x);
    float mask2=smoothBand(-.3,.3,.05,uv.y);
    float mask=mask1*mask2;
    fragColor=vec4(vec3(mask),1.);
}
