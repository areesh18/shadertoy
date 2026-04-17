void mainImage(out vec4 fragColor,in vec2 fragCoord)
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv=fragCoord/iResolution.xy;
    //-0.5 to +0.5
    uv=uv-.5;
    //fix aspect ratio
    uv.x*=iResolution.x/iResolution.y;
    
    float d=length(uv);
    float c;
    
    if(d<.3){
        c=1.;
    }
    else{
        c=0.;
    }
    fragColor=vec4(vec3(c),1.);
}