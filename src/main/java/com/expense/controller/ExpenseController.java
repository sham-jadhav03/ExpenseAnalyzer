package com.expense.controller;

import com.expense.dao.ExpenseDAO;
import com.expense.model.Expense;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class ExpenseController {

    @Autowired
    private ExpenseDAO expenseDAO;

    @GetMapping({"/", "/viewExpenses"})
    public String viewExpenses(Model model) {
        List<Expense> expenses = expenseDAO.getAllExpenses();
        model.addAttribute("expenses", expenses);
        return "viewExpenses";
    }

    @GetMapping("/addExpense")
    public String showAddForm(Model model) {
        model.addAttribute("expense", new Expense());
        return "addExpense";
    }

    @PostMapping("/saveExpense")
    public String saveExpense(@RequestParam("amount") double amount,
                            @RequestParam("category") String category,
                            @RequestParam("description") String description,
                            @RequestParam("date") String dateStr) {
        
        LocalDate date = LocalDate.parse(dateStr);
        Expense expense = new Expense(amount, category, description, date);
        expenseDAO.saveExpense(expense);
        return "redirect:/viewExpenses";
    }

    @GetMapping("/delete/{id}")
    public String deleteExpense(@PathVariable("id") int id) {
        expenseDAO.deleteExpense(id);
        return "redirect:/viewExpenses";
    }

    @GetMapping("/summary")
    public String showSummary(Model model) {
        double monthlyTotal = expenseDAO.getMonthlySummary();
        Map<String, Double> categorySummary = expenseDAO.getCategorySummary();
        
        List<String> suggestions = new ArrayList<>();
        if (monthlyTotal > 5000) {
            suggestions.add("Try reducing non-essential expenses.");
        }
        
        Double foodExpense = categorySummary.getOrDefault("Food", 0.0);
        if (foodExpense > 3000) {
            suggestions.add("Food spending is high this month.");
        }
        
        model.addAttribute("monthlyTotal", monthlyTotal);
        model.addAttribute("categorySummary", categorySummary);
        model.addAttribute("suggestions", suggestions);
        
        return "summary";
    }
}
