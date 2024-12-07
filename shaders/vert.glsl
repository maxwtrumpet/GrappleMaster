#version 410 core

layout(location=0) in vec3 position;
layout(location=1) in vec2 textureCoords;

uniform mat4 MODEL_MATRIX;
uniform mat4 VIEW_MATRIX;
uniform mat4 PROJECTION;

out vec2 v_textureCoords;

void main() {
    v_textureCoords = textureCoords;
    vec4 new_position = PROJECTION * VIEW_MATRIX * MODEL_MATRIX * vec4(position,1.0f);
    gl_Position = new_position;
}