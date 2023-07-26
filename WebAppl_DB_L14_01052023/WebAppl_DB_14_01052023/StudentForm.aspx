<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentForm.aspx.cs" Inherits="WebAppl_DB_14_01052023.StudentForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript">
        function Validation() {
             var msg = "";
             msg = checkName();
             msg += checkage();
             msg += checksalary();
            msg += checkmobileno();
            msg += checkPassword();
            msg += checkcPassword();

            if (msg == "") {
                return true;
            }
            else {
                alert(msg);
                return false;
            }

        }
        
        function checkName() {
            var Tb = document.getElementById('txtname');
            var exp = /^[a-zA-Z ]*$/
            if (Tb.Value == "") {
                return 'please enter your name !! \n';
            }
            else if (exp.test(Tb.Value)) {
                return "";
            }
            else {
                return 'please enter name between a-z,A-Z only !!\n ';
            }

        }
        function checkage() {
            var TB = document.getElementById('txtage');
            var exp = /^[0-9]*$/
            if (TB.value == "") {
                return 'Please enter your age !! \n';
            }
            else if (exp.test(TB.value)) {
                return "";
            }
            else {
                return 'please enter only int value for age !! \n';
            }
        }
        function checksalary() {
            var Tb = document.getElementById('txtsalary');
            var exp = /^[0-9]*$/
            if (Tb.value == "") {
                return 'Please enter your salary !! \n';
            }
            //else if (10000<= Tb.value <=50000) {
            //    return "";
            //}
            else if (Tb.value >= 10000 && Tb.value <= 50000) {
                return "";
            }
            else if (exp.test(Tb.value)) {
                return "";
            }
            else {
                return 'Please enter salary only in range between 10000 to 50000 !! \n';
            }
        }
        function checkmobileno() {
            var Tb = Document.getElementById('txtmobile');
            var exp = /^\d{10}$/
            if (Tb.value == "") {
                return'please enter your mobile no !! \n';
            }
            else if (exp.test(Tb.value)) {
                return "";
            }
            else {
                return 'please enter 10 digit mobile number only !! \n';
            }
        }
        function checkPassword() {
            var Tb = Document.getElementById('txtpassword');
            if (Tb.value == "") {
                return 'please enter your password  !! \n';
            }
            else {
                return "";
            }
        }
        function CheckcPassword() {
            var Tb = Document.getElementById('txtcpassword');
            var Tb1 = Document.getElementById('txtpassword');
            /*var exp = /^\d{10}$/*/
            if (Tb.value == "") {
                return 'please enter your confirm password !! \n';
            }
            else if (Tb.value == Tb1.value) {
                return "";
            }
            else {
                return 'password do not match !! \n';
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
                    <td>Name :</td>
                    <td><asp:TextBox ID="txtname" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Age :</td>
                    <td><asp:TextBox ID="txtage" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Salary :</td>
                    <td><asp:TextBox ID="txtsalary" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>MobileNO :</td>
                    <td><asp:TextBox ID="txtmobile" runat="server"></asp:TextBox></td>
                </tr>
                 <tr>
                    <td>Password :</td>
                    <td><asp:TextBox ID="txtpassword" runat="server"></asp:TextBox></td>
                </tr>
                 <tr>
                    <td>Confirm Password :</td>
                    <td><asp:TextBox ID="txtcpassword" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td></td>
                    <td><asp:Button ID="btnsave" runat="server" Text="Save" ForeColor="white" BackColor="Gray" OnClick="btnsave_Click" OnClientClick="return Validation()"></asp:Button></td>
                </tr>
                <tr>
                    <td></td>
                    <td><asp:GridView ID="grd" runat="server" OnRowCommand="grd_RowCommand" AutoGenerateColumns="false">
                        <Columns>
                            <asp:TemplateField HeaderText="Studnt Name">
                                <ItemTemplate>
                                    <%#Eval("name") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <Columns>
                            <asp:TemplateField HeaderText="Studnt Age">
                                <ItemTemplate>
                                    <%#Eval("age") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <Columns>
                            <asp:TemplateField HeaderText="Studnt Salary">
                                <ItemTemplate>
                                    <%#Eval("salary") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <Columns>
                            <asp:TemplateField HeaderText="Studnt MobileNo">
                                <ItemTemplate>
                                    <%#Eval("mobileno") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <Columns>
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btndelete" Text="Delete" runat="server" CommandName="D" CommandArgument='<%#Eval("sid")%>'></asp:LinkButton>
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
