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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                items: Map.fromEntries(
                    Bank.values.map((e) => MapEntry(e, e.name))),
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
                items: Map.fromEntries(
                    PeerApp.values.map((e) => MapEntry(e, e.name))),
              ),
              const Divider(height: 50),
              ImportAssetSection(
                title: "Import Asset",
                description:
                    "Directly import asset from assets/statements folder.",
                actionLabel: "Import",
                onImport: (fileName, password) {
                  context.read<ImportCubit>().onImportAsset(
                        context,
                        bank: selectedBank.value,
                        fileName: fileName,
                        password: password,
                      );
                },
                selectedItem: selectedBank,
                items: Map.fromEntries(
                    Bank.values.map((e) => MapEntry(e, e.name))),
              ),
            ],
          ),
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

class ImportAssetSection<T> extends StatefulWidget {
  final String title;
  final String description;
  final String actionLabel;
  final Function(String fileName, String? password) onImport;
  final ValueNotifier<T> selectedItem;
  final Map<T, String> items;
  final bool useTextButton;

  const ImportAssetSection({
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
  State<ImportAssetSection<T>> createState() => _ImportAssetSectionState<T>();
}

class _ImportAssetSectionState<T> extends State<ImportAssetSection<T>> {
  final TextEditingController _fileNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _fileNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<T>(
      valueListenable: widget.selectedItem,
      builder: (context, bank, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: context.textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              widget.description,
              style: context.textTheme.bodySmall!.copyWith(
                color: context.colorScheme.onSurface.withOpacity(.8),
              ),
            ),
            const SizedBox(height: 16),
            DropdownMenu<T>(
              initialSelection: widget.selectedItem.value,
              width: double.infinity,
              dropdownMenuEntries: widget.items.keys
                  .map(
                    (e) => DropdownMenuEntry<T>(
                      value: e,
                      label: widget.items[e] ?? "",
                    ),
                  )
                  .toList(),
              onSelected: (item) {
                if (item != null) widget.selectedItem.value = item;
              },
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _fileNameController,
              decoration: InputDecoration(
                labelText: 'File Name',
                hintText: 'e.g., fi.pdf or statements/fi.pdf',
                border: const OutlineInputBorder(),
                helperText: 'Enter the file name from assets/statements folder',
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password (Optional)',
                hintText: 'Enter PDF password if required',
                border: const OutlineInputBorder(),
                helperText: 'Leave empty if PDF is not password protected',
              ),
              enableSuggestions: false,
              autocorrect: false,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: widget.useTextButton
                  ? TextButton(
                      onPressed: () {
                        final fileName = _fileNameController.text.trim();
                        if (fileName.isNotEmpty) {
                          final password = _passwordController.text.trim();
                          widget.onImport(
                            fileName,
                            password.isEmpty ? null : password,
                          );
                        }
                      },
                      child: Text(widget.actionLabel),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        final fileName = _fileNameController.text.trim();
                        if (fileName.isNotEmpty) {
                          final password = _passwordController.text.trim();
                          widget.onImport(
                            fileName,
                            password.isEmpty ? null : password,
                          );
                        }
                      },
                      child: Text(widget.actionLabel),
                    ),
            ),
            const SizedBox(height: 12),
          ],
        );
      },
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
            Text(
              title,
              style: context.textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
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
