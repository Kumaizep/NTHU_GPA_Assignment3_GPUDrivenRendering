#version 430 core

in vec3 f_viewVertex;
in vec3 f_viewNormal;
in vec3 f_worldVertex;
in vec3 f_worldNormal;
in vec3 f_uv;

layout (location = 0) out vec4 fragColor;

uniform int pixelProcessId;

layout(binding = 0) uniform sampler2DArray tex;

const vec3 lightDirection = vec3(0.4, 0.5, 0.8);
const vec3 Ka = vec3(0.20, 0.20, 0.20);
const vec3 Kd = vec3(0.64, 0.64, 0.64);
const vec3 Ks = vec3(0.16, 0.16, 0.16);

vec4 withFog(vec4 color){
	const vec4 FOG_COLOR = vec4(0.0, 0.0, 0.0, 1);
	const float MAX_DIST = 150.0;
	const float MIN_DIST = 120.0;
	
	float dis = length(f_viewVertex);
	float fogFactor = (MAX_DIST - dis) / (MAX_DIST - MIN_DIST);
	fogFactor = clamp(fogFactor, 0.0, 1.0);
	fogFactor = fogFactor * fogFactor;
	
	vec4 colorWithFog = mix(FOG_COLOR, color, fogFactor);
	return colorWithFog;
}

vec4 getPlaneColor(float x, float z){
	float stepSize = 2.0;
	float grad = 0.2;
	vec2 coord = vec2(x, z) / stepSize; //square size in world space
	vec2 frac = fract(coord); //fractional parts of squares
	//interpolation, grad is smoothness of line gradients
	vec2 mult = smoothstep(0.0, grad, frac) - smoothstep(1.0-grad, 1.0, frac);
	vec4 color0 = vec4(0.9, 0.9, 0.9, 1.0);
	vec4 color1 = vec4(0.5, 0.5, 0.5, 1.0);
	vec4 mColor = mix(color0, color1, mult.x * mult.y);
	return withFog(mColor);
}

void proceduralPlane(){
	vec4 color = vec4(0.0, 0.0, 0.0, 0.0);
	color = color + getPlaneColor(f_worldVertex.x, f_worldVertex.z);
	fragColor = withFog(color);
}

void pureColor(){
	fragColor = vec4(1.0, 0.0, 0.0, 1.0);
}

void grass(){
	const float n = 1.0f;
	const vec3 Is = vec3(0.0);

	vec4 texel = texture(tex, f_uv);
	if(texel.a < 0.3)
	{
		discard;
	}
	vec3 albedo = texel.rgb;
	// ambient
	vec3 ambient = Ka * albedo;
	// diffuse
	vec3 norm = normalize(f_worldNormal);
	vec3 lightDir = normalize(lightDirection);
	vec3 diffuse = Kd * albedo * max(dot(lightDir, norm), 0.0);
	// specular
	vec3 viewDir = normalize(f_viewNormal);
	vec3 reflectDir = reflect(-lightDir, norm);  
	vec3 specular = Ks * Is * pow(max(dot(reflectDir, viewDir), 0.0), n); 

	fragColor = vec4(ambient + diffuse + specular, 1.0f) * texel;
	// fragColor = texel;
}

void main(){	
	if(pixelProcessId == 4){
		proceduralPlane();
	}
	else if(pixelProcessId == 5){
		pureColor();
	}
	else{
		grass();
	}
}