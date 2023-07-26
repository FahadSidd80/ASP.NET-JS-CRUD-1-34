<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="WebAppl_DB_L19_01092023.RegistrationForm" %>

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
                    <td>Bloodgroup :</td>
                    <td><asp:RadioButtonList ID="rblbg" runat="server" RepeatColumns="9" >
                     <%--<asp:ListItem Text="A+" Value="1"></asp:ListItem>  -- Static binding
                        <asp:ListItem Text="B+" Value="2"></asp:ListItem>
                        <asp:ListItem Text="AB+" Value="3"></asp:ListItem>
                        <asp:ListItem Text="O+" Value="4"></asp:ListItem>
                        <asp:ListItem Text="A-" Value="5"></asp:ListItem>
                        <asp:ListItem Text="O-" Value="6"></asp:ListItem>
                        <asp:ListItem Text="AB-" Value="7"></asp:ListItem> --%>
                        </asp:RadioButtonList></td>
                </tr>
                 <tr>
                    <td>Course</td>
                    <td><asp:DropDownList ID="ddlcourse" runat="server">
                       <%-- <asp:ListItem Text="--Select--" Value="0"></asp:ListItem> --  Static binding
                        <asp:ListItem Text="B.Tech" Value="1"></asp:ListItem>
                        <asp:ListItem Text="M.Tech" Value="2"></asp:ListItem>
                        <asp:ListItem Text="BBA" Value="3"></asp:ListItem>
                        <asp:ListItem Text="MBA" Value="4"></asp:ListItem>
                        <asp:ListItem Text="BCA" Value="5"></asp:ListItem>
                        <asp:ListItem Text="MCA" Value="6"></asp:ListItem>
                        <asp:ListItem Text="MBBS" Value="7"></asp:ListItem> --%>
                        </asp:DropDownList></td>
                </tr>
                 <tr>
                    <td></td>
                    <td><asp:Button ID="btnsave" runat="server" Text="Save" ForeColor="White" BackColor="Gray" OnClick="btnsave_Click" /> </td>
                </tr>
                <tr>
                    <td></td>
                    <td><asp:GridView ID="grd" runat="server" OnRowCommand="grd_RowCommand" AutoGenerateColumns="false">
                        <Columns>
                            <asp:TemplateField HeaderText="Employee Name">
                                <ItemTemplate>
                                    <%#Eval("name") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                         <Columns>
                            <asp:TemplateField HeaderText="Employee BloodGroup">
                                <ItemTemplate>
                                    <%#Eval("bname") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                         <Columns>
                            <asp:TemplateField HeaderText="Employee Course">
                                <ItemTemplate>
                                    <%#Eval("cname") %>
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
