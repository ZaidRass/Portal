<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LecturerRecommendsEE.aspx.cs" Inherits="MS3.LecturerRecommendsEE" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label14" runat="server" Text="Recommend External Examiner"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label16" runat="server" Text="Project Code"></asp:Label>
        <asp:TextBox ID="REEPROJ" runat="server"></asp:TextBox>
            <br />
        <br />
        <asp:Label ID="Label17" runat="server" Text="External Examiner ID"></asp:Label>
        <asp:TextBox ID="REEEID" runat="server"></asp:TextBox>
            <br />
        <br />
        <asp:Button ID="REE" runat="server" Text="Recommend" OnClick="REE_Click" />
        
        </div>
    </form>
</body>
</html>
