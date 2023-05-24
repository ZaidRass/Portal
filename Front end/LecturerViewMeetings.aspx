<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LecturerViewMeetings.aspx.cs" Inherits="MS3.LecturerViewMeetings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Meeting ID"></asp:Label>
            <asp:TextBox ID="VMMID" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="ViewMeetingBUT" runat="server" Text="View" OnClick="ViewMeetingBUT_Click" />
            <br />
            <asp:GridView ID="ye" runat="server" BackColor="#CCCCCC" BorderColor="#666666" BorderWidth="2px" CellSpacing="10">
                    </asp:GridView>
            <br />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
