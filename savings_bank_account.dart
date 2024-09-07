import 'bankAccount.dart';

class SavingsBankAccount extends BankAccount {
  late double minBalance;

  SavingsBankAccount(double balance) : super(balance) {
    minBalance = 1000;
  }

  @override
  bool withdraw(double amountOfMoney) {
    if (balance - amountOfMoney <= minBalance) {
      print('sorry, balance after withdraw should be >= $minBalance');
      return false;
    }
    return super.withdraw(amountOfMoney);
  }

  @override
  bool deposit(double amountOfMoney) {
    if (amountOfMoney < 100) {
      print('sorry invalid amount , amount of money should be > 100');
      return false;
    }
    return super.deposit(amountOfMoney);
  }
}
