<%@ Page Language="C#" AutoEventWireup="true" CodeFile="account_settings.aspx.cs" Inherits="account_settings" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" profile="http://gmpg.org/xfn/11">
<title>WSOS - Account Settings  </title>
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
        <li><a class="active" href="about.aspx">About Us</a></li>
      </ul>
    </div>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col2">
  <div id="breadcrumb">
    <ul>
       <li class="first">Account Settings For: </li>
      <asp:Label ID="Name_Session_Label" runat="server"></asp:Label>
        
        <li>&nbsp;| </li>
        <asp:Label ID="ID_Session_Label" runat="server"></asp:Label>
        
        <li> | 
            <asp:Button ID="Logout_Button" runat="server" Text="Logout..." onclick="Logout_Button_Click" 
                 />&nbsp;</li>
        <asp:Label ID="Page_Label1" runat="server" Visible="False"></asp:Label>
        <li>&nbsp;| </li>
        <asp:Button ID="Back_Button" runat="server" onclick="Back_Button_Click" 
            Text="Home..." />
    </ul>
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col3">
  <div id="container">
    <hr />
     <asp:Panel ID="Panel1" runat="server" BorderStyle="Dashed" BorderWidth="1px">
              <br />&nbsp; <b>Change Password</b> <hr />

              <table>
              <tr>
              <td>Current Password</td>
              <td>
                  <asp:TextBox ID="CurrentPassTextBox" runat="server" ValidationGroup="Group1" 
                      TextMode="Password" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox></td>
              <td class="style5">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                      ControlToValidate="CurrentPassTextBox" Display="Dynamic" 
                      ErrorMessage="Required" SetFocusOnError="True" ValidationGroup="Group1">Required</asp:RequiredFieldValidator>
                  </td>
              </tr>

              <tr>
              <td>New Password</td>
              <td>
                  <asp:TextBox ID="NewPassTextBox" runat="server" ValidationGroup="Group1" 
                      TextMode="Password" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox></td>
              <td class="style5">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                      ControlToValidate="NewPassTextBox" Display="Dynamic" ErrorMessage="Required" 
                      SetFocusOnError="True" ValidationGroup="Group1">Required</asp:RequiredFieldValidator>
                  </td>
              </tr>

              <tr>
              <td>Conform Password</td>
              <td>
                  <asp:TextBox ID="ConformPasTextBox" runat="server" ValidationGroup="Group1" 
                      TextMode="Password" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                  </td>
              <td class="style5">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                      ControlToValidate="ConformPasTextBox" Display="Dynamic" ErrorMessage="Required" 
                      SetFocusOnError="True" ValidationGroup="Group1">Required</asp:RequiredFieldValidator>
                  &nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" 
                      ControlToCompare="NewPassTextBox" ControlToValidate="ConformPasTextBox" 
                      ErrorMessage="New and Conform Password dose not match" ValidationGroup="Group1">New and Conform Password dose not match</asp:CompareValidator>
                  </td>
              </tr>

              <tr>
              <td>
                  <asp:Button ID="CancelButton" runat="server" Text="Cancle" 
                      ValidationGroup="Group0" onclick="CancelButton_Click" BorderStyle="Solid" 
                      BorderWidth="1px" />
                  </td>
              <td>
                  <asp:Button ID="ChangePassButton" runat="server" Text="Change Password" 
                      ValidationGroup="Group1" onclick="ChangePassButton_Click" 
                      BorderStyle="Solid" BorderWidth="1px" />
                  &nbsp;</td>
              <td class="style5"></td>
              </tr>

                  <tr>
                      <td>
                          &nbsp;</td>
                      <td>
                          <asp:Label ID="PasswordStatusLabel" runat="server"></asp:Label>
                      </td>
                      <td class="style5">
                          &nbsp;</td>
                  </tr>

              </table>

              </asp:Panel>
              <br /> <br />

               <asp:Panel ID="Panel2" runat="server" BorderStyle="Dashed" BorderWidth="1px">
              <br />&nbsp; <b>Change Security Quesion and Answer</b> <hr />

              <table>
              <tr>
              <td>Select Question</td>
              <td class="style6">
                  <asp:DropDownList ID="secQue" runat="server" ValidationGroup="Group2" 
                      BackColor="#CCCCFF">
                      <asp:ListItem>What is your Birth Place?</asp:ListItem>
                      <asp:ListItem Value="Computer">Your first mobile number?</asp:ListItem>
                      <asp:ListItem Value="Civil">What is your pet&#39;s name?</asp:ListItem>
                  </asp:DropDownList>
                  </td>
              </tr>

              <tr>
              <td>Answer</td>
              <td class="style6">
                  <asp:TextBox ID="AnswerTextBox" runat="server" ValidationGroup="Group2" 
                      Width="300px" TextMode="Password" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                  &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                      ControlToValidate="AnswerTextBox" Display="Dynamic" ErrorMessage="Required" 
                      SetFocusOnError="True" ValidationGroup="Group2">Required</asp:RequiredFieldValidator>
                  </td>
              </tr>


                  <tr>
                      <td>
                          <asp:Button ID="CancelButton0" runat="server" Text="Cancle" 
                              ValidationGroup="Group0" onclick="CancelButton0_Click" BorderStyle="Solid" 
                              BorderWidth="1px" />
                      </td>
                      <td class="style6">
                          <asp:Button ID="ChangePassButton0" runat="server" 
                              Text="Change Question and Answer" ValidationGroup="Group2" 
                              onclick="ChangePassButton0_Click" BorderStyle="Solid" BorderWidth="1px" />
                      </td>
                  </tr>
                  <tr>
                      <td>
                          &nbsp;</td>
                      <td class="style6">
                          <asp:Label ID="QuestionStatusLabel" runat="server"></asp:Label>
                      </td>
                  </tr>
        </table>
        </asp:Panel>
    
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
