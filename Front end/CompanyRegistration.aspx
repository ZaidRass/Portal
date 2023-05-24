<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompanyRegistration.aspx.cs" Inherits="MS3.CompanyRegistration" %>

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
            Company Address:<br />
            <asp:TextBox ID="address" runat="server" required="required"></asp:TextBox>
            <br />
            Company Name:<br />
            <asp:TextBox ID="comName" runat="server" required="required"></asp:TextBox>

            <br />
            Representative Name:<br />
            <asp:TextBox ID="repName" runat="server" required="required"></asp:TextBox>
            <br />
            Representative Email:<br />
            <asp:TextBox ID="repEmail" runat="server" required="required"></asp:TextBox>

            <br />
            <br />
            <asp:Button ID="registerButton" runat="server" Text="Register Now!" OnClick="Register" />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
