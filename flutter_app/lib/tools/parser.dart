class Parser {
  static num parseInvariant(String value) {
    if (value.contains(',')) {
      value = value.replaceAll(new RegExp(','), '.');
    }

    var parsedValue = num.tryParse(value);

    if (parsedValue == null) {
      return 0;
    }

    return parsedValue;
  }
}