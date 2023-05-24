<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LecturerSupervisesIndustrial.aspx.cs" Inherits="MS3.LecturerSupervisesIndustrial" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Supervise Industrial :<br />
        <br />
        <asp:Label ID="Label19" runat="server" Text="Project Code"></asp:Label>
        <asp:TextBox ID="SIPROJ" runat="server"></asp:TextBox>
            <br />
        <br />
        <asp:Button ID="SIBUT" runat="server" Text="Supervise" OnClick="SIBUT_Click" />
        
        </div>
    </form>
</body>
</html>
