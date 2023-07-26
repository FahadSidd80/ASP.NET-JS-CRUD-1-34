<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LibraryForm.aspx.cs" Inherits="WebAppl_DB_L5_140922.LibraryForm" %>

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
                    <td>Book Name :</td>
                    <td><asp:TextBox ID="txtbname" runat="server"></asp:TextBox></td>
                </tr>
                 <tr>
                    <td>Book Price :</td>
                    <td><asp:TextBox ID="txtbprice" runat="server"></asp:TextBox></td>
                </tr>
                 <tr>
                    <td>Author Name :</td>
                    <td><asp:TextBox ID="txtbauthor" runat="server"></asp:TextBox></td>
                </tr>
                 <tr>
                    <td></td>
                    <td><asp:Button ID="btninsert" runat="server" Text="Insert" ForeColor="White" BackColor="Gray" OnClick="btninsert_Click" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td><asp:GridView ID="grd" runat="server"></asp:GridView></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
