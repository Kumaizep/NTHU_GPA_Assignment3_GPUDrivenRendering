#pragma once
#ifndef COMMOMN_HPP
#define COMMOMN_HPP
#include "glad/glad.h"
#include "GLFW/glfw3.h"

// #define TINYOBJLOADER_IMPLEMENTATION
// #include "TinyOBJ/tiny_obj_loader.h"
#define STB_IMAGE_IMPLEMENTATION
#include "STB/stb_image.h"
// #include "utils/glutils.hpp"
#include "utils/timer.hpp"
#include "assimp/cimport.h"
#include "assimp/scene.h"
#include "assimp/postprocess.h"

#define GLM_FORCE_SWIZZLE
#include "glm/glm.hpp"
#include "glm/gtc/matrix_transform.hpp"
#include "glm/gtc/type_ptr.hpp"

#include "imgui/imgui.h"
#include "imgui/imgui_impl_glfw.h"
#include "imgui/imgui_impl_opengl3.h"

#define _USE_MATH_DEFINES
#include <cmath>
#include <cstdio>
#include <cstring>
#include <iostream>
#include <string>
#include <algorithm>
#include <vector>

#define __FILENAME__ (strrchr(__FILE__, '/') ? strrchr(__FILE__, '/') + 1 : __FILE__)
#define __FILEPATH__(x) ((std::string(__FILE__).substr(0, std::string(__FILE__).rfind('/'))+(x)).c_str())

#define deg2rad(x) ((x)*((3.1415926f)/(180.0f)))

#define INIT_WIDTH 1600
#define INIT_HEIGHT 900
#define INIT_VIEWPORT_X 0
#define INIT_VIEWPORT_Y 0
#define MAX_BONE_INFLUENCE 4

using namespace glm;
using namespace std;

const char* textureTypes[] = {
    "textureNone",
    "textureDiffuse", 
    "textureSpecular", 
    "textureAmbient", 
    "textureEmissive", 
    "textureHeight", 
    "textureNormal", 
    "textureShininess", 
    "textureOpacity", 
    "textureDisplacement", 
    "textureLightmap", 
    "textureReflection", 
    "textureUnknow"
};

const aiTextureType aiTextureTypes[] = {
    aiTextureType_NONE, 
    aiTextureType_DIFFUSE, 
    aiTextureType_SPECULAR, 
    aiTextureType_AMBIENT, 
    aiTextureType_EMISSIVE, 
    aiTextureType_HEIGHT, 
    aiTextureType_NORMALS, 
    aiTextureType_SHININESS, 
    aiTextureType_OPACITY, 
    aiTextureType_DISPLACEMENT, 
    aiTextureType_LIGHTMAP, 
    aiTextureType_REFLECTION, 
    aiTextureType_UNKNOWN
};


#endif
