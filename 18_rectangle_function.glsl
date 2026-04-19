float Band(float t, float start, float end){
    float a=step(start,t);
    float b=step(t,end);
    return a*b;
}
float Rectangle(vec2 uv, float leftEdge, float rightEdge, float bottomEdge, float topEdge){
    float horizontal_mask=Band(uv.y, bottomEdge, topEdge);
    float vertical_mask=Band(uv.x, leftEdge, rightEdge);
    return horizontal_mask*vertical_mask;
}
void mainImage(out vec4 fragColor, in vec2 fragCoord){
    vec2 uv=fragCoord/iResolution.xy;
    uv-=0.5;
    float mask=Rectangle(uv,-0.2,0.2,-0.3,0.3);
    fragColor=vec4(vec3(mask),1.);
}
