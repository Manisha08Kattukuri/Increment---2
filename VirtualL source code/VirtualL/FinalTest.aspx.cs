using System;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;


namespace VirtualL
{
    public partial class FinalTest : System.Web.UI.Page
    {
        public static SqlConnection sqlconn;
        protected string PostBackStr;

        protected void Page_Load(object sender, EventArgs e)
        {

            txtName.Text = Session["un"].ToString();
            sqlconn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\VirtualLdb.mdf;Integrated Security=True;User Instance=True");
           
            if (!IsPostBack)
            {
                string eventArg = Request["__EVENTARGUMENT"];
                if (eventArg == "time")
                {
                    getNextQuestion();
                }
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Label1.Visible = false;
            txtName.Visible = false;
            Button1.Visible = false;
            Panel1.Visible = true;
            lblName.Text = "Name : " + txtName.Text;
            int score = Convert.ToInt32(txtScore.Text);
            lblScore.Text = "Score : " + Convert.ToString(score);
            Session["counter"] = "1";
            Random rnd = new Random();
            int i = rnd.Next(1, 30);//Here specify your starting slno of question table and ending no.
            // lblQuestion.Text = i.ToString();
            getQuestion(i);

        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            getNextQuestion();

        }
        public void getQuestion(int no)
        {
            string str = "select * from Questions where Slno=" + no + " and qstyp='cat' and section='1'";
            //  string str = "select top(3)* from Questions where qstyp='cat'";
            SqlDataAdapter da2 = new SqlDataAdapter(str, sqlconn);
            DataSet ds2 = new DataSet();
            da2.Fill(ds2, "Questions");
            if (ds2.Tables[0].Rows.Count > 0)
            {
                DataRow dtr;
                int i = 0;
                while (i < ds2.Tables[0].Rows.Count)
                {
                    dtr = ds2.Tables[0].Rows[i];
                    Session["Answer"] = Convert.ToString(Convert.ToInt32(dtr["correctans"].ToString()) - 1);
                    lblQuestion.Text = "Q." + Session["counter"].ToString() + "  " + dtr["Question"].ToString();
                    RblOption.ClearSelection();
                    RblOption.Items.Clear();
                    RblOption.Items.Add(dtr["option1"].ToString());
                    RblOption.Items.Add(dtr["option2"].ToString());
                    RblOption.Items.Add(dtr["option3"].ToString());
                    RblOption.Items.Add(dtr["option4"].ToString());
                    i++;
                }
            }
        }
        int score = 0;
        public void getNextQuestion()
        {
            if (Convert.ToInt32(Session["counter"].ToString()) < 10)//20 is a counter which is used for 10 questions
            {
                if (RblOption.SelectedIndex >= 0)
                {
                    if (Session["Answer"].ToString() == RblOption.SelectedIndex.ToString())
                    {
                        score = Convert.ToInt32(txtScore.Text) + 3;// 1 for mark for each question
                        txtScore.Text = score.ToString();
                        lblScore.Text = "Score : " + Convert.ToString(score);
                    }
                    else
                    {
                        // score =Convert.ToInt16(txtScore.Text )- 1;
                    }
                }

                Random rnd = new Random();
                int i = rnd.Next(1, 30);
                // lblQuestion.Text = i.ToString();
                getQuestion(i);
                Session["counter"] = Convert.ToString(Convert.ToInt32(Session["counter"].ToString()) + 1);

            }
            else
            {
                Panel2.Visible = false;
                //  lblScore.Text += score.ToString();
                //code for displaying after completting the exam, if you want to show the result then you can code here.
            }
        }

        //#region Connection Open
        //public void ConnectionOpen()
        //{
        //    try
        //    {
        //        if (sqlconn.State == ConnectionState.Closed) { sqlconn.Open(); }
        //    }
        //    catch (SqlException ex)
        //    {

        //    }
        //    catch (SystemException sex)
        //    {

        //    }
        //}
        //#endregion
        //#region Connection Close
        //public void ConnectionClose()
        //{
        //    try
        //    {
        //        if (sqlconn.State != ConnectionState.Closed) { sqlconn.Close(); }
        //    }
        //    catch (SqlException ex)
        //    {

        //    }
        //    catch (SystemException sex)
        //    {

        //    }
        //}
        //#endregion
        static int sec = 59;
        int min = 9; //total time =10 mint , count down time is 9
        static int time = 0;
        static int examtime = 60; //muliple with 10, test time
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            time++;
            sec--;
            if (sec < 0)
            {
                min--;
                sec = 59;
            }
            if (sec < 10)
            {
                Label2.Text = min + ": 0" + sec;
            }
            else
            {
                Label2.Text = min + ": " + sec;
            }
            // time++;

            if (time == examtime)
            {
                try
                {
                    Timer1.Enabled = false;
                    Button2.Enabled = false;
                    Label3.Visible = true;
                    Label3.Text = "Your First Session is Completed";
                    // lblScore.Visible = true;
                    Session.Add("test1score", lblScore.Text.ToString());
                    Button3.Visible = true;
                    Button3.Enabled = true;
                }
                catch
                {
                }
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("FinalTest2.aspx");
        }
    }

}


