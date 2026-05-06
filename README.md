# 💸 Personal Expense Analyzer

A premium, modern web application for tracking daily expenses, built with **Spring Boot 3**, **Hibernate 6**, and **JSP**. This application helps users gain control over their finances with intelligent insights and a sleek dark-themed interface.

## 🚀 Overview
The **Personal Expense Analyzer** provides a sophisticated platform to record transactions, visualize spending history, and receive smart financial suggestions. It features auto-categorization and a responsive dashboard inspired by modern design aesthetics.

---

## 🛠 Features
- **✨ Seamless Add Expense**: Quick entry for amount, category, description, and date.
- **🏷 Smart Auto-Categorization**: Intelligently assigns categories based on keywords (e.g., "pizza" -> **Food**, "fuel" -> **Travel**).
- **📋 Detailed History**: A clean, tabular view of all transactions with real-time management.
- **📊 Financial Insights**:
    - Real-time monthly total calculation.
    - Category-wise spending breakdown.
    - Intelligent saving suggestions based on monthly spending thresholds.
- **🎨 Premium UI**: A modern, dark-themed interface using glassmorphism, smooth transitions, and responsive grid layouts.

---

## 📸 Screenshots

| Add Expense | View History | Financial Summary |
| :---: | :---: | :---: |
| ![Add Expense](./screenshots/add_expense.png) | ![View History](./screenshots/view_expenses.png) | ![Summary](./screenshots/summary.png) |

---

## 🛣 API Endpoints

Managed by `ExpenseController`:

| Method | Endpoint | Description |
| :--- | :--- | :--- |
| `GET` | `/` | Home page (Redirects to `/add`) |
| `GET` | `/add` | Form to enter a new expense |
| `POST` | `/save` | Saves expense with auto-categorization logic |
| `GET` | `/view` | Tabular list of all recorded expenses |
| `GET` | `/delete/{id}` | Deletes an expense by its unique ID |
| `GET` | `/summary` | Monthly totals, category breakdown, and tips |

---

## 💻 Tech Stack
- **Backend**: Java 17, Spring Boot 3.2.5, Spring Data JPA.
- **ORM**: Hibernate 6.
- **Frontend**: JSP (Jakarta EE), HTML5, Vanilla CSS3.
- **Database**: MySQL 8.0+.
- **Build Tool**: Maven.

---

## ⚙️ Installation & Setup

### 1. Prerequisites
- **JDK 17** or higher
- **Maven 3.8+**
- **MySQL 8.0**

### 2. Database Setup
Create a database named `expense_db` in MySQL:
```sql
CREATE DATABASE expense_db;
```
The application uses `spring.jpa.hibernate.ddl-auto=update`, so tables will be created automatically on the first run.

### 3. Configuration
Update your database credentials in `src/main/resources/application.properties`:
```properties
spring.datasource.username=your_username
spring.datasource.password=your_password
```

### 4. Run the Application
Navigate to the project root and execute:
```bash
mvn spring-boot:run
```
The application will be available at `http://localhost:8080`.

---

## 📂 Project Structure
```text
PersonalExpenseAnalyzer/
├── src/main/java/com/expense/
│   ├── Main.java         # Spring Boot Entry Point
│   ├── config/           # View & Resource configurations
│   ├── controller/       # Web controllers
│   ├── dao/              # Data Access Objects (JPA/Hibernate)
│   └── model/            # Entity models
├── src/main/resources/
│   └── application.properties # Core application settings
├── src/main/webapp/
│   ├── WEB-INF/views/    # JSP templates
│   └── static/css/       # Custom stylesheets
├── screenshots/          # UI Previews
├── db/                   # Reference SQL scripts
└── pom.xml               # Maven dependencies
```

---

## 📜 License
Developed for personal financial tracking and modern web architecture demonstration.
