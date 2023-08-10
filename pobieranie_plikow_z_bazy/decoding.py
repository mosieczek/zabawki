import pyodbc

# Połącz się z bazą danych SQL Server
connection_string = "DRIVER={ODBC Driver 17 for SQL Server};SERVER=ip;DATABASE=db123;UID=sa;PWD=xx123;"
conn = pyodbc.connect(connection_string)

# Zdefiniuj zapytanie, które pobiera dane typu image z tabeli
query = "select RPT from raport_blob where ID_RAPORTU = 10039"

# Wykonaj zapytanie i pobierz dane
cursor = conn.cursor()
cursor.execute(query)
result = cursor.fetchone()

# Zapisz dane do pliku
if result:
    image_data = result[0]
    with open("C:\\Users\\Adriana\\Documents\\aplikacje\\pobieranie_plikow_z_bazy\\test3.rpt", "wb") as f:
        f.write(image_data)


cursor.close()
conn.close()
