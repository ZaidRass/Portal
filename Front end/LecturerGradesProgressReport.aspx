<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LecturerGradesProgressReport.aspx.cs" Inherits="MS3.LecturerGradesProgressReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
        <asp:Label ID="Label36" runat="server" Text="Grade Progress Report"></asp:Label>
        :<br />
        <br />
        <asp:Label ID="Label38" runat="server" Text="Student ID"></asp:Label>
        <asp:TextBox ID="LGPRSID" runat="server"></asp:TextBox>
            <br />
        <br />
        <asp:Label ID="Label39" runat="server" Text="Grade"></asp:Label>
        <asp:TextBox ID="LGPRGRADE" runat="server"></asp:TextBox>
            <br />
        <br />
        <asp:Label ID="Label40" runat="server" Text="Date"></asp:Label>
        <asp:Calendar ID="LGPRDATE" runat="server"></asp:Calendar>
        <br />
        <asp:Button ID="LGRADEPR" runat="server" Text="Grade" OnClick="LGRADEPR_Click" />
        
        </div>
    </form>
</body>
</html>
