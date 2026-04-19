float Band(float t, float start, float end){
    float leftEdge=step(start,t);
    float rightEdge=step(t,end);
    return leftEdge*rightEdge;
}
void mainImage(out vec4 fragColor, in vec2 fragCoord){
    vec2 uv=fragCoord/iResolution.xy;
    uv-=0.5;
    float mask=Band(uv.x,-0.2,0.2);
    mask*=Band(uv.x,-0.1,0.1);
    mask+=Band(uv.x,-0.4,-0.3);
    mask+=Band(uv.x,0.3,0.4);
    fragColor=vec4(vec3(mask),1.0);
}
