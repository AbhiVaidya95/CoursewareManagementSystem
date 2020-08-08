using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class create_principal : System.Web.UI.Page
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
        }
        catch (Exception ee) { Response.Redirect("index.aspx"); }
    }
    protected void Logout_Button_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("index.aspx");
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
            string roles = "Principal";
            string branch = "";
            con.Open();
            cmd = new SqlCommand("insert into userstable values( '" + FullNameTextBox.Text + "','" + EmailID.Text + "','" + Password.Text + "','" + secQue.Text + "','" + secans.Text + "','" + Mobile.Text + "','" + branch + "','" + roles + "' )", con);
            cmd.ExecuteScalar();
            con.Close();
            StatusLable.Text = "Account Created!";
            clear_fields();
        }

        else if (temp.Length > 0)
        {
            StatusLable.Text = "Account Already Created.";
        }   
    }
    protected void ReserButton_Click(object sender, EventArgs e)
    {
        clear_fields();
        StatusLable.Text = "";
    }

    void clear_fields()
    {
        FullNameTextBox.Text = "";
        FullNameTextBox.Focus();
        EmailID.Text = "";
        Mobile.Text = "";
        Password.Text = "";
        ConformPassword.Text = "";
        secans.Text = "";
        secQue.SelectedIndex = 0;
    }
    protected void Delete_Principal_Click(object sender, EventArgs e)
    {
        if (CheckBox1.Checked == true)
        {
            try
            {
                con.Open();
                cmd = new SqlCommand(" delete from userstable where uemail ='" + EmailID.Text + "' ", con);
                cmd.ExecuteNonQuery();
                con.Close();
                StatusLable.Text = "Principal Deleted Successfully!";
            }
            catch (Exception ee) { }
        }
        else
        {
            StatusLable.Text = "Please conform the deletion";
        }
    }
}