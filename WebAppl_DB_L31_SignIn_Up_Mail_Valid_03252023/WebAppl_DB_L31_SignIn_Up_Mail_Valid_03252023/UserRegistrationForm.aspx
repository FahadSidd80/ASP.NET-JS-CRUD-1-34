﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UserRegistrationForm.aspx.cs" Inherits="WebAppl_DB_L31_SignIn_Up_Mail_Valid_03252023.UserRegistrationForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<table>
    <tr>
        <td>Name :</td>
        <td><asp:TextBox ID="txtname" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td>Email :</td>
        <td><asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
            <asp:Label ID="lblmsg1" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>Password :</td>
        <td><asp:TextBox ID="txtpassword" runat="server"></asp:TextBox></td>
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
        <td>Hobbies :</td>
        <td><asp:CheckBoxList ID="cblhobbies" runat="server" RepeatColumns="8">
            <asp:ListItem Text="Cricket" Value="1"></asp:ListItem>
            <asp:ListItem Text="Singing" Value="2"></asp:ListItem>
            <asp:ListItem Text="Coding" Value="3"></asp:ListItem>
            <asp:ListItem Text="Fooding" Value="4"></asp:ListItem>
            <asp:ListItem Text="Travelling" Value="5"></asp:ListItem>
            <asp:ListItem Text="Sky diving" Value="6"></asp:ListItem>
            <asp:ListItem Text="Dancing" Value="7"></asp:ListItem>
            <asp:ListItem Text="Riding" Value="8"></asp:ListItem>
            </asp:CheckBoxList></td>
    </tr>
               
    <tr>
        <td></td>
        <td><asp:Button ID="btnsave" runat="server" Text="Save" ForeColor="White" BackColor="Gray" OnClick="btnsave_Click" />
            <a href="UserLogin.aspx">Sign In</a>
        </td>
    </tr>
    <tr>
        <td></td>
        <td><asp:GridView ID="grd" runat="server" OnRowCommand="grd_RowCommand" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField HeaderText="Emp ID">
                    <ItemTemplate>
                        <%#Eval("SerialNumber") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Emp Name">
                    <ItemTemplate>
                        <%#Eval("name") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Emp Email">
                    <ItemTemplate>
                        <%#Eval("email") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Emp Password">
                    <ItemTemplate>
                        <%#Eval("password") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Emp Gender">
                    <ItemTemplate>
                        <%#Eval("gender").ToString()=="1"? "Male":Eval("gender").ToString()=="2"? "Female": "Other" %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Emp Hobbies">
                    <ItemTemplate>
                        <%#Eval("hobbies") %>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:Button ID="btndelete" runat="server" Text="Delete" CommandName="Del" CommandArgument='<%#Eval("uid") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:Button ID="btnedit" runat="server" Text="Edit" CommandName="Edt" CommandArgument='<%#Eval("uid") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
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
            </asp:GridView></td>
    </tr>
</table>

</asp:Content>
