using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class staff_home : System.Web.UI.Page
{/* DATABASE CONNECTION STRINGS AND OTHER REFERANCES*/
    SqlConnection con = new SqlConnection("database = wsos; uid= sa; password = server@123; data source = Mayur-PC; ");
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds = new DataSet();

    string password, username, branch, temp, dates, times, content_name_guid, subjects;
    int content_id, i;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            Name_Session_Label.Text = Session["uname"].ToString();
            ID_Session_Label.Text = Session["user_email"].ToString();
            Session.Add("page",Page_Label.Text);
        }
        catch (Exception ee) { Response.Redirect("index.aspx"); }
        try
        {
            //staffsub
            da = new SqlDataAdapter("select ubranch from staffsub where uemail= '" + ID_Session_Label.Text + "'  ", con);
            da.Fill(ds);
            branch = ds.Tables[0].Rows[0][0].ToString();
        }
        catch (Exception ee) { }
    }
    protected void EnableOptionButton_Click(object sender, EventArgs e)
    {
        Upload_Content.Enabled = true;
        EnableOptionButton.Text = "Upload Enabled";

        try
        {
            Subjects_DropDownList.Items.Clear();
            da = new SqlDataAdapter("select * from staffsub where uemail= '" + ID_Session_Label.Text + "'  ", con);
            da.Fill(ds, "staffsub"); // BRANCH FOR CONTENT TABLE
            branch = ds.Tables["staffsub"].Rows[0][1].ToString();
            Subjects_DropDownList.Items.Add(ds.Tables["staffsub"].Rows[0][2].ToString());
            Subjects_DropDownList.Items.Add(ds.Tables["staffsub"].Rows[0][3].ToString());
        }
        catch (Exception ee) { }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        try // CONTENT ID 
        {
            da = new SqlDataAdapter("select max(cid) from contents", con);
            da.Fill(ds, "cids");
            content_id = int.Parse(ds.Tables["cids"].Rows[0][0].ToString());
            content_id = content_id + 1;
        }
        catch (Exception ee) { content_id = 0; }

        try // GUID and File Name
        {
            i = System.Math.Abs(Guid.NewGuid().GetHashCode());
            string gg = i.ToString() + FileUpload1.FileName.ToString();
            content_name_guid = gg;
        }
        catch (Exception ee) { }

        dates = DateTime.Now.ToShortDateString();
        times = DateTime.Now.ToShortTimeString();

        try // INSERT INTO CONTENT TABLE WHEN USER CLICK UPLOAD BUTTON AND ALSO CHECK FOR THE CONTENT NAME
        {
            Upload_status_lable.Text = "";
            subjects = Subjects_DropDownList.SelectedValue.ToString();
            if (FileUpload1.HasFile)
            {
                string SaveLocation = Server.MapPath("Branch\\" + branch) + "\\" + content_name_guid;
                FileUpload1.PostedFile.SaveAs(SaveLocation);
                // SQL QUERY 
                con.Open();
                cmd = new SqlCommand("insert into contents values('" + content_id + "','" + description.Text + "','" + content_name_guid + "','" + branch + "','" + subjects + "','" + ID_Session_Label.Text + "','" + Name_Session_Label.Text + "','" + dates + "','" + times + "' )", con);
                cmd.ExecuteScalar();
                con.Close();

                EnableOptionButton.Text = "Enable Upload Option";

                Upload_status_lable.Text = "Successfully Uploaded!";
                Upload_Content.Enabled = false;
                SqlDataSource1.DataBind();
                GridView1.DataBind();

                content_id = 0;
            }
        }
        catch (Exception ee) { Upload_status_lable.Text = "Upload Fail.. Please Try Again.. "; }
    }
    protected void Subjects_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    string maxID_inbox, maxID_outbox;
    protected void SendButton_Click(object sender, EventArgs e)
    {
        try
        {
            da = new SqlDataAdapter("select max(id) from inbox", con);
            da.Fill(ds, "mids");
            maxID_inbox = ds.Tables["mids"].Rows[0][0].ToString();
            maxID_inbox= (int.Parse(maxID_inbox) + 1).ToString();
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
    protected void CancleButton_Click(object sender, EventArgs e)
    {
        StatusLabel.Text = "";
        reset_message_to_admin();
    }
    protected void Logout_Button_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("index.aspx");
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
        Panel2.Visible = false ;
        Panel3.Visible = true;
    }
    protected void LogDelReport_Click(object sender, EventArgs e)
    {

        try
        {
            dates = DateTime.Now.ToShortDateString();
            times = DateTime.Now.ToShortTimeString();
            con.Open();
            cmd = new SqlCommand("insert into adminmsg values( '" + TextBox1.Text + "','" + TextBox2.Text + "','" + ID_Session_Label.Text + "','" + Name_Session_Label.Text + "','" + branch + "','" + dates + "','" + times + "'  )", con);
            cmd.ExecuteScalar();
            con.Close();
            Admin_Label1.Text = "Message Send Successfully!";
            File_ID_TextBox.Text = "";
            File_Name_TextBOX.Text = "";
        }
        catch (Exception ee) { Admin_Label1.Text = "Message Sending Fail.. Please try again...!"; }
    }
}