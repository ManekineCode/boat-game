extends Node

#region Player and Runestone location
var player_rotation_degree : float
var player_position : Vector3
var runestone_position : Vector3
var runestone_axis_rotation : float

signal new_runestone_placed(new_runestone_position : Vector3) # when a new runestone is placed, the previous one gets destroyed
signal despawn_previous_runestone
var runestone_is_placed : bool = false
var current_runestone = null

#endregion

#region Map and Map drawing

var map_drawing_color : Color = Color(0.075, 0.141, 0.251, 1.0)

#endregion

#region Player control

var is_map_open : bool = false
var can_draw : bool = false
var is_adding_map_label = false

#endregion
