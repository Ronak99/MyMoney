import 'package:quick_actions/quick_actions.dart';

enum AppAction {
  createTransaction(
    title: "Create Transaction",
    type: "create_transaction",
    subtitle: "Record a new transaction",
    icon: "ic_launcher",
  ),
  importBankStatement(
    title: "Import Statement",
    type: "import_bank_statement",
    subtitle: "Import bank statement",
    icon: "",
  ),
  search(
    title: "Search",
    type: "search",
    subtitle: "Search for a transaction",
    icon: "",
  ),
  signin(
    title: "Sign In",
    type: "signin",
    subtitle: "Search for a transaction",
    icon: "",
  ),
  signout(
    title: "Sign out",
    type: "signout",
    subtitle: "Search for a transaction",
    icon: "",
  ),
  unknown(
    type: "",
    title: "",
    subtitle: "",
    icon: "",
  );

  final String type;
  final String title;
  final String icon;
  final String? subtitle;

  const AppAction({
    required this.type,
    required this.title,
    required this.icon,
    required this.subtitle,
  });

  ShortcutItem toShortcutItem() =>
      ShortcutItem(
        type: type,
        localizedTitle: title,
        icon: icon,
        localizedSubtitle: subtitle,
      );

  static AppAction determineType(String type) {
    for (AppAction action in AppAction.values) {
      if (action.type == type) {
        return action;
      }
    }
    return AppAction.unknown;
  }
}