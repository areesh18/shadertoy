void mainImage(out vec4 fragColor, in vec2 fragCoord){
    vec2 uv=fragCoord/iResolution.xy;
    uv-=0.5;
    float upperEdge=step(uv.y,0.2);
    float bottomEdge=step(-0.2,uv.y);
    float mask=upperEdge*bottomEdge;
    fragColor=vec4(vec3(mask),1.);

}