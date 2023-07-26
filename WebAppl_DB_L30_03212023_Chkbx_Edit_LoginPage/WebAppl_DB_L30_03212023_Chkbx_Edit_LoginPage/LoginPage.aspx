<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="WebAppl_DB_L30_03212023_Chkbx_Edit_LoginPage.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
               
    <tr>
        <td>Email :</td>
        <td><asp:TextBox ID="txtemail" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td>Password :</td>
        <td><asp:TextBox ID="txtpassword" runat="server"></asp:TextBox></td>
    </tr>
     <tr>
        <td></td>
        <td><asp:button ID="btnlogin" Text="Login" runat="server" OnClick="btnlogin_Click"></asp:button></td>
    </tr>  
    <tr>
        <td></td>
        <td><asp:Label ID="lblmsg" runat="server" Font-Bold="true"></asp:Label></td>
        <%--<td><asp:Label ID="Label1" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label></td>--%>
       
    </tr>
            </table>
        </div>
    </form>
</body>
</html>
