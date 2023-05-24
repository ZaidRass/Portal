<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentBookMeeting.aspx.cs" Inherits="MS3.StudentBookMeeting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="height: 396px">
    <form id="form1" runat="server">
        <div style="height: 393px">
           
            <br />
            <asp:Label ID="Label2" runat="server" Text="Meeting ID"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Book" />
            <br />
        </div>
    </form>
</body>
</html>
