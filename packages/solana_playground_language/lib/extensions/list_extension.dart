extension ListExtension on List {
  bool moveTo(Object object, int index) {
    if (index < 0 || index >= length) return false;
    if (!contains(object)) return false;

    remove(object);
    insert(index, object);
    return true;
  }
}