varying vec2 vUv;
varying vec3 vertex_color;

void main(){
     //gl_FragColor = vec4( vec3( vUv, 0) , 1);
     gl_FragColor = vec4(vertex_color, 1.0);
}