extends Node

var selected_situation: int = 1


func random_situation():
	selected_situation = randi_range(1,len(situation))


var company = {
	"placeholder_company": preload("res://Assets/company_placeholder.png")
}

var transcript = {
	#---Responsible for loading sprite image
	"placeholder_blue":preload("res://Assets/UI/paper_resolutions.png")  ,
	"placeholder_green": preload("res://Assets/green_trans_placeholder.png"),
	"placeholder_red": preload("res://Assets/red_trans_placeholder.png")
}
var situation = {
	1: {
		"company": company.get("placeholder_company", null),
		"ID1": {
			"Intro": "Peam",
			"transcripts": [
			"A",
			"B", 
			"C", 
			"D", 
			"E", 
			"F"
			],
			"transcript_sprite": transcript.get("placeholder_red", null),
			"is_corrupted": false
		},
		"ID2": {
			"Intro": "Guide",
			"transcripts": [
			"G", 
			"H", 
			"I", 
			"J", 
			"K", 
			"L"
			],
			"transcript_sprite": transcript.get("placeholder_green", null),
			"is_corrupted": false
		},
		"ID3": {
			"Intro": "Tae",
			"transcripts": [
			"I'm the MC | Academic Director lol", 
			"H", 
			"I", 
			"J", 
			"K",
			"L"
			],
			"transcript_sprite": transcript.get("placeholder_blue", null),
			"is_corrupted": true
		}
	}
}
