import 'package:flutter/material.dart';
import 'package:my_money/model/menu_item.dart';

extension BuildContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  void showSuccessSnackBar(String content) => ScaffoldMessenger.of(this)
      .showSnackBar(SnackBarUtils.success(content: content));

  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;

  double get safeAreaHeight =>
      MediaQuery.of(this).size.height - MediaQuery.paddingOf(this).top;

  void showCustomMenu(List<MenuItem> items) {
    final RenderBox button = findRenderObject() as RenderBox;
    final RenderBox overlay =
        Navigator.of(this).overlay!.context.findRenderObject() as RenderBox;

    const Offset offset = Offset(0, 50);
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(offset, ancestor: overlay),
        button.localToGlobal(
          button.size.bottomRight(Offset.zero) + offset,
          ancestor: overlay,
        ),
      ),
      Rect.fromPoints(
          Offset.zero, Offset(overlay.size.width, overlay.size.height)),
    );

    showMenu<String>(
      context: this,
      position: position,
      items: items
          .map(
            (e) => PopupMenuItem<String>(
              value: e.value,
              height: 0,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              onTap: e.onTap,
              child: Row(
                children: [
                  Icon(
                    e.icon,
                    size: 16,
                    color: e.isDestructive
                        ? colorScheme.error
                        : colorScheme.onSurface,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    e.label,
                    style: TextStyle(
                      color: e.isDestructive
                          ? colorScheme.error
                          : colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

enum SnackBarType {
  error(Colors.red, Icons.error_outline, Duration(seconds: 4)),
  info(Colors.blue, Icons.info_outline, Duration(seconds: 3)),
  warning(Colors.orange, Icons.warning_outlined, Duration(seconds: 3)),
  success(Colors.green, Icons.check_circle_outline, Duration(seconds: 3));

  const SnackBarType(this.color, this.icon, this.defaultDuration);

  final MaterialColor color;
  final IconData icon;
  final Duration defaultDuration;
}

class SnackBarUtils {
  /// Creates a typed snackbar with consistent styling
  static SnackBar _create({
    required SnackBarType type,
    required String content,
    Duration? duration,
    SnackBarAction? action,
    String? actionLabel,
    VoidCallback? onActionPressed,
  }) {
    return SnackBar(
      content: Row(
        children: [
          Icon(
            type.icon,
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              content,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: type.color[600],
      duration: duration ?? type.defaultDuration,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      action: action ??
          (actionLabel != null && onActionPressed != null
              ? SnackBarAction(
                  label: actionLabel,
                  textColor: Colors.white,
                  onPressed: onActionPressed,
                )
              : null),
    );
  }

  /// Creates an error snackbar with red background and white text
  static SnackBar error({
    required String content,
    Duration? duration,
    SnackBarAction? action,
    String? actionLabel,
    VoidCallback? onActionPressed,
  }) =>
      _create(
        type: SnackBarType.error,
        content: content,
        duration: duration,
        action: action,
        actionLabel: actionLabel,
        onActionPressed: onActionPressed,
      );

  /// Creates an info snackbar with blue background and white text
  static SnackBar info({
    required String content,
    Duration? duration,
    SnackBarAction? action,
    String? actionLabel,
    VoidCallback? onActionPressed,
  }) =>
      _create(
        type: SnackBarType.info,
        content: content,
        duration: duration,
        action: action,
        actionLabel: actionLabel,
        onActionPressed: onActionPressed,
      );

  /// Creates a warning snackbar with orange background and white text
  static SnackBar warning({
    required String content,
    Duration? duration,
    SnackBarAction? action,
    String? actionLabel,
    VoidCallback? onActionPressed,
  }) =>
      _create(
        type: SnackBarType.warning,
        content: content,
        duration: duration,
        action: action,
        actionLabel: actionLabel,
        onActionPressed: onActionPressed,
      );

  /// Creates a success snackbar with green background and white text
  static SnackBar success({
    required String content,
    Duration? duration,
    SnackBarAction? action,
    String? actionLabel,
    VoidCallback? onActionPressed,
  }) =>
      _create(
        type: SnackBarType.success,
        content: content,
        duration: duration,
        action: action,
        actionLabel: actionLabel,
        onActionPressed: onActionPressed,
      );
}
