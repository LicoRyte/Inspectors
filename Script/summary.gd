extends Node2D

@onready var victory_message: Label = $Text/Win_Lose/Panel/MarginContainer/HBoxContainer/Label
@onready var caughted: Label = $Text/caught/Panel/MarginContainer/HBoxContainer/Label
@onready var final: Label = $Text/final_judge/Panel/MarginContainer/HBoxContainer/Label

@onready var top_message: MarginContainer = $Text/Win_Lose
@onready var middle_message: MarginContainer = $Text/caught
@onready var bottom_message: MarginContainer = $Text/final_judge

var top := [
	"The mole slipped away.",          # 0 = missed some
	"The mole has been exposed.",      # 1 = perfect
	"Your suspicion spread too wide."  # 2 = over-voted
]

var bottom := [
	"The company is at risk.",                 # 0
	"The company is safe... for now.",        # 1
	"The company grows weaker from within."   # 2
]

var _sequence_started := false

func _ready() -> void:
	hide_text()
	# call this when voting ends; for demo we run once on ready
	present_results()

func hide_text() -> void:
	top_message.hide()
	middle_message.hide()
	bottom_message.hide()

func present_results() -> void:
	if _sequence_started:
		return
	_sequence_started = true

	var intended: Array = GameManager.intended_answer
	var player: Array   = GameManager.player_answer

	var result := _compare_answers(intended, player)
	_set_messages(result, intended, player)
	await _show_sequence()

func _set_messages(result: int, intended: Array, player: Array) -> void:
	match result:
		1: # perfect
			victory_message.text = top[1]
			final.text = bottom[1]
		2: # over-voted
			victory_message.text = top[2]
			final.text = bottom[2]
		_: # 0 = missed some
			victory_message.text = top[0]
			final.text = bottom[0]

	# 🔄 Progress line = intersection count (unique, order-agnostic)
	var correct := _count_correct(intended, player)
	var total := _unique_sorted(intended).size()
	caughted.text = "%d of %d identified" % [correct, total]

func _unique_sorted(arr: Array) -> Array:
	var seen := {}
	for v in arr:
		seen[v] = true
	var out := seen.keys()
	out.sort()
	return out

func _count_correct(intended: Array, player: Array) -> int:
	var i_u := _unique_sorted(intended)
	var p_u := _unique_sorted(player)
	var count := 0
	for id in p_u:
		if i_u.has(id):
			count += 1
	return count

# returns: 1 perfect, 0 missed, 2 over-voted
func _compare_answers(intended: Array, player: Array) -> int:
	var i_u := _unique_sorted(intended)
	var p_u := _unique_sorted(player)

	if p_u == i_u:
		return 1

	var all_in := true
	for id in i_u:
		if not p_u.has(id):
			all_in = false
			break

	if all_in and p_u.size() > i_u.size():
		return 2

	return 0

func _show_sequence() -> void:
	await get_tree().create_timer(2.0).timeout
	top_message.show()
	await get_tree().create_timer(1.5).timeout
	middle_message.show()
	await get_tree().create_timer(1.5).timeout
	bottom_message.show()
	await get_tree().create_timer(3.5).timeout
	Scene.Change("menu")
