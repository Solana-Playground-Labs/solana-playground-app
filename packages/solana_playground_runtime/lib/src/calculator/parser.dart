dynamic valueParse(String rawValue) {
  dynamic value;

  if (rawValue.startsWith('"') && rawValue.endsWith('"')) {
    value = rawValue.replaceAll('"', '');
  } else if (rawValue == "true") {
    value = true;
  } else if (rawValue == "false") {
    value = false;
  } else if (int.tryParse(rawValue) != null) {
    value = int.parse(rawValue);
  } else if (double.tryParse(rawValue) != null) {
    value = double.tryParse(rawValue);
  } else {
    throw Exception("Can not parse constant: $rawValue");
  }
  return value;
}