<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeCreateProgressReport.aspx.cs" Inherits="MS3.EmployeeCreateProgressReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 515px">
            <br />
            <asp:Label ID="Label2" runat="server" Text="Student ID"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Content"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox3" runat="server" Height="92px" Width="166px"></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Date"></asp:Label>
            <br />
            <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Graded" OnClick="Button1_Click" />
            <br />
        </div>
    </form>
</body>
</html>
