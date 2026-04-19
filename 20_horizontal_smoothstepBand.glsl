float smoothBand(float start,float end,float blur,float t){
    float halfBlur = blur * 0.5;
    return smoothstep(start-halfBlur,start+halfBlur,t)*smoothstep(end+halfBlur,end-halfBlur,t);
}
void mainImage(out vec4 fragColor,in vec2 fragCoord){
    vec2 uv=fragCoord/iResolution.xy;
    uv-=.5;
    
    float mask=smoothBand(-.3,.3,.01,uv.y);
    fragColor=vec4(vec3(mask),1.);
}