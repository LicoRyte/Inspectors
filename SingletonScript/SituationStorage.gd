extends Node

var selected_situation: int = 1


func random_situation():
	GameManager.intended_answer = []
	print("do random")
	selected_situation = randi_range(1,2)
	print(selected_situation)


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
			"it's my routine to get some gamble going on first day of the month", 
			"I know it's against the rule of our company but I do Free lance", 
			"it's the bonus of the company", 
			"I bought a necklaces for my girlfriend", 
			"I need to go get some grocery going my fridge feel a little empty", 
			"I am a good trader you know"
			],
			"transcript_sprite": transcript.get("default", null),
			"is_corrupted": false
		},
		"ID3": {
			"Intro": "ADAM TEZEL",
			"transcripts": [
			"last month Mya Harmony borrow some money and of course she returned it back.", 
			"I got a bonus.", 
			"Bought a concert ticket.", 
			"..........", 
			"I borrow some money from Luka Silomov",
			"Whether you belive it or not I use that to build a swimming pool"
			],
			"transcript_sprite": transcript.get("default", null),
			"is_corrupted": true
		}
	},
	
	2: {
		"company": company.get("placeholder_company", null),
		"ID1": {
			"Intro": "MYA HARMONY",
			"transcripts": [
			"A",
			"B", 
			"", 
			"", 
			"", 
			""
			],
			"transcript_sprite": transcript.get("default", null),
			"is_corrupted": true
		},
		"ID2": {
			"Intro": "LUKA SILOMOV",
			"transcripts": [
			"C", 
			"", 
			"", 
			"", 
			"", 
			""
			],
			"transcript_sprite": transcript.get("default", null),
			"is_corrupted": false
		},
		"ID3": {
			"Intro": "ADAM TEZEL",
			"transcripts": [
			"D", 
			"", 
			"", 
			"", 
			"",
			""
			],
			"transcript_sprite": transcript.get("default", null),
			"is_corrupted": false
		}
	}
}
