<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="WebAppl_DB_L30_03212023_Chkbx_Edit_LoginPage.ChangePassword" %>

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
                    <td>Old Password :</td>
                    <td><asp:TextBox ID="txtoldpassword" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                      <td>New Password :</td>
                      <td><asp:TextBox ID="txtnewpassword" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                      <td>Confirm New Password :</td>
                      <td><asp:TextBox ID="txtconfirmnewpassword" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td></td>
                    <td><asp:Button ID="btnupdatepassword" runat="server" Text="Update Password" OnClick="btnupdatepassword_Click" /></td>
                </tr>
                <tr>
                      <td></td>
                      <td><asp:Label ID="lblmsg" Font-Bold="true" runat="server"></asp:Label></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
