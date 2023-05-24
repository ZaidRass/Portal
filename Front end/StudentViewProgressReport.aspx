<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentViewProgressReport.aspx.cs" Inherits="MS3.StudentViewProgressReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 772px">
            <br />
            <asp:Label ID="Label2" runat="server" Text="Date"></asp:Label>
            <br />
            <br />
            <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="View" />
            <br />
            <br />
            <asp:GridView ID="ye" runat="server" BackColor="#CCCCCC" BorderColor="#666666" BorderWidth="2px" CellSpacing="10">
            </asp:GridView>
        </div>
    </form>
</body>
</html>
