part of '../storage.dart';

class _Queries {
  static const readTransactions = '''
  SELECT
    t.id                AS t_id,
    t.notes              AS t_notes,
    t.amount            AS t_amount,
    t.date              AS t_date,
    t.transactionType   AS t_transactionType,
    t.accountId         AS t_accountId,
    t.categoryId        AS t_categoryId,

    a.id                AS a_id,
    a.name              AS a_name,
    a.balance           AS a_balance,
    a.createdOn         AS a_createdOn,

    c.id                AS c_id,
    c.name              AS c_name,
    c.description       AS c_description,
    c.type              AS c_type,
    c.createdOn         AS c_createdOn
  FROM transactions t
  LEFT JOIN accounts  a ON a.id = t.accountId
  LEFT JOIN categories c ON c.id = t.categoryId
  ''';
}
