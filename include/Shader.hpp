#ifndef SHADER_HPP
#define SHADER_HPP
#include <iostream>
#include <fstream>
#include <string>
#include <sstream>

#include "glad/glad.h"
#include "glm/glm.hpp"

using namespace glm;
using namespace std;
// version: 221030

enum class ShaderStatus {
	READY,
	NULL_SHADER, NULL_SHADER_CODE
};

enum class ShaderProgramStatus {
	READY,
	PROGRAM_ID_READY,
	NULL_VERTEX_SHADER, NULL_FRAGMENT_SHADER,
	NULL_VERTEX_SHADER_FRAGMENT_SHADER
};


class Shader
{
public:
	Shader(const GLenum shaderType);
	virtual ~Shader();

public:
	bool createShaderFromFile(const std::string& fileFullpath);
	void appendShaderCode(const std::string& code);
	bool compileShader();
	void releaseShader();

public:
	std::string shaderInfoLog() const;
	ShaderStatus status() const;
	GLuint shaderId() const;
	GLenum shaderType() const;

private:
	const GLenum m_shaderType;
	GLuint m_shaderId;
	std::string m_shaderInfoLog;
	std::string m_shaderCode;
	ShaderStatus m_shaderStatus;
};


class ShaderProgram
{
public:
	ShaderProgram();
	virtual ~ShaderProgram();

public:
	bool init();
	bool attachShader(const Shader* shader);
	ShaderProgramStatus checkStatus();
	void linkProgram();
	void useProgram();

public:
	GLuint programId() const;
	ShaderProgramStatus status() const;
	void setInt(const GLchar* name, int value);
	void setBool(const GLchar* name, bool value);
	void setFloat(const GLchar* name, float value);
	void setVec2(const GLchar* name, float x, float y);
	void setVec4(const GLchar* name, vec4 value);
	void setMat4(const GLchar* name, const mat4 &mat);


private:
	GLuint m_programId;
	bool m_vsReady = false;
	bool m_fsReady = false;
	bool m_csReady = false;

	ShaderProgramStatus m_shaderProgramStatus;

};

#endif