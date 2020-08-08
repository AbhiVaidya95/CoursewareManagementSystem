<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_home.aspx.cs" Inherits="admin_home" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" profile="http://gmpg.org/xfn/11">
<title>WSOS - ADMINISTRATOR</title>
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
       <li class="first">Welcome: </li>
      <asp:Label ID="Name_Session_Label" runat="server"></asp:Label>
        
        <li>&nbsp;| </li>
        <asp:Label ID="ID_Session_Label" runat="server"></asp:Label>
        
        <li> | 
            <asp:HyperLink ID="HyperLink2" runat="server" 
                NavigateUrl="create_principal.aspx">Create Principal</asp:HyperLink>
&nbsp;| 
            <asp:HyperLink ID="HyperLink1" runat="server" 
                NavigateUrl="account_settings.aspx">Account Settings</asp:HyperLink>
            | 
            <asp:Button ID="Logout_Button" runat="server" Text="Logout..." 
                onclick="Logout_Button_Click" />&nbsp;</li>
        <asp:Label ID="Page_Lable" runat="server" Text="admin_home.aspx" 
            Visible="False"></asp:Label>
    </ul>
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col3">
  <div id="container">
    <hr />
    
        <center> <h2>Messages From Staff For Content Delete</h2> </center>

        <asp:GridView ID="GridView1" runat="server" CellPadding="4" 
        ForeColor="#333333" Width="100%" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="fid" DataSourceID="SqlDataSource1" 
        GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="fid" HeaderText="fid" ReadOnly="True" 
                    SortExpression="fid" />
                <asp:BoundField DataField="fname" HeaderText="fname" SortExpression="fname" />
                <asp:BoundField DataField="semail" HeaderText="semail" 
                    SortExpression="semail" />
                <asp:BoundField DataField="sname" HeaderText="sname" SortExpression="sname" />
                <asp:BoundField DataField="branch" HeaderText="branch" 
                    SortExpression="branch" />
                <asp:BoundField DataField="dates" HeaderText="dates" SortExpression="dates" />
                <asp:BoundField DataField="times" HeaderText="times" SortExpression="times" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" 
                HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" ForeColor="#333333" Font-Bold="True" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:wsosConnectionString %>" 
        
          
          
          SelectCommand="SELECT * FROM [adminmsg] ORDER BY [dates] DESC, [times] DESC" 
          DeleteCommand="DELETE FROM [adminmsg] WHERE [fid] = @fid" 
          InsertCommand="INSERT INTO [adminmsg] ([fid], [fname], [semail], [sname], [branch], [dates], [times]) VALUES (@fid, @fname, @semail, @sname, @branch, @dates, @times)" 
          UpdateCommand="UPDATE [adminmsg] SET [fname] = @fname, [semail] = @semail, [sname] = @sname, [branch] = @branch, [dates] = @dates, [times] = @times WHERE [fid] = @fid">
    <DeleteParameters>
        <asp:Parameter Name="fid" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="fid" Type="Int32" />
        <asp:Parameter Name="fname" Type="String" />
        <asp:Parameter Name="semail" Type="String" />
        <asp:Parameter Name="sname" Type="String" />
        <asp:Parameter Name="branch" Type="String" />
        <asp:Parameter Name="dates" Type="String" />
        <asp:Parameter Name="times" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="fname" Type="String" />
        <asp:Parameter Name="semail" Type="String" />
        <asp:Parameter Name="sname" Type="String" />
        <asp:Parameter Name="branch" Type="String" />
        <asp:Parameter Name="dates" Type="String" />
        <asp:Parameter Name="times" Type="String" />
        <asp:Parameter Name="fid" Type="Int32" />
    </UpdateParameters>
      </asp:SqlDataSource>
<br />

<h4><center> Select &amp; Fill The Following Details To be Deleted </center></h4>
        
        <table width=100%>
        <tr>
        <td class="style12" colspan="2">
                Select Branch:</td>
        <td class="style12" colspan="2">
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    DataSourceID="SqlDataSource2" DataTextField="branch" DataValueField="branch">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:wsosConnectionString %>" 
                    SelectCommand="SELECT [branch] FROM [adminmsg] ORDER BY [branch]">
                </asp:SqlDataSource>
            </td>
        <td class="style17">
            Content ID&nbsp;<asp:TextBox ID="Content_ID" runat="server" BorderStyle="Solid" 
                BorderWidth="1px" ValidationGroup="Group1"></asp:TextBox>
            &nbsp;
                <asp:RequiredFieldValidator ID="NameRequired" runat="server" 
                    ControlToValidate="Content_ID" Display="Dynamic" 
                    ErrorMessage="Required" SetFocusOnError="True" 
                    ValidationGroup="Group1">Required</asp:RequiredFieldValidator>
            </td>
        <td class="style7" colspan="2">
            <asp:Button ID="Get_Content_Name" runat="server" BorderStyle="Solid" BorderWidth="1px" 
                Text="Get Content Name" onclick="Get_Content_Name_Click" 
                ValidationGroup="Group1" />
            </td>

        </tr>
        <tr>
        <td colspan="7" class="style7"> <center> 
            <asp:Label ID="Content_name_Label" 
                runat="server" Font-Size="X-Large"></asp:Label> </center></td>

        </tr>
        <tr>
        <td class="style13">Admin Password</td>
        <td class="style16" colspan="2">
            <asp:TextBox ID="Admin_pass_TextBox" runat="server" BorderStyle="Solid" 
                BorderWidth="1px" ValidationGroup="GroupN" TextMode="Password"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="NameRequired1" runat="server" 
                    ControlToValidate="Admin_pass_TextBox" Display="Dynamic" 
                    ErrorMessage="Required" SetFocusOnError="True" 
                    ValidationGroup="GroupN" ForeColor="Red">Required</asp:RequiredFieldValidator>
            </td>
        <td class="style8">Principal ID</td>
        <td class="style9">
            <asp:TextBox ID="Principal_ID_TextBox" runat="server" BorderStyle="Solid" BorderWidth="1px" 
                Width="220px" ValidationGroup="GroupN"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="NameRequired0" runat="server" 
                    ControlToValidate="Principal_ID_TextBox" Display="Dynamic" 
                    ErrorMessage="Required" SetFocusOnError="True" 
                    ValidationGroup="GroupN" ForeColor="Red">Required</asp:RequiredFieldValidator>
            </td>
        <td class="style15">Principal Password</td>

        <td class="style8">
            <asp:TextBox ID="Principal_PASS_TextBox" runat="server" BorderStyle="Solid" 
                BorderWidth="1px" ValidationGroup="GroupN" TextMode="Password"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="NameRequired2" runat="server" 
                    ControlToValidate="Principal_PASS_TextBox" Display="Dynamic" 
                    ErrorMessage="Required" SetFocusOnError="True" 
                    ValidationGroup="GroupN" ForeColor="Red">Required</asp:RequiredFieldValidator>
            </td>

        </tr>
        <tr>
        <td class="style8" colspan="7"> <center> Make Sure About the Content Name And Content ID Bedore Deleting<br /> 
            <asp:Button ID="DeleteContent_Button" runat="server" 
                Text="Delete Content" BorderStyle="Solid" BorderWidth="1px" 
                Font-Size="Large" onclick="Button4_Click" ValidationGroup="GroupN"></asp:Button> </center></td>

        </tr>
        <tr>
        <td class="style8" colspan="7"><center> 
            <asp:Label ID="ContentDeleteStatus_lable" 
                runat="server" ForeColor="#009933"></asp:Label> </center></td>

        </tr>
        </table>

        <h2>Communications 


        <asp:Panel ID="Panel1" runat="server">
        <table width=100%>
              <tr>
              <td class="style3">Send To:</td>
              <td style="text-align: left">
                  <asp:TextBox ID="Send_TO" runat="server" Width="330px" 
                      BorderStyle="Solid" BorderWidth="1px" Enabled="True" ValidationGroup="cmn"></asp:TextBox>
                  &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                      ControlToValidate="Send_TO" Display="Dynamic" ErrorMessage="Required" 
                      SetFocusOnError="True" ValidationGroup="cmn">Required</asp:RequiredFieldValidator>
                  &nbsp;<asp:RegularExpressionValidator ID="EmailExpression" runat="server" 
                      ControlToValidate="Send_TO" Display="Dynamic" 
                      ErrorMessage="Invalid Email Type" SetFocusOnError="True" 
                      ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                      ValidationGroup="cmn">Invalid Email Type</asp:RegularExpressionValidator>
              </td>
              </tr>

              <tr>
              <td class="style3">&nbsp;</td>
              <td style="text-align: left">
                  <asp:TextBox ID="File_ID_TextBox" runat="server" BorderStyle="Solid" 
                      BorderWidth="1px" Width="125px" Visible="False" ValidationGroup="cmn"></asp:TextBox>
                
                  &nbsp;<asp:RequiredFieldValidator 
                      ID="RequiredFieldValidator1" runat="server" ControlToValidate="File_ID_TextBox" 
                      Display="Dynamic" ErrorMessage="Required" SetFocusOnError="True" 
                      ValidationGroup="cmn" Visible="False">Required</asp:RequiredFieldValidator>
                  </td>
              </tr>

              <tr>
                  <td class="style3">
                      Message</td>
                  <td style="text-align: left">
                      <asp:TextBox ID="File_Name_TextBOX" runat="server" BorderStyle="Solid" 
                          BorderWidth="1px" Width="336px" Height="93px" TextMode="MultiLine" 
                          ValidationGroup="cmn"></asp:TextBox>
                      &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                          ControlToValidate="File_Name_TextBOX" Display="Dynamic" ErrorMessage="Required" 
                          SetFocusOnError="True" ValidationGroup="cmn">Required</asp:RequiredFieldValidator>
                  </td>
              </tr>

              <tr>
              <td class="style3">
                  <asp:Button ID="CancleButton" runat="server" Text="Cancle" 
                      ValidationGroup="Group2" BorderStyle="Solid" BorderWidth="1px" 
                      onclick="CancleButton_Click" /></td>
              <td>
                  <asp:Button ID="SendButton" runat="server" Text="Send Message" 
                      ValidationGroup="cmn" onclick="SendButton_Click" BorderStyle="Solid" 
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


        </asp:Panel>

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
