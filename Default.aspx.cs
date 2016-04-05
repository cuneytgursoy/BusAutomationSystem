using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLayer1;
using BusinessLayer1;
using System.Threading;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;

namespace SonBus
{
    public partial class _Default : System.Web.UI.Page
    {

      

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        
       
        
      
        


        protected void btnal_Click(object sender, EventArgs e)
        {
            if (true) { Response.Redirect("nerden.aspx"); }
        }

        protected void btnlog_Click(object sender, EventArgs e)
        {
          
            personRepos pr = new personRepos();
            SqlConnection conn = new SqlConnection("Data Source=CUNEYTGURSOY-PC\\SQLEXPRESS;Initial Catalog=BuSystem;Integrated Security=True");
            conn.Open();
            string yTC = txttc1.Text;
            string ypassword = txtpassword1.Text;
            SqlCommand cmd = new SqlCommand("select P_id,P_password from person where P_id='" + yTC + "' and P_password= '" + ypassword + "'", conn);

            SqlDataReader oku = cmd.ExecuteReader();

            if (oku.Read())
            {
                Session.Add("user", yTC);

                if (yTC == "admin") { Response.Redirect("admin.aspx"); } else { Response.Redirect("nerden.aspx"); }
               

            }
            else { bilgi.Text = "başarısız"; }

            conn.Close(); conn.Dispose();

        }

        protected void LinkButton455_Click(object sender, EventArgs e)
        {
            Response.Redirect("kayit.aspx");

        }
    }
}