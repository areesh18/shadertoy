float Circle(vec2 uv,vec2 p,float size,float blur){
    float d=length(uv-p);
    float c=smoothstep(size,size-blur,d);
    return c;
}
float WinkeyFace(vec2 uv,vec2 p,float faceSize){
    uv=uv-p;
    float blur=faceSize*0.025;
    float face=Circle(uv,vec2(0.),faceSize,blur);
    float eye1=Circle(uv,vec2(-faceSize*.325,faceSize*.5),faceSize*.2,blur);
    float eye2=Circle(uv,vec2(faceSize*.325,faceSize*.5),faceSize*.2,blur);
    face-=(eye1+eye2);
    
    float mouth=Circle(uv,vec2(0.,-faceSize*.125),faceSize*.625,blur);
    mouth-=Circle(uv,vec2(0.,faceSize*.125),faceSize*.625,blur);
    
    mouth=max(0.,mouth);
    float eyebrowOffset=faceSize*0.075;
    float eyebrow1=Circle(uv,vec2(-faceSize*.325,faceSize*.5+eyebrowOffset),faceSize*0.26,blur);
    eyebrow1=eyebrow1-Circle(uv,vec2(-faceSize*.325,faceSize*.5),faceSize*0.26,blur);
    
    eyebrow1=max(0.,eyebrow1);
    
    float eyebrow2=Circle(uv,vec2(faceSize*.325,faceSize*.5+eyebrowOffset),faceSize*0.26,blur);
    eyebrow2=eyebrow2-Circle(uv,vec2(faceSize*.325,faceSize*.5),faceSize*0.26,blur);

    eyebrow2=max(0.,eyebrow2);

    float smileyFace=face-mouth-eyebrow1-eyebrow2;
    return smileyFace;
    //return eyebrow;
}

void mainImage(out vec4 fragColor,in vec2 fragCoord){
    vec2 uv=fragCoord/iResolution.xy;
    uv=uv-.5;
    uv.x*=iResolution.x/iResolution.y;
    
    vec3 col=vec3(1.,1.,0.);
    uv*=1.2;
    float winkeyFace=WinkeyFace(uv,vec2(0.),0.2);
    
    col*=winkeyFace;
    fragColor=vec4(col,1.);
}