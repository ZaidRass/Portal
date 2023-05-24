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
            Or Register as a:
            <asp:Button ID="studentReg" runat="server" Text="Student" OnClick="studentReg_Click" />
            <asp:Button ID="lecReg" runat="server" Text="Lecturer" OnClick="lecReg_Click" />
            <asp:Button ID="TAReg" runat="server" Text="Teaching Assistant" OnClick="TAReg_Click" />
            <asp:Button ID="comReg" runat="server" Text="Company" OnClick="comReg_Click" />
            <asp:Button ID="EEReg" runat="server" Text="External Examiner" OnClick="EEReg_Click" />
            
            <br />
        </div>
    </form>
</body>
</html>
