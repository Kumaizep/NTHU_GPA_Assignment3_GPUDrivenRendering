#version 460 core

layout (local_size_x = 1024, local_size_y = 1, local_size_z = 1) in;

struct DrawCommand
{
	uint count;
	uint instanceCount;
	uint firstIndex;
	uint baseVertex;
	uint baseInstance;
};

struct RawInstanceProperties
{
	vec4 position;
	vec4 indices;
};

struct InstanceProperties{
	vec4 position;
};
/*the buffer for storing “whole” instance position and other necessary information*/
layout (std430, binding = 1) buffer RawInstanceData
{
	InstanceProperties rawInstanceProps[];
};
/*the buffer for storing “visible” instance position*/
layout (std430, binding = 2) buffer CurrValidInstanceData
{
	InstanceProperties currValidInstanceProps[];
};

/* the SSBO for storing draw commands */
layout (std430, binding = 3) buffer DrawCommandsBlock
{
	DrawCommand commands[];
};

layout (std430, binding = 4) buffer RawInstanceIndices
{
	InstanceProperties rawInstanceIndices[];
};

layout (std430, binding = 6) buffer SlimeEated
{
	int slimeEated[];
};

uniform int numMaxInstance;
uniform mat4 viewProjMat;
uniform vec4 slimePosition;
uniform float slimeRadius;


void main() {
	const uint idx = gl_GlobalInvocationID.x;
	// discarding invalid array-access
	if(idx >= numMaxInstance || slimeEated[idx] == 1)
	{
		return; 
	}

	if (distance(slimePosition.xz, rawInstanceProps[idx].position.xz) < slimeRadius * 1.1)
	{
		slimeEated[idx] = 1;
	}

	// translate the position to clip space
	vec4 clipSpaceV = viewProjMat * vec4(rawInstanceProps[idx].position.xyz, 1.0);
	clipSpaceV = clipSpaceV / clipSpaceV.w ;
	// determine if it is culled
	bool frustumCulled = (clipSpaceV.x < -1.0) || (clipSpaceV.x > 1.0) || (clipSpaceV.y < -1.0) || (clipSpaceV.y > 1.0) || (clipSpaceV.z < -1.0) || (clipSpaceV.z > 1.0);
	if(frustumCulled == false)
	{
		// get UNIQUE buffer location for assigning the instance data
		// it also updates instanceCount
		const uint C_IDX = uint(rawInstanceIndices[idx].position.x);
		const uint UNIQUE_IDX = atomicAdd(commands[C_IDX].instanceCount, 1) + uint(rawInstanceIndices[idx].position.z);
		// put data into valid-instance buffer
		currValidInstanceProps[UNIQUE_IDX] = rawInstanceProps[idx];
	}
}