package com.expense.controller;

import com.expense.dao.ExpenseDAO;
import com.expense.model.Expense;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@Controller
public class ExpenseController {

    @Autowired
    private ExpenseDAO expenseDAO;

    @GetMapping("/")
    public String index() {
        return "redirect:/add";
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("expense", new Expense());
        return "addExpense";
    }

    @PostMapping("/save")
    public String saveExpense(@ModelAttribute("expense") Expense expense) {
        // Auto-categorization logic
        if (expense.getCategory() == null || expense.getCategory().trim().isEmpty()) {
            String desc = expense.getDescription().toLowerCase();
            if (desc.contains("pizza") || desc.contains("burger") || desc.contains("food")) {
                expense.setCategory("Food");
            } else if (desc.contains("bus") || desc.contains("train") || desc.contains("fuel")) {
                expense.setCategory("Travel");
            } else if (desc.contains("movie") || desc.contains("game")) {
                expense.setCategory("Entertainment");
            } else {
                expense.setCategory("Other");
            }
        }
        
        if (expense.getDate() == null) {
            expense.setDate(LocalDate.now());
        }

        expenseDAO.saveExpense(expense);
        return "redirect:/view";
    }

    @GetMapping("/view")
    public String viewExpenses(Model model) {
        List<Expense> expenses = expenseDAO.getAllExpenses();
        model.addAttribute("expenses", expenses);
        return "viewExpenses";
    }

    @GetMapping("/delete/{id}")
    public String deleteExpense(@PathVariable("id") int id) {
        expenseDAO.deleteExpense(id);
        return "redirect:/view";
    }

    @GetMapping("/summary")
    public String showSummary(Model model) {
        LocalDate now = LocalDate.now();
        double monthlyTotal = expenseDAO.getMonthlyTotal(now.getMonthValue(), now.getYear());
        Map<String, Double> categoryTotals = expenseDAO.getCategoryWiseTotal();

        model.addAttribute("monthlyTotal", monthlyTotal);
        model.addAttribute("categoryTotals", categoryTotals);

        // Suggestions logic
        String generalSuggestion = "";
        if (monthlyTotal > 5000) {
            generalSuggestion = "Try reducing non-essential expenses.";
        }

        String foodSuggestion = "";
        Double foodTotal = categoryTotals.getOrDefault("Food", 0.0);
        if (foodTotal > 3000) {
            foodSuggestion = "Food spending is high this month.";
        }

        model.addAttribute("generalSuggestion", generalSuggestion);
        model.addAttribute("foodSuggestion", foodSuggestion);

        return "summary";
    }
}
