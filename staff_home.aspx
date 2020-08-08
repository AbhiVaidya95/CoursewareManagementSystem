<%@ Page Language="C#" AutoEventWireup="true" CodeFile="staff_home.aspx.cs" Inherits="staff_home" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" profile="http://gmpg.org/xfn/11">
<title>WSOS - STAFF</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="styles/layout.css" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <!-- ####################################################################################################### -->
<div class="wrapper col1">
  <div id="header">
    <div class="fl_left">
     <h1>Cloud <a href="#">Engineering</a></h1>
      <p>Cloud Setup for College Campus</p>
     
    </div>
    <div id="topnav">
       <ul>
        <li><a  href="index.aspx"> Home </a></li>
        <li><a  href="about.aspx">About Us</a></li>
      </ul>
    </div>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col2">
  <div id="breadcrumb">
    <ul>
      <li class="first">Welcome Prof. : </li>
      <asp:Label ID="Name_Session_Label" runat="server"></asp:Label>
        
        <li>&nbsp;| </li>
        <asp:Label ID="ID_Session_Label" runat="server"></asp:Label> 

        <li> | 
            <asp:HyperLink ID="HyperLink1" runat="server" 
                NavigateUrl="account_settings.aspx">Account Settings</asp:HyperLink>
            | 
            <asp:Button ID="Logout_Button" runat="server" Text="Logout..." 
                onclick="Logout_Button_Click" />&nbsp;</li>
        <asp:Label ID="Page_Label" runat="server" Text="staff_home.aspx" 
            Visible="False"></asp:Label>
    </ul> 

  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col3">
  <div id="container">
    <hr />
    <center> <h2>Upload The Subject Content&nbsp; </h2>
            <p>
                <asp:Button ID="EnableOptionButton" runat="server" BorderStyle="Dotted" 
                    BorderWidth="1px" onclick="EnableOptionButton_Click" 
                    Text="Enable Upload Option" />
            </p> </center>
        <center>
        <table width=""100%">
        
        <tr>
        <td>
            <asp:Label ID="BranchName_Lable" runat="server" Text="Subject"></asp:Label> &nbsp;
            </td>
        <td class="style6">
            <asp:DropDownList ID="Subjects_DropDownList" runat="server" BackColor="#FF9933" 
                Height="16px" 
                onselectedindexchanged="Subjects_DropDownList_SelectedIndexChanged">
                <asp:ListItem>-- Select --</asp:ListItem>
            </asp:DropDownList>
            </td>
        <td class="style7"> <center>
            <asp:FileUpload ID="FileUpload1" runat="server" BorderStyle="Solid" 
                BorderWidth="1px" Width="203px" /> 
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="FileUpload1" Display="Dynamic" ErrorMessage="Required" 
                ForeColor="Red" SetFocusOnError="True" ValidationGroup="Group22">Required</asp:RequiredFieldValidator></center> </td>
        <td><center> &nbsp; &nbsp; &nbsp; &nbsp; Description:&nbsp;<asp:TextBox ID="description" runat="server" BorderStyle="Solid" 
                BorderWidth="1px"></asp:TextBox>
&nbsp; <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="description" Display="Dynamic" ErrorMessage="Required" 
                ForeColor="Red" SetFocusOnError="True" ValidationGroup="Group22">Required</asp:RequiredFieldValidator></center>
            </td>
        <td>&nbsp;
            <asp:Button ID="Upload_Content" runat="server" BorderStyle="Solid" BorderWidth="1px" 
                Text="Upload Content" Enabled="False" onclick="Button3_Click" 
                ValidationGroup="Group22" />

                <br /> <asp:Label ID="Upload_status_lable" runat="server" 
                ForeColor="Red"></asp:Label>
            </td>
        
        </tr>
        </table>
        
        <h2> Content Uploaded By You </h2>

            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                DataSourceID="SqlDataSource1" Width="100%" AutoGenerateColumns="False" 
                DataKeyNames="cid" CellPadding="4" ForeColor="#333333">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="cid" HeaderText="File ID" ReadOnly="True" 
                        SortExpression="cid" >
                    </asp:BoundField>
                    <asp:BoundField DataField="des" HeaderText="About File" 
                        SortExpression="des" >
                    </asp:BoundField>
                    <asp:BoundField DataField="cname" HeaderText="File Name" 
                        SortExpression="cname" >
                    </asp:BoundField>
                    <asp:BoundField DataField="subject" HeaderText="Subject" 
                        SortExpression="subject" >
                    </asp:BoundField>
                    <asp:BoundField DataField="dates" HeaderText="Date" SortExpression="dates" >
                    </asp:BoundField>
                    <asp:BoundField DataField="times" HeaderText="Time" SortExpression="times" >
                    </asp:BoundField>
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:wsosConnectionString %>" 
                SelectCommand="SELECT * FROM [contents] WHERE ([semail] = @semail) ORDER BY [dates] DESC, [times] DESC">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ID_Session_Label" Name="semail" PropertyName="Text" 
                        Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

        <br />

        <h2> Comments On Content From Students </h2>
        <br /> 
        
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                DataSourceID="SqlDataSource2" Width="100%" AutoGenerateColumns="False" 
                CellPadding="4" DataKeyNames="fid" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField DeleteText="Del" ShowDeleteButton="True" />
                <asp:BoundField DataField="sname" HeaderText="Sender" SortExpression="sname">
                </asp:BoundField>
                <asp:BoundField DataField="semails" HeaderText="Sender's ID" 
                    SortExpression="semails">
                </asp:BoundField>
                <asp:BoundField DataField="comt" HeaderText="Comment" SortExpression="comt">
                </asp:BoundField>
                <asp:BoundField DataField="fid" HeaderText="ID" SortExpression="fid" 
                    ReadOnly="True">
                </asp:BoundField>
                <asp:BoundField DataField="fname" HeaderText="File Name" 
                    SortExpression="fname">
                </asp:BoundField>
                <asp:BoundField DataField="dates" HeaderText="Date" 
                    SortExpression="dates">
                </asp:BoundField>
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" 
                HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" ForeColor="#333333" Font-Bold="True" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:wsosConnectionString %>" 
                
                
                SelectCommand="SELECT [fid], [fname], [comt], [dates], [sname], [semails] FROM [comments] WHERE ([staffemail] = @staffemail) ORDER BY [dates] DESC, [times] DESC" 
                DeleteCommand="DELETE FROM [comments] WHERE [fid] = @fid" 
                InsertCommand="INSERT INTO [comments] ([fid], [fname], [comt], [dates], [sname], [semails]) VALUES (@fid, @fname, @comt, @dates, @sname, @semails)" 
                UpdateCommand="UPDATE [comments] SET [fname] = @fname, [comt] = @comt, [dates] = @dates, [sname] = @sname, [semails] = @semails WHERE [fid] = @fid">
            <DeleteParameters>
                <asp:Parameter Name="fid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="fid" Type="Int32" />
                <asp:Parameter Name="fname" Type="String" />
                <asp:Parameter Name="comt" Type="String" />
                <asp:Parameter Name="dates" Type="String" />
                <asp:Parameter Name="sname" Type="String" />
                <asp:Parameter Name="semails" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="ID_Session_Label" Name="staffemail" PropertyName="Text" 
                    Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="fname" Type="String" />
                <asp:Parameter Name="comt" Type="String" />
                <asp:Parameter Name="dates" Type="String" />
                <asp:Parameter Name="sname" Type="String" />
                <asp:Parameter Name="semails" Type="String" />
                <asp:Parameter Name="fid" Type="Int32" />
            </UpdateParameters>
            </asp:SqlDataSource>
        <br />

         <h2> Send Delete request Of Content To Administrator </h2>

         <asp:Panel ID="Panel4" runat="server">
        <table width=100%>
              <tr>
              <td class="style3">Administrator Email</td>
              <td style="text-align: left">
                  <asp:TextBox ID="ADMIN_TEXTBOX" runat="server" Width="330px" 
                      BorderStyle="Solid" BorderWidth="1px" Enabled="False" 
                      ValidationGroup="ADLOG">admin@wsos.com</asp:TextBox>
                  &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                      ControlToValidate="ADMIN_TEXTBOX" Display="Dynamic" ErrorMessage="Required" 
                      SetFocusOnError="True" ValidationGroup="ADLOG">Required</asp:RequiredFieldValidator>
                  &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                      ControlToValidate="ADMIN_TEXTBOX" Display="Dynamic" 
                      ErrorMessage="Invalid Email Type" SetFocusOnError="True" 
                      ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                      ValidationGroup="ADLOG">Invalid Email Type</asp:RegularExpressionValidator>
              </td>
              </tr>

              <tr>
              <td class="style3">File ID</td>
              <td style="text-align: left">
                  <asp:TextBox ID="TextBox1" runat="server" BorderStyle="Solid" 
                      BorderWidth="1px" Width="125px" ValidationGroup="ADLOG"></asp:TextBox>
                
                  &nbsp;<asp:RequiredFieldValidator 
                      ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox1" 
                      Display="Dynamic" ErrorMessage="Required" SetFocusOnError="True" 
                      ValidationGroup="ADLOG">Required</asp:RequiredFieldValidator>
                  </td>
              </tr>

              <tr>
                  <td class="style3">
                      File Name</td>
                  <td style="text-align: left">
                      <asp:TextBox ID="TextBox2" runat="server" BorderStyle="Solid" 
                          BorderWidth="1px" Width="202px" ValidationGroup="ADLOG"></asp:TextBox>
                      &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                          ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Required" 
                          SetFocusOnError="True" ValidationGroup="ADLOG">Required</asp:RequiredFieldValidator>
                  </td>
              </tr>

              <tr>
              <td class="style3">
                  <asp:Button ID="Button1" runat="server" Text="Cancle" 
                      ValidationGroup="ADLOG2" BorderStyle="Solid" BorderWidth="1px" /></td>
              <td>
                  <asp:Button ID="LogDelReport" runat="server" onclick="LogDelReport_Click" 
                      Text="Log Del Report" ValidationGroup="ADLOG" />
                  </td>
              </tr>


                  <tr>
                      <td class="style3">
                          &nbsp;</td>
                      <td>
                          <asp:Label ID="Admin_Label1" runat="server"></asp:Label>
                      </td>
                  </tr>


              </table>

        </asp:Panel>
        <hr />
        <h2>Communications 

        <!-- 
        <asp:Panel ID="Panel1" runat="server">
        <table width=100%>
              <tr>
              <td class="style3">Send To:</td>
              <td style="text-align: left">
                  <asp:TextBox ID="Send_TO" runat="server" Width="330px" 
                      BorderStyle="Solid" BorderWidth="1px" Enabled="True"></asp:TextBox>
                  &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                      ControlToValidate="Send_TO" Display="Dynamic" ErrorMessage="Required" 
                      SetFocusOnError="True" ValidationGroup="Group1">Required</asp:RequiredFieldValidator>
                  &nbsp;<asp:RegularExpressionValidator ID="EmailExpression" runat="server" 
                      ControlToValidate="Send_TO" Display="Dynamic" 
                      ErrorMessage="Invalid Email Type" SetFocusOnError="True" 
                      ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                      ValidationGroup="Group1">Invalid Email Type</asp:RegularExpressionValidator>
              </td>
              </tr>

              <tr>
              <td class="style3">&nbsp;</td>
              <td style="text-align: left">
                  <asp:TextBox ID="File_ID_TextBox" runat="server" BorderStyle="Solid" 
                      BorderWidth="1px" Width="125px" Visible="False"></asp:TextBox>
                
                  &nbsp;<asp:RequiredFieldValidator 
                      ID="RequiredFieldValidator1" runat="server" ControlToValidate="File_ID_TextBox" 
                      Display="Dynamic" ErrorMessage="Required" SetFocusOnError="True" 
                      ValidationGroup="Group1" Visible="False">Required</asp:RequiredFieldValidator>
                  </td>
              </tr>

              <tr>
                  <td class="style3">
                      Message</td>
                  <td style="text-align: left">
                      <asp:TextBox ID="File_Name_TextBOX" runat="server" BorderStyle="Solid" 
                          BorderWidth="1px" Width="336px" Height="93px" TextMode="MultiLine"></asp:TextBox>
                      &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                          ControlToValidate="File_Name_TextBOX" Display="Dynamic" ErrorMessage="Required" 
                          SetFocusOnError="True" ValidationGroup="Group1">Required</asp:RequiredFieldValidator>
                  </td>
              </tr>

              <tr>
              <td class="style3">
                  <asp:Button ID="CancleButton" runat="server" Text="Cancle" 
                      ValidationGroup="Group2" BorderStyle="Solid" BorderWidth="1px" 
                      onclick="CancleButton_Click" /></td>
              <td>
                  <asp:Button ID="SendButton" runat="server" Text="Send Message" 
                      ValidationGroup="Group1" onclick="SendButton_Click" BorderStyle="Solid" 
                      BorderWidth="1px" /></td>
              </tr>


                  <tr>
                      <td class="style3">
                          &nbsp;</td>
                      <td>
                          <asp:Label ID="StatusLabel" runat="server"></asp:Label>
                      </td>
                  </tr>


              </table>

              <table width=100%>
              <tr>
              <td>Inbox Messages 
                  <asp:Button ID="inbox_GO" runat="server" Text="Go" onclick="inbox_GO_Click" /></td>
              <td>Outbox Messages 
                  <asp:Button ID="outbox_GO" runat="server" Text="Go" onclick="outbox_GO_Click" /></td>
              </tr>

              <tr>
                <td colspan=2> 
                    <asp:Panel ID="Panel2" runat="server" Visible="False">
                        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" 
                            AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" 
                            BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="id" 
                            DataSourceID="SqlDataSource3" GridLines="Vertical">
                            <AlternatingRowStyle BackColor="Gainsboro" />
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" />
                                <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" 
                                    SortExpression="id" />
                                <asp:BoundField DataField="msg" HeaderText="msg" SortExpression="msg" />
                                <asp:BoundField DataField="semail" HeaderText="semail" 
                                    SortExpression="semail" />
                                <asp:BoundField DataField="sname" HeaderText="sname" SortExpression="sname" />
                                <asp:BoundField DataField="sendto" HeaderText="sendto" 
                                    SortExpression="sendto" />
                                <asp:BoundField DataField="branch" HeaderText="branch" 
                                    SortExpression="branch" />
                                <asp:BoundField DataField="dates" HeaderText="dates" SortExpression="dates" />
                                <asp:BoundField DataField="times" HeaderText="times" SortExpression="times" />
                            </Columns>
                            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#0000A9" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#000065" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:wsosConnectionString %>" 
                            DeleteCommand="DELETE FROM [inbox] WHERE [id] = @original_id" 
                            InsertCommand="INSERT INTO [inbox] ([id], [msg], [semail], [sname], [sendto], [branch], [dates], [times]) VALUES (@id, @msg, @semail, @sname, @sendto, @branch, @dates, @times)" 
                            OldValuesParameterFormatString="original_{0}" 
                            SelectCommand="SELECT [id], [msg], [semail], [sname], [sendto], [branch], [dates], [times] FROM [inbox] WHERE ([sendto] = @sendto) ORDER BY [dates] DESC, [times] DESC" 
                            UpdateCommand="UPDATE [inbox] SET [msg] = @msg, [semail] = @semail, [sname] = @sname, [sendto] = @sendto, [branch] = @branch, [dates] = @dates, [times] = @times WHERE [id] = @original_id">
                            <DeleteParameters>
                                <asp:Parameter Name="original_id" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="id" Type="Int32" />
                                <asp:Parameter Name="msg" Type="String" />
                                <asp:Parameter Name="semail" Type="String" />
                                <asp:Parameter Name="sname" Type="String" />
                                <asp:Parameter Name="sendto" Type="String" />
                                <asp:Parameter Name="branch" Type="String" />
                                <asp:Parameter Name="dates" Type="String" />
                                <asp:Parameter Name="times" Type="String" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ID_Session_Label" Name="sendto" 
                                    PropertyName="Text" Type="String" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="msg" Type="String" />
                                <asp:Parameter Name="semail" Type="String" />
                                <asp:Parameter Name="sname" Type="String" />
                                <asp:Parameter Name="sendto" Type="String" />
                                <asp:Parameter Name="branch" Type="String" />
                                <asp:Parameter Name="dates" Type="String" />
                                <asp:Parameter Name="times" Type="String" />
                                <asp:Parameter Name="original_id" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </asp:Panel>
                    
                    <asp:Panel ID="Panel3" runat="server" Visible="False">
                        <asp:GridView ID="GridView4" runat="server" AllowPaging="True" 
                            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" 
                            DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" />
                                <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" 
                                    SortExpression="id" />
                                <asp:BoundField DataField="msg" HeaderText="msg" SortExpression="msg" />
                                <asp:BoundField DataField="semail" HeaderText="semail" 
                                    SortExpression="semail" />
                                <asp:BoundField DataField="sname" HeaderText="sname" SortExpression="sname" />
                                <asp:BoundField DataField="sendto" HeaderText="sendto" 
                                    SortExpression="sendto" />
                                <asp:BoundField DataField="branch" HeaderText="branch" 
                                    SortExpression="branch" />
                                <asp:BoundField DataField="dates" HeaderText="dates" SortExpression="dates" />
                                <asp:BoundField DataField="times" HeaderText="times" SortExpression="times" />
                            </Columns>
                            <EditRowStyle BackColor="#7C6F57" />
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#E3EAEB" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:wsosConnectionString %>" 
                            DeleteCommand="DELETE FROM [outbox] WHERE [id] = @original_id" 
                            InsertCommand="INSERT INTO [outbox] ([id], [msg], [semail], [sname], [sendto], [branch], [dates], [times]) VALUES (@id, @msg, @semail, @sname, @sendto, @branch, @dates, @times)" 
                            OldValuesParameterFormatString="original_{0}" 
                            SelectCommand="SELECT * FROM [outbox] WHERE ([semail] = @semail) ORDER BY [dates] DESC, [times] DESC" 
                            UpdateCommand="UPDATE [outbox] SET [msg] = @msg, [semail] = @semail, [sname] = @sname, [sendto] = @sendto, [branch] = @branch, [dates] = @dates, [times] = @times WHERE [id] = @original_id">
                            <DeleteParameters>
                                <asp:Parameter Name="original_id" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="id" Type="Int32" />
                                <asp:Parameter Name="msg" Type="String" />
                                <asp:Parameter Name="semail" Type="String" />
                                <asp:Parameter Name="sname" Type="String" />
                                <asp:Parameter Name="sendto" Type="String" />
                                <asp:Parameter Name="branch" Type="String" />
                                <asp:Parameter Name="dates" Type="String" />
                                <asp:Parameter Name="times" Type="String" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ID_Session_Label" Name="semail" 
                                    PropertyName="Text" Type="String" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="msg" Type="String" />
                                <asp:Parameter Name="semail" Type="String" />
                                <asp:Parameter Name="sname" Type="String" />
                                <asp:Parameter Name="sendto" Type="String" />
                                <asp:Parameter Name="branch" Type="String" />
                                <asp:Parameter Name="dates" Type="String" />
                                <asp:Parameter Name="times" Type="String" />
                                <asp:Parameter Name="original_id" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </asp:Panel> </td>
              </tr>
              </table>


        </asp:Panel> -->
    <hr />
    
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col4">
  <div id="footer">
    <p><marquee>Hello </marquee> </p>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col5">
  <div id="copyright">
<p class="fl_left">Copyright &copy; 2012-13 - All Rights Reserved <a href="www.infotechwebdeveloper.com"></a></p>
    <p class="fl_right">Developed by, S.S.V.P.S's. Students  </p>
    <br class="clear" />
  </div>
</div>
</form>
</body>
</html>
