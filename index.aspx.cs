using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class index : System.Web.UI.Page
{/* DATABASE CONNECTION STRINGS AND OTHER REFERANCES*/

    SqlConnection con = new SqlConnection("database = wsos; uid= sa; password = server@123; data source = Mayur-PC; ");
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds = new DataSet();

    string password, username, roles, temp;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            SqlDataSource1.DataBind();
            GridView1.DataBind();
        }
        catch (Exception ee) { }
    }
    protected void StudentPanel_Button_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = false;
        Panel3.Visible = false;
        Student_Panel.Visible = true;
    }
    protected void StaffPanel_Button_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        Panel2.Visible = false;
        Panel3.Visible = false;
        Student_Panel.Visible = false;
    }
    protected void PrincipalPanel_Button_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = true;
        Panel3.Visible = false;
        Student_Panel.Visible = false;
    }
    protected void AdminPanel_Button_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = false;
        Panel3.Visible = true;
        Student_Panel.Visible = false;
    }
    protected void Student_login_Button_Click(object sender, EventArgs e)
    {
        Student_Status_Lable.Text = "";
        try
        {
            con.Open();
            da = new SqlDataAdapter("select upass, uname, roles from userstable where uemail = '" + Student_TextBox.Text + "'", con);
            da.Fill(ds, "userstable");
            password = ds.Tables["userstable"].Rows[0][0].ToString();
            temp = ds.Tables["userstable"].Rows[0][1].ToString();
            roles = ds.Tables["userstable"].Rows[0][2].ToString();
            Session.Add("user_email", Student_TextBox.Text);
            Session.Add("uname", temp.ToString());
        }
        catch (Exception ee) { Student_Status_Lable.Text = "Invalid User ID or Password"; }

        if (password == Student_TextBox_password.Text && roles == "Student")
        {
            Response.Redirect("students_home.aspx");
        }

        else { Student_Status_Lable.Text = "Invalid Password"; }
    }
    protected void Student_Forgot_Button_Click(object sender, EventArgs e)
    {
        Response.Redirect("forgot_password.aspx");
    }
    protected void Staff_LoginButton_Click(object sender, EventArgs e)
    {
        Staff_Status_Lable.Text = "";
        try
        {
            con.Open();
            da = new SqlDataAdapter("select upass, uname, roles from userstable where uemail = '" + Staff_TextBox.Text + "'", con);
            da.Fill(ds, "userstable");
            password = ds.Tables["userstable"].Rows[0][0].ToString();
            temp = ds.Tables["userstable"].Rows[0][1].ToString();
            roles = ds.Tables["userstable"].Rows[0][2].ToString();
            Session.Add("user_email", Staff_TextBox.Text);
            Session.Add("uname", temp.ToString());
        }
        catch (Exception ee) { Staff_Status_Lable.Text = "Invalid User ID or Password"; }

        if (password == Staff_PasswordTextBox.Text && roles == "Teacher")
        {
            Response.Redirect("staff_home.aspx");
        }

        else { Staff_Status_Lable.Text = "Invalid Password"; }
    }
    protected void Staff_Forgot_Button_Click(object sender, EventArgs e)
    {
        Response.Redirect("forgot_password.aspx");
    }
    protected void Principal_loginButton_Click(object sender, EventArgs e)
    {
        Principal_Status_Lable.Text = "";
        try
        {
            con.Open();
            da = new SqlDataAdapter("select upass, uname, roles from userstable where uemail = '" + Principal_TextBox.Text + "'", con);
            da.Fill(ds, "userstable");
            password = ds.Tables["userstable"].Rows[0][0].ToString();
            temp = ds.Tables["userstable"].Rows[0][1].ToString();
            roles = ds.Tables["userstable"].Rows[0][2].ToString();
            Session.Add("user_email", Principal_TextBox.Text);
            Session.Add("uname", temp.ToString());
        }
        catch (Exception ee) { Principal_Status_Lable.Text = "Invalid User ID or Password"; }

        if (password == Principal_Password_TextBox.Text && roles == "Principal")
        {
            Response.Redirect("principal_home.aspx");
        }

        else { Principal_Status_Lable.Text = "Invalid Password"; }
    }
    protected void Principal_ForgotButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("forgot_password.aspx");
    }
    protected void Admin_loginButton_Click(object sender, EventArgs e)
    {
        Admin_Status_Lable.Text = "";
        try
        {
            con.Open();
            da = new SqlDataAdapter("select upass, uname, roles from userstable where uemail = '" + Admin_TextBox.Text + "'", con);
            da.Fill(ds, "userstable");
            password = ds.Tables["userstable"].Rows[0][0].ToString();
            temp = ds.Tables["userstable"].Rows[0][1].ToString();
            roles = ds.Tables["userstable"].Rows[0][2].ToString();
            Session.Add("user_email", Admin_TextBox.Text);
            Session.Add("uname", temp.ToString());
        }
        catch (Exception ee) { Admin_Status_Lable.Text = "Invalid User ID"; }

        if (password == Admin_passwordTextBox.Text && roles == "Admin")
        {
            Response.Redirect("admin_home.aspx");
        }

        else { Admin_Status_Lable.Text = "Invalid Password"; }
    }
    protected void Admin_ForgotButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("forgot_password.aspx");
    }
}