using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;

namespace biblio_ksiegarnia2
{
    public partial class Form1 : Form
    {
        public string databaseName = string.Empty;
        public string serverName = string.Empty;
        public string userName = string.Empty;
        public string userPass = string.Empty;
        public string connectionString = string.Empty;
        public Form1()
        {
            InitializeComponent();
        }

        private void loginBtn_Click(object sender, EventArgs e)
        {
            if(string.IsNullOrEmpty(serverName) || string.IsNullOrEmpty(databaseName) || string.IsNullOrEmpty(userPass) || string.IsNullOrEmpty(userName))
            {
                MessageBox.Show("Proszę uzupełnić wszystkie pola", "Błąd", MessageBoxButtons.OK);
            }
            else
            {
                try
                {
                    connectionString = connectionString = $"Server={serverName};Database={databaseName};User Id={userName};Password={userPass};";
                    using (SqlConnection sqlCon = new SqlConnection(connectionString))
                    {
                        try
                        {
                            sqlCon.Open();

                            MessageBox.Show("Zalogowano.");

                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show("Błąd podczas łączenia z bazą danych: " + ex.Message);
                        }

                    }

                }
                catch (Exception ex)
                {
                    MessageBox.Show("Proszę uzupełnić wszystkie pola" + ex.Message, "Błąd", MessageBoxButtons.OK);

                }
            }
        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {
            serverName = textBox3.Text;
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            databaseName = textBox1.Text;
        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {
            userName = textBox4.Text;
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {
            userPass = textBox2.Text;
        }
    }
}
