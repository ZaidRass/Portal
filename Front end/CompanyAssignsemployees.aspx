<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompanyAssignsemployees.aspx.cs" Inherits="MS3.CompanyAssignsemployees" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 326px">
            <asp:Label ID="Label1" runat="server" Text="Bachelor Code"></asp:Label>
            <asp:TextBox ID="CAE" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Staff ID"></asp:Label>
            <asp:TextBox ID="CSID" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="CAEMP" runat="server" Text="Assign" OnClick="CAEMP_Click" />
        </div>
    </form>
</body>
</html>
