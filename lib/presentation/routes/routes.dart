enum Routes {
  TRANSACTIONS,
  ACCOUNTS,
  CATEGORIES,
  CREATE_TRANSACTION,
  MODIFY_ACCOUNT,
  MODIFY_CATEGORY,
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