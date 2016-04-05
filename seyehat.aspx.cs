using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.ClientServices;
using BusinessLayer1;
using DataLayer1;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Configuration;
using System.Drawing;
namespace SonBus
{
    public partial class seyehat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet data = database.SelectCommand("exec selectCity");
            if (data.Tables[0].Rows.Count == 0)
            {
                
            }
            else
            {
                List<city> cities = new List<city>();
                foreach (DataRow city in data.Tables[0].Rows)
                {
                    cities.Add(new city { id = Convert.ToInt32(city[0]), name = city[1].ToString() });
                }
               
            }

            object tctc = Session["user"];
            SqlConnection conn; SqlCommand comm; SqlDataReader reader;
            string connectionString = ConfigurationManager.ConnectionStrings["csShipment"].ConnectionString;
            conn = new SqlConnection(connectionString);
            comm = new SqlCommand("exec selectTicket15 "+tctc.ToString(), conn);
            try
            { conn.Open(); reader = comm.ExecuteReader(); grr.DataSource = reader; grr.DataBind(); reader.Close(); }
            catch { Response.Write("Error"); }
            finally { conn.Close(); }
            
           
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
            Session["user"]=null;
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("nerden.aspx");
        }

        protected void grr_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

       

        
    }
}