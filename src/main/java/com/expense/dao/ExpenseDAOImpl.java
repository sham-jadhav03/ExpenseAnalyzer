package com.expense.dao;

import com.expense.model.Expense;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
@Transactional
public class ExpenseDAOImpl implements ExpenseDAO {

    @Autowired
    private SessionFactory sessionFactory;

    protected Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public void saveExpense(Expense expense) {
        getSession().merge(expense);
    }

    @Override
    public List<Expense> getAllExpenses() {
        return getSession().createQuery("from Expense", Expense.class).list();
    }

    @Override
    public void deleteExpense(int id) {
        Expense expense = getSession().get(Expense.class, id);
        if (expense != null) {
            getSession().remove(expense);
        }
    }

    @Override
    public double getMonthlyTotal(int month, int year) {
        String hql = "select sum(e.amount) from Expense e where month(e.date) = :month and year(e.date) = :year";
        Query<Double> query = getSession().createQuery(hql, Double.class);
        query.setParameter("month", month);
        query.setParameter("year", year);
        Double result = query.uniqueResult();
        return result != null ? result : 0.0;
    }

    @Override
    public Map<String, Double> getCategoryWiseTotal() {
        String hql = "select e.category, sum(e.amount) from Expense e group by e.category";
        List<Object[]> results = getSession().createQuery(hql, Object[].class).list();
        Map<String, Double> categoryTotals = new HashMap<>();
        for (Object[] result : results) {
            categoryTotals.put((String) result[0], (Double) result[1]);
        }
        return categoryTotals;
    }
}
