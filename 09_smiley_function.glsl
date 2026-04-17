float Circle(vec2 uv,vec2 p,float size,float blur){
    float d=length(uv-p);
    float c=smoothstep(size,size-blur,d);
    return c;
}
float SmileyFace(vec2 uv, vec2 p, float faceSize){
    uv=uv-p;
    
    float face=Circle(uv,vec2(0.),faceSize,.01);
    float eye1=Circle(uv,vec2(-faceSize*0.325,faceSize*0.5),faceSize*0.2,.01);
    float eye2=Circle(uv,vec2(faceSize*0.325,faceSize*0.5),faceSize*0.2,.01);
    face-=(eye1+eye2);
    
    float mouth=Circle(uv,vec2(0.,-faceSize*0.125),faceSize*0.625,.01);
    mouth-=Circle(uv,vec2(0.,faceSize*0.125),faceSize*0.625,.01);
    
    mouth=max(0.,mouth);
    
    float smileyFace=face-mouth;
    return smileyFace;
}

void mainImage(out vec4 fragColor,in vec2 fragCoord){
    vec2 uv=fragCoord/iResolution.xy;
    uv=uv-.5;
    uv.x*=iResolution.x/iResolution.y;
    
    vec3 col=vec3(1.,1.,0.);
    float smileyFace=SmileyFace(uv,vec2(0.1,0.1),0.1);
    smileyFace+=SmileyFace(uv,vec2(-0.1,0.1),0.1);
    smileyFace+=SmileyFace(uv,vec2(-0.1,-0.1),0.1);
    smileyFace+=SmileyFace(uv,vec2(0.1,-0.1),0.1);
    
    col*=smileyFace;
    fragColor=vec4(col,1.);
}