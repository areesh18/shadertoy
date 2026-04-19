void mainImage(out vec4 fragColor,in vec2 fragCoord){
    vec2 uv=fragCoord/iResolution.xy;//0 to 1
    uv-=0.5;//-0.5 to 0.5 (0,0) is the center.
    float f=0.;
    if(uv.x>-.2&&uv.x<.2){
        f=1.;
    }else{
        f=0.;
    }
    vec3 col=vec3(f);
    fragColor=vec4(col,1.);
    
}