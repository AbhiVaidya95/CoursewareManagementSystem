using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class create_account : System.Web.UI.Page
{/* DATABASE USINGS */

    SqlConnection con = new SqlConnection("data source = Mayur-Pc; Password = server@123; uid = sa; database=wsos;");
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds = new DataSet();

    string password, temp, username;
    protected void Page_Load(object sender, EventArgs e)
    {

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
            string roles = "Student";
            con.Open();
            cmd = new SqlCommand("insert into userstable values( '" + FullNameTextBox.Text + "','" + EmailID.Text + "','" + Password.Text + "','" + secQue.Text + "','" + secans.Text + "','" + Mobile.Text + "','" + BranchList.SelectedItem.Text + "','" + roles + "' )", con);
            cmd.ExecuteScalar();
            con.Close();
            StatusLable.Text = "Account Created!";
            Response.Redirect("index.aspx");
        }

        else if (temp.Length > 0)
        {
            StatusLable.Text = "Account Already Created.";
        }
    }
    protected void ReserButton_Click(object sender, EventArgs e)
    {
        StatusLable.Text = "";
    }
}