float smoothBand(float start,float end,float blur,float t){
    float halfBlur=blur*0.5;
   return smoothstep(start-halfBlur,start+halfBlur,t) * smoothstep(end+halfBlur,end-halfBlur,t);
}
float SmoothRectangle(vec2 uv, float leftEdge, float rightEdge, float bottomEdge, float topEdge, float blur){
    return smoothBand(leftEdge,rightEdge,blur,uv.x)*smoothBand(bottomEdge,topEdge,blur,uv.y);
}
void mainImage(out vec4 fragColor,in vec2 fragCoord){
    vec2 uv=fragCoord/iResolution.xy;
    uv-=.5;
    
    
    float mask=SmoothRectangle(uv,-0.2,0.2,-0.3,0.3,0.01);
    fragColor=vec4(vec3(mask),1.);
}
