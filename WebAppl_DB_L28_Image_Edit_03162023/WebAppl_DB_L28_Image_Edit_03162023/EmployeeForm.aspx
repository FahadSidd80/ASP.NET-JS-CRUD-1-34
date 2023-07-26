<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeForm.aspx.cs" Inherits="WebAppl_DB_L28_Image_Edit_03162023.EmployeeForm" %>

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
        <td>Name :</td>
        <td><asp:TextBox ID="txtname" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td>Age :</td>
        <td><asp:TextBox ID="txtage" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td>Image/File :</td>
        <td><asp:FileUpload ID="fuimg" runat="server" /></td><%--// fuimg cant store file value--%>
    </tr>
    <tr>
        <td></td>
        <td><asp:Button ID="btnsave" runat="server" Text="Save" ForeColor="White" BackColor="Gray" OnClick="btnsave_Click" /></td>
    </tr>
    <tr>
        <td></td>
        <td><asp:GridView ID="grd" runat="server" OnRowCommand="grd_RowCommand" AutoGenerateColumns="false">
            <Columns>
                <asp:TemplateField HeaderText="Emp ID">
                    <ItemTemplate>
                        <%#Eval("empid") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Emp Name">
                    <ItemTemplate>
                        <%#Eval("name") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Emp Age">
                    <ItemTemplate>
                        <%#Eval("age") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Emp Image">
                    <ItemTemplate>
                        <%--<%#Eval("img") %>--%>
                        <asp:Image ID="img1" runat="server" Height="70px" Width="70px" ImageUrl='<%#Eval("img","~/Photos/{0}") %>' />
                        <%--<asp:Image ID="img1"  runat="server" Height="60px" Width="60px" ImageUrl='<%#Eval("img","~/Photos/{0}")%>' />--%>
                        <%--<asp:Image ID="Image1" runat="server" Width="70px" Height="50px" ImageUrl='<%#Eval("img","~/photos/{0}") %>' />--%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Emp Age">
                    <ItemTemplate>
                        <asp:Button ID="btnedit" runat="server" Text="Edit" CommandName="Edt" CommandArgument='<%#Eval("empid") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            </asp:GridView></td>
    </tr>
</table>
        </div>
    </form>
</body>
</html>
