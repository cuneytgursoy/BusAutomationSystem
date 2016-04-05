using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer1;
using DataLayer1;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Configuration;


namespace SonBus
{
    public partial class admin : System.Web.UI.Page
    {

        database sp = new database();
        SqlConnection conn = new SqlConnection("Data Source=CUNEYTGURSOY-PC\\SQLEXPRESS;Initial Catalog=BuSystem;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {

        }
       
       
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

       

        protected void Link2_Click(object sender, EventArgs e)
        {

            SqlConnection conn; SqlCommand comm; SqlDataReader reader;
            string connectionString = ConfigurationManager.ConnectionStrings["csShipment"].ConnectionString;
            conn = new SqlConnection(connectionString);
            comm = new SqlCommand("exec selectPerson", conn);
            try
            { conn.Open(); reader = comm.ExecuteReader(); gr1.DataSource = reader; gr1.DataBind(); reader.Close(); }
            catch { Response.Write("Error"); }
            finally { conn.Close(); }
            
        }

        

        protected void lnkvoyage_Click(object sender, EventArgs e)
        {
            SqlConnection conn; SqlCommand comm; SqlDataReader reader;
            string connectionString = ConfigurationManager.ConnectionStrings["csShipment"].ConnectionString;
            conn = new SqlConnection(connectionString);
            comm = new SqlCommand("exec selectCity", conn);
            try
            { conn.Open(); reader = comm.ExecuteReader(); gr1.DataSource = reader; gr1.DataBind(); reader.Close(); }
            catch { Response.Write("Error"); }
            finally { conn.Close(); }
            

        }

        protected void lnkSaveVoyage_Click(object sender, EventArgs e)
        {
            conn.Open();

            //string sorgu = string.Format("exec ssssss "+ txtvoyage.Text );
            string sorgu = string.Format("insert into city (c_name) values ('{0}')", txtvoyage.Text);

            sp.NonQueryMethod(sorgu);

            conn.Close();

            txtvoyage.Text = "";

        }

    

        protected void LinkBudsadtton2_Click1(object sender, EventArgs e)
        {
            conn.Open();

            string sorgu = string.Format("exec ssss " + txtdel.Text );

            sp.NonQueryMethod(sorgu);

            conn.Close();

            txtdel.Text = "";

        }

        protected void ticlsam_Click(object sender, EventArgs e)
        {

            SqlConnection conn; SqlCommand comm; SqlDataReader reader;
            string connectionString = ConfigurationManager.ConnectionStrings["csShipment"].ConnectionString;
            conn = new SqlConnection(connectionString);
            comm = new SqlCommand("exec sssss", conn);
            try
            { conn.Open(); reader = comm.ExecuteReader(); gr1.DataSource = reader; gr1.DataBind(); reader.Close(); }
            catch { Response.Write("Error"); }
            finally { conn.Close(); }
            

        }

        protected void lnktic_Click(object sender, EventArgs e)
        {

            conn.Open();

            string sorgu = string.Format("exec sss " + txtticket.Text );

            sp.NonQueryMethod(sorgu);

            conn.Close();

            txtticket.Text = "";

        }

        protected void asdsa443_Click(object sender, EventArgs e)
        {


            SqlConnection conn; SqlCommand comm; SqlDataReader reader;// VIEEW KULLANIMIIIII
            string connectionString = ConfigurationManager.ConnectionStrings["csShipment"].ConnectionString;
            conn = new SqlConnection(connectionString);
            comm = new SqlCommand("exec vieww", conn);
           // comm = new SqlCommand("select * from wew", conn);
            try
            { conn.Open(); reader = comm.ExecuteReader(); gr1.DataSource = reader; gr1.DataBind(); reader.Close(); }
            catch { Response.Write("Error"); }
            finally { conn.Close(); }

        }

        protected void LinkButdasdsadton2_Click(object sender, EventArgs e)
        {

            SqlConnection conn; SqlCommand comm; SqlDataReader reader;
            string connectionString = ConfigurationManager.ConnectionStrings["csShipment"].ConnectionString;
            conn = new SqlConnection(connectionString);
            comm = new SqlCommand("exec ss "+txtsear.Text, conn);
            try
            { conn.Open(); reader = comm.ExecuteReader(); gr1.DataSource = reader; gr1.DataBind(); reader.Close(); }
            catch { Response.Write("Error"); }
            finally { conn.Close(); }

        }

    }
}