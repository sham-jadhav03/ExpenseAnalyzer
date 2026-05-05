<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Expense - Personal Expense Analyzer</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/lucide@latest"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">
</head>
<body>
    <aside class="sidebar">
        <a href="${pageContext.request.contextPath}/add" class="sidebar-brand">
            <i data-lucide="zap" style="fill: var(--primary);"></i>
            Expensify
        </a>
        <nav class="sidebar-nav">
            <a href="${pageContext.request.contextPath}/add" class="sidebar-link active">
                <i data-lucide="layout-dashboard"></i> Dashboard
            </a>
            <a href="${pageContext.request.contextPath}/view" class="sidebar-link">
                <i data-lucide="layers"></i> History
            </a>
            <a href="${pageContext.request.contextPath}/summary" class="sidebar-link">
                <i data-lucide="bar-chart-2"></i> Analytics
            </a>
            <a href="#" class="sidebar-link">
                <i data-lucide="settings"></i> Settings
            </a>
        </nav>
    </aside>

    <main class="main-wrapper">
        <header class="top-bar">
            <div class="user-profile">
                <span style="color: var(--text-muted); font-size: 0.9rem; margin-right: 8px;">Notifications</span>
                <i data-lucide="bell" style="width: 20px; color: var(--text-muted); margin-right: 24px;"></i>
                <span>Sarah J.</span>
                <div class="user-avatar"></div>
            </div>
        </header>

        <section class="glass-panel" style="max-width: 800px; margin: 0 auto; width: 100%;">
            <h1 style="text-align: center; margin-bottom: 8px;">Add New Expense</h1>
            <p style="text-align: center; color: var(--text-muted); margin-bottom: 48px;">Track and manage your recent expenditures</p>
            
            <form:form action="${pageContext.request.contextPath}/save" method="post" modelAttribute="expense">
                <div class="form-grid">
                    <div class="form-group" style="grid-column: span 2;">
                        <label class="label">Amount (₹)</label>
                        <form:input path="amount" type="number" step="0.01" required="true" class="input-field" placeholder="0.00" />
                    </div>
                    
                    <div class="form-group">
                        <label class="label">Date</label>
                        <form:input path="date" type="date" required="true" class="input-field" />
                    </div>
                    
                    <div class="form-group">
                        <label class="label">Category</label>
                        <form:input path="category" class="input-field" placeholder="e.g. Food, Travel, etc." />
                    </div>
                    
                    <div class="form-group" style="grid-column: span 2;">
                        <label class="label">Description</label>
                        <form:input path="description" required="true" class="input-field" placeholder="What did you spend on?" />
                    </div>
                </div>
                
                <div style="margin-top: 40px;">
                    <button type="submit" class="btn btn-primary" style="width: 100%; justify-content: center; padding: 18px;">
                        Save Expense Record
                    </button>
                </div>
            </form:form>
        </section>
    </main>

    <script>
        lucide.createIcons();
    </script>
</body>
</html>
