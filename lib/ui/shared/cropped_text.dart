String croppedText(String? text) {
  if (text?.isNotEmpty ?? false) {
    final part1 = text?.substring(0, 6) ?? '';
    final part2 = text?.substring((text.length - 8)) ?? '';
    return '$part1 *** $part2';
  }

  return '';
}
