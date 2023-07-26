<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="WebAppl_DB_L18_01262023.RegistrationForm" %>

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
                        <asp:ListItem Text="male" Value="1"></asp:ListItem>
                        <asp:ListItem Text="female" Value="2"></asp:ListItem>
                        <asp:ListItem Text="others" Value="3"></asp:ListItem>
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
                        </asp:DropDownList></td>
                </tr>

                <tr>
                    <td></td>
                    <td><asp:Button ID="btnsave" runat="server" Text="Submit" OnClick="btnsave_Click" /></td>
                </tr>

                <tr>
                    <td></td>
                    <td><asp:GridView ID="grd" runat="server" AutoGenerateColumns="false">
                        <Columns>
                            <asp:TemplateField HeaderText="User ID">
                                <ItemTemplate>
                                    <%#Eval("rid") %>
                                </ItemTemplate>
                            </asp:TemplateField>

                             <asp:TemplateField HeaderText="User Name">
                                <ItemTemplate>
                                    <%#Eval("Name") %>
                                </ItemTemplate>
                            </asp:TemplateField>

                             <asp:TemplateField HeaderText="Gender">
                                <ItemTemplate>
                                    <%#Eval("gender").ToString() == "1" ? "Male" :Eval("gender").ToString()=="2" ? "Female" : "other"  %>
                                </ItemTemplate>
                            </asp:TemplateField>

                             <asp:TemplateField HeaderText="Country">
                                <ItemTemplate>
                                    <%#Eval("country").ToString()=="1" ? "Bharat" :Eval("country").ToString()=="2" ? "Pakistan" : Eval("country").ToString()=="3" ? "U.S.A." : "Japan"  %>
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
