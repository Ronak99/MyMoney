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

  Future<Account> add(Account account) async {
    try{
      await Get.find<LocalStorageService>().addAccount(account);
      return account;
    }catch(e){
      rethrow;
    }
  }

  Future<void> update(Account account) async {
    try{
      await Get.find<LocalStorageService>().updateAccount(account);
    }catch(e){
      rethrow;
    }
  }

  Future<void> delete(Account account) async {
    try {
      await Get.find<LocalStorageService>().deleteAccount(account);
    }catch(e){
      rethrow;
    }
  }
}
