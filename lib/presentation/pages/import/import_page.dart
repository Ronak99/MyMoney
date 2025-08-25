import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_money/extensions/build_context.dart';
import 'package:my_money/extensions/peer_app.dart';
import 'package:my_money/packages/parser/parser.dart';
import 'package:my_money/presentation/pages/import/state/import_cubit.dart';
import 'package:my_money/presentation/widgets/custom_bottom_sheet.dart';
import 'package:my_money/presentation/widgets/custom_scaffold.dart';

class ImportPage extends StatelessWidget {
  const ImportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> showInfoDialog = ValueNotifier(true);
    final ValueNotifier<Bank> selectedBank = ValueNotifier(Bank.fi);
    final ValueNotifier<PeerApp> selectedPeer = ValueNotifier(PeerApp.myMoney);

    return CustomScaffold(
      title: "Import",
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
              child: Text(
                "Import",
                style: context.textTheme.headlineLarge,
              ),
            ),
            const SizedBox(height: 12),
            ValueListenableBuilder(
              valueListenable: showInfoDialog,
              builder: (context, value, child) =>
                  value ? child! : const SizedBox.shrink(),
              child: InfoCard(onDismiss: () => showInfoDialog.value = false),
            ),
            const SizedBox(height: 16),
            ImportSection(
              title: "Statement",
              description:
                  "We have added PDF parsers for bank statements for select banks.",
              actionLabel: "Import",
              onImport: () {
                context
                    .read<ImportCubit>()
                    .onImport(context, bank: selectedBank.value);
              },
              selectedItem: selectedBank,
              items: Map.fromEntries(Bank.values.map((e) => MapEntry(e, e.name))),
            ),
            const Divider(
              height: 50,
            ),
            ImportSection(
              title: "Existing Records",
              description:
                  "Import CSV from your existing finance management apps.",
              actionLabel: "Import",
              onImport: () {
                context
                    .read<ImportCubit>()
                    .onImport(context, peerApp: selectedPeer.value);
              },
              selectedItem: selectedPeer,
              items: Map.fromEntries(PeerApp.values.map((e) => MapEntry(e, e.name))),
            ),
          ],
        ),
      ),
    );
  }
}

/// Reusable info card with dismiss button
class InfoCard extends StatelessWidget {
  final VoidCallback onDismiss;

  const InfoCard({super.key, required this.onDismiss});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: context.colorScheme.primary.withOpacity(.1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.notes, color: context.colorScheme.primary),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Privacy Built-In!",
                      style: context.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: context.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "This app keeps all your data on your device, nothing is stored in the cloud.",
                      style: context.textTheme.bodySmall!.copyWith(
                        color: context.colorScheme.onSurface.withOpacity(.8),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => CustomBottomSheet.privacy().show(context),
                  child: const Text("Learn More"),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextButton(
                  onPressed: onDismiss,
                  child: const Text("Dismiss"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ImportSection<T> extends StatelessWidget {
  final String title;
  final String description;
  final String actionLabel;
  final Function() onImport;
  final ValueNotifier<T> selectedItem;
  final Map<T, String> items;
  final bool useTextButton;

  const ImportSection({
    super.key,
    required this.title,
    required this.description,
    required this.actionLabel,
    required this.onImport,
    required this.selectedItem,
    required this.items,
    this.useTextButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<T>(
      valueListenable: selectedItem,
      builder: (context, bank, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: context.textTheme.headlineSmall),
            const SizedBox(height: 4),
            Text(
              description,
              style: context.textTheme.bodySmall!.copyWith(
                color: context.colorScheme.onSurface.withOpacity(.8),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: DropdownMenu<T>(
                    initialSelection: selectedItem.value,
                    width: double.infinity,
                    dropdownMenuEntries: items.keys
                        .map(
                          (e) => DropdownMenuEntry<T>(
                            value: e,
                            label: items[e] ?? "",
                          ),
                        )
                        .toList(),
                    onSelected: (item) {
                      if (item != null) selectedItem.value = item;
                    },
                  ),
                ),
                const SizedBox(width: 16),
                useTextButton
                    ? TextButton(
                        onPressed: onImport,
                        child: Text(actionLabel),
                      )
                    : ElevatedButton(
                        onPressed: onImport,
                        child: Text(actionLabel),
                      ),
              ],
            )
          ],
        );
      },
    );
  }
}
