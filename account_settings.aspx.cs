using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class account_settings : System.Web.UI.Page
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
            Page_Label1.Text = Session["page"].ToString();
        }
        catch (Exception ee) { Response.Redirect("index.aspx"); }
    }
    protected void Logout_Button_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("index.aspx");
    }
    protected void Back_Button_Click(object sender, EventArgs e)
    {
        Response.Redirect(Page_Label1.Text);
    }
    protected void ChangePassButton_Click(object sender, EventArgs e)
    {
        PasswordStatusLabel.Text = "";
        da = new SqlDataAdapter("select upass from userstable where uemail = '" + ID_Session_Label.Text + "' ", con);
        da.Fill(ds);
        password = ds.Tables[0].Rows[0][0].ToString();

        if (password == CurrentPassTextBox.Text)
        {
            con.Open();
            cmd = new SqlCommand("update userstable set upass ='" + ConformPasTextBox.Text + "' where uemail='" + ID_Session_Label.Text + "' ", con);
            cmd.ExecuteScalar();
            con.Close();
            PasswordStatusLabel.Text = "Password Changes Successfully!";
        }

        else if (password != CurrentPassTextBox.Text)
        {
            PasswordStatusLabel.Text = "Invalid Current Password!";
        }
    }
    protected void CancelButton_Click(object sender, EventArgs e)
    {
        CurrentPassTextBox.Text = "";
        NewPassTextBox.Text = "";
        ConformPasTextBox.Text = "";
        CurrentPassTextBox.Focus();
    }

    protected void ChangePassButton0_Click(object sender, EventArgs e)
    {
        con.Open();
        cmd = new SqlCommand("update userstable set useq ='" + secQue.SelectedItem.ToString() + "', uans = '" + AnswerTextBox.Text + "' where uemail='" + ID_Session_Label.Text + "' ", con);
        cmd.ExecuteScalar();
        con.Close();
        QuestionStatusLabel.Text = "Changed Successfully!";
    }
    
    protected void CancelButton0_Click(object sender, EventArgs e)
    {
        AnswerTextBox.Text = "";
        AnswerTextBox.Focus();
    }
}