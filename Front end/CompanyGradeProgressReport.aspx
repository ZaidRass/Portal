<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompanyGradeProgressReport.aspx.cs" Inherits="MS3.CompanyGradeProgressReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 400px">
            <br />
            <asp:Label ID="Label2" runat="server" Text="Student ID"></asp:Label>
            <asp:TextBox ID="PRSID" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Grade"></asp:Label>
            <asp:TextBox ID="PRGRADE" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label5" runat="server" Text="Date"></asp:Label>
            <br />
            <asp:Calendar ID="PRDATE" runat="server"></asp:Calendar>
            <br />
            <asp:Button ID="Grade" runat="server" Text="Grade" OnClick="Grade_Click" />
        </div>
    </form>
</body>
</html>
