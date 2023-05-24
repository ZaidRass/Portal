<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TeachingAssistantPortal.aspx.cs" Inherits="MS3.TeachingAssistantPortal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Student ID: "></asp:Label>
            <asp:TextBox ID="SID" runat="server"></asp:TextBox>
            <br />
            <br />
        <asp:Label ID="Label2" runat="server" Text="Date: "></asp:Label>
            <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
            <br />
            Content:
            <asp:TextBox ID="content" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="progReport" runat="server" Text="Create Progress Report" OnClick="progReport_Click" />
            <br />
            <br />
            <asp:PlaceHolder ID="ProgressReport" runat="server"></asp:PlaceHolder>
            <br />
        </div>
        <div>
            <asp:Label ID="Label3" runat="server" Text="Meeting ID: "></asp:Label>
            <asp:TextBox ID="meeting_id" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Text="To Do List: "></asp:Label>
            <br />
            <asp:TextBox ID="ToDoList" runat="server" TextMode="MultiLine"></asp:TextBox>
            <br />
            <asp:Button ID="Add" runat="server" Text="Add" OnClick="Add_Click" />
        </div>
    </form>
</body>
</html>
