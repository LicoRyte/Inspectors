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
			"Luka give me my money back.",
			"just get some rest at the beach.", 
			"I did won a lottery, My luck is going up.", 
			"My makeup brand that I use lunch a new product and I need it.", 
			"it's just literally went to my bank account, I have no idea.", 
			"it's the bonus from you."
			],
			"transcript_sprite": transcript.get("default", null),
			"is_corrupted": true
		},
		"ID2": {
			"Intro": "LUKA SILOMOV",
			"transcripts": [
			"I had taken out loans from informal sources, and in order to settle all of them, I borrowed money from Adam Tezel, and I paid him back.", 
			"that's for the dinner with my girlfriend.", 
			"My 3D model sold out that's make a lot of money.", 
			"I went to the golf club and have some fun.", 
			"I went to the casino and that day it's my lucky day.", 
			"it's the bonus of the resterant"
			],
			"transcript_sprite": transcript.get("default", null),
			"is_corrupted": false
		},
		"ID3": {
			"Intro": "ADAM TEZEL",
			"transcripts": [
			"Luka returned my money, but I don't know what he borrowed it for though.", 
			"I got a dinner.... alone.", 
			"I bought a gift for my mom, try to be a good son you know.", 
			"I got a big big tip from the customer.", 
			"My mom need a money for her car installments.",
			"It's the bouns of this month."
			],
			"transcript_sprite": transcript.get("default", null),
			"is_corrupted": false
		}
	}
}
