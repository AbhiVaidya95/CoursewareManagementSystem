<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" profile="http://gmpg.org/xfn/11">
<title> WSOS </title>
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
        <li><a class="active" href="index.aspx"> Home </a></li>
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
      <li class="first">Welcome To:</li>
      
      <li class="current">Guest</li>
    </ul>
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col3">
  <div id="container">
    <div id="content">
      <h1>From Principal's Desk</h1>
          <asp:Label ID="Label1" runat="server" Text="All" Visible="False"></asp:Label>
        
      <hr /> <marquee direction="up" onmouseover="this.stop()" onmouseout="this.start()" scrolldelay="100" direction="up" scrollamount="4">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" 
            GridLines="Horizontal" Width="100%">
            <Columns>
                <asp:BoundField DataField="msg" HeaderText="Notifications" 
                    SortExpression="msg" />
                <asp:BoundField DataField="dates" HeaderText="Date" SortExpression="dates" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:wsosConnectionString %>" 
            SelectCommand="SELECT [msg], [dates] FROM [noti] WHERE ([roles] = @roles) ORDER BY [dates] DESC, [times] DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="Label1" Name="roles" PropertyName="Text" 
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        </marquee>
      <hr />
    </div>
    <div id="column">
      <div class="subnav">
        <h2>User's Login </h2>
        
        <center>
    <asp:Button ID="StudentPanel_Button" runat="server" Text="Student" BorderStyle="Solid" 
                    BorderWidth="1px" onclick="StudentPanel_Button_Click"></asp:Button> 
    <asp:Button ID="StaffPanel_Button" runat="server" Text="Staff" BorderStyle="Solid" 
                    BorderWidth="1px" onclick="StaffPanel_Button_Click"></asp:Button> 
    <asp:Button ID="PrincipalPanel_Button" runat="server" Text="Principal" BorderStyle="Solid" 
                    BorderWidth="1px" onclick="PrincipalPanel_Button_Click"></asp:Button> 
                    <br />  <br />
    <asp:Button ID="AdminPanel_Button" runat="server" Text="Admin" BorderStyle="Solid" 
                    BorderWidth="1px" onclick="AdminPanel_Button_Click"></asp:Button>
            </center>
                <br />
                <br />
                <asp:Panel ID="Student_Panel" runat="server" BorderStyle="Dashed" 
                    BorderWidth="1px" Width="100%">
                    <center><p><B>Login For Students</B></p></center>
                  <table width=100%>
                    <tr>
                        <td><center> Student ID </center></td>
                    </tr>
                    <tr>
                        <td><center>
                            <asp:TextBox ID="Student_TextBox" runat="server" BorderStyle="Solid" 
                                BorderWidth="1px" ValidationGroup="StudentGroup"></asp:TextBox> 
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="Student_TextBox" Display="Dynamic" ErrorMessage="Required" 
                                SetFocusOnError="True" ValidationGroup="StudentGroup">Required</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="EmailExpression" runat="server" 
                                ControlToValidate="Student_TextBox" Display="Dynamic" 
                                ErrorMessage="Invalid Email Type" SetFocusOnError="True" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                ValidationGroup="StudentGroup">Invalid Email Type</asp:RegularExpressionValidator>
                            </center>
                        </td>
                    </tr>
                    <tr>
                        <td><center>Password</center></td>
                    </tr>
                    <tr>
                        <td class="style1"> <center>
                            <asp:TextBox ID="Student_TextBox_password" runat="server" BorderStyle="Solid" BorderWidth="1px" 
                                TextMode="Password" ValidationGroup="StudentGroup"></asp:TextBox> 
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ControlToValidate="Student_TextBox_password" Display="Dynamic" 
                                ErrorMessage="Required" SetFocusOnError="True" ValidationGroup="StudentGroup">Required</asp:RequiredFieldValidator>
                            </center>
                        </td>
                    </tr>

                         <tr>
                             <td> <center>
                                 <asp:Button ID="Student_login_Button" runat="server" BorderStyle="Solid" BorderWidth="1px" 
                                     Text="Login!" ValidationGroup="StudentGroup" 
                                     onclick="Student_login_Button_Click" /> &nbsp;<asp:Button ID="Student_Forgot_Button" 
                                     runat="server" BorderStyle="Solid" BorderWidth="1px" 
                                     Text="Forgot Password" onclick="Student_Forgot_Button_Click" />
                                 <br />
                                 <asp:Label ID="Student_Status_Lable" runat="server"></asp:Label>
                                 </center>
                             </td>
                         </tr>
                         <tr>
                             <td> <center>
                                 <asp:HyperLink ID="StudentCreatepage" runat="server" 
                                     NavigateUrl="create_account.aspx">Create Student Account</asp:HyperLink> </center>
                             </td>
                         </tr>

                    </table>
                   
                </asp:Panel>
                
                <asp:Panel ID="Panel1" runat="server" BorderStyle="Dashed" 
                    BorderWidth="1px" Visible="False">
                    <center><p><B>Login For Staff</B></p></center>
                   
                     <table width=100%>
                    <tr>
                        <td><center>Staff ID </center></td>
                    </tr>
                    <tr>
                        <td><center>
                            <asp:TextBox ID="Staff_TextBox" runat="server" BorderStyle="Solid" 
                                BorderWidth="1px" ValidationGroup="StaffGroup"></asp:TextBox> 
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="Staff_TextBox" Display="Dynamic" ErrorMessage="Required" 
                                SetFocusOnError="True" ValidationGroup="StaffGroup">Required</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="EmailExpression0" runat="server" 
                                ControlToValidate="Staff_TextBox" Display="Dynamic" 
                                ErrorMessage="Invalid Email Type" SetFocusOnError="True" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                ValidationGroup="StaffGroup">Invalid Email Type</asp:RegularExpressionValidator>
                            </center>  
                        </td>
                    </tr>
                    <tr>
                        <td><center>Password </center></td>
                    </tr>
                    <tr>
                        <td class="style2"> <center>
                            <asp:TextBox ID="Staff_PasswordTextBox" runat="server" BorderStyle="Solid" BorderWidth="1px" 
                                TextMode="Password" ValidationGroup="StaffGroup"></asp:TextBox> 
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                ControlToValidate="Staff_PasswordTextBox" Display="Dynamic" 
                                ErrorMessage="Required" SetFocusOnError="True" ValidationGroup="StaffGroup">Required</asp:RequiredFieldValidator>
                            </center>
                        </td>
                    </tr>

                         <tr>
                             <td>
                                 <center>  </center></td>
                         </tr>
                         <tr>
                             <td>
                                 <center>  
                                     <asp:Button ID="Staff_LoginButton" runat="server" BorderStyle="Solid" 
                                         BorderWidth="1px" Text="Login!" ValidationGroup="StaffGroup" 
                                         onclick="Staff_LoginButton_Click" />
                                     <asp:Button ID="Staff_Forgot_Button" runat="server" BorderStyle="Solid" 
                                         BorderWidth="1px" Text="Forgot Password" 
                                         onclick="Staff_Forgot_Button_Click" />
                                     <br />
                                     <asp:Label ID="Staff_Status_Lable" runat="server"></asp:Label>
                                 </center></td>
                         </tr>

                    </table>

                </asp:Panel>
            
            <asp:Panel ID="Panel2" runat="server" BorderStyle="Dashed" 
                    BorderWidth="1px" Visible="False">
                    <center><p><B>Login For Principal</B></p></center>
                     <table width=100%>
                    <tr>
                        <td><center> Principal ID </center> </td>
                    </tr>
                    <tr>
                        <td><center>
                            <asp:TextBox ID="Principal_TextBox" runat="server" BorderStyle="Solid" 
                                BorderWidth="1px" ValidationGroup="PrincipalGroup"></asp:TextBox> 
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="Principal_TextBox" Display="Dynamic" ErrorMessage="Required" 
                                SetFocusOnError="True" ValidationGroup="PrincipalGroup">Required</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="EmailExpression1" runat="server" 
                                ControlToValidate="Principal_TextBox" Display="Dynamic" 
                                ErrorMessage="Invalid Email Type" SetFocusOnError="True" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                ValidationGroup="PrincipalGroup">Invalid Email Type</asp:RegularExpressionValidator>
                            </center>
</td>
                    </tr>
                    <tr>
                        <td><center>Password </center>  </td>
                    </tr>
                    <tr>
                        <td class="style2"> <center>
                            <asp:TextBox ID="Principal_Password_TextBox" runat="server" BorderStyle="Solid" 
                                BorderWidth="1px" TextMode="Password" ValidationGroup="PrincipalGroup"></asp:TextBox> 
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                ControlToValidate="Principal_Password_TextBox" Display="Dynamic" 
                                ErrorMessage="Required" SetFocusOnError="True" ValidationGroup="PrincipalGroup">Required</asp:RequiredFieldValidator>
                            </center>
</td>
                    </tr>

                         <tr>
                             <td>
                                 <center> </center></td>
                         </tr>
                         <tr>
                             <td>
                                 <center> 
                                     <asp:Button ID="Principal_loginButton" runat="server" BorderStyle="Solid" 
                                         BorderWidth="1px" Text="Login!" ValidationGroup="PrincipalGroup" 
                                         onclick="Principal_loginButton_Click" />
                                     <asp:Button ID="Principal_ForgotButton" runat="server" BorderStyle="Solid" 
                                         BorderWidth="1px" Text="Forgot Password" 
                                         onclick="Principal_ForgotButton_Click" />
                                     <br />
                                     <asp:Label ID="Principal_Status_Lable" runat="server"></asp:Label>
                                 </center></td>
                         </tr>

                    </table>

                </asp:Panel>

                <asp:Panel ID="Panel3" runat="server" BorderStyle="Dashed" 
                    BorderWidth="1px" Visible="False">
                    <center><p><B>Login For Admin</B></p></center>
                     <table width=100%>
                    <tr>
                        <td><center> Admin ID </center> </td>
                    </tr>
                    <tr>
                        <td><center> 
                            <asp:TextBox ID="Admin_TextBox" runat="server" BorderStyle="Solid" 
                                BorderWidth="1px" ValidationGroup="AdminGroup"></asp:TextBox> 
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="Admin_TextBox" Display="Dynamic" ErrorMessage="Required" 
                                SetFocusOnError="True" ValidationGroup="AdminGroup">Required</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="EmailExpression2" runat="server" 
                                ControlToValidate="Admin_TextBox" Display="Dynamic" 
                                ErrorMessage="Invalid Email Type" SetFocusOnError="True" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                ValidationGroup="AdminGroup">Invalid Email Type</asp:RegularExpressionValidator>
                            </center>  
                        </td>
                    </tr>
                    <tr>
                        <td><center> Password </center></td>
                    </tr>
                    <tr>
                        <td class="style2"> <center>
                            <asp:TextBox ID="Admin_passwordTextBox" runat="server" BorderStyle="Solid" BorderWidth="1px" 
                                TextMode="Password" ValidationGroup="AdminGroup"></asp:TextBox> 
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                ControlToValidate="Admin_passwordTextBox" Display="Dynamic" 
                                ErrorMessage="Required" SetFocusOnError="True" ValidationGroup="AdminGroup">Required</asp:RequiredFieldValidator>
                            </center>
                        </td>
                    </tr>

                         <tr>
                             <td>
                                 <center> </center></td>
                         </tr>
                         <tr>
                             <td>
                                 <center>  
                                     <asp:Button ID="Admin_loginButton" runat="server" BorderStyle="Solid" 
                                         BorderWidth="1px" Text="Login!" ValidationGroup="AdminGroup" 
                                         onclick="Admin_loginButton_Click" />
                                     <asp:Button ID="Admin_ForgotButton" runat="server" BorderStyle="Solid" 
                                         BorderWidth="1px" Text="Forgot Password" 
                                         onclick="Admin_ForgotButton_Click" />
                                     <br />
                                     <asp:Label ID="Admin_Status_Lable" runat="server"></asp:Label>
                                 </center></td>
                         </tr>

                    </table>

                </asp:Panel>
                <hr />


      </div>
     
    </div>
    <br class="clear" />
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
