import 'bankAccount.dart';

class Client {
  String name;
  String address;
  String phone;
  late BankAccount bankAccount;
  Client(this.name, this.address, this.phone);
}

// void main() {
//   BankAccount account = BankAccount(1000000);
//   Client owner = Client('khaled', '011156', 'assiut');
//
//   account.owner = owner;
//   owner.bankAccount = account;
//   account.viewInfo();
// }
