#ifndef MODEL_HPP
#define MODEL_HPP

#include "mesh.hpp"

#include "assimp/Importer.hpp"
#include "assimp/scene.h"
#include "assimp/postprocess.h"
#include "texture.hpp"

vector<Texture> loadedTextures;

struct ImageData
{
    int width;
    int height;
    GLenum format;
    unsigned char* data;

    ImageData() : width(0), height(0), data(0) {}
};


class Model 
{
public:
    int uvZ;
    vector<Mesh> meshes;
    mat4 modelMatrix = translate(mat4(1.0f), vec3(0.0f));

    Model(const string path, const int idx)
    {
        uvZ = idx;
        loadModel(path);
    }

    void draw(ShaderProgram& shader, Texture& texture, vec3 position = vec3(0.0f))
    {
        // cout << "DEBUG::MODEL::C-MODEL-F-D: " << meshes.size() << endl;
        for (GLuint i = 0; i < meshes.size(); i++)
            meshes[i].draw(shader, texture, modelMatrix);
    }

    void bind0()
    {
        meshes[0].bind();
    }

    int getVertexNumber()
    {
        int count = 0;
        for (auto& it: meshes)
        {
            count += it.vertices.size();
        }
        return count;
    }

    // void updateState(const glm::mat4 &viewMat, const glm::vec3 &viewPos) {
    // }
private:
    string directory;

    void loadModel(const string path)
    {
        Assimp::Importer importer;
        const aiScene* scene = importer.ReadFile(path, 
            aiProcess_Triangulate | aiProcess_GenSmoothNormals | aiProcess_FlipUVs | aiProcess_CalcTangentSpace); 

        if (!scene || scene->mFlags == AI_SCENE_FLAGS_INCOMPLETE || !scene->mRootNode) 
        {
            cout << "ERROR::ASSIMP::" << importer.GetErrorString() << endl;
            return;
        }
        directory = path.substr(0, path.find_last_of('/'));

        processNode(scene->mRootNode, scene);
    }

    void processNode(aiNode* node, const aiScene* scene)
    {
        for (GLuint i = 0; i < node->mNumMeshes; i++)
        {
            meshes.push_back(processMesh(scene->mMeshes[node->mMeshes[i]], scene)); 
        }
        for (GLuint i = 0; i < node->mNumChildren; i++)
        {
            processNode(node->mChildren[i], scene);
        }
    }

    Mesh processMesh(aiMesh* mesh, const aiScene* scene)
    {
        vector<Vertex> vertices  = processVertices(mesh);
        vector<GLuint> indices   = processIndices(mesh);
        // vector<Texture> textures = processTextures(mesh, scene);
        vector<Texture> textures;
        return Mesh(vertices, indices, textures);
    }

    vector<Vertex> processVertices(aiMesh* mesh)
    {
        vector<Vertex> vertices;
        for (GLuint i = 0; i < mesh->mNumVertices; i++)
        {
            Vertex vertex;

            vertex.position = vec3(mesh->mVertices[i].x, mesh->mVertices[i].y, mesh->mVertices[i].z);
            if (mesh->HasNormals())
            {
                vertex.normal = vec3(mesh->mNormals[i].x, mesh->mNormals[i].y, mesh->mNormals[i].z);
            }
            if (mesh->mTextureCoords[0])
            {
                vertex.texCoords = vec3(mesh->mTextureCoords[0][i].x, mesh->mTextureCoords[0][i].y, uvZ);
                vertex.tangent   = vec3(mesh->mTangents[i].x, mesh->mTangents[i].y, mesh->mTangents[i].z);
                vertex.bitangent = vec3(mesh->mBitangents[i].x, mesh->mBitangents[i].y, mesh->mBitangents[i].z);
            }
            else
            {
                vertex.texCoords = vec3(0.0f, 0.0f, uvZ);
            }

            vertices.push_back(vertex);
        }
        return vertices;
    }

    vector<GLuint> processIndices(aiMesh* mesh)
    {
        vector<GLuint> indices;
        for (GLuint i = 0; i < mesh->mNumFaces; i++)
        {
            for (GLuint j = 0; j < (mesh->mFaces[i]).mNumIndices; j++)
            {
                indices.push_back((mesh->mFaces[i]).mIndices[j]);
            }
        }
        return indices;
    }

};

#endif