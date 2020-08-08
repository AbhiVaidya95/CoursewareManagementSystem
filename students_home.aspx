<%@ Page Language="C#" AutoEventWireup="true" CodeFile="students_home.aspx.cs" Inherits="students_home" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" profile="http://gmpg.org/xfn/11">
<title>WSOS - STUDENT </title>
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
      <li class="first">Welcome Student: </li>
        <asp:Label ID="Name_Session_Label" runat="server"></asp:Label>
        
        <li>&nbsp;| </li>
        <asp:Label ID="ID_Session_Label" runat="server"></asp:Label>
        
        <li> | 
            <asp:HyperLink ID="HyperLink1" runat="server" 
                NavigateUrl="account_settings.aspx">Account Settings</asp:HyperLink>
            | 
            <asp:Button ID="Logout_Button" runat="server" Text="Logout..." 
                onclick="Logout_Button_Click" />&nbsp;<asp:Label ID="Page_Label" 
                runat="server" Text="students_home.aspx" Visible="False"></asp:Label>
        </li>
    </ul>
  </div>
</div>
<!-- #######################  Document Body ################################################## -->
<div class="wrapper col3">
  <div id="container">
    <hr />
    
    <table width="100%">

       <tr>
        <td> Select Branch:</td>
        <td> 
                <asp:DropDownList ID="BranchList" runat="server" 
                BackColor="#FF9933">
                    <asp:ListItem>Computer</asp:ListItem>
                    <asp:ListItem Value="Civil"></asp:ListItem>
                    <asp:ListItem Value="Mech"></asp:ListItem>
                    <asp:ListItem Value="ENTC"></asp:ListItem>
                    <asp:ListItem Value="Instru"></asp:ListItem>
                    <asp:ListItem>IT</asp:ListItem>
                </asp:DropDownList> &nbsp;<asp:Button ID="GO_Button1" runat="server" 
                     Text="Go&gt;&gt;" onclick="GO_Button1_Click" />
           </td>

        <td> Select Subject:</td>
        <td> 
            <asp:DropDownList ID="DropDownList2" runat="server" 
                BackColor="#FF9933" DataSourceID="SqlDataSource2" DataTextField="sname" 
                DataValueField="sname" Enabled="False">
            </asp:DropDownList>
           &nbsp;<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:wsosConnectionString %>" 
                SelectCommand="SELECT [sname] FROM [subject_table] WHERE ([bname] = @bname)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="BranchList" Name="bname" 
                        PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
           &nbsp;<asp:Button ID="GO_Button2" runat="server" BorderStyle="Solid" 
                BorderWidth="1px" onclick="GO_Button_Click" Text="GO" Enabled="False" />
           </td>
        
       </tr>
       
       </table>

       <hr />
       <table width="100%">

       <tr>
             <td>  
                 <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                     AutoGenerateColumns="False" CellPadding="4" DataKeyNames="cid" 
                     DataSourceID="SqlDataSource3" ForeColor="#333333" Width="100%" 
                     GridLines="None">
                 <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                 <Columns>
                     <asp:BoundField DataField="cid" HeaderText="ID" ReadOnly="True" 
                         SortExpression="cid" />
                     <asp:BoundField DataField="des" HeaderText="Summery" 
                         SortExpression="des" />
                     <asp:BoundField DataField="cname" HeaderText="File Name" 
                         SortExpression="cname" />
                     <asp:BoundField DataField="dates" HeaderText="Date" 
                         SortExpression="dates" />
                     <asp:BoundField DataField="subject" HeaderText="Subject" 
                         SortExpression="subject" />
                     <asp:BoundField DataField="sname" HeaderText="Staff" SortExpression="sname" />
                     <asp:BoundField DataField="semail" HeaderText="Staff Email" 
                         SortExpression="semail" />
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
                 <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                     ConnectionString="<%$ ConnectionStrings:wsosConnectionString %>" 
                     
                     
                     SelectCommand="SELECT [cid], [des], [cname], [dates], [times], [subject], [sname], [semail] FROM [contents] WHERE ([subject] = @subject) ORDER BY [dates] DESC, [times] DESC">
                     <SelectParameters>
                         <asp:ControlParameter ControlID="DropDownList2" Name="subject" 
                             PropertyName="SelectedValue" Type="String" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </td>
       </tr>

       </table>
        <hr />
       
        <table width="100%">
        
        <tr>
            <td>Enter Content ID:  </td>
            <td>
                <asp:TextBox ID="Content_IDTextBox" runat="server" BorderStyle="Solid" 
                    BorderWidth="1px"></asp:TextBox>
            </td>
            <td class="style6"> <asp:TextBox ID="File_NameTextBox" runat="server" 
                    BorderStyle="Solid" BorderWidth="1px" Enabled="False" Width="508px"></asp:TextBox> </td>
            <td> <asp:Button ID="Download_Button" runat="server" Text="Download" 
                    BorderStyle="Solid" BorderWidth="1px" onclick="Download_Button_Click"></asp:Button></td>
        </tr>

        </table>
        
        <hr />
        <br /> 
        <table width=100%>
              <tr>
              <td class="style3" bgcolor="#CCCCFF" colspan="2">Send Comments on the content 
                  uploaded:</td>
              </tr>

              <tr>
              <td class="style3" bgcolor="#CCCCFF">Staff&#39;s Email</td>
              <td style="text-align: left" bgcolor="#CCCCFF">
                  <asp:TextBox ID="Staff_Email_TextBox" runat="server" BorderStyle="Solid" 
                      BorderWidth="1px" Width="367px"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator 
                      ID="RequiredFieldValidator7" runat="server" ControlToValidate="Staff_Email_TextBox" 
                      Display="Dynamic" ErrorMessage="Required" SetFocusOnError="True" 
                      ValidationGroup="Group1" ForeColor="#FF3300">Required</asp:RequiredFieldValidator>
                  </td>
              </tr>

              <tr>
              <td class="style3" bgcolor="#CCCCFF">File ID</td>
              <td style="text-align: left" bgcolor="#CCCCFF">
                  <asp:TextBox ID="File_ID_TextBox" runat="server" BorderStyle="Solid" 
                      BorderWidth="1px" Width="125px"></asp:TextBox>
                
                  &nbsp;<asp:RequiredFieldValidator 
                      ID="RequiredFieldValidator1" runat="server" ControlToValidate="File_ID_TextBox" 
                      Display="Dynamic" ErrorMessage="Required" SetFocusOnError="True" 
                      ValidationGroup="Group1" ForeColor="#FF3300">Required</asp:RequiredFieldValidator>
                  </td>
              </tr>

              <tr>
                  <td class="style3" bgcolor="#CCCCFF">
                      File Name</td>
                  <td style="text-align: left" bgcolor="#CCCCFF">
                      <asp:TextBox ID="File_Name_TextBOX" runat="server" BorderStyle="Solid" 
                          BorderWidth="1px" Width="202px"></asp:TextBox>
                      &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                          ControlToValidate="File_Name_TextBOX" Display="Dynamic" ErrorMessage="Required" 
                          SetFocusOnError="True" ValidationGroup="Group1" ForeColor="#FF3300">Required</asp:RequiredFieldValidator>
                  </td>
              </tr>

              <tr>
                  <td class="style3" bgcolor="#CCCCFF">
                      Comments</td>
                  <td style="text-align: left" bgcolor="#CCCCFF">
                      <asp:TextBox ID="Comments" runat="server" BorderStyle="Solid" BorderWidth="1px" 
                          Height="45px" TextMode="MultiLine" Width="530px"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                          ControlToValidate="Comments" Display="Dynamic" ErrorMessage="Required" 
                          SetFocusOnError="True" ValidationGroup="Group1" ForeColor="#FF3300">Required</asp:RequiredFieldValidator>
                  </td>
              </tr>

              <tr>
              <td class="style3" bgcolor="#CCCCFF">
                  <asp:Button ID="CancleButton" runat="server" Text="Cancle" 
                      ValidationGroup="Group2" BorderStyle="Solid" BorderWidth="1px" 
                      onclick="CancleButton_Click" /></td>
              <td bgcolor="#CCCCFF">
                  <asp:Button ID="SendButton" runat="server" Text="Send Message" 
                      ValidationGroup="Group1" onclick="SendButton_Click" BorderStyle="Solid" 
                      BorderWidth="1px" /></td>
              </tr>


                  <tr>
                      <td class="style3" bgcolor="#CCCCFF">
                          &nbsp;</td>
                      <td bgcolor="#CCCCFF">
                          <asp:Label ID="StatusLabel" runat="server"></asp:Label>
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
