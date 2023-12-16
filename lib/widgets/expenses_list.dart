import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });
  final void Function(Expense) onRemoveExpense;
  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        background: Container(
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.error.withOpacity(0.7),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                'Delete',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        key: ValueKey(expenses[index]),
        child: ExpensesListItem(
          expense: expenses[index],
        ),
      ),
    );
  }
}
