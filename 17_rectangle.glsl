float Band(float t, float start, float end){
    float bottomEdge=step(start,t);
    float upperEdge=step(t,end);
    return bottomEdge*upperEdge;
}
void mainImage(out vec4 fragColor, in vec2 fragCoord){
    vec2 uv=fragCoord/iResolution.xy;
    uv-=0.5;
    float horizontal_mask=Band(uv.y,-0.2,0.2);
    float vertical_mask=Band(uv.x,-0.3,0.3);
    float mask=horizontal_mask*vertical_mask;
    fragColor=vec4(vec3(mask),1.);
}
