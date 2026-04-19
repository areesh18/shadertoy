float Band(float t, float start, float end){
    float bottomEdge=step(start,t);
    float upperEdge=step(t,end);
    return bottomEdge*upperEdge;
}
void mainImage(out vec4 fragColor, in vec2 fragCoord){
    vec2 uv=fragCoord/iResolution.xy;
    uv-=0.5;
    float mask=Band(uv.y,-0.2,0.2);
    fragColor=vec4(vec3(mask),1.);
}
