<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompanyGradeThesis.aspx.cs" Inherits="MS3.CompanyGradeThesis" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 286px">
            <br />
            <asp:Label ID="Label2" runat="server" Text="Student ID"></asp:Label>
            <asp:TextBox ID="CGTDSID" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Thesis Title"></asp:Label>
            <asp:TextBox ID="CGTT" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Grade"></asp:Label>
            <asp:TextBox ID="CGTGRADE" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="CGRADE" runat="server" Text="Grade" OnClick="CGRADE_Click" />
            <br />
        </div>
    </form>
</body>
</html>
