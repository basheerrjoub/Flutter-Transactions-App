import 'package:flutter/material.dart';
import '../models/Transaction.dart';

List<Transaction> transactions = [
  Transaction(1, "Buy ticket", 4.99, DateTime.now()),
  Transaction(2, "Buy Milk", 9.99, DateTime.now()),
  Transaction(3, "Register ChatGPT", 20.0, DateTime.now()),
  Transaction(4, "Buy Bread", 1.99, DateTime.now().subtract(Duration(days: 4))),
  Transaction(5, "Buy Humus", 4.99, DateTime.now().subtract(Duration(days: 3))),
  Transaction(
      6, "Pay Rent", 1200.00, DateTime.now().subtract(Duration(days: 10))),
  Transaction(
      7, "Grocery Shopping", 50.00, DateTime.now().subtract(Duration(days: 2))),
  Transaction(
      8, "Buy New Phone", 699.00, DateTime.now().subtract(Duration(days: 14))),
  Transaction(9, "Dine Out", 35.00, DateTime.now().subtract(Duration(days: 6))),
  Transaction(
      10, "Buy Gasoline", 30.00, DateTime.now().subtract(Duration(days: 5))),
  Transaction(
      11, "Buy Stationery", 15.00, DateTime.now().subtract(Duration(days: 1))),
  Transaction(12, "Online Shopping", 100.00,
      DateTime.now().subtract(Duration(days: 7))),
  Transaction(13, "Purchase Movie Tickets", 25.00,
      DateTime.now().subtract(Duration(days: 3))),
  Transaction(14, "Donate to Charity", 50.00,
      DateTime.now().subtract(Duration(days: 1))),
  Transaction(
      15, "Buy Groceries", 70.00, DateTime.now().subtract(Duration(days: 3))),
  Transaction(
      16, "Buy Clothing", 150.00, DateTime.now().subtract(Duration(days: 8))),
  Transaction(
      17, "Buy Jewelry", 500.00, DateTime.now().subtract(Duration(days: 14))),
  Transaction(18, "Pay for Gym Membership", 50.00,
      DateTime.now().subtract(Duration(days: 9))),
  Transaction(19, "Buy Concert Tickets", 100.00,
      DateTime.now().subtract(Duration(days: 2))),
  Transaction(
      20, "Pay for Parking", 10.00, DateTime.now().subtract(Duration(days: 1))),
];
