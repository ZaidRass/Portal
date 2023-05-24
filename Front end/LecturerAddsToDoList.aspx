<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LecturerAddsToDoList.aspx.cs" Inherits="MS3.LecturerAddsToDoList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Add&nbsp; To-Do List:<br />
        <asp:Label ID="Label10" runat="server" Text="Meeting ID"></asp:Label>
        <asp:TextBox ID="TODOMID" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label11" runat="server" Text="To-Do List"></asp:Label>
        <br />
        <asp:TextBox ID="TODOLIST" runat="server" Height="158px" Width="246px"></asp:TextBox>
        <br />
        <asp:Button ID="TODOADD" runat="server" Text="Add" OnClick="TODOADD_Click" />
        <br />
        </div>
    </form>
</body>
</html>
