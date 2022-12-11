#ifndef TEXTURE_HPP
#define TEXTURE_HPP

#include "common.hpp"
#include "Shader.hpp"


class Texture
{
public:
    GLuint id;
    string type;
    string path;
    int width;
    int height;

    Texture() {}

    Texture(const string path1, const string path2, const string path3, int width, int height, int channel = 4)
    {
        id = loadMultipleTexture3(path1, path2, path3, width, height, channel);
    }   

	Texture(const string &filepath, string typeName)
	{
		id = loadTexture(filepath, width, height);
        type = typeName;
        path = filepath;
	}
    Texture(const string filepath, int width, int height, int channel = 4)
    {
        id = loadMultipleTexture1(filepath, width, height, channel);
    }

	GLuint loadTexture(const string &path, int &width, int &height)
    {
        int colorChannel;
        unsigned char *data = stbi_load(path.c_str(), &width, &height, &colorChannel, 0);

        GLuint textureID;
        glGenTextures(1, &textureID);

        if (data)
        {
            GLint internalFormat;
            GLint format;
            switch (colorChannel) {
                case 1:
                    internalFormat = GL_R8;
                    format = GL_RED;
                    break;
                case 2:
                    internalFormat = GL_RG8;
                    format = GL_RG;
                    break;
                case 3:
                    internalFormat = GL_RGB8;
                    format = GL_RGB;
                    break;
                case 4:
                    internalFormat = GL_RGBA8;
                    format = GL_RGBA;
                    break;
                default:
                    cout << "ERROR::Texture with unknow color channel " << colorChannel << ": " << path << endl;
                    break;
            }

            glBindTexture(GL_TEXTURE_2D, textureID);
            glTexImage2D(GL_TEXTURE_2D, 0, format, width, height, 0, format, GL_UNSIGNED_BYTE, data);
            glGenerateMipmap(GL_TEXTURE_2D);

            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR_MIPMAP_LINEAR);
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
        }
        else
        {
            std::cout << "ERROR::Texture failed to load at path: " << path << std::endl;
        }

        stbi_image_free(data);
        return textureID;
    }

    GLuint loadMultipleTexture3(const string path1, const string path2, const string path3, int width, int height, int channel)
    {
        int tempW, tempH, colorChannel;
        int image_size = width * height * channel;
        unsigned char* data = new unsigned char[image_size * 4];
        unsigned char* data1 = stbi_load(path1.c_str(), &tempW, &tempH, &colorChannel, 4);
        unsigned char* data2 = stbi_load(path2.c_str(), &tempW, &tempH, &colorChannel, 4);
        unsigned char* data3 = stbi_load(path3.c_str(), &tempW, &tempH, &colorChannel, 4);
        memcpy(data, data1, image_size);
        memcpy(data + image_size, data2, image_size);
        memcpy(data + 2 * image_size, data3, image_size);
        stbi_image_free(data1);
        stbi_image_free(data2);
        stbi_image_free(data3);

        GLuint textureID;
        glGenTextures(1, &textureID);

        if (data)
        {
            glBindTexture(GL_TEXTURE_2D_ARRAY, textureID);
            glTexStorage3D(GL_TEXTURE_2D_ARRAY, 1, GL_RGBA32F, width, height, 3);
            glTexSubImage3D(GL_TEXTURE_2D_ARRAY, 0, 0, 0, 0, width, height, 3, GL_RGBA, GL_UNSIGNED_BYTE, data);
            glTexParameterf(GL_TEXTURE_2D_ARRAY, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
            glTexParameterf(GL_TEXTURE_2D_ARRAY, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
            glTexParameterf(GL_TEXTURE_2D_ARRAY, GL_TEXTURE_WRAP_S, GL_REPEAT);
            glTexParameterf(GL_TEXTURE_2D_ARRAY, GL_TEXTURE_WRAP_T, GL_REPEAT);
        }
        else
        {
            std::cout << "ERROR::Texture failed to load at path: " << path << std::endl;
        }

        stbi_image_free(data);
        return textureID;
    }

        GLuint loadMultipleTexture1(const string path, int width, int height, int channel)
    {
        int tempW, tempH, colorChannel;
        int image_size = width * height * channel;
        cout << "DEBUG::TEXTURE::CHCEK1" << endl;
        unsigned char* data = stbi_load(path.c_str(), &tempW, &tempH, &colorChannel, 4);


        GLuint textureID;
        glGenTextures(1, &textureID);

        if (data)
        {
            glBindTexture(GL_TEXTURE_2D, textureID);
            glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, width, height, 0, GL_RGBA, GL_UNSIGNED_BYTE, data);
            glGenerateMipmap(GL_TEXTURE_2D);

            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR_MIPMAP_LINEAR);
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
        }
        else
        {
            std::cout << "ERROR::Texture failed to load at path: " << path << std::endl;
        }

        stbi_image_free(data);
        return textureID;
    }


    int comparePath(const char* filepath)
	{
		return strcmp(path.data(), filepath);
	}

	void activeAndBind(ShaderProgram& shader, GLuint unit)
	{
        glActiveTexture(GL_TEXTURE0 + unit);
        glBindTexture(GL_TEXTURE_2D_ARRAY, id);
        // shader.setVec2("textureSizeReciprocal", 1.0f / width, 1.0f / height);
	}
	
};

#endif
