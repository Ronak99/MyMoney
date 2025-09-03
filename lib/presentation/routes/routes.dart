enum Routes {
  TRANSACTIONS,
  ACCOUNTS,
  CATEGORIES,
  CREATE_TRANSACTION,
  IMPORT,
  VIEW_IMPORTS,
  ANALYSIS,
  SETTINGS,
}

extension RoutesExt on Routes {
  String get value {
    return '/${name.toLowerCase()}';
  }
}