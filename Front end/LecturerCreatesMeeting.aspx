<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LecturerCreatesMeeting.aspx.cs" Inherits="MS3.LecturerCreatesMeeting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label8" runat="server" Text="Create Meeting"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label41" runat="server" Text="Start Time" ></asp:Label>
        &nbsp;<asp:TextBox ID="CMSTARTTIME" runat="server" required="required" TextMode="Time"></asp:TextBox>
        <br />
        <asp:Label ID="Label42" runat="server" Text="End Time"  ></asp:Label>
        &nbsp;<asp:TextBox ID="CMENDTIME" runat="server" required="required" TextMode="Time"></asp:TextBox>
        <br />
        <asp:Label ID="Label43" runat="server" Text="Meeting Point"></asp:Label>
        &nbsp;<asp:TextBox ID="CMPOINT" runat="server" required="required"></asp:TextBox>
        <br />
        <asp:Label ID="Label44" runat="server" Text="Date"></asp:Label>
        &nbsp;<asp:TextBox ID="CMDATE" runat="server" required="required" TextMode="DateTime"></asp:TextBox>
        <br />
        <asp:Button ID="CreateMeeting" runat="server" Text="Create Meeting" OnClick="CreateMeeting_Click" />
        
        </div>
    </form>
</body>
</html>
