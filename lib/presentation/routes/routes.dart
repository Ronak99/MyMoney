enum Routes {
  TRANSACTIONS,
  ACCOUNTS,
  CATEGORIES,
}

extension RoutesExt on Routes {
  String get value {
    return '/${name.toLowerCase()}';
  }
}