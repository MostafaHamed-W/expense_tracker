import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

enum Category { food, travel, leisure, work }

final formatter = DateFormat.yMd();

const categoryIcons = {
  Category.work: Icons.work,
  Category.food: Icons.lunch_dining,
  Category.leisure: Icons.movie,
  Category.travel: Icons.flight_takeoff,
};

class ExpenseModel {
  ExpenseModel({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String title;
  final double amount;
  final DateTime date;
  final String id;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}
