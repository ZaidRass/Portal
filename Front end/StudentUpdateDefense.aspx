<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentUpdateDefense.aspx.cs" Inherits="MS3.StudentUpdateDefense" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="height: 323px">
    <form id="form1" runat="server">
        <div style="height: 321px">
            
            <br />
            <asp:Label ID="Label2" runat="server" Text="Content"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Update" OnClick="Button1_Click" style="height: 29px" />
            <br />
        </div>
    </form>
</body>
</html>
