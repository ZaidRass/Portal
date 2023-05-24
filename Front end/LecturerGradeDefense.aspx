<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LecturerGradeDefense.aspx.cs" Inherits="MS3.LecturerGradeDefense" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <br />
        <asp:Label ID="Label25" runat="server" Text="Grade Defense: "></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label28" runat="server" Text="Student ID"></asp:Label>
        <asp:TextBox ID="GDSID" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label29" runat="server" Text="Defense Location"></asp:Label>
        <asp:TextBox ID="GDLOCATION" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label30" runat="server" Text="Lecturer Grade"></asp:Label>
        <asp:TextBox ID="GDGRADE" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="GD" runat="server" Text="Grade" OnClick="GD_Click" />
        
        </div>
    </form>
</body>
</html>
