<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="WebAppl_DB_L7_150922.RegistrationForm" %>

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
                    <td>Name</td>
                    <td><asp:TextBox ID="txtname" runat="server"></asp:TextBox></td>
                </tr>
                 <tr>
                    <td>Gender :</td>
                    <td><asp:TextBox ID="txtgender" runat="server"></asp:TextBox></td>
                </tr>
                 <tr>
                    <td>Age :</td>
                    <td><asp:TextBox ID="txtage" runat="server"></asp:TextBox></td>
                </tr>
                 <tr>
                    <td></td>
                    <td><asp:Button ID="btnsave" runat="server" Text="Save" ForeColor="White" BackColor="Gray" OnClick="btnsave_Click"/></td>
                </tr>
                 <tr>
                    <td></td>
                    <td><asp:GridView ID="grd" runat="server" AutoGenerateColumns="false" OnRowCommand="grd_RowCommand">
                        <Columns>
                            <asp:TemplateField HeaderText="Name" >
                                <ItemTemplate>
                                    <%#Eval("name") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                                <asp:TemplateField HeaderText="Gender" >
                                <ItemTemplate>
                                    <%#Eval("gender") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                                <asp:TemplateField HeaderText="Age" >
                                <ItemTemplate>
                                    <%#Eval("age") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                                <asp:TemplateField >
                                <ItemTemplate>
                                   <asp:LinkButton ID="btndelete" Text="Delete" runat="server" CommandName="Del" CommandArgument='<%#Eval("rid") %>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                                <asp:TemplateField >
                                <ItemTemplate>
                                  <asp:LinkButton ID="btnedit" Text="Edit" runat="server" CommandName="Edt" CommandArgument='<%#Eval("rid") %>'></asp:LinkButton>
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
