<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompanyCreateProject.aspx.cs" Inherits="MS3.CompanyCreateProject" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 339px">
            <br />
            <asp:Label ID="Label2" runat="server" Text="Project Code"></asp:Label>
            <asp:TextBox ID="CLPPROJCODE" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Title"></asp:Label>
            <asp:TextBox ID="CLPTITLE" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Description"></asp:Label>
            <asp:TextBox ID="CLPDESCRIPTION" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label5" runat="server" Text="Major Code"></asp:Label>
            <asp:TextBox ID="CLPMAJORCODE" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="CREATELP" runat="server" Text="Create" OnClick="CREATELP_Click" />
        </div>
    </form>
</body>
</html>
