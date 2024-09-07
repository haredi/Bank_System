import 'client.dart';

class BankAccount {
  static int ids_generator = 1000;
  late int accountId;
  late double balance;
  late Client owner;

  BankAccount([this.balance = 0]) {
    accountId = ids_generator;
    ids_generator++;
  }

  void viewInfo() {
    print('this is account information');
    print('accountId: $accountId');
    print('balance: $balance');
    print('name: ${owner.name}');
    print('address: ${owner.address}');
    print('phone: ${owner.phone}');
  }

  bool withdraw(double amountOfMoney) {
    if (amountOfMoney < 0) {
      print('Invalid amount , amount should be >0');
      return false;
    }
    if (amountOfMoney > balance) {
      print('amount should be =< $balance');
      return false;
    }
    balance -= amountOfMoney;
    print(
        'amount has been withdraw successfully and your balance  is = $balance');
    return true;
  }

  bool deposit(double amountOfMoney) {
    if (amountOfMoney < 100) {
      print('Invalid amount , amount should be >0');
      return false;
    }
    balance += amountOfMoney;
    print(
        'amount has been deposit successfully and your balance  is = $balance');
    return true;
  }
}

// void main() {
//   BankAccount acc1 = BankAccount(10000);
//   BankAccount acc2 = BankAccount(5000);
//   BankAccount acc3 = BankAccount(5000);
//   print(acc1.accountId);
//   print(acc2.accountId);
//   print(acc3.accountId);
//
//   acc1.deposit(500);
//   acc2.withdraw(3000);
// }
