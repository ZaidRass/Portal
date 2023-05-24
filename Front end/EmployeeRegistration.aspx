<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeRegistration.aspx.cs" Inherits="MS3.CoordinatorRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Email:<br />
            <asp:TextBox ID="regEmail" runat="server" required="required"></asp:TextBox>
            <br />
            Username:<br />
            <asp:TextBox ID="regUsername" runat="server" required="required"></asp:TextBox>
            <br />
            First Name:<br />
            <asp:TextBox ID="firstName" runat="server" required="required"></asp:TextBox>
            <br />
            Last Name:<br />
            <asp:TextBox ID="lastName" runat="server" required="required"></asp:TextBox>
            <br />
            Phone Number:<br />
            <asp:TextBox ID="phoneNum" runat="server" required="required"></asp:TextBox>
            <br />
            Birth Date:<br />
            <asp:TextBox ID="birthDate" runat="server" TextMode="DateTime" required="required"></asp:TextBox>
            <br />
            Address:<br />
            <asp:TextBox ID="address" runat="server" required="required"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="registerButton" runat="server" Text="Register Now!" OnClick="Register" />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
