import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_money/presentation/widgets/custom_scaffold.dart';
import 'package:my_money/state/settings/settings_cubit.dart';
import 'package:my_money/state/settings/settings_state.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static final List<ColorOption> colorOptions = [
    ColorOption(
      name: 'Cyan',
      color: const Color(0xFF22D3EE),
    ),
    ColorOption(
      name: 'Blue',
      color: const Color(0xFF3B82F6),
    ),
    ColorOption(
      name: 'Purple',
      color: const Color(0xFFA78BFA),
    ),
    ColorOption(
      name: 'Pink',
      color: const Color(0xFFEC4899),
    ),
    ColorOption(
      name: 'Red',
      color: const Color(0xFFEF4444),
    ),
    ColorOption(
      name: 'Orange',
      color: const Color(0xFFF59E0B),
    ),
    ColorOption(
      name: 'Green',
      color: const Color(0xFF34D399),
    ),
    ColorOption(
      name: 'Teal',
      color: const Color(0xFF14B8A6),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) => CustomScaffold(
        title: 'Settings',
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              'Theme Color',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Choose a color to customize your app theme',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: 24),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: colorOptions.length,
              itemBuilder: (context, index) {
                final option = colorOptions[index];
                final isSelected = state.seedColor.value == option.color.value;

                return GestureDetector(
                  onTap: () {
                    context.read<SettingsCubit>().updateSeedColor(option.color);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: option.color,
                      border: Border.all(
                        color: isSelected
                            ? Theme.of(context).colorScheme.onSurface
                            : Colors.transparent,
                        width: isSelected ? 3 : 0,
                      ),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: option.color.withOpacity(0.3),
                                blurRadius: 8,
                                spreadRadius: 2,
                              ),
                            ]
                          : null,
                    ),
                    child: isSelected
                        ? Center(
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.9),
                              ),
                              child: Icon(
                                Icons.check,
                                color: option.color,
                                size: 20,
                              ),
                            ),
                          )
                        : null,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ColorOption {
  final String name;
  final Color color;

  const ColorOption({
    required this.name,
    required this.color,
  });
}

