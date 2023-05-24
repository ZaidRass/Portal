<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeGradeDefense.aspx.cs" Inherits="MS3.EmployeeGradeDefense" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 621px">
            <br />
            <asp:Label ID="Label2" runat="server" Text="Student ID"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Defense Location"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Grade"></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Graded" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
