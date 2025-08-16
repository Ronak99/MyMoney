import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_money/model/account.dart';
import 'package:my_money/model/transaction.dart';
import 'package:my_money/model/transaction_category.dart';
import 'package:my_money/presentation/pages/transactions/create/state/create_transaction_state.dart';
import 'package:my_money/presentation/routes/route_generator.dart';

class CreateTrasnactionBloc extends Cubit<CreateTransactionState> {
  CreateTrasnactionBloc({
    String? name,
    String? description,
    Account? account,
    TransactionCategory? category,
    TransactionType? transactionType,
    DateTime? date,
    double? amount,
  }) : super(CreateTransactionState(
          name: name,
          description: description,
          account: account,
          category: category,
          transactionType: transactionType,
          date: date,
          amount: amount,
        ));

  void setName() {}

  void setDescription() {}

  void setAccount() {}

  void setCategory() {}

  void setTransactionType() {}

  void setDate() {}

  void setAmount() {}

  void create() {
    Transaction transaction = Transaction(
      name: state.name!,
      description: state.description!,
      amount: state.amount!,
      date: state.date!,
      transactionType: state.transactionType!,
      accountId: state.account!.id,
      categoryId: state.category!.id,
    );

    RouteGenerator.transactionCubit.addTransaction(transaction);
  }
}
