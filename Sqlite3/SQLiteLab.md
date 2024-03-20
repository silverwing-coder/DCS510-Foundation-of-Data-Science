### SQLite DBMS : MG-245 Lab. Session

**_School of Arts and Science, Carolina University_**

---

#### 1. Download SQLite

> -   Download and extract SQLite on your machine's Operating System
>     -   Download [_SQLite_](https://www.sqlite.org/download.html)
>         -   Select Precompiled Binaries for YOUR*OS: *[Windows] sqlite-tools-win32-x86-3380200.zip\_
>         -   Extract the zip file in a folder\_
>         -   Execute _sqlite3.exe_\_
>     -   Download [_SQLiteStudio_](https://github.com/pawelsalawa/sqlitestudio/releases)
>         -   Select Precompiled Binaries for YOUR*OS: *[Windows] sqlitestudio-3.3.2.zip \_
>         -   Extract the zip file in a folder
>         -   Execute _SQLiteStudio.exe_

#### 2. Reference: SQLite shell & SQL commands

> -   Shell Commands:
>     -   .open _DataBaseNAME(\*.db)_: create or connect to a database(file)
>     -   .tables: list all the tables in the database
>     -   .exit: disconnect database and close sqlite shell
>     -   .help: display the dot-command(help) list
> -   SQL commands
>     -   CREATE TABLE table-name (primary-key-name INTEGER PRIMARY KEY, column-name type NOT NULL, ..., FOREIGN KEY (column-name) REFERENCES table-name(column-name));
>     -   ALTER TABLE table-name RENAME TO new-name;
>     -   ALTER TABLE table-name ADD COLULM column-definition;
>     -   ALTER TABLE table-name DROP COLULM column-name;
>     -   DROP TABLE table-name;
>     -   INSERT INTO table-name(column-name, ....) VALUES(....), (....), ....;
>     -   UPDATE table-name SET .... WHERE condition;
>     -   DELETE FROM table-name WHERE condition;
>     -   UPDATE table-name SET .... WHERE condition;
>     -   SELECT column-name, ... FROM table-name SET .... WHERE condition;

#### 3. SQLite References

> -   SQLite [Documentation](https://www.sqlite.org/docs.html)
> -   SQLite [Tutorial](https://www.sqlitetutorial.net/)

#### 4. SAMPLE Database

> -   **Entity Relationship Diagram(ERD)** ![SQLite](./sqlite-sample-db.jpg)
> -   **File:** [musicstore.db](./musicstore.db)

#### 5. Classroom Demo.

> -   .open mg245.db
> -   CREATE TABLE department (dept_id INTEGER PRIMARY KEY, dept_name VARCHAR(64) NOT NULL);
> -   .tables
> -   INSERT INTO department (dept_name) VALUES('Human Resources');
> -   SELECT \* FROM department;
> -   CREATE TABLE employee (emp_id INTEGER PRIMARY KEY, emp_name VARCHAR(64) NOT NULL, dept_id INTEGER NOT NULL,FOREIGN KEY (dept_id) REFERENCES department(dept_id));
> -   .tables
> -   INSERT INTO department (dept_name) VALUES ('Marketing');
> -   SELECT \* FROM department;
> -   INSERT INTO employee (emp_name, dept_id) VALUES ("samuel jackson", 1);
> -   SELECT \* FROM employee;
