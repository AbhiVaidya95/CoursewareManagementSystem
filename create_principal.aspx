<%@ Page Language="C#" AutoEventWireup="true" CodeFile="create_principal.aspx.cs" Inherits="create_principal" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" profile="http://gmpg.org/xfn/11">
<title>WSOS </title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="styles/layout.css" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 271px;
        }
        .style2
        {
            width: 245px;
        }
    </style>
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
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="admin_home.aspx">Back</asp:HyperLink>
&nbsp;|&nbsp; 
            <asp:Button ID="Logout_Button" runat="server" Text="Logout..." 
                onclick="Logout_Button_Click" />&nbsp;</li>
    </ul>
  </div>
</div>
<!-- ################################# DOCUMENT BODY ################################################ -->
<div class="wrapper col3">
  <div id="container">
    <hr />
    
    <h2> Create Principal Account</h2>
         <table width="100%">
        <tr>
            <td class="style2">Full Name (Last Name and First Name)</td>
            <td class="style1">
                <asp:TextBox ID="FullNameTextBox" runat="server" Width="300px" 
                    ValidationGroup="Group1" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox> </td>
            <td>
                <asp:RequiredFieldValidator ID="NameRequired" runat="server" 
                    ControlToValidate="FullNameTextBox" Display="Dynamic" 
                    ErrorMessage="Name Required" SetFocusOnError="True" 
                    ValidationGroup="Group1">Name Required</asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="NameExpression" runat="server" 
                    ControlToValidate="FullNameTextBox" Display="Dynamic" 
                    ErrorMessage="Invalid Name Type" SetFocusOnError="True" 
                    ValidationExpression="^[a-zA-Z''-'\s]{1,40}$" ValidationGroup="Group1">Invalid Name Type</asp:RegularExpressionValidator>
            </td>
        </tr>
        
       <tr>
            <td class="style2"> Email ID</td>
            <td class="style1"> 
                <asp:TextBox ID="EmailID" runat="server" Width="300px" ValidationGroup="Group1" 
                    BorderStyle="Solid" BorderWidth="1px"></asp:TextBox> </td>
            <td> 
                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                    ControlToValidate="EmailID" Display="Dynamic" ErrorMessage="Email Required" 
                    SetFocusOnError="True" ValidationGroup="Group1">Email Required</asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="EmailExpression" runat="server" 
                    ControlToValidate="EmailID" Display="Dynamic" ErrorMessage="Invalid Email Type" 
                    SetFocusOnError="True" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    ValidationGroup="Group1">Invalid Email Type</asp:RegularExpressionValidator>
            &nbsp;<asp:RequiredFieldValidator ID="EmailRequired0" runat="server" 
                    ControlToValidate="EmailID" Display="Dynamic" ErrorMessage="Email Required" 
                    SetFocusOnError="True" ValidationGroup="Group22">Email Required</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2"> Contact Number (Mobile)</td>
            <td class="style1"> 
                <asp:TextBox ID="Mobile" runat="server" Width="300px" ValidationGroup="Group1" 
                    BorderStyle="Solid" BorderWidth="1px"></asp:TextBox> </td>
            <td> 
                <asp:RequiredFieldValidator ID="ContactRequired" runat="server" 
                    ControlToValidate="Mobile" Display="Dynamic" 
                    ErrorMessage="Mobile Number Required" SetFocusOnError="True" 
                    ValidationGroup="Group1">Mobile Number Required</asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="MobileExpression" runat="server" 
                    ControlToValidate="Mobile" Display="Dynamic" 
                    ErrorMessage="Invalid Mobile Number" SetFocusOnError="True" 
                    ValidationExpression="^\d+$" ValidationGroup="Group1">Invalid Mobile Number</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style2"> Password</td>
            <td class="style1"> 
                <asp:TextBox ID="Password" runat="server" Width="300px" 
                    ValidationGroup="Group1" TextMode="Password" BorderStyle="Solid" 
                    BorderWidth="1px"></asp:TextBox> </td>
            <td> 
                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                    ControlToValidate="Password" Display="Dynamic" ErrorMessage="Password Required" 
                    SetFocusOnError="True" ValidationGroup="Group1">Password Required</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2"> Conform Password</td>
            <td class="style1"> 
                <asp:TextBox ID="ConformPassword" runat="server" Width="300px" 
                    ValidationGroup="Group1" TextMode="Password" BorderStyle="Solid" 
                    BorderWidth="1px"></asp:TextBox> </td>
            <td> 
                <asp:RequiredFieldValidator ID="ConformPasswordRequired" runat="server" 
                    ControlToValidate="ConformPassword" Display="Dynamic" ErrorMessage="Required" 
                    SetFocusOnError="True" ValidationGroup="Group1">Required</asp:RequiredFieldValidator>
&nbsp;<asp:CompareValidator ID="PassCompareValidator" runat="server" 
                    ControlToCompare="Password" ControlToValidate="ConformPassword" 
                    Display="Dynamic" ErrorMessage="Conform Password Dose Not Match" 
                    SetFocusOnError="True" ValidationGroup="Group1">Conform Password Dose Not Match</asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style2"> Security Question</td>
            <td class="style1"> 
                <asp:DropDownList ID="secQue" runat="server">
                    <asp:ListItem>What is your Birth Place?</asp:ListItem>
                    <asp:ListItem Value="Computer">Your first mobile number?</asp:ListItem>
                    <asp:ListItem Value="Civil">What is your pet&#39;s name?</asp:ListItem>
                </asp:DropDownList> </td>
            <td> </td>
        </tr>
        <tr>
            <td class="style2"> Answer</td>
            <td class="style1"> 
                <asp:TextBox ID="secans" runat="server" Width="300px" ValidationGroup="Group1" 
                    TextMode="Password" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox> </td>
            <td> 
                <asp:RequiredFieldValidator ID="SecRequired" runat="server" 
                    ControlToValidate="secans" Display="Dynamic" ErrorMessage="Answer Required" 
                    SetFocusOnError="True" ValidationGroup="Group1">Answer Required</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2" rowspan="2"> </td>
            <td class="style1"> <center>
                <asp:Button ID="CreateAccountButton" runat="server" Text="Create Account" 
                    ValidationGroup="Group1" onclick="CreateButton_Click" BorderStyle="Solid" 
                    BorderWidth="1px" />
&nbsp;
                <asp:Button ID="ReserButton" runat="server" Text="Reset" 
                    ValidationGroup="Group2" onclick="ReserButton_Click" BorderStyle="Solid" 
                    BorderWidth="1px" />
            &nbsp; <br /> 
                &nbsp;&nbsp; </center> </td>
            <td rowspan="2"> 
                <asp:Label ID="StatusLable" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1"> <center>
                <asp:CheckBox ID="CheckBox1" runat="server" Text="Conform Delete" />
                <asp:Button ID="Delete_Principal" runat="server" BorderStyle="Solid" 
                    BorderWidth="1px" Text="Delete Account" ValidationGroup="Group22" 
                    onclick="Delete_Principal_Click" /> </center>
            </td>
        </tr>
        </table>

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
