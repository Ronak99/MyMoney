enum Bank {
  fi,
  sbi,
  hdfc,
  icici,
}

extension BankExtension on Bank {
  String get name => switch(this) {
    Bank.fi => "Federal Bank",
    Bank.sbi => "State Bank of India",
    Bank.hdfc => "HDFC Bank",
    Bank.icici => "ICICI Bank",
  };
}