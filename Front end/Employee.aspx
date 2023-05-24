<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="MS3.Employee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 280px">
            <asp:Label ID="Label1" runat="server" Text="Employee"></asp:Label>
            <br />
            <asp:Button ID="EGT" runat="server" Text="Grade Thesis" OnClick="EGT_Click" />
            <br />
            <asp:Button ID="EGD" runat="server" Text="Grade Defense" OnClick="EGD_Click" />
            <br />
            <asp:Button ID="EPR" runat="server" Text="Create Progress Report" OnClick="EPR_Click" />
            <br />
        </div>
    </form>
</body>
</html>
