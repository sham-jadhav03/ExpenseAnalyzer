package com.expense.dao;

import com.expense.model.Expense;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ExpenseDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Transactional
    public void saveExpense(Expense expense) {
        // Auto Categorization Logic
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
        sessionFactory.getCurrentSession().persist(expense);
    }

    @Transactional(readOnly = true)
    public List<Expense> getAllExpenses() {
        return sessionFactory.getCurrentSession().createQuery("from Expense", Expense.class).list();
    }

    @Transactional
    public void deleteExpense(int id) {
        Session session = sessionFactory.getCurrentSession();
        Expense expense = session.get(Expense.class, id);
        if (expense != null) {
            session.remove(expense);
        }
    }

    @Transactional(readOnly = true)
    public double getMonthlySummary() {
        LocalDate start = LocalDate.now().withDayOfMonth(1);
        LocalDate end = LocalDate.now().withDayOfMonth(LocalDate.now().lengthOfMonth());
        
        Session session = sessionFactory.getCurrentSession();
        Query<Double> query = session.createQuery(
            "select sum(amount) from Expense where date between :start and :end", Double.class);
        query.setParameter("start", start);
        query.setParameter("end", end);
        
        Double result = query.uniqueResult();
        return result != null ? result : 0.0;
    }

    @Transactional(readOnly = true)
    public Map<String, Double> getCategorySummary() {
        Session session = sessionFactory.getCurrentSession();
        Query<Object[]> query = session.createQuery(
            "select category, sum(amount) from Expense group by category", Object[].class);
        
        List<Object[]> results = query.list();
        Map<String, Double> summary = new HashMap<>();
        for (Object[] row : results) {
            summary.put((String) row[0], (Double) row[1]);
        }
        return summary;
    }
}
