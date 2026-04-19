void mainImage(out vec4 fragColor, in vec2 fragCoord){
    vec2 uv=fragCoord/iResolution.xy;
    uv-=0.5;
    float leftEdge=step(uv.x,0.2);
    float rightEdge=step(-0.2,uv.x);
    float mask=leftEdge*rightEdge;
    fragColor=vec4(vec3(mask),1.0);
}