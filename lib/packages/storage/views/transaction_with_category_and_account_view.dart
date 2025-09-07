part of '../storage.dart';

extension TCAViewExtension on TransactionWithCategoryAndAccountView {
  /// Build Account only when the LEFT JOIN actually matched.
  Account? toAccount() {
    if (a_id == null) return null;

    return Account(
      id: a_id!,
      name: a_name ?? '',
      balance: (a_balance ?? 0).toInt(),
      createdOn: DateTime.fromMillisecondsSinceEpoch(a_createdOn ?? 0),
    );
  }

  /// Build Category only when the LEFT JOIN actually matched.
  TransactionCategory? toCategory() {
    if (c_id == null) return null;

    final rawType = c_type;
    // Guard against bad enum index
    final catType = (rawType != null &&
            rawType >= 0 &&
            rawType < CategoryType.values.length)
        ? CategoryType.values[rawType]
        : CategoryType.expense;

    return TransactionCategory(
      id: c_id!,
      name: c_name ?? '',
      type: catType,
      icon: c_icon != null ? CategoryIcon.values[c_icon!] : CategoryIcon.unknown,
      createdOn: DateTime.fromMillisecondsSinceEpoch(c_createdOn ?? 0),
    );
  }

  Transaction toTransaction({
    required Account? account,
    required TransactionCategory? category,
  }) {
    // Enum guard for transactionType
    final idx = t_transactionType;
    final txType = (idx >= 0 && idx < TransactionType.values.length)
        ? TransactionType.values[idx]
        : TransactionType.none;

    return Transaction(
      id: t_id,
      notes: t_notes,
      amount: t_amount,
      date: DateTime.fromMillisecondsSinceEpoch(t_date),
      transactionType: txType,
      accountId: t_accountId,
      categoryId: t_categoryId,
      account: account,
      category: category,
    );
  }
}

@DatabaseView(
  _Queries.readTransactions,
  viewName: DBViews.transactionWithCategoryAndAccount,
)
class TransactionWithCategoryAndAccountView {
  final int t_id;
  final String t_notes;
  final double t_amount;
  final int t_date;
  final int t_transactionType;
  final int? t_accountId;
  final int? t_categoryId;

  final int? a_id;
  final String? a_name;
  final int? a_balance;
  final int? a_createdOn;

  final int? c_id;
  final String? c_name;
  final int? c_icon;
  final int? c_type;
  final int? c_createdOn;

  const TransactionWithCategoryAndAccountView({
    required this.t_id,
    required this.t_notes,
    required this.t_amount,
    required this.t_date,
    required this.t_transactionType,
    this.t_accountId,
    this.t_categoryId,
    this.a_id,
    this.a_name,
    this.a_balance,
    this.a_createdOn,
    this.c_id,
    this.c_name,
    this.c_icon,
    this.c_type,
    this.c_createdOn,
  });
}
