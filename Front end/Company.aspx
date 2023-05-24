<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Company.aspx.cs" Inherits="MS3.Company" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 298px">
            <asp:Label ID="Label1" runat="server" Text="Company"></asp:Label>
            <br />
            <br />
            <asp:Button ID="CADDEMP" runat="server" Text="Add Employee" OnClick="CADDEMP_Click" />
            <br />
            <asp:Button ID="CCREATEPROJECT" runat="server" Text="Create Project" OnClick="CCREATEPROJECT_Click" />
            <br />
            <asp:Button ID="CASSIGNEMPS" runat="server" Text="Assign Employees" OnClick="CASSIGNEMPS_Click" />
            <br />
            <asp:Button ID="CGRADETHESIS" runat="server" Text="Grade Thesis" OnClick="CGRADETHESIS_Click" />
            <br />
            <asp:Button ID="CGRADEDEFENSE" runat="server" Text="Grade Defense" OnClick="CGRADEDEFENSE_Click" />
            <br />
            <asp:Button ID="CGRADEPR" runat="server" Text="Grade Progress Report" OnClick="CGRADEPR_Click" />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
