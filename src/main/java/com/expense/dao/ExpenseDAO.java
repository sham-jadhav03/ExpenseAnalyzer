package com.expense.dao;

import com.expense.model.Expense;
import java.util.List;
import java.util.Map;

public interface ExpenseDAO {
    void saveExpense(Expense expense);
    List<Expense> getAllExpenses();
    void deleteExpense(int id);
    double getMonthlyTotal(int month, int year);
    Map<String, Double> getCategoryWiseTotal();
}
