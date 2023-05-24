<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LecturerCreatesProgressReport.aspx.cs" Inherits="MS3.LecturerCreatesProgressReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <br />
        <asp:Label ID="Label31" runat="server" Text="Create Progress Report"></asp:Label>
        :<br />
        <br />
        <asp:Label ID="Label33" runat="server" Text="Student ID"></asp:Label>
        <asp:TextBox ID="CPRSID" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label34" runat="server" Text="Content"></asp:Label>
        <br />
        <asp:TextBox ID="CPRCONTENT" runat="server" Height="124px" Width="233px"></asp:TextBox>
        <br />
        <asp:Label ID="Label35" runat="server" Text="Date"></asp:Label>
        <br />
        <asp:Calendar ID="CPRCALENDAR" runat="server"></asp:Calendar>
        <asp:Button ID="CPRGBUTTON" runat="server" Text="Create" OnClick="CPRGBUTTON_Click" />
        
        </div>
    </form>
</body>
</html>
