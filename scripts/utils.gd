extends Node
class_name Utils


static func beautify_number(value: int) -> String:
	var suffixes: Array = ["", "K", "M", "B", "T"] # Extend with more suffixes if needed.
	var idx: int = 0
	var number: float = float(value)
	
	while number >= 1000 and idx < suffixes.size():
		idx += 1
		number /= 1000.0

	var result: String = "%.1f" % number
	result = result.erase(result.find("."), 2) if result.ends_with(".0") else result
	
	return result + suffixes[idx]
