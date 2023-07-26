<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeForm.aspx.cs" Inherits="WebAppl_DB_L12_200922.EmployeeForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript">
        //function Validation()  -- Not clear with concept because it retun tru value and data get enter in database.
        //{
            
        //    checkname();
        //    checkcity();
          
   
        //}

        //function checkname()
        //{
        //    var p = document.getElementById('txtname');
        //    if (p.value == "")  // but txtname is a ASP control so we can not use/call directly in java script. only way we can use it with document.getElementByID
        //    {
        //        alert('Please enter your name...');
        //        return false;
        //    }
        //}

        //function checkcity()
        //{
        //    var p = document.getElementById('txtcity');
        //    if (p.value == "")  // but txtname is a ASP control so we can not use/call directly in java script. only way we can use it with document.getElementByID
        //    {
        //        alert('Please enter your city...');
        //        return false;
        //    }
        //}


        function Validation() {

            var alrt = "";
            alrt = checkname();
            alrt += checkcity();
            alrt += checkage();
            
            if (alrt == "")
            {
                return true;
            }
            else {
                alert(alrt);
                return false;
            }


        }

        function checkname() {
            var p = document.getElementById('txtname');
            if (p.value == "")  // but txtname is a ASP control so we can not use/call directly in java script. only way we can use it with document.getElementByID
            {
                return ' Please enter your name...\n';
            }
            else {
                return  "";
            }
        }

        function checkcity() {
            var p = document.getElementById('txtcity');
            if (p.value == "")  // but txtname is a ASP control so we can not use/call directly in java script. only way we can use it with document.getElementByID
            {
                return ' Please enter your city...\n';
            }
            else {
                return  "";
            }
        }

        function checkage() {
            var p = document.getElementById('txtage');
            if (p.value == "")  // but txtname is a ASP control so we can not use/call directly in java script. only way we can use it with document.getElementByID
            {
                return ' Please enter your age...\n';
            }
            else {
                return "";
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
                    <td>City :</td>
                    <td><asp:TextBox ID="txtcity" runat="server"></asp:TextBox></td>
                </tr>
                 <tr>
                    <td>Age :</td>
                    <td><asp:TextBox ID="txtage" runat="server"></asp:TextBox></td>
                </tr>
                 <tr>
                    <td></td>
                    <td><asp:Button ID="btnsave" runat="server" Text="Save" ForeColor="White" BackColor="Gray" OnClick="btnsave_Click" OnClientClick="return Validation()" /></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
