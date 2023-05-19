<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationPage.aspx.cs" Inherits="MS3.RegistrationPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            Please Login:<br />
            <br />
            Email:<br />
            <asp:TextBox ID="loginEmail" runat="server"></asp:TextBox>
            <br />
            Password:<br />
            <asp:TextBox ID="loginPassword" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="loginButton" runat="server" Text="Login" OnClick ="Login" />
            <br />
            <br />
        </div>
        <div>
            Or register here:<br />
            <asp:DropDownList ID="userType" runat="server">
                <asp:ListItem>Students</asp:ListItem>
                <asp:ListItem>Lecturers</asp:ListItem>
                <asp:ListItem>External Examiners</asp:ListItem>
                <asp:ListItem>Teaching Assistants</asp:ListItem>
            </asp:DropDownList>
            <br />
            Email:<br />
            <asp:TextBox ID="regEmail" runat="server"></asp:TextBox>
            <br />
            Username:<br />
            <asp:TextBox ID="regUsername" runat="server"></asp:TextBox>
            <br />
            First Name:<br />
            <asp:TextBox ID="firstName" runat="server"></asp:TextBox>
            <br />
            Last Name:<br />
            <asp:TextBox ID="lastName" runat="server"></asp:TextBox>
            <br />
            Phone Number:<br />
            <asp:TextBox ID="phoneNum" runat="server"></asp:TextBox>
            <br />
            Major Code:<br />
            <asp:TextBox ID="majorCode" runat="server"></asp:TextBox>
            <br />
            Birth Date:<br />
            <asp:Calendar ID="birthDate" runat="server"></asp:Calendar>
            Address:<br />
            <asp:TextBox ID="address" runat="server"></asp:TextBox>
            <br />
            Semester:<br />
            <asp:TextBox ID="semester" runat="server"></asp:TextBox>
            <br />
            GPA:<br />
            <asp:TextBox ID="gpa" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="registerButton" runat="server" Text="Register Now!" OnClick ="Register"/>
            <br />
            </div>
    </form>
</body>
</html>
