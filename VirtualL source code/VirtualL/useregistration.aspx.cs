using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace VirtualL
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\VirtualLdb.mdf;Integrated Security=True;User Instance=True");
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string insert = "insert into Usertable(userid,username,password,email) values(@udi,@uname,@password,@email)";
            con.Open();
            SqlCommand cmd = new SqlCommand(insert, con);
            cmd.CommandType = CommandType.Text;

            cmd.Parameters.AddWithValue("@udi", TextBox1.Text);
            cmd.Parameters.AddWithValue("@uname", TextBox2.Text);
            cmd.Parameters.AddWithValue("@password", TextBox3.Text);
            cmd.Parameters.AddWithValue("@email", TextBox4.Text);

            cmd.ExecuteNonQuery();
            con.Close();
            Label2.Text = "Regestered Successfully";

        }
    }
}
