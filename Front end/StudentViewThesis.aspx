<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentViewThesis.aspx.cs" Inherits="MS3.StudentViewThesis" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 469px">
            <br />
            <asp:Label ID="Label2" runat="server" Text="Thesis Title"></asp:Label>
            <asp:TextBox ID="Thesis_title" runat="server"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="View" OnClick="Button1_Click" />
            <br />
            <asp:GridView ID="Grid" runat="server" BackColor="#CCCCCC" BorderColor="#666666" BorderWidth="2px" CellSpacing="10">
                    </asp:GridView>
        </div>
    </form>
</body>
</html>
