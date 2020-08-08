using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class principal_home : System.Web.UI.Page
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
    protected void Allocate_Button1_Click(object sender, EventArgs e)
    {
        Subject1TextBox.Text = SubjectDropDownList1.SelectedItem.Text.ToString();
    }
    protected void Allocate_Button2_Click(object sender, EventArgs e)
    {
        Subject2TextBox.Text = SubjectDropDownList2.SelectedItem.Text.ToString();
    }
    protected void CreateButton_Click(object sender, EventArgs e)
    {
        StatusLable.Text = "";
        try
        {
            da = new SqlDataAdapter("select uname from userstable where uemail ='" + EmailID.Text + "' ", con);
            da.Fill(ds);
            temp = ds.Tables[0].Rows[0][0].ToString();
        }
        catch (Exception ee) { temp = ""; }

        if (temp.Length == 0)
        {
            string roles = "Teacher";
            /* STAFF ACCOUNT CREATION */
            con.Open();
            cmd = new SqlCommand("insert into userstable values( '" + FullNameTextBox.Text + "','" + EmailID.Text + "','" + Password.Text + "','" + secQue.Text + "','" + secans.Text + "','" + Mobile.Text + "','" + BranchList.SelectedItem.Text + "','" + roles + "' )", con);
            cmd.ExecuteScalar();
            con.Close();

            /* SUBJECT ALLOCATION ALONG WITH EMAIL ADDRESS AND BRANCH NAME*/
            con.Open();
            cmd = new SqlCommand("insert into staffsub values( '" + EmailID.Text + "','" + BranchList.SelectedItem.Text + "','" + Subject1TextBox.Text + "','" + Subject2TextBox.Text + "')", con);
            cmd.ExecuteScalar();
            con.Close();
            StatusLable.Text = "Account Created!";
            reset_form();
        }
        else
        {
            StatusLable.Text = "User Already Created"; 
        }
    }

    void reset_form()
    {
        FullNameTextBox.Text = "";
        FullNameTextBox.Focus();
        EmailID.Text = "";
        Mobile.Text = "";
        Subject1TextBox.Text = "";
        Subject2TextBox.Text = "";
        BranchList.SelectedIndex = 0;
        secQue.SelectedIndex = 0;
        
    }

    protected void ReserButton_Click(object sender, EventArgs e)
    {
        StatusLable.Text = "";
        reset_form();
    }
    protected void Delate_Button_Click(object sender, EventArgs e)
    {
        if (EmailID.Text != "")
        {
            StatusLable.Text = "";
            try
            {
                string rolesss = "Teacher";
                con.Open();
                cmd = new SqlCommand("delete from userstable where uemail ='" + EmailID.Text + "' and roles='" + rolesss + "' ", con);
                cmd.ExecuteScalar();
                con.Close();
                StatusLable.Text = "Account Deleted";
            }
            catch (Exception ee) { StatusLable.Text = "Fail to Delete Account..."; }
        }
        else
        {
            StatusLable.Text = "Enter Email ID TO Delete";
            EmailID.Focus();
        }
    }
    protected void Logout_Button_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("index.aspx");
    }
}