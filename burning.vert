varying vec3 normal, lightDir,lightDir1,lightDir2;
float dist,dist1,dist2;

void main()
{	
	// Note that gl_LightSource, gl_NormalMatrix, and gl_Normal
	// are pre-defined variables that access the current OpenGL
	// state.
	   

	normal = normalize(gl_NormalMatrix * gl_Normal);

	vec4 ecPos;
	vec3 aux;
	ecPos = gl_ModelViewMatrix*gl_Vertex;
	aux = vec3(gl_LightSource[0].position-ecPos);
	dist=length(lightDir);
	lightDir = normalize(aux);

	
	vec4 repulse = vec4(lightDir*dot(normal,lightDir),0);
	
	vec4 new_Vert = gl_Vertex-repulse/(1.0+dist);

	//lightDir1 = normalize(vec3(gl_LightSource[1].position));

	//lightDir2 = normalize(vec3(gl_LightSource[2].position));
	lightDir2 = normalize(vec3(gl_LightSource[2].position-ecPos));
	

	// v=ftransform();
	// v=gl_ProjectionMatrix*gl_modelViewMatrix*gl_Vertex;

	gl_Position=gl_ProjectionMatrix*gl_ModelViewMatrix*new_Vert;
	//gl_Position = ftransform();
}
