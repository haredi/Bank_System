import 'dart:io';

import 'savings_bank_account.dart';
import 'bankAccount.dart';
import 'client.dart';

class BankingSystem {
  late List<BankAccount> allAccounts;
  late List<Client> allClients;
  BankingSystem() {
    allAccounts = [];
    allClients = [];
    // addTestDate();
  }

  // void addTestDate() {
  //   for (int i = 0; i < 100; i++) {
  //     BankAccount account = BankAccount((i + 1) * 1000);
  //     Client client = Client('client${i + 1}', 'assiut${i + 1}', '0115544');
  //     account.owner = client;
  //     client.bankAccount = account;
  //     allClients.add(client);
  //     allAccounts.add(account);
  //   }
  // }

  void listAllAccounts() {
    for (var account in allAccounts) {
      account.viewInfo();
      print('==========================');
    }
  }

  getAccountIndexById(int accountId) {
    for (int i = 0; i < allAccounts.length; i++) {
      if (allAccounts[i].accountId == accountId) {
        return i;
      }
    }
    return -1;
  }

  void displayAccountDetails() {
    print('please, Enter account Id');
    int id = int.parse(stdin.readLineSync()!);
    int index = getAccountIndexById(id);
    if (index < 0) {
      print('account no found');
    } else {
      allAccounts[index].viewInfo();
    }
  }

  BankAccount? getAccountById(int accountId) {
    for (var account in allAccounts) {
      if (account.accountId == accountId) {
        return account;
      }
    }
    return null;
  }

  void withdraw() {
    print('please, Enter account id');
    int id = int.parse(stdin.readLineSync()!);
    BankAccount? account = getAccountById(id);
    if (account == null) {
      print('account not found.');
    } else {
      print('please, Enter amount of money');
      double money = double.parse(stdin.readLineSync()!);
      account.withdraw(money);
    }
  }

  void deposit() {
    print('please, Enter account id');
    int id = int.parse(stdin.readLineSync()!);
    BankAccount? account = getAccountById(id);
    if (account == null) {
      print('account not found.');
    } else {
      print('please, Enter amount of money');
      double money = double.parse(stdin.readLineSync()!);
      account.deposit(money);
    }
  }

  void delete() {
    print('please, Enter account id');
    int id = int.parse(stdin.readLineSync()!);
    BankAccount? account = getAccountById(id);
    if (allAccounts.remove(account)) {
      print('account deleted successfully');
    } else {
      print('account not found');
    }
  }

  void showMenu() {
    while (true) {
      print('press 0- to update account data');
      print('press 1- to create account');
      print('press 2- to list all available accounts');
      print('press 3- to display a specific account');
      print('press 4- to withdraw money from specific account');
      print('press 5- to deposit money to account');
      print('press 6- to delete account');
      print('press 7- to Exit');

      int userInput = int.parse(stdin.readLineSync()!);

      switch (userInput) {
        case 0:
          {
            updateClientData();
            break;
          }
        case 1:
          {
            createAccount();
            break;
          }
        case 2:
          {
            listAllAccounts();
            break;
          }
        case 3:
          {
            displayAccountDetails();
            break;
          }
        case 4:
          {
            withdraw();
            break;
          }
        case 5:
          {
            deposit();
            break;
          }
        case 6:
          {
            delete();
            break;
          }
        case 7:
          {
            return;
          }
      }
    }
  }

  Client getClientInformation() {
    print('please, Enter client name: ');
    String name = stdin.readLineSync()!;
    print('please, Enter client address: ');
    String address = stdin.readLineSync()!;
    print('please, Enter client phone: ');
    String phone = stdin.readLineSync()!;
    Client client = Client(name, address, phone);
    return client;
  }

  void createAccount() {
    Client client = getClientInformation();

    late BankAccount account;

    print('1- to Basic Bank Account');
    print('2- to Savings Bank Account');
    int accountType = int.parse(stdin.readLineSync()!);

    print('please, Enter basic Balance');
    double balance = double.parse(stdin.readLineSync()!);
    if (accountType == 1) {
      account = BankAccount(balance);
    } else {
      if (balance < 1000) {
        print('minimum balance is 1000');
        return;
      }
      account = SavingsBankAccount(balance);
    }
    account.owner = client;
    client.bankAccount = account;
    allAccounts.add(account);
    allClients.add(client);
    print('account created successfully');
  }

  void updateClientData() {
    print('please, Enter account id');
    int id = int.parse(stdin.readLineSync()!);
    BankAccount? account = getAccountById(id);
    if (account == null) {
      print('account not found');
      return;
    } else {
      print('press 1- to edit name');
      print('press 2- to edit address');
      print('press 3- to edit phone');
      int userInput = int.parse(stdin.readLineSync()!);
      switch (userInput) {
        case 1:
          {
            print('please, enter the new name');
            String name = stdin.readLineSync()!;
            account.owner.name = name;
            return;
          }
        case 2:
          {
            print('please, enter the new address');
            String address = stdin.readLineSync()!;
            account.owner.address = address;
            return;
          }
        case 3:
          {
            print('please, enter the new phone');
            String phone = stdin.readLineSync()!;
            account.owner.phone = phone;
            return;
          }
      }
    }
  }
}

void main() {
  BankingSystem system = BankingSystem();
  system.showMenu();
}
