<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LecturerCreatesProject.aspx.cs" Inherits="MS3.LecturerCreatesProject" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="label1" runat="server" Text="Create Project"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="  Project Code"></asp:Label>
  
        <asp:TextBox ID="CreateProjectProjectCode" runat="server"></asp:TextBox>
        <br />
      <br /> 
        <asp:Label ID="Label4" runat="server" Text="Title"></asp:Label>
        <asp:TextBox ID="CreateProjectTitle" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="label6" runat="server" Text="Major Code"></asp:Label>
        <asp:TextBox ID="CreateProjectMajorCode" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label5" runat="server" Text="Description"></asp:Label>
        <br />
        <asp:TextBox ID="CreateProjectDescription" runat="server"></asp:TextBox>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="CreateProject" runat="server" Text="Create" OnClick="CreateProject_Click" />
        <br />
        <div>
        </div>
    </form>
</body>
</html>
