using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;   // required for database
using System.Data.SqlClient; // needed for sql server

namespace VirtualL
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            da = new SqlDataAdapter("select * from Usertable", con);
            ds = new DataSet();
            da.Fill(ds, "Usertable");
            n = ds.Tables["Usertable"].Rows.Count;
            TextBox1.Focus();

        }
        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\VirtualLdb.mdf;Integrated Security=True;User Instance=True");


        SqlDataAdapter da;
        DataSet ds;
        public int i, n;

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            for (i = 0; i < n; i++)
            {
                if (TextBox1.Text == ds.Tables["Usertable"].Rows[i][0].ToString() && TextBox2.Text == ds.Tables["Usertable"].Rows[i][2].ToString())
                {
                    //Session["un"] = TextBox1.Text;
                    Session["un"] = ds.Tables["Usertable"].Rows[i][1].ToString();
                    Response.Redirect("FinalTest.aspx");
                }
                else if (TextBox1.Text == "Admin" || TextBox2.Text == "admin")
                {
                    Response.Redirect("EnterQuestions.aspx");
                }
                else
                {
                    Label2.Text = "Invalid User / Password";
                }
            }

        }
    }
}