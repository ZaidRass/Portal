<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeGradeThesis.aspx.cs" Inherits="MS3.EmployeeGradeThesis" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 345px">
            <br />
            <asp:Label ID="Label2" runat="server" Text="Student ID"></asp:Label>
            <asp:TextBox ID="EGTSID" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="TItle"></asp:Label>
            <asp:TextBox ID="EGTTITLE" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Grade"></asp:Label>
            <asp:TextBox ID="EGTGRADE" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="EGT" runat="server" Text="Grade" OnClick="EGT_Click" />
            <br />
        </div>
    </form>
</body>
</html>
