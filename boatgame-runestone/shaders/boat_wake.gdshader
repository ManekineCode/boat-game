shader_type spatial;
render_mode diffuse_toon, specular_toon, cull_disabled, unshaded;

uniform vec4 foam_color : source_color = vec4(1.0, 1.0, 1.0, 1.0);

// Boat Tracker

uniform vec3 boat_position = vec3(0.0, 0.0, 0.0);

uniform float scroll_speed = 1.5;
uniform float line_thickness : hint_range(0.01, 0.2) = 0.04;
uniform float lateral_edge_thickness : hint_range(0.01, 0.2) = 0.05; // New control slider!
uniform float wave_frequency : hint_range(1.0, 10.0) = 6.0;

uniform float trail_length_fade : hint_range(0.1, 3.0) = 0.8;
uniform float expansion_narrow_tip : hint_range(0.1, 1.0) = 0.3;

void fragment() {
	vec2 flat_boat_pos = boat_position.xz;
	
	
	float expansion = mix(expansion_narrow_tip, 1.0, UV.y); 
	vec2 warped_uv = vec2((UV.x - 0.5) / expansion + 0.5, UV.y);
	
	// Boundary Clip
	if (warped_uv.x < 0.0 || warped_uv.x > 1.0) {
		discard;
	}

	
	float time_offset = TIME * scroll_speed * 0.2;
	
	
	float vertical_loop = warped_uv.y - time_offset;
	float arch_curve = abs(cos(warped_uv.x * 3.14159265));
	float repeating_wave_grid = fract(vertical_loop * wave_frequency + arch_curve * 0.6);
	
	
	float arch_lines = step(0.5 - line_thickness, repeating_wave_grid) * step(repeating_wave_grid, 0.5 + line_thickness);
	
	
	// Calculate the distance to the absolute edges (0.0 and 1.0) of our warped trapezoid space
	float left_edge = step(0.0, warped_uv.x) * step(warped_uv.x, lateral_edge_thickness);
	float right_edge = step(1.0 - lateral_edge_thickness, warped_uv.x) * step(warped_uv.x, 1.0);
	float lateral_borders = max(left_edge, right_edge);
	
	
	float distance_fade = smoothstep(1.0, 0.0, UV.y * trail_length_fade);
	
	// Combine the central arch lines and the outer lateral edges together
	// Using max() acts like a logical "OR" operation in shader math
	float combined_geometry = max(arch_lines, lateral_borders);
	
	
	float final_composition = combined_geometry * distance_fade;
	float sharp_ink_outline = step(0.1, final_composition);

	ALBEDO = foam_color.rgb;
	ALPHA = sharp_ink_outline;
	
	ALPHA_SCISSOR_THRESHOLD = 0.1;
}