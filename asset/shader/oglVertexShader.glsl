#version 430 core

layout(location=0) in vec3 v_vertex;
layout(location=1) in vec3 v_normal;
layout(location=2) in vec3 v_uv;
layout(location=3) in vec4 v_worldPosOffset;

out vec3 f_viewVertex;
out vec3 f_viewNormal;
out vec3 f_worldVertex;
out vec3 f_worldNormal;
out vec3 f_uv;

struct InstanceProperties
{
	vec4 position ;
};
layout (std430, binding=2) buffer CurrValidInstanceData
{
	InstanceProperties currValidInstanceProps[] ;
};

uniform mat4 projMat;
uniform mat4 viewMat;
uniform mat4 modelMat;
uniform int pixelProcessId;

void commonProcess()
{
	mat4 modelViewMat = viewMat * modelMat;
	vec4 viewVertex = modelViewMat * vec4(v_vertex, 1.0);
	vec4 viewNormal = modelViewMat * vec4(v_normal, 0.0);
	
	f_viewVertex = viewVertex.xyz;
	f_viewNormal = viewNormal.xyz;
	f_worldVertex = (modelMat * vec4(v_vertex, 1.0)).xyz;
	f_worldNormal = (modelMat * vec4(v_normal, 0.0)).xyz;
	f_uv = v_uv;

	gl_Position = projMat * viewVertex;
}

void sampleProcess()
{
	vec4 worldVertex = modelMat * vec4(v_vertex, 1.0) + v_worldPosOffset;
	// vec4 worldVertex = modelMat * vec4(v_vertex, 1.0) + v_worldPosOffset - vec4(20, 0, -240, 0);
	vec4 worldNormal = modelMat * vec4(v_normal, 0.0);
	f_worldVertex = worldVertex.xyz;
	f_worldNormal = worldNormal.xyz;
	vec4 viewVertex = viewMat * worldVertex;
	vec4 viewNormal = viewMat * worldNormal;
	f_viewVertex = viewVertex.xyz;
	f_viewNormal = viewNormal.xyz;
	f_uv = v_uv;
	
	gl_Position = projMat * viewVertex;
}

void main()
{	
	if(pixelProcessId == 4 || pixelProcessId == 5){
		commonProcess();	
	}
	else{
		sampleProcess();
	}
}