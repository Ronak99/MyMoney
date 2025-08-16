enum Routes {
  TRANSACTIONS,
  ACCOUNTS,
  CATEGORIES,
  CREATE_TRANSACTION,
}

extension RoutesExt on Routes {
  String get value {
    return '/${name.toLowerCase()}';
  }
}