using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class students_home : System.Web.UI.Page
{/* DATABASE CONNECTION STRINGS AND OTHER REFERANCES*/

    SqlConnection con = new SqlConnection("database = wsos; uid= sa; password = server@123; data source = Mayur-PC; ");
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds = new DataSet();

    string password, username, branch, temp;
    string principal_password, admin_pass;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            Name_Session_Label.Text = Session["uname"].ToString();
            ID_Session_Label.Text = Session["user_email"].ToString();
            Session.Add("page", Page_Label.Text);
        }
        catch (Exception ee) { Response.Redirect("index.aspx"); }
    }
    protected void Logout_Button_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("index.aspx");
    }
    protected void GO_Button_Click(object sender, EventArgs e)
    {
        SqlDataSource2.DataBind();
    }
    protected void Download_Button_Click(object sender, EventArgs e)
    {
        try
        {
            da = new SqlDataAdapter("select cname from contents where cid  = '" + Content_IDTextBox.Text + "' ", con);
            da.Fill(ds, "contents");
            File_NameTextBox.Text = ds.Tables["contents"].Rows[0][0].ToString();
            Response.Redirect("~/Branch/" + BranchList.Text.ToString() + "/" + File_NameTextBox.Text.ToString());
        }
        catch (Exception ee) { }
    }
    protected void CancleButton_Click(object sender, EventArgs e)
    {

    }

    string messages, branchs;
    protected void SendButton_Click(object sender, EventArgs e)
    {
        StatusLabel.Text = "";
        //messages = "File ID: " + File_ID_TextBox.Text + "File Name: " + File_NameTextBox.Text + "Comments: " + Comments.Text;
        //branchs = "";

        try
        {
            string dates = DateTime.Now.ToShortDateString();
            string times = DateTime.Now.ToShortTimeString();
            con.Open();
            cmd = new SqlCommand("insert into comments values( '" + Staff_Email_TextBox.Text + "','" + File_ID_TextBox.Text + "','" + File_Name_TextBOX.Text + "','" + Comments.Text + "','" + dates + "','" + times + "', '" + Name_Session_Label.Text + "','" + ID_Session_Label.Text + "' )", con);
            cmd.ExecuteScalar();
            con.Close();
            StatusLabel.Text = "Comment Send...";
            clear_comments();
        }
        catch (Exception ee) { StatusLabel.Text = "Already send..."; }
        /*
        try
        {
            string dates = DateTime.Now.ToShortDateString();
            string times = DateTime.Now.ToShortTimeString();
            con.Open();
            cmd = new SqlCommand("insert into outbox  values( '" + File_ID_TextBox.Text + "','" + messages + "','" + ID_Session_Label.Text + "','" + Name_Session_Label.Text + "', '" + Staff_Email_TextBox.Text + "' ,'" + branchs + "' ,'" + dates + "','" + times + "')", con);
            cmd.ExecuteScalar();
            con.Close();
            StatusLabel.Text = "Comment Send...";
            clear_comments();
        }
        catch (Exception ee) { StatusLabel.Text = "Already send..."; } */
    }

    void clear_comments()
    {
        Staff_Email_TextBox.Text = "";
        File_ID_TextBox.Text = "";
        File_Name_TextBOX.Text = "";
        Comments.Text = "";
    }
    protected void GO_Button1_Click(object sender, EventArgs e)
    {
        DropDownList2.Enabled = true;
        GO_Button2.Enabled = true;
    }
}