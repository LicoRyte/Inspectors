extends Node

var selected_situation: int = 1


func random_situation():
	selected_situation = randi_range(1,len(situation))


var transcript = {
	#preloads of png goes here
}

var situation = {
	1 : {
		"ID1" : {
			"name" : "Peam",
			"message" : "ARRRRRR",
			"transcript_sprite" : null,
		},
		"ID2" : {
			"name" : "Guide",
			"message" : "Kuy",
			"transcript_sprite" : null,
		},
		"ID3" : {
			"name" : "Tae",
			"message" : "Dev Test Dialogue",
			"transcript_sprite" : null,
		},

	},
	
	
	
	2 : {
		
	},
	
	
	
	3 : {
		
	}
}
