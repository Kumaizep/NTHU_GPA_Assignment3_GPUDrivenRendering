#version 460 core

layout (local_size_x = 1, local_size_y = 1, local_size_z = 1) in;

struct InstanceProperties{
	vec4 position;
};

struct DrawCommand
{
	uint count;
	uint instanceCount;
	uint firstIndex;
	uint baseVertex;
	uint baseInstance;
};

layout (std430, binding = 2) buffer CurrValidInstanceData
{
	InstanceProperties currValidInstanceProps[];
};

layout (std430, binding = 3) buffer DrawCommandsBlock
{
	DrawCommand commands[];
};

layout (std430, binding = 5) buffer InstanceOffset
{
	int instanceOffset[];
};

uniform int workMode;
uniform int instanceTypeNumber;

void resetDrawCommandsBlock()
{
	for (int i = 0; i < instanceTypeNumber; ++i)
	{
		commands[uint(i)].instanceCount = 0;
	}
}

void validInstanceCompaction()
{
	// const int temp[3] = {0, 155304 / 10, 155304 / 10 + 1010};
	int compactionIndex = 0;
	for (uint i = 0; i < instanceTypeNumber; ++i)
	{
		for (uint j = 0; j < commands[i].instanceCount; ++j)
		{
			currValidInstanceProps[uint(compactionIndex)] = currValidInstanceProps[uint(instanceOffset[i]) + j];
			compactionIndex++;
		}
	}
}

void main() 
{
	if (workMode == 1)
		validInstanceCompaction();
	else
		resetDrawCommandsBlock();

	// resetDrawCommandsBlock();
}