using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Security.Cryptography;

namespace szyfrowanie
{
    public partial class Form1 : Form
    {
        public string par_serwer { get; private set; }          // nazwa instancji serwera SQL
        public string par_baza { get; private set; }            // nazwa bazy danych SQL
        public string par_user { get; private set; }            // nazwa użytkownika bazy SQL
        public string par_pass { get; private set; }            // hasło użytkownika bazy SQL
        public string connectionString { get; private set; }

        public int par_idfirmy { get; private set; }            // identyfikator firmy                  (FIRMA.ID_FIRMY)
        public int par_prac { get; private set; }               // identyfikator użytkownika            (UZYTKOWNIK.ID_UZYTKOWNIKA)
        public int par_kontekst { get; private set; }               // kod kontekstu           
        public DataTable dataTable { get; private set; }
        public List<Firma> firmaList { get; private set; }
        public string filename { get; set; }
        public string path { get; set; }
        public string finalPath { get; set; }
        public List<string> headers { get; set; }
        public Form1()
        {
            Boolean jestok = true;
            /*            try
                        {
                            String[] args = Environment.GetCommandLineArgs();

                            string[] args1 = args[1].Split(new string[] { "," }, StringSplitOptions.None);
                            string[] args2 = args[2].Split(new string[] { "," }, StringSplitOptions.None);

                            par_serwer = args1[0];
                            par_baza = args1[1];
                            par_user = args1[2];
                            par_pass = args1[3];

                            par_idfirmy = Convert.ToInt32(args2[0]);       // identyfikator użytkownika
                            par_prac = Convert.ToInt32(args2[1]);       // identyfikator użytkownika
                            par_kontekst = Convert.ToInt32(args2[1]);       // identyfikator użytkownika

                            connectionString = @"Data Source=" + par_serwer + ";" + @"Initial Catalog=" + par_baza + ";" + @"User Id=" + par_user + ";" + @"Password=" + par_pass + ";" + @"Connection Timeout=0;" + @"MultipleActiveResultSets = True";
                        }
                        catch(Exception e)
                        {
                            MessageBox.Show("Wystąpił problem z połączeniem z bazą danych SQL.\r\rProgram nie zostanie uruchomiony.");
                            jestok = false;
                        }*/

            par_serwer = "ADRIANA";
            par_baza = "WAPRO_DEMO";
            par_user = "sa";
            par_pass = "Wapro3000";
            connectionString = @"Data Source=" + par_serwer + ";" + @"Initial Catalog=" + par_baza + ";" + @"User Id=" + par_user + ";" + @"Password=" + par_pass + ";" + @"Connection Timeout=0;" + @"MultipleActiveResultSets = True";
            par_idfirmy = 1;
            par_prac = 3000001;
            par_kontekst = 120;
            if (jestok)
            {
                InitializeComponent();
            }
        }

        private void importBtn_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlcon = new SqlConnection(connectionString))
            {
                try
                {
                    sqlcon.Open();
                    SqlCommand sqlCmd = new SqlCommand("PGIT_READ_DATA", sqlcon);
                    sqlCmd.CommandTimeout = 0;
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.AddWithValue("@idfirmy", par_idfirmy);
                    sqlCmd.Parameters.AddWithValue("@idkontekstu", par_kontekst);
                    sqlCmd.Parameters.AddWithValue("@iduzytkownika", par_prac);
                    using (SqlDataAdapter da = new SqlDataAdapter(sqlCmd))
                    {
                        dataTable = new DataTable();
                        da.Fill(dataTable);
                    }
                    dgv.DataSource = dataTable;
                    headers = dataTable.Columns.Cast<DataColumn>().Select(x => x.ColumnName).ToList();
                    firmaList = new List<Firma>();
                    foreach(DataRow row in dataTable.Rows)
                    {
                        var firma = new Firma()
                        {
                            nip = row.ItemArray[0].ToString(),
                            nazwa = row.ItemArray[1].ToString(),
                            sprzedazNetto = Convert.ToDecimal(row.ItemArray[2]),
                            naleznoscBrutto = Convert.ToDecimal(row.ItemArray[3]),
                            zakupyBrutto = Convert.ToDecimal(row.ItemArray[4]),
                            zobowiazaniaBrutto = Convert.ToDecimal(row.ItemArray[5])
                        };
                        firmaList.Add(firma);
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(" błąd: " + ex);
                }
            }
        }
        private void createFile()
        {
            var sb = new StringBuilder();
            finalPath = path + filename + ".csv";
            var header = "";
            var info = typeof(Firma).GetProperties();
            if (!File.Exists(finalPath))
            {
                var file = File.Create(finalPath);
                file.Close();

/*                TextWriter sw = new StreamWriter(finalPath, true, Encoding.UTF8);
                sw.Write(sb.ToString());
                sw.Close();*/
            }
            foreach (var prop in headers)
            {
                header += prop + ";";
            }
            header = header.Substring(0, header.Length - 1);
            sb.AppendLine(header);
            File.WriteAllText(finalPath, sb.ToString(), Encoding.UTF8);
            foreach (var obj in firmaList)
            {
                sb = new StringBuilder();
                var line = "";
                foreach (var prop in info)
                {
                    line += prop.GetValue(obj, null) + ";";
                }
                line = line.Substring(0, line.Length - 1);
                sb.AppendLine(line);
                File.AppendAllText(finalPath, sb.ToString(), Encoding.UTF8);
                /*                TextWriter sw = new StreamWriter(finalPath, true, Encoding.UTF8);
                                sw.Write(sb.ToString());
                                sw.Close();*/
            }
        }

        private void csvBtn_Click(object sender, EventArgs e)
        {
            path = String.Empty;
            DateTime dateTime = DateTime.Now;
            filename = "\\RiskRadarData_" + dateTime.ToString("dd/MM/yyyy") + "-" + dateTime.ToString("HH");
            using (var fbd = new FolderBrowserDialog())
            {
                DialogResult result = fbd.ShowDialog();

                if (result == DialogResult.OK && !string.IsNullOrWhiteSpace(fbd.SelectedPath))
                {
                    path = fbd.SelectedPath;
                    try
                    {
                        createFile();
                    }
                    catch(Exception ex)
                    {
                        MessageBox.Show("Błąd: " + ex.Message);
                    }
                    finally
                    {
                        MessageBox.Show("Zapisano plik o nazwie: " + filename.Substring(1, filename.Length - 1) + " w wybranej lokalizacji");
                    }
                }
            }

            
        }

    }
}
