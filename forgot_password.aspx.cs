using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class forgot_password : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("database = wsos; uid= sa; password = server@123; data source = Mayur-PC; ");
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds = new DataSet();

    string pass, ans;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GeneratePassButton_Click(object sender, EventArgs e)
    {
        PasswordStatusLable.Text = "";

        try
        {
            da = new SqlDataAdapter("select upass, uans from userstable where uemail ='" + EmailIDTextBox.Text + "' and roles ='" + Roles_list.Text + "'", con);
            da.Fill(ds);
            pass = ds.Tables[0].Rows[0][0].ToString();
            ans = ds.Tables[0].Rows[0][1].ToString();
        }
        catch (Exception ee) { PasswordStatusLable.Text = "Invalid Email or Security Answer"; }

        if (AnswerTextBox.Text == ans)
        {
            PasswordStatusLable.Text = "Your Password is: " + pass;
        }
        else
        {
            PasswordStatusLable.Text = "Invalid Email or Security Answer";
        }
    }
}