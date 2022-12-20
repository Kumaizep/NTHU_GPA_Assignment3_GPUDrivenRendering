#include "../include/Shader.hpp"
#include "../include/SceneRenderer.hpp"
#include "../include/MyMovingTrack.hpp"
#include "../include/MyImGuiPanel.hpp"
#include "../include/MyPoissonSample.hpp"
#include "../include/ViewFrustumSceneObject.hpp"
#include "../include/InfinityPlane.hpp"
#include "../include/camera.hpp"
#include "../include/model.hpp"
#include "../include/MixModel.hpp"
#include "../include/texture.hpp"
#include <GLFW/glfw3.h>

#pragma comment (lib, "lib-vc2015\\glfw3.lib")
#pragma comment(lib, "assimp-vc141-mt.lib")

struct DrawElementsIndirectCommand{
	unsigned int count;
	unsigned int instanceCount;
	unsigned int firstIndex;
	unsigned int baseVertex;
	unsigned int baseInstance;
};

struct RawInstanceProperties {
	glm::vec4 position;
	ivec4 indices;
};

struct InstanceProperties {
	glm::vec4 position;
};

GLuint vaoHandle;
GLuint resetCSProgramHandle;
GLuint cullingCSProgramHandle;
GLuint renderProgramHandle;

int NUM_TOTAL_INSTANCE = 10;


int FRAME_WIDTH = 1024;
int FRAME_HEIGHT = 512;

void mouseButtonCallback(GLFWwindow* window, int button, int action, int mods);
void mouseScrollCallback(GLFWwindow *window, double xoffset, double yoffset);
void cursorPosCallback(GLFWwindow* window, double x, double y);
void keyCallback(GLFWwindow* window, int key, int scancode, int action, int mods);

bool initializeGL();
void resizeGL(GLFWwindow *window, int w, int h);
void paintGL(Camera& pCamera, Camera& gCamera);
void resize(const int w, const int h);

bool m_leftButtonPressed = false;
bool m_rightButtonPressed = false;
double cursorPos[2];

GLubyte timerCounter = 0;
bool timerEnabled = true;
bool pauseEnabled = false;
float timerCurrent = 0.0f;
float timerLast = 0.0f;
unsigned int timerSpeed = 16;

bool keyPressing[400] = {0};
float keyPressTime[400] = {0.0f};

bool trackballEnable = false;
vec2 mouseCurrent = vec2(0.0f, 0.0f);
vec2 mouseLast = vec2(0.0f, 0.0f);

using namespace std;

MyImGuiPanel* m_imguiPanel = nullptr;

void vsyncDisabled(GLFWwindow *window, Camera& pCamera, Camera& gCamera);

// ==============================================
SceneRenderer *defaultRenderer = nullptr;
ShaderProgram* rcsShaderProgram = new ShaderProgram();
ShaderProgram* ccsShaderProgram = new ShaderProgram();
ShaderProgram* defaultShaderProgram = new ShaderProgram();

IMovingTrack* movingTrack = nullptr ;

MixModel mixModel;
vector<Model> models;
Texture texture;

glm::mat4 godProjMat;
glm::mat4 godViewMat;
glm::mat4 playerProjMat;
glm::mat4 playerViewMat;

ViewFrustumSceneObject* viewFrustumSO = nullptr;
InfinityPlane *infinityPlane = nullptr;
// ==============================================

void updateWhenPlayerProjectionChanged(const float nearDepth, const float farDepth);
void viewFrustumMultiClipCorner(const vector<float> &depths, const glm::mat4 &viewMat, const glm::mat4 &projMat, float *clipCorner);

void timerUpdate()
{
    timerLast = timerCurrent;
    timerCurrent = glfwGetTime();
}

void processCameraMove(Camera& camera)
{
    float timeDifferent = 0.0f;
    if (timerEnabled)
        timeDifferent = timerCurrent - timerLast;

    if (keyPressing[GLFW_KEY_W])
        camera.processMove(FORWARD, timeDifferent);
    if (keyPressing[GLFW_KEY_S])
        camera.processMove(BACKWARD, timeDifferent);
    if (keyPressing[GLFW_KEY_A])
        camera.processMove(LEFT, timeDifferent);
    if (keyPressing[GLFW_KEY_D])
        camera.processMove(RIGHT, timeDifferent);
    if (keyPressing[GLFW_KEY_Z])
        camera.processMove(UP, timeDifferent);
    if (keyPressing[GLFW_KEY_X])
        camera.processMove(DOWN, timeDifferent);
}

void processCameraTrackball(Camera& camera, GLFWwindow *window)
{   
    double x, y;
    glfwGetCursorPos(window, &x, &y); 
    mouseLast = mouseCurrent;
    mouseCurrent = vec2(x, y);

    vec2 mouseDifferent = vec2(0.0f, 0.0f);
    if (trackballEnable)
    {
        mouseDifferent = mouseCurrent - mouseLast;
    	camera.processTrackball(mouseDifferent.x, mouseDifferent.y);
    }
}

int main(){
	glfwInit();
	glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
	glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
	glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);

	GLFWwindow *window = glfwCreateWindow(FRAME_WIDTH, FRAME_HEIGHT, "GPA2022_Assignment3", nullptr, nullptr);
	if (window == nullptr){
		cout << "failed to create GLFW window\n";
		glfwTerminate();
		return -1;
	}
	glfwMakeContextCurrent(window);

	// load OpenGL function pointer
	if (!gladLoadGLLoader((GLADloadproc)glfwGetProcAddress))
	{
		cout << "Failed to initialize GLAD" << endl;
		return -1;
	}

	glfwSetKeyCallback(window, keyCallback);
	glfwSetScrollCallback(window, mouseScrollCallback);
	glfwSetMouseButtonCallback(window, mouseButtonCallback);
	glfwSetCursorPosCallback(window, cursorPosCallback);
	glfwSetFramebufferSizeCallback(window, resizeGL);

	Camera godCamera = Camera()
                        .withPosition(vec3(0.0, 50.0, 20.0))
                        .withMoveSpeed(40.0f)
                        .withTrackballSpeed(0.15f)
                        .withTheta(270.0f)
                        .withPhi(-45.0f);
    Camera playerCamera = Camera()
                        .withPosition(vec3(0.0, 8.0, 10.0))
                        .withMoveSpeed(40.0f)
                        .withTrackballSpeed(0.15f)
                        .withTheta(270.0f)
                        .withPhi(-16.6666f);

	if (initializeGL() == false) {
		cout << "initialize GL failed\n";
		glfwTerminate();
		system("pause");
		return 0;
	}

	IMGUI_CHECKVERSION();
	ImGui::CreateContext();
	ImGuiIO &io = ImGui::GetIO();
	(void)io;
	ImGui::StyleColorsDark();
	ImGui_ImplGlfw_InitForOpenGL(window, true);
	ImGui_ImplOpenGL3_Init("#version 460");

	// disable vsync
	glfwSwapInterval(0);

	// start game-loop
	vsyncDisabled(window, playerCamera, godCamera);
		

	ImGui_ImplOpenGL3_Shutdown();
	ImGui_ImplGlfw_Shutdown();
	ImGui::DestroyContext();

	glfwTerminate();
	return 0;
}

void vsyncDisabled(GLFWwindow *window, Camera& pCamera, Camera& gCamera) 
{
	double previousTimeForFPS = glfwGetTime();
	int frameCount = 0;

	static int IMG_IDX = 0;

	while (!glfwWindowShouldClose(window)) {
		// measure speed
		const double currentTime = glfwGetTime();
		frameCount = frameCount + 1;
		const double deltaTime = currentTime - previousTimeForFPS;
		if (deltaTime >= 1.0) {
			m_imguiPanel->setAvgFPS(frameCount * 1.0);
			m_imguiPanel->setAvgFrameTime(deltaTime * 1000.0 / frameCount);

			// reset
			frameCount = 0;
			previousTimeForFPS = currentTime;
		}			

		timerUpdate();
		glfwPollEvents();
		processCameraMove(pCamera);
        processCameraTrackball(gCamera, window);
		paintGL(pCamera, gCamera);
		glfwSwapBuffers(window);
	}
}

bool initializeShaderDefault()
{
	// vertex shader
	Shader* vsShader = new Shader(GL_VERTEX_SHADER);
	vsShader->createShaderFromFile("asset/shader/oglVertexShader.glsl");
	cout << vsShader->shaderInfoLog() << "\n";

	// fragment shader
	Shader* fsShader = new Shader(GL_FRAGMENT_SHADER);
	fsShader->createShaderFromFile("asset/shader/oglFragmentShader.glsl");
	cout << fsShader->shaderInfoLog() << "\n";

	// shader program
	ShaderProgram* shaderProgram = new ShaderProgram();
	shaderProgram->init();
	shaderProgram->attachShader(vsShader);
	shaderProgram->attachShader(fsShader);
	shaderProgram->checkStatus();
	if (shaderProgram->status() != ShaderProgramStatus::READY) {
		cout << "DEBUG::MAIN::ShaderProgramDefaultStatusNotReady" << endl;
		return false;
	}
	shaderProgram->linkProgram();

	vsShader->releaseShader();
	fsShader->releaseShader();
	
	delete vsShader;
	delete fsShader;
	// =================================================================
	// init renderer
	defaultRenderer = new SceneRenderer();
	if (!defaultRenderer->initialize(FRAME_WIDTH, FRAME_HEIGHT, shaderProgram)) {
		return false;
	}

	// =================================================================
	// initialize camera
	godViewMat = glm::lookAt(glm::vec3(0.0, 50.0, 20.0), glm::vec3(0.0, 20.0, -10.0), glm::vec3(0.0, 1.0, 0.0));
	playerViewMat = glm::lookAt(glm::vec3(0.0, 8.0, 10.0), glm::vec3(0.0, 5.0, 0.0), glm::vec3(0.0, 1.0, 0.0));

	const glm::vec4 directionalLightDir = glm::vec4(0.4, 0.5, 0.8, 0.0);
	
	defaultRenderer->setDirectionalLightDir(directionalLightDir);
	return true;
}

bool initializeResetShader()
{
	// vertex shader
	Shader* rcsShader = new Shader(GL_COMPUTE_SHADER);
	rcsShader->createShaderFromFile("asset/shader/oglResetComputeShader.glsl");
	cout << rcsShader->shaderInfoLog() << "\n";

	// shader program
	rcsShaderProgram = new ShaderProgram();
	rcsShaderProgram->init();
	rcsShaderProgram->attachShader(rcsShader);
	rcsShaderProgram->checkStatus();
	if (rcsShaderProgram->status() != ShaderProgramStatus::READY) {
		cout << "DEBUG::MAIN::ShaderProgramResetStatusNotReady" << endl;
		return false;
	}
	rcsShaderProgram->linkProgram();

	rcsShader->releaseShader();
	delete rcsShader;
	return true;
}

bool initializeCullingShader()
{
	// vertex shader
	Shader* ccsShader = new Shader(GL_COMPUTE_SHADER);
	ccsShader->createShaderFromFile("asset/shader/oglCullingComputeShader.glsl");
	cout << ccsShader->shaderInfoLog() << "\n";
	// shader program
	ccsShaderProgram = new ShaderProgram();
	ccsShaderProgram->init();
	ccsShaderProgram->attachShader(ccsShader);
	ccsShaderProgram->checkStatus();
	if (rcsShaderProgram->status() != ShaderProgramStatus::READY) {
		cout << "DEBUG::MAIN::ShaderProgramCullingSStatusNotReady" << endl;
		return false;
	}
	ccsShaderProgram->linkProgram();

	ccsShader->releaseShader();
	delete ccsShader;
	return true;
}

bool initializeGL(){
	// initialize shader program
	if (!initializeShaderDefault())
		return false;
	if (!initializeResetShader())
		return false;
	if (!initializeCullingShader())
		return false;
	// =================================================================
	// initialize camera and view frustum
	infinityPlane = new InfinityPlane(2);
	defaultRenderer->appendObject(infinityPlane->sceneObject());

	viewFrustumSO = new ViewFrustumSceneObject(2, SceneManager::Instance()->m_fs_pixelProcessIdHandle, SceneManager::Instance()->m_fs_pureColor);
	defaultRenderer->appendObject(viewFrustumSO->sceneObject());

	resize(FRAME_WIDTH, FRAME_HEIGHT);
	// =================================================================	
	m_imguiPanel = new MyImGuiPanel();	

	// =================================================================
	// initialize the IMovingTrack
	movingTrack = new IMovingTrack();

	// =================================================================
	// initialize models
	models.push_back(Model("asset/slime.obj", 0));
	mixModel.addModel("asset/grassB.obj");
	mixModel.addModel("asset/bush01_lod2.obj");
	mixModel.addModel("asset/bush05_lod2.obj");
	mixModel.setUpVAO();

	// =================================================================
	// initialize textures
	texture = Texture("asset/grassB_albedo.png", "asset/bush01.png", "asset/bush05.png", 1024, 1024 , 4);
	// texture = Texture("asset/grassB_albedo.png", 1024, 1024 , 4);

	// =================================================================
	// initialize the poisson samples
	MyPoissonSample* sample0 = MyPoissonSample::fromFile("asset/poissonPoints_155304.ppd");
	MyPoissonSample* sample1 = MyPoissonSample::fromFile("asset/poissonPoints_1010.ppd");
	MyPoissonSample* sample2 = MyPoissonSample::fromFile("asset/poissonPoints_2797.ppd");
	// get number of sample
	const int NUM_SAMPLE[3] = {sample0->m_numSample, sample1->m_numSample, sample2->m_numSample};
	NUM_TOTAL_INSTANCE = NUM_SAMPLE[0] + NUM_SAMPLE[1] + NUM_SAMPLE[2];
	vector<float> POSITION_BUFFER;
	for (int i = 0; i < NUM_SAMPLE[0]; ++i)
	{
		POSITION_BUFFER.push_back(sample0->m_positions[3 * i]);
		POSITION_BUFFER.push_back(sample0->m_positions[3 * i + 1]);
		POSITION_BUFFER.push_back(sample0->m_positions[3 * i + 2]);
	}
	for (int i = 0; i < NUM_SAMPLE[1]; ++i)
	{
		POSITION_BUFFER.push_back(sample1->m_positions[3 * i]);
		POSITION_BUFFER.push_back(sample1->m_positions[3 * i + 1]);
		POSITION_BUFFER.push_back(sample1->m_positions[3 * i + 2]);
	}
	for (int i = 0; i < NUM_SAMPLE[2]; ++i)
	{
		POSITION_BUFFER.push_back(sample2->m_positions[3 * i]);
		POSITION_BUFFER.push_back(sample2->m_positions[3 * i + 1]);
		POSITION_BUFFER.push_back(sample2->m_positions[3 * i + 2]);
	}

	// for (int i = 0; i < NUM_TOTAL_INSTANCE; ++i)
	// {
	// 	cout << "DEBUG::MAIN::IG::" << i << ":\t(" << POSITION_BUFFER[i * 3] << ", " << POSITION_BUFFER[i * 3 + 1] << ", " << POSITION_BUFFER[i * 3] << ")" << endl;
	// }
	// const float* POSITION_BUFFER[3] = {sample0->m_positions, sample1->m_positions, sample2->m_positions};
	// NUM_TOTAL_INSTANCE = NUM_SAMPLE[0];
	// =================================================================
	// initialize rawInsData
	InstanceProperties* rawInsData = new InstanceProperties[NUM_TOTAL_INSTANCE];
	InstanceProperties* rawInsIndices = new InstanceProperties[NUM_TOTAL_INSTANCE];
	int* offset = new int [NUM_TOTAL_INSTANCE];
	int* slimeEated = new int [NUM_TOTAL_INSTANCE];
	// cout << "DEBUG::MAIN::IG::1" << endl;
	int offsetla = 0;
	for (int i = 0; i < mixModel.getModelNumber(); ++i)
	{
		offset[i] = offsetla;
		// cout << "DEBUG::MAIN::IG::Genrate rawInsData ==================" << endl;
		for (int j = 0; j < NUM_SAMPLE[i]; ++j)
		{
			rawInsData[offsetla].position = vec4(
				POSITION_BUFFER[offsetla * 3], 
				POSITION_BUFFER[offsetla * 3 + 1], 
				POSITION_BUFFER[offsetla * 3 + 2], 
				0.0f);
			rawInsIndices[offsetla].position = vec4(i, j, offset[i], 0);
			// cout << offsetla << ":\t(" << POSITION_BUFFER[offsetla * 3] << ", " << POSITION_BUFFER[offsetla * 3 + 1] << ", " << POSITION_BUFFER[offsetla * 3] << ")" << endl;
			slimeEated[offsetla] = 0;
			offsetla++;
		}
	}

	// prepare a SSBO for storing raw instance data
	GLuint rawInstanceDataBufferHandle;
	glGenBuffers(1, &rawInstanceDataBufferHandle);
	glBindBuffer(GL_SHADER_STORAGE_BUFFER, rawInstanceDataBufferHandle);
	glBufferStorage(GL_SHADER_STORAGE_BUFFER, NUM_TOTAL_INSTANCE * sizeof(InstanceProperties), 
		rawInsData, GL_MAP_READ_BIT);
	glBindBufferBase(GL_SHADER_STORAGE_BUFFER, 1, rawInstanceDataBufferHandle);

	// prepare a SSBO for storing VALID instance data
	GLuint validInstanceDataBufferHandle;
	glGenBuffers(1, &validInstanceDataBufferHandle);
	glBindBuffer(GL_SHADER_STORAGE_BUFFER, validInstanceDataBufferHandle);
	// #TAG1
	glBufferStorage(GL_SHADER_STORAGE_BUFFER, NUM_TOTAL_INSTANCE * sizeof(InstanceProperties), 
		rawInsData, GL_MAP_READ_BIT);
	glBindBufferBase(GL_SHADER_STORAGE_BUFFER, 2, validInstanceDataBufferHandle);

	// prepare a SSBO for storing draw commands
	DrawElementsIndirectCommand* drawCommands = new DrawElementsIndirectCommand[mixModel.getModelNumber()];
	offsetla = 0;
	for (int i = 0; i < mixModel.getModelNumber(); ++i)
	{
		drawCommands[i].count = mixModel.models[i].getVertexNumber();
		drawCommands[i].instanceCount = NUM_SAMPLE[i];
		drawCommands[i].firstIndex = 0;
		drawCommands[i].baseVertex = offsetla;
		drawCommands[i].baseInstance = offset[i];
		offsetla += mixModel.models[i].getVertexNumber();
	}
	GLuint cmdBufferHandle;
	glGenBuffers(1, &cmdBufferHandle);
	glBindBuffer(GL_SHADER_STORAGE_BUFFER, cmdBufferHandle);
	glBufferStorage(GL_SHADER_STORAGE_BUFFER, mixModel.getModelNumber() * sizeof(DrawElementsIndirectCommand),
	drawCommands, GL_MAP_READ_BIT);
	glBindBufferBase(GL_SHADER_STORAGE_BUFFER, 3, cmdBufferHandle);


	// prepare a SSBO for storing raw instance indice
	GLuint rawInstanceIndicesBufferHandle;
	glGenBuffers(1, &rawInstanceIndicesBufferHandle);
	glBindBuffer(GL_SHADER_STORAGE_BUFFER, rawInstanceIndicesBufferHandle);
	glBufferStorage(GL_SHADER_STORAGE_BUFFER, NUM_TOTAL_INSTANCE * sizeof(InstanceProperties), 
		rawInsIndices, GL_MAP_READ_BIT);
	glBindBufferBase(GL_SHADER_STORAGE_BUFFER, 4, rawInstanceIndicesBufferHandle);

	// prepare a SSBO for storing instance offset
	GLuint InstanceOffsetBufferHandle;
	glGenBuffers(1, &InstanceOffsetBufferHandle);
	glBindBuffer(GL_SHADER_STORAGE_BUFFER, InstanceOffsetBufferHandle);
	glBufferStorage(GL_SHADER_STORAGE_BUFFER, mixModel.getModelNumber() * sizeof(int), 
		offset, GL_MAP_READ_BIT);
	glBindBufferBase(GL_SHADER_STORAGE_BUFFER, 5, InstanceOffsetBufferHandle);

	// prepare a SSBO for storing instance offset
	GLuint SlimeEatedBufferHandle;
	glGenBuffers(1, &SlimeEatedBufferHandle);
	glBindBuffer(GL_SHADER_STORAGE_BUFFER, SlimeEatedBufferHandle);
	glBufferStorage(GL_SHADER_STORAGE_BUFFER, NUM_TOTAL_INSTANCE * sizeof(int), 
		slimeEated, GL_MAP_READ_BIT);
	glBindBufferBase(GL_SHADER_STORAGE_BUFFER, 6, SlimeEatedBufferHandle);


	mixModel.bindVAO();
	// SSBO as vertex shader attribute
	glBindBuffer(GL_ARRAY_BUFFER, validInstanceDataBufferHandle);
	glVertexAttribPointer(3, 4, GL_FLOAT, false, 0, nullptr);
	glEnableVertexAttribArray(3);
	glVertexAttribDivisor(3, 1);
	// SSBO as draw-indirect-buffer
	glBindBuffer(GL_DRAW_INDIRECT_BUFFER, cmdBufferHandle);
	// done
	glBindVertexArray(0) ; 
    timerLast = glfwGetTime();
	
	return true;
}

void resizeGL(GLFWwindow *window, int w, int h){
	resize(w, h);
}

bool slimeCulling(mat4 viewProjMat, vec3 position)
{
	vec4 clipSpaceV = viewProjMat * vec4(position, 1.0);
	clipSpaceV = clipSpaceV / clipSpaceV.w ;

	return (clipSpaceV.x < -1.0) || (clipSpaceV.x > 1.0) || (clipSpaceV.y < -1.0) || (clipSpaceV.y > 1.0) || (clipSpaceV.z < -1.0) || (clipSpaceV.z > 1.0);
}

void drawSlime(vec3 position)
{
	defaultRenderer->m_shaderProgram->setVec4("slimePosOffset", vec4(position, 0.0f));
	defaultRenderer->m_shaderProgram->setInt("pixelProcessId", 1);
	models[0].draw(*(defaultRenderer->m_shaderProgram), texture);
}

void paintGL(Camera& pCamera, Camera& gCamera){
	if (pauseEnabled)
		return;
	ImGui_ImplOpenGL3_NewFrame();
	ImGui_ImplGlfw_NewFrame();
	ImGui::NewFrame();

	// update Slime’s position
	movingTrack->update() ;
	// get the position of current frame
	glm::vec3 position = movingTrack->position();
	glm::vec4 positionVec4 = movingTrack->positionVec4();

	// shader program for resetting render parameters
	rcsShaderProgram->useProgram();
	rcsShaderProgram->setInt("instanceTypeNumber", mixModel.getModelNumber());
	rcsShaderProgram->setInt("workMode", 0);
	glDispatchCompute(1, 1, 1);
	glMemoryBarrier(GL_SHADER_STORAGE_BARRIER_BIT);

	// shader program for collecting visible instances
	ccsShaderProgram->useProgram();
	// send the necessary information to compute shader (must after useProgram)
	ccsShaderProgram->setInt("numMaxInstance", NUM_TOTAL_INSTANCE);
	ccsShaderProgram->setMat4("viewProjMat", playerProjMat * pCamera.getView());
	ccsShaderProgram->setVec4("slimePosition", positionVec4);
	ccsShaderProgram->setFloat("slimeRadius", 1.5);
	// start GPU process
	glDispatchCompute((NUM_TOTAL_INSTANCE / 1024) + 1, 1, 1);
	glMemoryBarrier(GL_SHADER_STORAGE_BARRIER_BIT);

	// // shader program for resetting render parameters
	// rcsShaderProgram->useProgram();
	// rcsShaderProgram->setInt("instanceTypeNumber", mixModel.getModelNumber());
	// rcsShaderProgram->setInt("workMode", 1);
	// glDispatchCompute(1, 1, 1);
	// glMemoryBarrier(GL_SHADER_STORAGE_BARRIER_BIT);

	// ===============================
	// update infinity plane with player camera
	const glm::vec3 PLAYER_VIEW_POSITION = pCamera.position;
	infinityPlane->updateState(pCamera.getView(), PLAYER_VIEW_POSITION);

	// update player camera view frustum
	viewFrustumSO->updateState(pCamera.getView(), PLAYER_VIEW_POSITION);

	// =============================================
	// start new frame
	defaultRenderer->setViewport(0, 0, FRAME_WIDTH, FRAME_HEIGHT);
	defaultRenderer->startNewFrame();


	// rendering with god view
	const int HALF_W = FRAME_WIDTH * 0.5;
	defaultRenderer->setViewport(0, 0, HALF_W, FRAME_HEIGHT);
	defaultRenderer->setProjection(godProjMat);
	defaultRenderer->setView(gCamera.getView());
	defaultRenderer->renderPass();
	mixModel.draw(*(defaultRenderer->m_shaderProgram), texture);
	if (!slimeCulling(playerProjMat * pCamera.getView(), position))
		drawSlime(position);

	// rendering with player view
	defaultRenderer->setViewport(HALF_W, 0, HALF_W, FRAME_HEIGHT);
	defaultRenderer->setProjection(playerProjMat);
	defaultRenderer->setView(pCamera.getView());
	defaultRenderer->renderPass();
	mixModel.draw(*(defaultRenderer->m_shaderProgram), texture);
	if (!slimeCulling(playerProjMat * pCamera.getView(), position))
		drawSlime(position);
	// ===============================

	ImGui::Begin("Frame Status");
	m_imguiPanel->update();
	ImGui::End();

	ImGui::Render();
	ImGui_ImplOpenGL3_RenderDrawData(ImGui::GetDrawData());
}

////////////////////////////////////////////////
void mouseButtonCallback(GLFWwindow* window, int button, int action, int mods)
{
	double x, y;
    glfwGetCursorPos(window, &x, &y);
    if (button == GLFW_MOUSE_BUTTON_LEFT)
    {
    	if (action == GLFW_PRESS) {
            trackballEnable = true;
            printf("Mouse %d is pressed at (%f, %f)\n", button, x, y);
        }
        else if (action == GLFW_RELEASE) {
            trackballEnable = false;
            printf("Mouse %d is released at (%f, %f)\n", button, x, y);
        }
    }
}
void cursorPosCallback(GLFWwindow* window, double x, double y){}
void keyCallback(GLFWwindow* window, int key, int scancode, int action, int mods)
{
	switch (key) {
        case GLFW_KEY_ESCAPE:
            glfwSetWindowShouldClose(window, true);
            break;
        case GLFW_KEY_T:
            if (action == GLFW_PRESS) timerEnabled = !timerEnabled;
            break;
        case GLFW_KEY_SPACE:
            if (action == GLFW_PRESS) pauseEnabled = !pauseEnabled;
            break;
        case GLFW_KEY_D:
        case GLFW_KEY_A:
        case GLFW_KEY_W:
        case GLFW_KEY_S:
        case GLFW_KEY_Z:
        case GLFW_KEY_X:
            if (action == GLFW_PRESS)
            {
                keyPressing[key] = true;
            }
            else if (action == GLFW_RELEASE)
            {
                keyPressing[key] = false;
            }
            break;
        default:
            break;
    }
}

void mouseScrollCallback(GLFWwindow *window, double xoffset, double yoffset) {}

void updateWhenPlayerProjectionChanged(const float nearDepth, const float farDepth) {
	// get view frustum corner
	const int NUM_CASCADE = 2;
	const float HY = 0.0;

	float dOffset = (farDepth - nearDepth) / NUM_CASCADE;
	float *corners = new float[(NUM_CASCADE + 1) * 12];
	vector<float> depths(NUM_CASCADE + 1);
	for (int i = 0; i < NUM_CASCADE; i++) {
		depths[i] = nearDepth + dOffset * i;
	}
	depths[NUM_CASCADE] = farDepth;
	// get viewspace corners
	glm::mat4 tView = glm::lookAt(glm::vec3(0.0, 0.0, -1.0), glm::vec3(0.0, 0.0, 0.0), glm::vec3(0.0, 1.0, 0.0));
	// calculate corners of view frustum cascade
	viewFrustumMultiClipCorner(depths, tView, playerProjMat, corners);

	// update infinity plane
	for (int i = 0; i < NUM_CASCADE; i++) {
		float *cascadeBuffer = infinityPlane->cascadeDataBuffer(i);

		cascadeBuffer[0] = corners[((i + 1) * 4 + 1) * 3 + 0];
		cascadeBuffer[1] = HY;
		cascadeBuffer[2] = corners[((i + 1) * 4 + 1) * 3 + 2];

		cascadeBuffer[3] = corners[((i + 1) * 4 + 1) * 3 + 0];
		cascadeBuffer[4] = HY;
		cascadeBuffer[5] = corners[(i * 4 + 1) * 3 + 2];

		cascadeBuffer[6] = corners[((i + 1) * 4 + 2) * 3 + 0];
		cascadeBuffer[7] = HY;
		cascadeBuffer[8] = corners[(i * 4 + 2) * 3 + 2];

		cascadeBuffer[9] = corners[((i + 1) * 4 + 2) * 3 + 0];
		cascadeBuffer[10] = HY;
		cascadeBuffer[11] = corners[((i + 1) * 4 + 2) * 3 + 2];
	}
	infinityPlane->updateDataBuffer();

	// update view frustum scene object
	for (int i = 0; i < NUM_CASCADE + 1; i++) {
		float *layerBuffer = viewFrustumSO->cascadeDataBuffer(i);
		for (int j = 0; j < 12; j++) {
			layerBuffer[j] = corners[i * 12 + j];
		}
	}
	viewFrustumSO->updateDataBuffer();
}
void resize(const int w, const int h) {
	FRAME_WIDTH = w;
	FRAME_HEIGHT = h;

	// half for god view, half for player view
	const int HALF_W = w * 0.5;
	const double PLAYER_PROJ_FAR = 150.0;

	godProjMat = glm::perspective(glm::radians(75.0), HALF_W * 1.0 / h, 0.1, 500.0);
	playerProjMat = glm::perspective(glm::radians(45.0), HALF_W * 1.0 / h, 0.1, PLAYER_PROJ_FAR);

	defaultRenderer->resize(w, h);

	updateWhenPlayerProjectionChanged(0.1, PLAYER_PROJ_FAR);
}
void viewFrustumMultiClipCorner(const vector<float> &depths, const glm::mat4 &viewMat, const glm::mat4 &projMat, float *clipCorner) {
	const int NUM_CLIP = depths.size();

	// Calculate Inverse
	glm::mat4 viewProjInv = glm::inverse(projMat * viewMat);

	// Calculate Clip Plane Corners
	int clipOffset = 0;
	for (const float depth : depths) {
		// Get Depth in NDC, the depth in viewSpace is negative
		glm::vec4 v = glm::vec4(0, 0, -1 * depth, 1);
		glm::vec4 vInNDC = projMat * v;
		if (fabs(vInNDC.w) > 0.00001) {
			vInNDC.z = vInNDC.z / vInNDC.w;
		}
		// Get 4 corner of clip plane
		float cornerXY[] = {
			-1, 1,
			-1, -1,
			1, -1,
			1, 1
		};
		for (int j = 0; j < 4; j++) {
			glm::vec4 wcc = {
				cornerXY[j * 2 + 0], cornerXY[j * 2 + 1], vInNDC.z, 1
			};
			wcc = viewProjInv * wcc;
			wcc = wcc / wcc.w;

			clipCorner[clipOffset * 12 + j * 3 + 0] = wcc[0];
			clipCorner[clipOffset * 12 + j * 3 + 1] = wcc[1];
			clipCorner[clipOffset * 12 + j * 3 + 2] = wcc[2];
		}
		clipOffset = clipOffset + 1;
	}
}


