extends Node

#region Player and Runestone location
var player_rotation_degree : float
var player_position : Vector3
var tracker_position : Vector3
var tracker_axis_rotation : float

#endregion

#region Map and Map drawing

var map_drawing_color : Color = Color(0.075, 0.141, 0.251, 1.0)

#endregion

#region Player control

var is_map_open : bool = false
var can_draw : bool = false
var is_adding_map_label = false

#endregion
