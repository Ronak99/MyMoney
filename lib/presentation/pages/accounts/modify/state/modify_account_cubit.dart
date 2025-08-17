import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_money/model/account.dart';
import 'package:my_money/presentation/routes/route_generator.dart';

import 'modify_account_state.dart';

class ModifyAccountCubit extends Cubit<ModifyAccountState> {
  ModifyAccountCubit({
    String? name,
    double? balance,
    DateTime? createdOn,
  }) : super(ModifyAccountState(
    name: name,
    balance: balance,
    createdOn: createdOn ?? DateTime.now(),
  ));

  void setName(String name) {
    emit(state.copyWith(name: name));
  }

  void setBalance(String balance) {
    try {
      emit(state.copyWith(balance: double.tryParse(balance)));
    } catch (e) {
      rethrow;
    }
  }

  void setCreatedOn(DateTime createdOn) {
    emit(state.copyWith(createdOn: createdOn));
  }

  void create() {
    Account account = Account(
      name: state.name!,
      balance: state.balance ?? 0.0,
      createdOn: state.createdOn!,
    );

    // Assuming you have an account cubit similar to transaction cubit
    RouteGenerator.accountCubit.addAccount(account);
  }
}