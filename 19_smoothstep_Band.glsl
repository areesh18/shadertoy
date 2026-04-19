float smoothBand(float start,float end,float blur,float t){
    float leftEdge=smoothstep(start,start+blur,t);
    float rightEdge=smoothstep(end,end-blur,t);
    return leftEdge*rightEdge;
}
void mainImage(out vec4 fragColor,in vec2 fragCoord){
    vec2 uv=fragCoord/iResolution.xy;
    uv-=.5;
    
    float mask=smoothBand(-.2,.2,.01,uv.x);
    fragColor=vec4(vec3(mask),1.);
}
