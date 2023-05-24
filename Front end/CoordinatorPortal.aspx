<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CoordinatorPortal.aspx.cs" Inherits="MS3.CoordinatorPortal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
            <asp:Label ID="Label3" runat="server" Text="Assign TA with ID: "></asp:Label>
            <asp:TextBox ID="TA" runat="server"></asp:TextBox>
            <asp:Label ID="Label4" runat="server" Text=" to project ID: "></asp:Label>
            <asp:TextBox ID="project" runat="server"></asp:TextBox>
            <asp:Button ID="Save" runat="server" Text="save" OnClick="save_Click" />
            <br />
            <br />
        </div>
            <asp:Label ID="Label1" runat="server" Text="Enter ID: "></asp:Label>
            <asp:TextBox ID="ID" runat="server" Width="152px" style="margin-left: 15px"></asp:TextBox>
            <asp:Button ID="Search" runat="server" Text="Search" OnClick="Search_Click" />
            <br />
            <asp:DropDownList ID="Filter" runat="server" Width="136px">
                <asp:ListItem>Students</asp:ListItem>
                <asp:ListItem Value="TeachingAssistants">Teaching Assistants</asp:ListItem>
                <asp:ListItem>Lecturers</asp:ListItem>
                <asp:ListItem Value="ExternalExaminers">External Examiners</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:PlaceHolder ID="UserInfo" runat="server"></asp:PlaceHolder>
            <br />
            <br />
        </div>
        <div>
            <asp:Label ID="Label8" runat="server" Text="Recommended External Examiners"></asp:Label>
            <br />
            <br />
            <asp:PlaceHolder ID="recommended" runat="server"></asp:PlaceHolder>
            <br />
            <br />
        </div>
        <div>
            <asp:Label ID="Label10" runat="server" Text="Assign External Examiner with ID: "></asp:Label>
            <asp:TextBox ID="EEID" runat="server" style="margin-left: 5px" Width="107px"></asp:TextBox>
            <asp:Label ID="Label11" runat="server" Text=" to Project ID: "></asp:Label>
            <asp:TextBox ID="PID" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="save2" runat="server" Text="Save" OnClick="save2_Click" />
            <br />
            <br />
            <br />
        </div>
    <div>
        <br />
        <asp:Label ID="Label13" runat="server" Text="student id: "></asp:Label>
        <asp:TextBox ID="StudentID" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label14" runat="server" Text="Date: "></asp:Label>
        <asp:Calendar ID="Calendar" runat="server"></asp:Calendar>
        <br />
        <asp:Label ID="Label15" runat="server" Text="Time: "></asp:Label>
        <asp:TextBox ID="Time" runat="server" TextMode="Time"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label16" runat="server" Text="Location: "></asp:Label>
        <asp:TextBox ID="Location" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="schedDefense" runat="server" Text="Schedule Defense" OnClick="schedDefense_Click" />
    </div>
    </form>
    </body>
</html>
