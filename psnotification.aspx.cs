using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class psnotification : System.Web.UI.Page
{
    int no;
    string password, username, branch, temp, dates, times, content_name_guid, subjects;
    int content_id, i;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            Name_Session_Label.Text = Session["uname"].ToString();
            ID_Session_Label.Text = Session["user_email"].ToString();
            Session.Add("page", Page_Label.Text);
        }
        catch (Exception ee) { Response.Redirect("index.aspx"); }

        try
        {
            da = new SqlDataAdapter("select max(id) from noti", con);
            da.Fill(ds, "noti");
            no = int.Parse(ds.Tables["noti"].Rows[0][0].ToString());
            no = no + 1;
        }
        catch (Exception ee) { no = 1; }
    }

    protected void Spec_Button1_Click(object sender, EventArgs e)
    {
        Panel2.Visible = false;
        Panel1.Visible = true;
        Spec_Button1.Enabled = false;
        Roles_Button2.Enabled = true;
    }
    protected void Roles_Button2_Click(object sender, EventArgs e)
    {
        Roles_Button2.Enabled = false;
        Panel2.Visible = true;
        Panel1.Visible = false;
        Spec_Button1.Enabled = true;
    }

    SqlConnection con = new SqlConnection("database= wsos; password = server@123 ; uid = sa; data source= Mayur-PC");
    SqlCommand cmd;
    DataSet ds = new DataSet();
    SqlDataAdapter da;
    /*
    protected void Send_Button1_Click(object sender, EventArgs e)
    {
        Status_lABLE.Text = "";
        try
        {
            string dates = DateTime.Now.ToShortDateString(), times = DateTime.Now.ToShortTimeString();
            string n = "";
            con.Open();
            cmd = new SqlCommand("insert into noti values( '"+no+"', '" + TextBox1.Text + "','" + n + "','" + TextBox2.Text + "','" + dates + "','" + times + "' )", con);
            cmd.ExecuteNonQuery();
            con.Close();
            Status_lABLE.Text = "Send Successfully!";
        }
        catch (Exception ee) { Status_lABLE.Text = "Sending Fail"; }

    } */
    protected void Button3_Click(object sender, EventArgs e)
    {
        Status_lABLE0.Text = "";
        try
        {
            string dates = DateTime.Now.ToShortDateString(), times = DateTime.Now.ToShortTimeString();
            string n = "";
            con.Open();
            cmd = new SqlCommand("insert into noti values( '" + no + "','" + n + "','" + DropDownList1.Text + "','" + TextBox4.Text + "','" + dates + "','" + times + "' )", con);
            cmd.ExecuteNonQuery();
            con.Close();
            Status_lABLE0.Text = "Send Successfully!";
        }
        catch (Exception ee) { Status_lABLE0.Text = "Sending Fail"; }
    }
    protected void Logout_Button_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("index.aspx");
    }
    protected void CancleButton_Click(object sender, EventArgs e)
    {
        StatusLabel.Text = "";
        reset_message_to_admin();
    }
    void reset_message_to_admin()
    {
        File_ID_TextBox.Text = "";
        File_ID_TextBox.Focus();
        File_Name_TextBOX.Text = "";
    }
    string maxID_inbox, maxID_outbox;
    protected void SendButton_Click(object sender, EventArgs e)
    {
        try
        {
            da = new SqlDataAdapter("select max(id) from inbox", con);
            da.Fill(ds, "mids");
            maxID_inbox = ds.Tables["mids"].Rows[0][0].ToString();
            maxID_inbox = (int.Parse(maxID_inbox) + 1).ToString();
        }
        catch (Exception ee) { maxID_inbox = "1"; }

        try
        {
            dates = DateTime.Now.ToShortDateString();
            times = DateTime.Now.ToShortTimeString();
            con.Open();
            cmd = new SqlCommand("insert into inbox values( '" + maxID_inbox + "','" + File_Name_TextBOX.Text + "','" + ID_Session_Label.Text + "','" + Name_Session_Label.Text + "', '" + Send_TO.Text + "','" + branch + "','" + dates + "','" + times + "'  )", con);
            cmd.ExecuteScalar();
            con.Close();
            StatusLabel.Text = "Message Send Successfully!";

        }
        catch (Exception ee) { StatusLabel.Text = "Same Message Already Send..."; reset_message_to_admin(); }

        try
        {
            da = new SqlDataAdapter("select max(id) from outbox", con);
            da.Fill(ds, "mids");
            maxID_outbox = ds.Tables["mids"].Rows[0][0].ToString();
            maxID_outbox = (int.Parse(maxID_outbox) + 1).ToString();
        }
        catch (Exception ee) { maxID_outbox = "1"; }

        try
        {
            dates = DateTime.Now.ToShortDateString();
            times = DateTime.Now.ToShortTimeString();
            con.Open();
            cmd = new SqlCommand("insert into outbox values( '" + maxID_outbox + "','" + File_Name_TextBOX.Text + "','" + ID_Session_Label.Text + "','" + Name_Session_Label.Text + "', '" + Send_TO.Text + "','" + branch + "','" + dates + "','" + times + "'  )", con);
            cmd.ExecuteScalar();
            con.Close();
            StatusLabel.Text = "Message Send Successfully!";
            reset_message_to_admin();
        }
        catch (Exception ee) { StatusLabel.Text = "Same Message Already Send..."; reset_message_to_admin(); }
    }
    protected void inbox_GO_Click(object sender, EventArgs e)
    {
        SqlDataSource3.DataBind();
        GridView3.DataBind();
        Panel4.Visible = true;
        Panel5.Visible = false;
    }
    protected void outbox_GO_Click(object sender, EventArgs e)
    {
        SqlDataSource3.DataBind();
        GridView3.DataBind();
        Panel4.Visible = false;
        Panel5.Visible = true;
    }
}