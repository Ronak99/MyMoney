import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:my_money/model/account.dart';
import 'package:my_money/packages/storage/storage.dart';

import 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(AccountState()) {
    initialize();
  }

  void initialize() {
    Get.find<LocalStorageService>().streamAllAccounts().listen((data) {
      emit(state.copyWith(accounts: data));
    });
  }

  void addAccount({required String name, required double balance}) async {
    try{
      Account account = Account(id: 4, name: name, balance: balance, createdOn: DateTime.now(),);
      final result = await Get.find<LocalStorageService>().addAccount(account);
      print(result);
    }catch(e){
      print(e);
    }
  }
}
