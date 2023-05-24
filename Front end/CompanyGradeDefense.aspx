<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompanyGradeDefense.aspx.cs" Inherits="MS3.CompanyGradeDefense" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="height: 326px">
    <form id="form1" runat="server">
        <div style="height: 339px">
            <br />
            <asp:Label ID="Label2" runat="server" Text="Student ID"></asp:Label>
            <asp:TextBox ID="CGDSID" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Location"></asp:Label>
            <asp:TextBox ID="CGDLOCATION" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Grade"></asp:Label>
            <asp:TextBox ID="CGDGRADE" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="CGRADE" runat="server" Text="Grade" OnClick="CGRADE_Click" />
            <br />
        </div>
    </form>
</body>
</html>
