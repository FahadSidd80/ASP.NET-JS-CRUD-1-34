<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="RegistrationDisplay.aspx.cs" Inherits="WebAppl_DB_L27_03112023_Image_Upload_Master.RegistrationDisplay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<table>
    <tr>
        <td></td>
        <td>
            <asp:GridView ID="grd" runat="server" OnRowCommand="grd_RowCommand" AutoGenerateColumns="false" >
                <Columns>
                    <%-- <asp:TemplateField HeaderText="Emp ID">
                       <ItemTemplate>
                           <%#Eval("pppp") %> aise bhi kar sakte hai like pppp
                       </ItemTemplate>
                   </asp:TemplateField>--%>
                    <asp:TemplateField HeaderText="Sr.No">
                       <ItemTemplate>
                           <%#Eval("serialNumber") %>
                       </ItemTemplate>
                   </asp:TemplateField>
                    <%--<asp:TemplateField HeaderText="Emp ID">
                       <ItemTemplate>
                           <%#Eval("id") %>
                       </ItemTemplate>
                   </asp:TemplateField>--%>
                   <asp:TemplateField HeaderText="Emp Name">
                       <ItemTemplate>
                           <%#Eval("CapName") %>
                       </ItemTemplate>
                   </asp:TemplateField>
                    <asp:TemplateField HeaderText="Emp Age">
                       <ItemTemplate>
                           <%#Eval("age") %>
                       </ItemTemplate>
                   </asp:TemplateField>
                    <asp:TemplateField HeaderText="Emp Gender">
                       <ItemTemplate>
                           <%#Eval("gender").ToString()=="1"?"Male":Eval("gender").ToString()=="2"?"Female":"Other"%>
                       </ItemTemplate>
                   </asp:TemplateField>
                    <asp:TemplateField HeaderText="Emp Country">
                       <ItemTemplate>
                           <%#Eval("cname") %>
                       </ItemTemplate>
                   </asp:TemplateField>
                     <asp:TemplateField HeaderText="Emp State">
                       <ItemTemplate>
                           <%#Eval("sname") %>
                       </ItemTemplate>
                   </asp:TemplateField>
                    <asp:TemplateField HeaderText="Action" ItemStyle-BackColor="Blue">
                       <ItemTemplate>
                           <asp:LinkButton ID="btndelete" Text="Delete" runat="server" ForeColor="White" CommandArgument='<%#Eval("id") %>' CommandName="Del"  OnClientClick="return confirm('are you sure you want to delete  ??') "></asp:LinkButton>
                       </ItemTemplate>
                   </asp:TemplateField>
                    <asp:TemplateField HeaderText="Action" ItemStyle-BackColor="Black">
                       <ItemTemplate>
                           <asp:LinkButton ID="btnedit" Text="Edit" runat="server" ForeColor="White" BackColor="Black" CommandArgument='<%#Eval("id") %>' CommandName="Edt"></asp:LinkButton>
                       </ItemTemplate>
                   </asp:TemplateField>
                </Columns>
                </asp:GridView>
        </td>
    </tr>
</table>
</asp:Content>
