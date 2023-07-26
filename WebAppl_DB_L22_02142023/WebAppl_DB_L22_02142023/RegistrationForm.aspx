<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="WebAppl_DB_L22_02142023.RegistrationForm" %>

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
                    <td>Name: </td>
                    <td><asp:TextBox ID="txtname" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Age: </td>
                    <td><asp:TextBox ID="txtage" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Gender: </td>
                    <td><asp:RadioButtonList ID="rblgender" runat="server" RepeatColumns="3">
                        <asp:ListItem Text="Male" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Female" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Other" Value="3"></asp:ListItem>
                        </asp:RadioButtonList></td>
                </tr>
                <tr>
                    <td>BloodGroup: </td>
                    <td><asp:RadioButtonList ID="rblbloodgroup" runat="server" RepeatColumns="6"></asp:RadioButtonList></td>
                </tr>
                <tr>
                    <td>Course: </td>
                    <td><asp:DropDownList ID="ddlcourse" runat="server"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td>Country: </td>
                    <td><asp:DropDownList ID="ddlcountry" runat="server"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td></td>
                    <td><asp:Button ID="btnsave" Text="Save" runat="server" ForeColor="White" BackColor="Gray" OnClick="btnsave_Click" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td><asp:GridView ID="grd" runat="server" AutoGenerateColumns="false" OnRowCommand="grd_RowCommand">
                        <Columns>
                            <asp:TemplateField HeaderText="Emp ID">
                                <ItemTemplate>
                                    <%#Eval("rid") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Emp Name">
                                <ItemTemplate>
                                    <%#Eval("name") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Emp Age">
                                <ItemTemplate>
                                    <%#Eval("age") %>  <%--age is column name of tblregistration table--%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Emp Gender">
                                <ItemTemplate>
                                    <%#Eval("gender").ToString() == "1" ? "Male" :Eval("gender").ToString() == "2" ? "Female": "Other"  %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Emp Bloodgroup">
                                <ItemTemplate>
                                    <%#Eval("bname") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Emp Course">
                                <ItemTemplate>
                                    <%#Eval("crname") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Emp Country">
                                <ItemTemplate>
                                    <%#Eval("cnname") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:LinkButton id="btndelete" Text="Delete" runat="server" CommandName="Del" CommandArgument='<%#Eval("rid") %>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:Button id="btnedit" Text="Edit" runat="server" CommandName="Edt" CommandArgument='<%#Eval("rid") %>'></asp:Button>
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
