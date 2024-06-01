Map<String, String> parseResponse(String response) {
  // Extract the values
  String? imageDescriptionValue;
  String? suggestionValue;
  String? reasonValue;

  // Regular expressions to match the keys and their values
  RegExp imageDescriptionRegExp = RegExp(r"Image description: (.*?)(?=Suggestion:|$)", dotAll: true);
  RegExp suggestionRegExp = RegExp(r"Suggestion: (.*?)(?=Reason:|$)", dotAll: true);
  RegExp reasonRegExp = RegExp(r"Reason: (.*?)(?=$)", dotAll: true);

  // Use the regular expressions to extract the values
  final imageDescriptionMatch = imageDescriptionRegExp.firstMatch(response);
  final suggestionMatch = suggestionRegExp.firstMatch(response);
  final reasonMatch = reasonRegExp.firstMatch(response);

  if (imageDescriptionMatch != null) {
    imageDescriptionValue = imageDescriptionMatch.group(1)?.trim();
  }
  if (suggestionMatch != null) {
    suggestionValue = suggestionMatch.group(1)?.trim();
  }
  if (reasonMatch != null) {
    reasonValue = reasonMatch.group(1)?.trim();
  }

  // Create and return the map
  return {
    "image_description": imageDescriptionValue ?? "",
    "suggestion": suggestionValue ?? "",
    "reason": reasonValue ?? "",
  };
}