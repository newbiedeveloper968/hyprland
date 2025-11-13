#version 320 es
precision mediump float;

in vec2 v_texcoord;
out vec4 fragColor;

uniform sampler2D tex;

void main() {
    vec4 color = texture(tex, v_texcoord);

    // Apply a warm tint — reduces blue light
    float warmth = 0.4; // lower = cooler, higher = warmer (0.7–0.9 sweet spot)
    vec3 warmMatrix = vec3(1.0, 0.7, warmth);

    vec3 adjusted = color.rgb * warmMatrix;

    // Optional: mild brightness compensation
    adjusted = pow(adjusted, vec3(0.95));

    fragColor = vec4(adjusted, color.a);
}

