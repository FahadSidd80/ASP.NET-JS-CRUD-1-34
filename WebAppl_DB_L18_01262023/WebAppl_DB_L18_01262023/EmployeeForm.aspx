<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeForm.aspx.cs" Inherits="WebAppl_DB_L18_01262023.EmployeeForm" %>

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
                    <td>Gender :</td>
                    <td><asp:RadioButtonList ID="rblgender" runat="server" RepeatColumns="3">
                        <asp:ListItem Text="Male" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Female" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Other" Value="3"></asp:ListItem>
                        </asp:RadioButtonList></td>
                </tr>
                 <tr>
                    <td>Country :</td>
                    <td><asp:DropDownList ID="ddlcountry" runat="server">
                        <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                        <asp:ListItem Text="India" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Pakistan" Value="2"></asp:ListItem>
                        <asp:ListItem Text="USA" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Japan" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Canada" Value="5"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                 <tr>
                    <td></td>
                    <td><asp:Button ID="btnsave" runat="server" Text="Save" ForeColor="White" BackColor="Gray" OnClick="btnsave_Click" /></td>
                </tr>
                 <tr>
                    <td></td>
                    <td><asp:GridView ID="grd" runat="server" AutoGenerateColumns="false">
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
                            <asp:TemplateField HeaderText="Emp Gender">
                                <ItemTemplate>
                                    <%#Eval("gender").ToString() =="1" ? "Male" : Eval("gender").ToString() == "2" ? "female" : "Other" %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Emp Country">
                                <ItemTemplate>
                                    <%#Eval("country").ToString() == "1" ? "India" : Eval("country").ToString() == "2" ? "Pakistan" : Eval("country").ToString() == "3" ? "U.S.A" : Eval("country").ToString() == "4" ? "japan" : "Canada"%>
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
