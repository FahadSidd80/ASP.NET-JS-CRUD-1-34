<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductForm.aspx.cs" Inherits="WebAppl_DB_L13_280922.ProductForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript">
        function Validation()
        {
            var cont = "";
            cont = checkName();
            cont += checkPrice();
            cont += checkMobileno();
            cont += checkPassword();
            cont += checkConfirmPassword();

            if (cont == "") {
                return true;
            }
            else {
                alert(cont);
                return false;
            }
        }

        function checkName()
        {
            var p = document.getElementById('txtname');
            var exp = /^[a-zA-Z]*$/
            if (p.value == "") {
                return 'Please enter your name...\n';
            }
            else if (exp.test(p.value))
            {
                return "";
            }
            else
            {
                return 'please enter only alphabets between a-z,A-Z\n';
            }
        }

        function checkPrice() {
            var p = document.getElementById('txtprice');
            var exp = /^[0-9]*$/
            if (p.value == "") {
                return 'Please enter your price...\n';
            }
            else if (exp.test(p.value))
            {
                return "";
            }
            else {
                return 'Please enter value only between 0-9\n';
            }
        }

        function checkMobileno() {
            var p = document.getElementById('txtmobile');
            var exp = /^\d{10}$/
            if (p.value == "") {
                return 'Please enter your mobile no from 0-9...\n';
            }
            else if (exp.test(p.value))
            {
                return  "";
            }
            else {
                return 'Please enter 10 digit mobile Number only\n';
            }
        }

        function checkPassword() {
            var p = document.getElementById('txtpassword');
            if (p.value == "") {
                return 'Please enter your password...\n';
            }
            else {
                return "";
            }
        }

        function checkConfirmPassword() {
            var p = document.getElementById('txtcpassword');
            var p1 = document.getElementById('txtpassword');
            if (p.value == "") {
                return 'Please enter your confirm password...\n';
            }
            else if (p.value == p1.value)
            {
                return "";
            }
            else {
                return 'Password do not match....please enter correct password...\n';
            }
        }
    </script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>Product Name :</td>
                    <td><asp:TextBox ID="txtname" runat="server"></asp:TextBox></td>
                </tr>
                 <tr>
                    <td>Price :</td>
                    <td><asp:TextBox ID="txtprice" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Mobile No :</td>
                    <td><asp:TextBox ID="txtmobile" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Passowrd :</td>
                    <td><asp:TextBox ID="txtpassword" TextMode="Password" runat="server"></asp:TextBox></td> <%-- When we use textMode then textbox automatically got cleared like as using clear function for it.--%>
                </tr>
                <tr>
                    <td>Confirm Password:</td>
                    <td><asp:TextBox ID="txtcpassword" TextMode="Password" runat="server"></asp:TextBox></td> <%-- When we use textMode then textbox automatically got cleared like as using clear function for it.--%>
                </tr>
                 <tr>
                    <td></td>
                    <td><asp:Button ID="btnsave" runat="server" Text="Save" ForeColor="White" BackColor="Gray" OnClick="btnsave_Click" OnClientClick="return Validation()" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td><asp:GridView ID="grd" runat="server" AutoGenerateColumns="false" OnRowCommand="grd_RowCommand">
                        <Columns>
                            <asp:TemplateField HeaderText="Product Name" >
                                <ItemTemplate>
                                    <%#Eval("name") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Product Price" >
                                <ItemTemplate>
                                    <%#Eval("price") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Person Mobile No" >
                                <ItemTemplate>
                                    <%#Eval("mobileno") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText=" Password" >
                                <ItemTemplate>
                                    <%#Eval("password") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Confirm Password" >
                                <ItemTemplate>
                                    <%#Eval("confirmpassword") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Action" >
                                <ItemTemplate>
                                   <asp:linkbutton ID="btndelete" runat="server" Text="Delete" CommandArgument='<%#Eval("id") %>' />
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
