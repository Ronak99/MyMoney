enum Routes {
  HOME,
  ANALYTICS,
  ACCOUNTS,
  CATEGORIES,
  PREFERENCES,
}

extension RoutesExt on Routes {
  String get value {
    return '/${name.toLowerCase()}';
  }
}