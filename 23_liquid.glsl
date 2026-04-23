float smoothBand(float start,float end,float blur,float t){
    float halfBlur=blur*.5;
    return smoothstep(start-halfBlur,start+halfBlur,t)*smoothstep(end+halfBlur,end-halfBlur,t);
}
float SmoothRectangle(vec2 uv,float leftEdge,float rightEdge,float bottomEdge,float topEdge,float blur){
    return smoothBand(leftEdge,rightEdge,blur,uv.x)*smoothBand(bottomEdge,topEdge,blur,uv.y);
}
void mainImage(out vec4 fragColor,in vec2 fragCoord){
    vec2 uv=fragCoord/iResolution.xy;
    uv.x*=iResolution.x/iResolution.y;
    uv-=.5;
    uv*=1.5;
    
    uv.x+=sin(uv.y*20.+iTime)*.1;
    uv.y+=cos(uv.x*20.+iTime)*.1;

    float mask=SmoothRectangle(uv,-.2,.2,-.3,.3,.001);
    fragColor=vec4(vec3(mask),1.);
}
