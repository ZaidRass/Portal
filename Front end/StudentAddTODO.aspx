<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentAddTODO.aspx.cs" Inherits="MS3.StudentAddTODO" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Meeting ID"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label2" runat="server" Text="To-Do List"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox2" runat="server" Height="86px" Width="199px"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
