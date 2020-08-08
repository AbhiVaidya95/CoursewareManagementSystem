<%@ Page Language="C#" AutoEventWireup="true" CodeFile="psnotification.aspx.cs" Inherits="psnotification" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" profile="http://gmpg.org/xfn/11">
<title>WSOS - PRINCIPAL Notification</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="styles/layout.css" type="text/css" />
    <style type="text/css">
        .style2
        {
            width: 435px;
        }
        .style3
        {
            width: 247px;
        }
        .style4
        {
            width: 62px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
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
      <li class="first">Welcome Principal Sir: </li>
      <asp:Label ID="Name_Session_Label" runat="server"></asp:Label>
        
        <li>&nbsp;| </li>
        <asp:Label ID="ID_Session_Label" runat="server"></asp:Label>
        
        <li> | 
            <asp:HyperLink ID="HyperLink1" runat="server" 
                NavigateUrl="account_settings.aspx">Account Settings</asp:HyperLink>
            | 
            <asp:Button ID="Logout_Button" runat="server" Text="Logout..." 
                onclick="Logout_Button_Click" />&nbsp;</li>
        <asp:Label ID="Page_Label" runat="server" Text="principal_home.aspx" 
            Visible="False"></asp:Label>
    </ul>
  </div>
</div>
<!-- ############################### DOCUMENT BODY ######################################### -->
<div class="wrapper col3">
  <div id="container">
        <center>
        <br />
        <table width=100%>
        
        <tr>
            <td> 
                <asp:Button ID="Spec_Button1" runat="server" BorderStyle="Solid" 
                    BorderWidth="1px" onclick="Spec_Button1_Click" Text="Send Specific" />
&nbsp;
                <asp:Button ID="Roles_Button2" runat="server" BorderStyle="Solid" 
                    BorderWidth="1px" onclick="Roles_Button2_Click" Text="Send To Desktop" />
                <br /> <br />
            </td>
        </tr>

        <tr>
            <td> 
                <asp:Panel ID="Panel1" runat="server" BorderStyle="None" 
                    Visible="False">
            
            <h2>Communications 


        <asp:Panel ID="Panel3" runat="server">
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
                    <asp:Panel ID="Panel4" runat="server" Visible="False">
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
                    
                    <asp:Panel ID="Panel5" runat="server" Visible="False">
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


        </asp:Panel>
    <hr />



            </asp:Panel></td>
        </tr>

        <tr>
            <td> 
                <asp:Panel ID="Panel2" runat="server" BorderStyle="None" 
                    Visible="False">
            
                <table width="60%">
                    <tr>
                        <td class="style4">
                            Send To
                        </td>
                        <td class="style3">
                            <asp:DropDownList ID="DropDownList1" runat="server">
                                <asp:ListItem>All</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style4" valign="top">
                            Message
                        </td>
                        <td class="style3">
                            <asp:TextBox ID="TextBox4" runat="server" BorderStyle="Solid" BorderWidth="1px" 
                                Height="79px" TextMode="MultiLine" ValidationGroup="Gx" Width="242px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="Required" 
                                ValidationGroup="Gx"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                        </td>
                        <td class="style3">
                            <asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text="Send" 
                                ValidationGroup="Gx" />
                            &nbsp;<asp:Button ID="Button4" runat="server" Text="Calcel" />
&nbsp;
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                        </td>
                        <td class="style3">
                            <asp:Label ID="Status_lABLE0" runat="server"></asp:Label>
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            </asp:Panel></td>
        
        </tr>
        
        </table>
</center>
 </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col4">
  <div id="footer">
    <p> 
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:wsosConnectionString %>" 
            DeleteCommand="DELETE FROM [noti] WHERE [id] = @id" 
            InsertCommand="INSERT INTO [noti] ([id], [uid], [roles], [msg], [dates], [times]) VALUES (@id, @uid, @roles, @msg, @dates, @times)" 
            SelectCommand="SELECT * FROM [noti] ORDER BY [dates] DESC, [times] DESC" 
            UpdateCommand="UPDATE [noti] SET [uid] = @uid, [roles] = @roles, [msg] = @msg, [dates] = @dates, [times] = @times WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="id" Type="Int32" />
                <asp:Parameter Name="uid" Type="String" />
                <asp:Parameter Name="roles" Type="String" />
                <asp:Parameter Name="msg" Type="String" />
                <asp:Parameter Name="dates" Type="String" />
                <asp:Parameter Name="times" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="uid" Type="String" />
                <asp:Parameter Name="roles" Type="String" />
                <asp:Parameter Name="msg" Type="String" />
                <asp:Parameter Name="dates" Type="String" />
                <asp:Parameter Name="times" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" 
            ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="uid" HeaderText="To User" SortExpression="uid" />
                <asp:BoundField DataField="roles" HeaderText="To Roles" 
                    SortExpression="roles" />
                <asp:BoundField DataField="msg" HeaderText="Message" SortExpression="msg" />
                <asp:BoundField DataField="dates" HeaderText="Date" SortExpression="dates" />
                <asp:BoundField DataField="times" HeaderText="Time" SortExpression="times" />
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
    
    </p>
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
