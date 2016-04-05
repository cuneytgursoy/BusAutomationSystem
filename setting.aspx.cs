using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLayer1;
using BusinessLayer1;
using System.Threading;


namespace SonBus
{
    public partial class setting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btndel_Click(object sender, EventArgs e)
        {
            personRepos ps = new personRepos();

            person p = new person()
            {
                ID = txttcre.Text,
                password = txtpassre.Text

            };

            txttcre.Text = "";
            txtpassre.Text = "";


            ps.Delete(p);
            Response.Redirect("Default.aspx");
        }

        protected void BTNP_Click(object sender, EventArgs e)
        {

           
            personRepos ps = new personRepos();

            person p = new person()
            {

                ID = txttcup.Text,
                password = txtpassup.Text,
                newpassword = txtnewpas.Text

            };
            ps.Update(p);

            txttcup.Text = "";
            txtpassup.Text = "";
            txtnewpas.Text = "";

            Response.Redirect("Default.aspx");
        }

        

        protected void plk_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");

        }

        protected void lkk_Click(object sender, EventArgs e)
        {
            Response.Redirect("nerden.aspx");
            Session["user"] = null;// session log out dediğimizde null yapmamız gerekir
        }

        
    }
}