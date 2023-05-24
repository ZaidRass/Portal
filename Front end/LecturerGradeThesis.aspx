<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LecturerGradeThesis.aspx.cs" Inherits="MS3.LecturerGradeThesis" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <asp:Label ID="Label20" runat="server" Text="Grade Thesis"></asp:Label>
        :<br />
        <br />
        <asp:Label ID="Label22" runat="server" Text="Student ID"></asp:Label>
        <asp:TextBox ID="LGTSID" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label23" runat="server" Text="Thesis Title"></asp:Label>
        <asp:TextBox ID="LGTTITLE" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label24" runat="server" Text="Grade"></asp:Label>
        <asp:TextBox ID="LGTGRADE" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="LGT" runat="server" Text="Grade" OnClick="LGT_Click" />
        
        </div>
    </form>
</body>
</html>
