<%@ Page Language="C#" AutoEventWireup="true" CodeFile="forgot_password.aspx.cs" Inherits="forgot_password" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" profile="http://gmpg.org/xfn/11">
<title>WSOS - Forgot Pasword</title>
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
    
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col3">
  <div id="container">
    <hr />
    <h2> Enter Details to generate your password:</h2>
       
        <table>
              <tr>
              <td class="style1">Select Role:</td>
              <td class="style6">
                  <asp:DropDownList ID="Roles_list" runat="server" BackColor="#66CCFF">
                      <asp:ListItem>Student</asp:ListItem>
                      <asp:ListItem>Teacher</asp:ListItem>
                      <asp:ListItem>Principal</asp:ListItem>
                      <asp:ListItem>Admin</asp:ListItem>
                  </asp:DropDownList>
                  <br />
                  </td>
              </tr>

                  <tr>
                      <td class="style1">
                          Email:</td>
                      <td class="style6">
                          <asp:TextBox ID="EmailIDTextBox" runat="server" Width="300px" 
                              BorderStyle="Solid" BorderWidth="1px" ValidationGroup="G1"></asp:TextBox>
                      &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                      ControlToValidate="AnswerTextBox" Display="Dynamic" ErrorMessage="Required" 
                      SetFocusOnError="True" ValidationGroup="G1" ForeColor="#FF0066">Required</asp:RequiredFieldValidator>
                          <br />
                      </td>
                  </tr>

                  <tr>
                      <td class="style1">
                          Select Question:</td>
                      <td class="style6">
                          <asp:DropDownList ID="secQue" runat="server" ValidationGroup="Group2" 
                              BackColor="#66CCFF">
                              <asp:ListItem>What is your Birth Place?</asp:ListItem>
                              <asp:ListItem Value="Computer">Your first mobile number?</asp:ListItem>
                              <asp:ListItem Value="Civil">What is your pet&#39;s name?</asp:ListItem>
                          </asp:DropDownList>
                          <br />
                      </td>
                  </tr>

              <tr>
              <td class="style1">Answer:</td>
              <td class="style6">
                  <asp:TextBox ID="AnswerTextBox" runat="server" ValidationGroup="G1" 
                      Width="300px" TextMode="Password" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                  &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                      ControlToValidate="AnswerTextBox" Display="Dynamic" ErrorMessage="Required" 
                      SetFocusOnError="True" ValidationGroup="G1" ForeColor="#FF0066">Required</asp:RequiredFieldValidator>
                  <br />
                  </td>
              </tr>


                  <tr>
                      <td class="style1">
                          </td>
                      <td class="style6">
                          <asp:Button ID="GeneratePassButton" runat="server" 
                              Text="Generate Password" ValidationGroup="G1" 
                              onclick="GeneratePassButton_Click" BorderStyle="Double" 
                              BorderWidth="1px" />
                      </td>
                  </tr>
                  <tr>
                      <td class="style1">
                          &nbsp;</td>
                      <td class="style6">
                          <asp:Label ID="PasswordStatusLable" runat="server"></asp:Label>
                      </td>
                  </tr>


              </table>
    
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
