extension StringExt on String {
  String get titleCase {
    if (isEmpty) {
      return '';
    }
    final tempList = toLowerCase().trim().split(' ');
    for (var i = 0; i < tempList.length; i++) {
      tempList[i] = tempList[i][0].toUpperCase() + tempList[i].substring(1);
    }
    return tempList.join(' ');
  }
}
