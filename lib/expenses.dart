import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widgets/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<ExpenseModel> _registeredExpenses = [
    ExpenseModel(title: 'travel', amount: 200, date: DateTime.now(), category: Category.travel),
    ExpenseModel(title: 'food', amount: 50, date: DateTime.now(), category: Category.food),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (context) => NewExpense(
        addExpense: _addExpense,
      ),
    );
  }

  void _addExpense(ExpenseModel expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expanse Tracker'),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Card(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 60),
                child: Center(child: Text('Chart')),
              ),
            ),
          ),
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses),
          ),
        ],
      ),
    );
  }
}
