using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class admin_home : System.Web.UI.Page
{/* DATABASE CONNECTION STRINGS AND OTHER REFERANCES*/

    SqlConnection con = new SqlConnection("database = wsos; uid= sa; password = server@123; data source = Mayur-PC; ");
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds = new DataSet();
    string password, username, branch, temp, dates, times, content_name_guid, subjects;
    int content_id, i;
   // string password, username, branch, temp;
    string principal_password, admin_pass;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            Name_Session_Label.Text = Session["uname"].ToString();
            ID_Session_Label.Text = Session["user_email"].ToString();
            Session.Add("page", Page_Lable.Text);
        }
        catch (Exception ee) { Response.Redirect("index.aspx"); }
    }
    protected void Logout_Button_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("index.aspx");
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        ContentDeleteStatus_lable.Text = "";
        try
        {
            string rolesss = "Principal";
            da = new SqlDataAdapter("select upass from userstable where uemail ='" + Principal_ID_TextBox.Text + "' and roles= '" + rolesss + "' ", con);
            da.Fill(ds, "userstable");
            principal_password = ds.Tables["userstable"].Rows[0][0].ToString();

        }
        catch (Exception ee) { ContentDeleteStatus_lable.Text = "Error Occured!"; }

        try
        {
            da = new SqlDataAdapter("select upass from userstable where uemail ='" + ID_Session_Label.Text + "' ", con);
            da.Fill(ds, "userstable1");
            admin_pass = ds.Tables["userstable1"].Rows[0][0].ToString();

        }
        catch (Exception ee) { ContentDeleteStatus_lable.Text = "Error Occured!"; }

        try
        {
            if (admin_pass == Admin_pass_TextBox.Text && principal_password == Principal_PASS_TextBox.Text)
            {
                con.Open();
                cmd = new SqlCommand("delete from adminmsg where fname='" + Content_name_Label.Text + "' ", con);
                cmd.ExecuteScalar();
                con.Close();

                con.Open();
                cmd = new SqlCommand("delete from contents where cid='" + Content_ID.Text + "' ", con);
                cmd.ExecuteScalar();
                con.Close();

                File.Delete(Server.MapPath("Branch\\" + DropDownList1.Text + "\\" + Content_name_Label.Text));
                ContentDeleteStatus_lable.Text = "Content Deleted Successfully!...";
                SqlDataSource1.DataBind();
                GridView1.DataBind();
                SqlDataSource2.DataBind();
                DropDownList1.DataBind();
            }
        }
        catch (Exception ee) { ContentDeleteStatus_lable.Text = "Delete fail... "; }

    }
    protected void Get_Content_Name_Click(object sender, EventArgs e)
    {
        try
        {
            da = new SqlDataAdapter("select fname from adminmsg where fid='" + Content_ID.Text + "' and branch = '" + DropDownList1.SelectedValue.ToString() + "'", con);
            da.Fill(ds);
            Content_name_Label.Text = ds.Tables[0].Rows[0][0].ToString();
        }
        catch (Exception) { Content_name_Label.Text = ""; }
    }
    protected void CancleButton_Click(object sender, EventArgs e)
    {
        StatusLabel.Text = "";
        reset_message_to_admin();
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

    void reset_message_to_admin()
    {
        File_ID_TextBox.Text = "";
        File_ID_TextBox.Focus();
        File_Name_TextBOX.Text = "";
    }
    protected void inbox_GO_Click(object sender, EventArgs e)
    {
        SqlDataSource3.DataBind();
        GridView3.DataBind();
        Panel2.Visible = true;
        Panel3.Visible = false;
    }
    protected void outbox_GO_Click(object sender, EventArgs e)
    {
        SqlDataSource3.DataBind();
        GridView3.DataBind();
        Panel2.Visible = false;
        Panel3.Visible = true;
    }
}