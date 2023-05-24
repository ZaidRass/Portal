<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompanyAddEmployee.aspx.cs" Inherits="MS3.CompanyAddEmployee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="height: 306px">
    <form id="form1" runat="server">
        <br />
        <asp:Label ID="Label2" runat="server" Text="Email"></asp:Label>
        <asp:TextBox ID="CEMAIL" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Name"></asp:Label>
        <asp:TextBox ID="CNAME" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label4" runat="server" Text="Phone Number"></asp:Label>
        <asp:TextBox ID="CPHONENUMBER" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label5" runat="server" Text="Field"></asp:Label>
        <asp:TextBox ID="CFIELD" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
        <asp:Button ID="ADDEMPLOYEE" runat="server" Text="Add" OnClick="ADDEMPLOYEE_Click" />
        <br />
        <br />
        <br />
        <br />
    </form>
</body>
</html>
