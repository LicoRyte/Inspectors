extends Node

var selected_situation: int = 1


func random_situation():
	selected_situation = randi_range(1,len(situation))


var transcript = {
	#preloads of png goes here
}

var situation = {
	1: {
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
			"transcript_sprite": null,
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
			"transcript_sprite": null,
			"is_corrupted": false
		},
		"ID3": {
			"Intro": "Tae",
			"transcripts": [
			"G", 
			"H", 
			"I", 
			"J", 
			"K",
			"L"
			],
			"transcript_sprite": null,
			"is_corrupted": false
		}
	}
}
