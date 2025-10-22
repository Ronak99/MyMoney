import 'package:go_router/go_router.dart';
import 'package:my_money/packages/actions/app_action.dart';
import 'package:my_money/presentation/pages/transactions/update/update_transaction_page.dart';
import 'package:my_money/presentation/routes/route_generator.dart';
import 'package:my_money/presentation/routes/routes.dart';
import 'package:quick_actions/quick_actions.dart';

class AppActionManager {
  final quickActions = const QuickActions();

  // this is a hard limit set by both Android and iOS
  int get kMaxActionsAllowed => 4;

  // initializer
  void initialize() {
    quickActions.initialize(_actionHandler);
    _registerDefaultActions();
  }

  // intents
  void _registerDefaultActions() {
    _setQuickAction(
      [
        AppAction.createTransaction,
        AppAction.importBankStatement,
        AppAction.search,
      ],
    );
  }

  // maybe something to do as we log out of the app
  void clearAllActions() {
    quickActions.clearShortcutItems();
  }

  // local functions
  void _actionHandler(String shortcutType) {
    final context = RouteGenerator.rootNavigatorKey.currentContext!;
    switch (AppAction.determineType(shortcutType)) {
      case AppAction.createTransaction:
        context.push(
          Routes.UPDATE_TRANSACTION.value,
          extra: UpdateTransactionParams(),
        );
      case AppAction.importBankStatement:
        context.push(Routes.IMPORT.value);
      case AppAction.search:
        context.push(Routes.ACCOUNTS.value);
      default:
        break;
    }
  }

  void _setQuickAction(List<AppAction> actions) async {
    try {
      await quickActions.setShortcutItems(
        actions.map((e) => e.toShortcutItem()).toList(),
      );
    } catch (e) {
      print(e);
    }
  }

  // singleton
  static AppActionManager get instance {
    _instance ??= AppActionManager._();
    return _instance!;
  }

  static AppActionManager? _instance;

  AppActionManager._();
}
