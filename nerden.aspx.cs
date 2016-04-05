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
    public partial class nerden : System.Web.UI.Page
    {

        public int zc = 0;
        public int zcc = 0;
        public int zccc = 0;
        Boolean flag11 = false;
        List<Seat> sList = new List<Seat>();
        public string [] stringList = new string[55];
        public string[] stringList1 = new string[55];
        public string[] stringList2 = new string[55];
        List<Seat> s1List = new List<Seat>();
        List<Seat> s2List = new List<Seat>();
        List<Seat> s7List = new List<Seat>();
        List<Seat> s99List = new List<Seat>();
        List<Seat> s999List = new List<Seat>();
        List<Seat> s9List = new List<Seat>();
        List<Seat> s19List = new List<Seat>();
        List<ticket> s10List = new List<ticket>();
        List<ticket> s20List = new List<ticket>();
        Boolean flag2 = true;
        List<Button> b1 = new List<Button>();
        List<Button> b2 = new List<Button>();
        Button b = new Button();
        Boolean flag = true;
        personRepos pr = new personRepos();
        database sp = new database();      
        SqlConnection conn = new SqlConnection("Data Source=CUNEYTGURSOY-PC\\SQLEXPRESS;Initial Catalog=BuSystem;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            lblsend.Text = "";// mesaj yerini boşalttık iyide oldu request trigger için :)
            lblbuy.Text = "";
           
            if (!Page.IsPostBack)
            {
                List<city> cities = cityRespos.GetCities2();
                foreach (city city in cities)
                {
                    Dr1.Items.Add(new ListItem { Text = city.name, Value = city.id.ToString() });
                }

                List<date> dates = dateRepos.GetDates2();
                foreach (date date in dates)
                {
                   DrDate.Items.Add(new ListItem { Text = date.date_name, Value = date.date_id.ToString() });
                }

            }
            if (Session["user"] != null)
            {
                lbl100.Text = "Welcome " + Session["user"];
            }
            else { Response.Redirect("Default.aspx"); }


            int z = 0;

            for (int i = 1; i <= 10; i++)
            {
                for (int j = 1; j <= 4; j++)
                {
                    z++;

                    b = new Button();
                    b.BackColor = System.Drawing.Color.YellowGreen;
                    b.ID = "Btn" + z.ToString();
                    b.Text = z.ToString();
                    b.Height = 40;
                    b.Width = 40;
                    b.ToolTip = "Empty";
                    this.b.Click += new EventHandler(this.b_Click);
                    b1.Add(b);
                    pnl1.Controls.Add(b);

                }

            }
            boya();
        }

        private void b_Click(object Sender, EventArgs e)
        {
            if (dr4.Text == "AddSeat")
            {
                flag = true;
                lbl3.Text = "";
                object tctc = Session["user"];
                Button b = Sender as Button;
                Label2.Text = b.Text;

               // DataTable dt = sp.ExecuteMethod("select * from seat ", false);
                DataTable dt = sp.ExecuteMethod("exec selectSeat", false);

                foreach (DataRow item in dt.Rows)
                {
                    Seat s = new Seat()
                    {
                        id = item["seat_id"].ToString(),
                        tc = item["seat_tc"].ToString(),
                        gender = item["seat_gender"].ToString(),
                        date_id = item["date_id"].ToString(),
                        city_id = item["cityid"].ToString()

                    };
                    s1List.Add(s);
                }

                for (int i = 0; i < s1List.Count(); i++)
                {
                    if (s1List[i].id == b.Text && s1List[i].date_id == DrDate.Text && s1List[i].city_id == (Dr1.SelectedIndex + 1).ToString())
                    {
                        flag = false;
                        lbl3.Text = "Full , select place again ...";
                    }
                    else if (s1List[i].id == b.Text && s1List[i].date_id != DrDate.Text)
                    {
                        flag = true;

                    }

                }

                for (int i = 0; i < s1List.Count(); i++)
                {
                    if (s1List[i].tc.ToString() == tctc.ToString() && s1List[i].date_id == (DrDate.SelectedIndex + 1).ToString())
                    {
                        flag = false;
                        lbl3.Text = "You can choose for each day...";
                    }

                }


                if (flag == true)
                {
                    conn.Open();
                    //DataTable dt3 = sp.ExecuteMethod("select P_gender from person p where P_id='" + tctc.ToString() + "'", false);
                    DataTable dt3 = sp.ExecuteMethod("exec selectper "+tctc.ToString(), false);

                    foreach (DataRow item in dt3.Rows)
                    {
                        Seat s = new Seat()
                        {
                            gender = item["P_gender"].ToString()

                        };
                        s7List.Add(s);
                    }

                    string sorgu = string.Format("insert into seat values ('{0}','{1}','{2}', {3} , {4}, '{5}','{6}')", b.Text, tctc.ToString(), s7List[0].gender, (Dr1.SelectedIndex + 1), (DrDate.SelectedIndex + 1), DrDate.SelectedItem.Text, Dr1.SelectedItem.Text);
                    //*******string sorgu = string.Format("exec insertSeat12 "+ b.Text + "," + tctc.ToString() + "," + s7List[0].gender + "," + (Dr1.SelectedIndex + 1) + "," + (DrDate.SelectedIndex + 1) + "," + DrDate.SelectedItem.Text + "," + Dr1.SelectedItem.Text);

                    sp.NonQueryMethod(sorgu);

                    //DataTable dt1 = sp.ExecuteMethod("select p.P_gender,p.P_name,p.P_surname from person p where P_id='" + tctc.ToString() + "'", false);
                    DataTable dt1 = sp.ExecuteMethod("exec searchPer o"+ tctc.ToString() , false);
                    foreach (DataRow item in dt1.Rows)
                    {
                        Seat s = new Seat()
                        {
                            gender = item["P_gender"].ToString(),
                            name = item["P_name"].ToString(),
                            surname = item["P_surname"].ToString()

                        };
                        sList.Add(s);
                    }

                    boya();
                }

            }
            else
            {// DELETE İŞLEMİ BURDA YAPILMAKTADIR
                lbl3.Text = "";
                object tctc = Session["user"];
                Button b = Sender as Button;
                Label2.Text = b.Text;

                DataTable dt10 = sp.ExecuteMethod("select TC,Date,Seat,From_To from ticket15 where TC='"+tctc.ToString()+"' and Date='"+DrDate.SelectedItem.Text+"' and Seat='"+b.Text+"' and From_To='"+Dr1.SelectedItem.Text+"'", false);
                //***DataTable dt10 = sp.ExecuteMethod("exec del1 "+tctc.ToString()+","+DrDate.SelectedItem.Text+","+b.Text+","+Dr1.SelectedItem.Text, false);
                foreach (DataRow item in dt10.Rows)
                {
                    ticket t = new ticket()
                    {
                        ticket_TC = item["TC"].ToString(),
                        date = item["Date"].ToString(),
                        seat = item["Seat"].ToString(),
                        cityname = item["From_To"].ToString(),

                    };
                    s10List.Add(t);
                }

                DataTable dt9 = sp.ExecuteMethod("select seat_id,seat_tc,date_name,cityname from seat where seat_tc='" + tctc.ToString() + "' and date_name='" + DrDate.SelectedItem.Text + "' and seat_id='" + b.Text + "' and cityname='" + Dr1.SelectedItem.Text + "'", false);
                //****DataTable dt9 = sp.ExecuteMethod("exec del2 "+ tctc.ToString()+ ","+ DrDate.SelectedItem.Text + "," + b.Text + "," + Dr1.SelectedItem.Text , false);

                foreach (DataRow item in dt9.Rows)
                {
                    Seat s = new Seat()
                    {
                        id = item["seat_id"].ToString(),
                        tc = item["seat_tc"].ToString(),
                       date_name = item["date_name"].ToString(),
                       city_name=item["cityname"].ToString()
                        
                        
                    };
                    s9List.Add(s);
                }

                if (s10List.Count() == 0 && s9List.Count() == 0) 
                {

                    lbl3.Text = "Not allowed";
                
                }

                if (s9List.Count() == 1 && s10List.Count() == 0)// tam tersi ihtimali hiç bir zaman olmayacak ama tamı tamına 7 saatimi aldığın için teşekkürler delete
                { 
                     conn.Open();
                    string sorgu = string.Format("delete from seat where seat_id='"+s9List[0].id+"' and seat_tc='"+s9List[0].tc+"' and date_name='"+s9List[0].date_name+"' and cityname='"+s9List[0].city_name+"'");
                    //****string sorgu = string.Format("exec del3 "+ s9List[0].id + "," + s9List[0].tc + "," + s9List[0].date_name + "," + s9List[0].city_name+"");
                    
                    sp.NonQueryMethod(sorgu);

                    conn.Close();

                    boya();
                
                }

                if (s9List.Count() == 1 && s10List.Count() == 1) 
                {


                    lbl3.Text = "Sales were made to contact the customer service ...";
                
                }
                

               
            }// else sonuu
        }

        protected void Dr1_SelectedIndexChanged(object sender, EventArgs e)
        {/*wait please* :))))))     :D*/}

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("setting.aspx");
            lblsend.Text = "";// mesaj yerini boşalttık iyide oldu request trigger için :)
            lblbuy.Text = "";
        }

        public void boya()
        {

            s2List = new List<Seat>();
            //DataTable dt2 = sp.ExecuteMethod("select * from seat where cityid="+(Dr1.SelectedIndex+1)+"and date_id="+(DrDate.SelectedIndex+1), false);
            DataTable dt2 = sp.ExecuteMethod("exec boya "+(Dr1.SelectedIndex + 1) + "," +(DrDate.SelectedIndex + 1), false);

            foreach (DataRow item in dt2.Rows)
            {
                Seat s = new Seat()
                {
                    id = item["seat_id"].ToString(),
                    tc = item["seat_tc"].ToString(),
                    gender = item["seat_gender"].ToString(),
                    city_id = item["cityid"].ToString()

                };
                s2List.Add(s);
            }

            
            int z = s2List.Count();

            for (int i = 0; i < z; i++)
            {

                int zz = Int32.Parse(s2List[i].id);


                if (s2List[i].gender == "Male")
                {
                    b1[zz - 1].BackColor = ColorTranslator.FromHtml("#33CCFF");
                   
                    b1[zz - 1].ToolTip = s2List[i].id + " " + s2List[i].gender;

                }
                else {
                    b1[zz - 1].BackColor = System.Drawing.Color.Pink;
                    
                    b1[zz - 1].ToolTip = s2List[i].id + " " + s2List[i].gender;
                    
                
                }
            }
            if (s2List.Count!=0)
            {
                for (int i = 0; i < b1.Count(); i++)///////çokkkkk önemliii 5 saatimi aldı :((***********
                {
                    for (int j = 0; j < s2List.Count(); j++)
                    {
                        if (s2List[j].id != b1[i].Text)
                        {
                            flag2 = false;
                           
                           
                        }
                        else {
                            flag2 = true;
                            break;
                        }


                    }
                    if (flag2 == false) {
                        b1[i].BackColor = System.Drawing.Color.YellowGreen;
                        b1[i].ToolTip = "Empty";
                        flag2 = true;
                    
                    }

                }
            }
            else {

                for (int i = 0; i < b1.Count(); i++)///////çokkkkk önemliii 5 saatimi aldı :((
                {
                            b1[i].BackColor = System.Drawing.Color.YellowGreen;
                            b1[i].ToolTip = "Empty";
                        
                }
             }
        }
        public string a = "";
        public int count = 1;
       
        protected void lnklog_Click(object sender, EventArgs e)
        {
           
            Response.Redirect("Default.aspx");
            Session["user"] = null;// session log out dediğimizde null yapmamız gerekir

        }
       
        protected void BtnSeferGetir_Click(object sender, EventArgs e)
        {
            boya();
        }

        protected void lnksend_Click(object sender, EventArgs e)// trigger kullanımı isteğe bağlı :)))
        {
            object tctc = Session["user"];

            string sorgu = string.Format("insert into r1 values ('{0}','{1}')", tctc.ToString(), txtsend.Text);// trigger olduğu için exec kabul etmiyor malesef
             //string sorgu = string.Format("exec requestt "+ tctc.ToString()+","+ txtsend.Text);
            sp.NonQueryMethod(sorgu);

            lblsend.Text = "Send successfully";

            txtsend.Text = "";
            }

        protected void btnbuy_Click(object sender, EventArgs e)
        {
            Button b = sender as Button;
        
            conn.Open();
            object tctc = Session["user"];
            s99List = new List<Seat>();
           // DataTable dt99 = sp.ExecuteMethod("select seat_id from seat where seat_tc='" + tctc.ToString()+"'", false);
            DataTable dt99 = sp.ExecuteMethod("exec buy1 " + tctc.ToString(), false);
            foreach (DataRow item in dt99.Rows)
            {
                Seat s = new Seat()
                {
                    id = item["seat_id"].ToString()
                };
                s99List.Add(s);
            }

            s999List = new List<Seat>();
           // DataTable dt999 = sp.ExecuteMethod("select seat_id from seat where seat_tc='" + tctc.ToString() + "' and date_id='"+(DrDate.SelectedIndex+1)+"'", false);
            DataTable dt999 = sp.ExecuteMethod("exec buy2 " + tctc.ToString() + "," + (DrDate.SelectedIndex + 1), false);
            foreach (DataRow item in dt999.Rows)
            {
                Seat s = new Seat()
                {
                    id = item["seat_id"].ToString()
                };
                s999List.Add(s);
            }


            if (dr4.Text == "AddSeat")
            {

                string sorgu = string.Format("insert into ticket15 values ('{0}','{1}','{2}','{3}','{4}','{5}','{6}')", tctc.ToString(), Dr1.SelectedItem.Text, DrDate.SelectedItem.Text, lbltime.Text, lblcity.Text, lblprice.Text,s999List[0].id);
                //***string sorgu = string.Format("exec buy3 " + tctc.ToString() + "," + Dr1.SelectedItem.Text + "," + DrDate.SelectedItem.Text + "," + lbltime.Text + "," + lblcity.Text + "," + lblprice.Text + "," + s999List[0].id);

                sp.NonQueryMethod(sorgu);



                lblbuy.Text = "Save the ticket Successfully...";
                lblbuy1.Text = "If you experience a problem, Please call the customer service ...";
            }
            else {


                lblbuy.Text = "Please change the Add-Delete Seat tab ...";
            
            }
        }

        protected void lnk2_Click(object sender, EventArgs e)
        {
            Response.Redirect("seyehat.aspx");
        }
        }
    }
