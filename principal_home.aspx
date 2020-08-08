<%@ Page Language="C#" AutoEventWireup="true" CodeFile="principal_home.aspx.cs" Inherits="principal_home" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" profile="http://gmpg.org/xfn/11">
<title>WSOS - PRINCIPAL</title>
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
      <li class="first">Welcome Principal Sir: </li>
      <asp:Label ID="Name_Session_Label" runat="server"></asp:Label>
        
        <li>&nbsp;| </li>
        <asp:Label ID="ID_Session_Label" runat="server"></asp:Label>
        
        <li> &nbsp;|
            <asp:HyperLink ID="HyperLink2" runat="server" 
                NavigateUrl="~/psnotification.aspx">Compose Notifications</asp:HyperLink>
&nbsp;| 
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
        </table>

        <h2> Create Teaching Staff Account</h2>
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
            <td class="style2">Branch </td>
            <td class="style1">
                <asp:DropDownList ID="BranchList" runat="server" AutoPostBack="True">
                    <asp:ListItem>Computer</asp:ListItem>
                    <asp:ListItem Value="Civil"></asp:ListItem>
                    <asp:ListItem Value="Mech"></asp:ListItem>
                    <asp:ListItem Value="ENTC"></asp:ListItem>
                    <asp:ListItem Value="Instru"></asp:ListItem>
                    <asp:ListItem>IT</asp:ListItem>
                </asp:DropDownList> </td>
            <td> </td>
        </tr>
        <tr>
            <td class="style2"> Subject 1</td>
            <td class="style1"> 
                <asp:TextBox ID="Subject1TextBox" runat="server" BorderStyle="Solid" 
                    BorderWidth="1px" Enabled="False" ValidationGroup="Group1"></asp:TextBox>
&nbsp;
                <asp:DropDownList ID="SubjectDropDownList1" runat="server" 
                    DataSourceID="SqlDataSource1" DataTextField="sname" DataValueField="sname">
                </asp:DropDownList>
&nbsp;<asp:Button ID="Allocate_Button1" runat="server" BorderStyle="Solid" BorderWidth="1px" 
                    Text="Allocate" onclick="Allocate_Button1_Click" />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:wsosConnectionString %>" 
                    
                    SelectCommand="SELECT [sname] FROM [subject_table] WHERE ([bname] = @bname) ORDER BY [sname]">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="BranchList" Name="bname" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td> 
                <asp:RequiredFieldValidator ID="Subject1Required" runat="server" 
                    ControlToValidate="Subject1TextBox" Display="Dynamic" 
                    ErrorMessage="Required" SetFocusOnError="True" 
                    ValidationGroup="Group1">Required</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2"> Subject 2</td>
            <td class="style1"> 
                <asp:TextBox ID="Subject2TextBox" runat="server" BorderStyle="Solid" 
                    BorderWidth="1px" Enabled="False" ValidationGroup="Group1"></asp:TextBox>
&nbsp;
                <asp:DropDownList ID="SubjectDropDownList2" runat="server" 
                    DataSourceID="SqlDataSource1" DataTextField="sname" DataValueField="sname">
                </asp:DropDownList>
&nbsp;<asp:Button ID="Allocate_Button2" runat="server" BorderStyle="Solid" BorderWidth="1px" 
                    Text="Allocate" onclick="Allocate_Button2_Click" />
            </td>
            <td> 
                &nbsp;</td>
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
            <td class="style2"> &nbsp;</td>
            <td class="style1"> 
                &nbsp;</td>
            <td> 
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2"> </td>
            <td class="style1"> 
                <asp:Button ID="CreateAccountButton" runat="server" Text="Create Account" 
                    ValidationGroup="Group1" onclick="CreateButton_Click" BorderStyle="Solid" 
                    BorderWidth="1px" />
&nbsp;
                <asp:Button ID="ReserButton" runat="server" Text="Reset" 
                    ValidationGroup="Group2" onclick="ReserButton_Click" BorderStyle="Solid" 
                    BorderWidth="1px" />
            &nbsp;
                <asp:Button ID="Delate_Button" runat="server" BorderStyle="Solid" BorderWidth="1px" 
                    Text="Delete Account" onclick="Delate_Button_Click"  />
            </td>
            <td> 
                <asp:Label ID="StatusLable" runat="server"></asp:Label>
            </td>
        </tr>
        </table>


  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col4">
  <div id="footer">
    <p> </p>
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
