import tkinter as tk
from tkinter import messagebox, ttk
import mysql.connector

# ---------------- Database Connection ---------------- #
def connect_db():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="",   # put your MySQL password if set
        database="traffic_violation"
    )

# ---------------- Colors ---------------- #
DARK = "#17252A"
TEAL = "#2B7A78"
LIGHT_TEAL = "#3AAFA9"
LIGHT_CYAN = "#DEF2F1"
WHITE = "#FEFFFF"

# ---------------- Management Page ---------------- #
def management_page():
    root = tk.Tk()
    root.title("Traffic Violations Management")
    root.state("zoomed")  # Full screen

    # --- Header --- #
    header = tk.Frame(root, bg=TEAL, height=60)
    header.pack(side="top", fill="x")
    tk.Label(header, text="Traffic Violations Management", bg=TEAL, fg=WHITE,
             font=("Arial", 18, "bold")).pack(side="left", padx=20)

    # --- Search --- #
    search_frame = tk.Frame(root, bg=WHITE, pady=10)
    search_frame.pack(fill="x")
    tk.Label(search_frame, text="Search (Plate / Driver / Charge):", bg=WHITE, fg=DARK, font=("Arial", 12)).pack(side="left", padx=10)

    search_entry = tk.Entry(search_frame, bg=LIGHT_CYAN, fg=DARK, font=("Arial", 12))
    search_entry.pack(side="left", padx=5, ipadx=30, ipady=3)

    def search_records():
        for row in tree.get_children():
            tree.delete(row)
        db = connect_db()
        cursor = db.cursor()
        query = """SELECT * FROM traffic_violations 
                   WHERE PlateNumber LIKE %s OR DriverName LIKE %s OR Description LIKE %s"""
        value = f"%{search_entry.get()}%"
        cursor.execute(query, (value, value, value))
        rows = cursor.fetchall()
        for r in rows:
            tree.insert("", "end", values=r)
        db.close()

    def clear_search():
        search_entry.delete(0, tk.END)
        load_data()

    tk.Button(search_frame, text="Search", bg=LIGHT_TEAL, fg=WHITE, font=("Arial", 11),
              command=search_records).pack(side="left", padx=5)
    tk.Button(search_frame, text="Clear", bg=DARK, fg=WHITE, font=("Arial", 11),
              command=clear_search).pack(side="left", padx=5)

    # --- Table with 25 columns --- #
    columns = ("id","PlateNumber","DriverName","Description","Belts","Personal_Injury","Property_Damage",
               "Commercial_License","Commercial_Vehicle","State","VehicleType","Year","Make","Model","Color",
               "Charge","PenaltyAmount","Contributed_To_Accident","Race","Gender","Driver_City","Driver_State",
               "DL_State","Arrest_Type","Violation_Type")

    frame_table = tk.Frame(root)
    frame_table.pack(fill="both", expand=True, padx=10, pady=10)

    x_scroll = tk.Scrollbar(frame_table, orient="horizontal")
    x_scroll.pack(side="bottom", fill="x")
    y_scroll = tk.Scrollbar(frame_table, orient="vertical")
    y_scroll.pack(side="right", fill="y")

    tree = ttk.Treeview(frame_table, columns=columns, show="headings",
                        xscrollcommand=x_scroll.set, yscrollcommand=y_scroll.set)
    for col in columns:
        tree.heading(col, text=col)
        tree.column(col, width=150, anchor="center")
    tree.pack(fill="both", expand=True)

    x_scroll.config(command=tree.xview)
    y_scroll.config(command=tree.yview)

    # --- CRUD Functions --- #
    def add_record():
        def save_new():
            db = connect_db()
            cursor = db.cursor()
            query = """INSERT INTO traffic_violations 
            (PlateNumber, DriverName, Description, Belts, Personal_Injury, Property_Damage, 
            Commercial_License, Commercial_Vehicle, State, VehicleType, Year, Make, Model, Color, 
            Charge, PenaltyAmount, Contributed_To_Accident, Race, Gender, Driver_City, Driver_State, 
            DL_State, Arrest_Type, Violation_Type)
            VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"""
            values = tuple(ent.get() for ent in entries)
            cursor.execute(query, values)
            db.commit()
            db.close()
            add_win.destroy()
            load_data()

        add_win = tk.Toplevel(root)
        add_win.title("Add Record")
        labels = columns[1:]  # skip id
        entries = []
        for i, label in enumerate(labels):
            tk.Label(add_win, text=label).grid(row=i, column=0, padx=10, pady=5, sticky="w")
            ent = tk.Entry(add_win, width=40)
            ent.grid(row=i, column=1, padx=10, pady=5)
            entries.append(ent)
        tk.Button(add_win, text="Save", command=save_new).grid(row=len(labels), column=0, columnspan=2, pady=10)

    def edit_record():
        selected = tree.focus()
        if not selected:
            messagebox.showerror("Error", "Select a record to edit")
            return
        values = tree.item(selected, "values")

        def save_edit():
            db = connect_db()
            cursor = db.cursor()
            query = """UPDATE traffic_violations SET PlateNumber=%s, DriverName=%s, Description=%s, Belts=%s,
            Personal_Injury=%s, Property_Damage=%s, Commercial_License=%s, Commercial_Vehicle=%s,
            State=%s, VehicleType=%s, Year=%s, Make=%s, Model=%s, Color=%s, Charge=%s, PenaltyAmount=%s,
            Contributed_To_Accident=%s, Race=%s, Gender=%s, Driver_City=%s, Driver_State=%s, DL_State=%s,
            Arrest_Type=%s, Violation_Type=%s WHERE id=%s"""
            vals = tuple(ent.get() for ent in entries) + (values[0],)
            cursor.execute(query, vals)
            db.commit()
            db.close()
            edit_win.destroy()
            load_data()

        edit_win = tk.Toplevel(root)
        edit_win.title("Edit Record")
        labels = columns[1:]
        entries = []
        for i, label in enumerate(labels):
            tk.Label(edit_win, text=label).grid(row=i, column=0, padx=10, pady=5, sticky="w")
            ent = tk.Entry(edit_win, width=40)
            ent.grid(row=i, column=1, padx=10, pady=5)
            ent.insert(0, values[i+1])
            entries.append(ent)
        tk.Button(edit_win, text="Save", command=save_edit).grid(row=len(labels), column=0, columnspan=2, pady=10)

    def delete_record():
        selected = tree.focus()
        if not selected:
            messagebox.showerror("Error", "Select a record to delete")
            return
        values = tree.item(selected, "values")
        confirm = messagebox.askyesno("Confirm", "Delete this record?")
        if confirm:
            db = connect_db()
            cursor = db.cursor()
            cursor.execute("DELETE FROM traffic_violations WHERE id=%s", (values[0],))
            db.commit()
            db.close()
            load_data()

    # --- Buttons --- #
    btn_frame = tk.Frame(root, bg=WHITE, pady=10)
    btn_frame.pack(fill="x")

    tk.Button(btn_frame, text="Add", bg=LIGHT_TEAL, fg=WHITE, font=("Arial", 12), width=10,
              command=add_record).pack(side="left", padx=10)
    tk.Button(btn_frame, text="Edit", bg=LIGHT_TEAL, fg=WHITE, font=("Arial", 12), width=10,
              command=edit_record).pack(side="left", padx=10)
    tk.Button(btn_frame, text="Delete", bg=LIGHT_TEAL, fg=WHITE, font=("Arial", 12), width=10,
              command=delete_record).pack(side="left", padx=10)
    tk.Button(btn_frame, text="Refresh", bg=LIGHT_TEAL, fg=WHITE, font=("Arial", 12), width=10,
              command=lambda: load_data()).pack(side="left", padx=10)
    tk.Button(btn_frame, text="Logout", bg=DARK, fg=WHITE, font=("Arial", 12), width=10,
              command=lambda: [root.destroy(), login_page()]).pack(side="right", padx=10)

    # --- Load Data --- #
    def load_data():
        for row in tree.get_children():
            tree.delete(row)
        db = connect_db()
        cursor = db.cursor()
        cursor.execute("SELECT * FROM traffic_violations")
        rows = cursor.fetchall()
        for r in rows:
            tree.insert("", "end", values=r)
        db.close()

    load_data()
    root.mainloop()

# ---------------- Login Page ---------------- #
def login_page():
    login = tk.Tk()
    login.title("Login - Traffic Violation System")
    login.state("zoomed")  

    # Left Panel
    left_frame = tk.Frame(login, bg=TEAL, width=400)
    left_frame.pack(side="left", fill="y")

    logo_frame = tk.Frame(left_frame, bg=TEAL)
    logo_frame.place(relx=0.5, rely=0.5, anchor="center")

    canvas = tk.Canvas(logo_frame, width=100, height=220, bg=TEAL, highlightthickness=0)
    canvas.pack()
    canvas.create_rectangle(40, 20, 70, 220, fill=DARK, outline="")
    canvas.create_oval(30, 30, 80, 80, fill="red")
    canvas.create_oval(30, 100, 80, 150, fill="yellow")
    canvas.create_oval(30, 170, 80, 220, fill="green")

    tk.Label(logo_frame, text="Traffic Violation\nSystem", 
             bg=TEAL, fg=WHITE, font=("Arial", 20, "bold")).pack(pady=10)

    # Right Panel
    right_frame = tk.Frame(login, bg=WHITE)
    right_frame.pack(side="right", expand=True, fill="both")

    tk.Label(right_frame, text="Login", bg=WHITE, fg=DARK, font=("Arial", 24, "bold")).pack(pady=40)

    tk.Label(right_frame, text="Username", bg=WHITE, fg=DARK, font=("Arial", 14)).pack(pady=10)
    username_entry = tk.Entry(right_frame, bg=LIGHT_CYAN, fg=DARK, font=("Arial", 14))
    username_entry.pack(pady=10, ipadx=30, ipady=8)

    tk.Label(right_frame, text="Password", bg=WHITE, fg=DARK, font=("Arial", 14)).pack(pady=10)
    password_entry = tk.Entry(right_frame, bg=LIGHT_CYAN, fg=DARK, show="*", font=("Arial", 14))
    password_entry.pack(pady=10, ipadx=30, ipady=8)

    def check_login():
        if username_entry.get() == "admin" and password_entry.get() == "admin123":
            login.destroy()
            management_page()
        else:
            messagebox.showerror("Error", "Invalid Username or Password")

    tk.Button(right_frame, text="Login", bg=LIGHT_TEAL, fg=WHITE, font=("Arial", 14, "bold"),
              command=check_login).pack(pady=40, ipadx=20, ipady=10)

    login.mainloop()

# ---------------- Start App ---------------- #
login_page()
