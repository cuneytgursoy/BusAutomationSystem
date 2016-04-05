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
    public partial class kayit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btncreate_Click(object sender, EventArgs e)
        {
            personRepos ps = new personRepos();
            person p = new person()
            {
                ID = txttc.Text,
                Name = txtname.Text,
                surname = txtsurname.Text,
                password = txtpassword.Text,
                gender = ddlGender.SelectedItem.Text,
                bdate = txtbdate.Text,
                phone = txtphone.Text,
                email = txtemail.Text


            };

            ps.Save(p);
            lblkayit.Text = "KAYIT BAŞARILI" + " : " + txtname.Text + " " + txtsurname.Text;


            txttc.Text = "";
            txtname.Text = "";
            txtsurname.Text = "";
            txtphone.Text = "";
            txtpassword.Text = "";
            txtbdate.Text = "";
            txtemail.Text = "";

            Response.Redirect("kayit1.aspx");



        }

        
    }
}