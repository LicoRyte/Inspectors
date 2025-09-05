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
	"placeholder_red": preload("res://Assets/red_trans_placeholder.png"),
	"default": preload("res://Assets/transcript/transcript_defualt.png")
	
}
var situation = {
	1: {
		"company": company.get("placeholder_company", null),
		"ID1": {
			"Intro": "MYA HARMONY",
			"transcripts": [
			"I just have a dinner with my family",
			"I want a new bag", 
			"I got it from you remember?", 
			"it's my attorney consulation fees of my other business", 
			"you know I do have a lot of business right stockmarket is one of that and it's blown up on that day", 
			"that's for my dog but he good now don't worry about him"
			],
			"transcript_sprite": transcript.get("default", null),
			"is_corrupted": false
		},
		"ID2": {
			"Intro": "LUKA SILOMOV",
			"transcripts": [
			"G", 
			"H", 
			"I", 
			"J", 
			"K", 
			"L"
			],
			"transcript_sprite": transcript.get("default", null),
			"is_corrupted": false
		},
		"ID3": {
			"Intro": "ADAM TEZEL",
			"transcripts": [
			"I'm the MC | Academic Director lol", 
			"H", 
			"I", 
			"J", 
			"K",
			"L"
			],
			"transcript_sprite": transcript.get("default", null),
			"is_corrupted": true
		}
	}
}
