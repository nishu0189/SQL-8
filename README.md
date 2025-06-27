# SQL-8

# 📘 SQL Practice: Views, Foreign Keys, Cross-DB Access, and Identity

This SQL script covers essential relational database concepts such as **Views**, **Cross-Database Queries**, **Foreign Key Constraints**, and **Identity Columns**. These are foundational for real-world SQL usage and database design.

---
## Table of Contents

1. [Views (Virtual Tables)](#1-views)
2. [Cross-Database Access](#2-cross-database-access)
3. [Foreign Key & Reference Constraints](#3-foreign-key--reference-constraint)
4. [Identity Columns](#4-identity-columns)

---

## 1. 🪟 Views

**Purpose**: A **View** is a virtual table that is the result of a stored query. It does not store data itself.

### ✅ Benefits of Using Views
- **Simplified Access**: Users can query a view like a table without knowing the complex SQL behind it.
- **Reusability**: Reuse complex queries by encapsulating them inside views.
- **Abstraction**: Users only see the output, not the underlying logic or joins.
## 2. Cross-Database Access
SELECT * FROM database_name.schema_name.table_name;

## 3. What Is a FOREIGN KEY?
A foreign key is a column (or columns) in one table that points to the primary key in another table.

🎯 Purpose:
To make sure the value in one table must exist in another table. This helps keep your data accurate and connected — this is called referential integrity.

###  What Will SQL Allow?

| Action                            | Allowed? | Why?                                   |
| --------------------------------- | -------- | -------------------------------------- |
| Insert emp with valid `dept_id`   | ✅        | That `dept_id` exists in dept2         |
| Insert emp with `dept_id = 900`   | ❌        | No such `dept_id` in dept2             |
| Insert emp with `dept_id = NULL`  | ✅        | Null is allowed (means unknown)        |
| Delete `dept_id = 200` from dept2 | ❌        | Cannot delete, it's still used in emp2 |

## 4. Identity Columns
Purpose: Automatically generate unique incremental values (usually for primary keys).
