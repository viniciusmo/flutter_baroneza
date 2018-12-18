import 'dart:collection';

class Dependencies {
  static Map<Type, Object> dependencies = HashMap();

  static register<T>(Object object) {
    dependencies[T] = object;
  }

  static T get<T>() {
    return dependencies[T];
  }

  static clear<T>() {
    dependencies[T] = null;
  }
}
