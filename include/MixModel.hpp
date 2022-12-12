#ifndef MIXMODEL_HPP
#define MIXMODEL_HPP

#include "glm/common.hpp"
#include "mesh.hpp"
#include "model.hpp"
#include "texture.hpp"

class MixModel 
{
public:
    vector<Model> models;
    GLuint VAO, VBO, EBO;
    vector<Vertex>  vertices;
    vector<GLuint>  indices;
    vector<Texture> textures;
    mat4 modelMatrix = translate(mat4(1.0f), vec3(0.0f));

    MixModel(){}

    void addModel(const string path)
    {
        models.push_back(Model(path, models.size()));
    }

    void setUpVAO()
    {
        mergeModel();

        glGenVertexArrays(1, &VAO);
        glBindVertexArray(VAO);

        glGenBuffers(1, &VBO);
        glBindBuffer(GL_ARRAY_BUFFER, VBO);
        glBufferData(GL_ARRAY_BUFFER, vertices.size() * sizeof(Vertex), &vertices[0], GL_STATIC_DRAW);  

        glGenBuffers(1, &EBO);
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, EBO);
        glBufferData(GL_ELEMENT_ARRAY_BUFFER, indices.size() * sizeof(GLuint), &indices[0], GL_STATIC_DRAW);

        glEnableVertexAttribArray(0); 
        glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, sizeof(Vertex), 
            (GLvoid*)0);

        glEnableVertexAttribArray(1); 
        glVertexAttribPointer(1, 3, GL_FLOAT, GL_FALSE, sizeof(Vertex), 
            (GLvoid*)offsetof(Vertex, normal));

        glEnableVertexAttribArray(2); 
        glVertexAttribPointer(2, 3, GL_FLOAT, GL_FALSE, sizeof(Vertex), 
            (GLvoid*)offsetof(Vertex, texCoords));

        glBindVertexArray(0);
    }

    void mergeModel()
    {
        for (auto& it: models)
        {
            GLuint offset = vertices.size();
            for (auto& itIndex: it.indices) {
                indices.push_back(itIndex + offset);
                // cout << "DEBUG::MIXMODEL::F-MM: " << itIndex + offset << endl;
            }
            vertices.insert(vertices.end(), it.vertices.begin(), it.vertices.end());
            textures.insert(textures.end(), it.textures.begin(), it.textures.end());
        }
        cout << "DEBUG::MIXMODEL::F-MM: merge all mesh with " << vertices.size() << " " << indices.size() << " " << textures.size() << endl;
    }

    void draw(ShaderProgram& shader, Texture& texture)
    {
        // cout << "DEBUG::MODEL::C-MODEL-F-D: " << meshes.size() << endl;
        texture.activeAndBind(shader, 0);
        
        glBindVertexArray(VAO);
        shader.setInt("pixelProcessId", 0);
        shader.setMat4("modelMat", modelMatrix);
        // glDrawElementsIndirect(GL_TRIANGLES, GL_UNSIGNED_INT, 0);
        glMultiDrawElementsIndirect(GL_TRIANGLES, GL_UNSIGNED_INT, (GLvoid*)0, models.size(), 0); 
        glBindVertexArray(0);

        glActiveTexture(GL_TEXTURE0);
    }

    void bindVAO()
    {
        glBindVertexArray(VAO);
    }

    int getVertexNumber()
    {
        return vertices.size();
    }

    int getModelNumber()
    {
        return models.size();
    }
};

#endif