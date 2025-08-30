import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class CustomScaffold extends StatelessWidget {
  final String? title;
  final Widget body;
  final Widget? fab;
  final Widget? bottomNavigationBar;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onBackButtonPressed;

  const CustomScaffold({
    super.key,
    this.title,
    required this.body,
    this.fab,
    this.leading,
    this.trailing,
    this.bottomNavigationBar,
    this.onBackButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: fab,
      bottomNavigationBar: bottomNavigationBar,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    if (onBackButtonPressed != null)
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: IconButton(
                          onPressed: onBackButtonPressed,
                          padding: EdgeInsets.zero,
                          alignment: Alignment.center,
                          icon: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 20,
                          ),
                        ),
                      ),
                    if (title != null)
                      GestureDetector(
                        onTap: onBackButtonPressed,
                        child: Text(
                          title!,
                          style: context.textTheme.headlineMedium!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                      ),
                    const Spacer(),
                    if (trailing != null) trailing!,
                  ],
                ),
              ),
              Expanded(child: body),
            ],
          ),
        ),
      ),
    );
  }
}
