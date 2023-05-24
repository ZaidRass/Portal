<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Lecturer.aspx.cs" Inherits="MS3.Lecturer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 3629px;
        }
        #TextArea1 {
            height: 99px;
            width: 258px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="Label" runat="server" Text="Lecturer"></asp:Label>
        <br />
        <asp:Button ID="ViewProfile" runat="server" Text="ViewProfile" OnClick="ViewProfile_Click" />
        <br />
        <asp:Button ID="CreateProjectBUT" runat="server" Text="Create Project " OnClick="CreateProjectBUT_Click" />
        <br />
        <asp:Button ID="SpecifytThesisBUT" runat="server" Text="Specify Thesis Deadline" OnClick="SpecifytThesisBUT_Click" />
        <br />
        <asp:Button ID="CM" runat="server" Text="Create Meeting" OnClick="CM_Click" />
        <br />
        <asp:Button ID="ADDTODOLIST" runat="server" Text="Add To List" OnClick="ADDTODOLIST_Click" />
        <br />
        <asp:Button ID="ViewMeetings" runat="server" Text="View My Meetings" OnClick="ViewMeetings_Click" />
        <br />
        <asp:Button ID="ViewEE" runat="server" Text="View External Examiner" OnClick="ViewEE_Click" />
        <br />
        <asp:Button ID="RecEE" runat="server" Text="Recommend External Examiner" OnClick="RecEE_Click" />
        <br />
        <asp:Button ID="Supervise_Industrial" runat="server" Text="Supervise Industrial" OnClick="Supervise_Industrial_Click" />
        <br />
        <asp:Button ID="Grade_Thesis" runat="server" Text="Grade Thesis" OnClick="Grade_Thesis_Click" />
        <br />
        <asp:Button ID="Grade_defense" runat="server" Text="Grade Defense" OnClick="Grade_defense_Click" />
        <br />
        <asp:Button ID="Create_Progress_Report" runat="server" Text="Create Progress Report" OnClick="Create_Progress_Report_Click" />
        <br />
        <asp:Button ID="Grade_Progress_Report" runat="server" Text="Grade Progress Report" OnClick="Grade_Progress_Report_Click" />
        <br />
        <br />
        <br />
        <br />
        
        <br />
        <br />
        <br />
        <br />
        <br />
        
        <br />
        <asp:Label ID="Label12" runat="server" Text="View Meetings:"></asp:Label>
        <br />
        still need to make this<br />
        <br />
        <asp:Label ID="Label13" runat="server" Text="View External Examiner"></asp:Label>
        <br />
        same need to make this<br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
       <br />
        <br />
       <br />
        <br />
       <br />
        <br />
        <br />
        <br />
      
        
        
    </form>
</body>
</html>


