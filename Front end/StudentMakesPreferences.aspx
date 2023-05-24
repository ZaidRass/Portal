<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentMakesPreferences.aspx.cs" Inherits="MS3.StudentMakesPreferences" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 124px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 125px">
            <asp:Label ID="Label1" runat="server" Text="Bacehlor Code"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Preference Number"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Make Preference" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
