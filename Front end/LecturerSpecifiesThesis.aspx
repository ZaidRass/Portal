<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LecturerSpecifiesThesis.aspx.cs" Inherits="MS3.LecturerSpecifiesThesis" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label7" runat="server" Text="Specify Thesis Deadline"></asp:Label>
        <br />
        <asp:Calendar ID="DeadlineCal" runat="server" OnSelectionChanged="DeadlineCal_SelectionChanged"></asp:Calendar>
        
            <asp:Button ID="setDeadline" runat="server" Text="Save" OnClick="DeadlineCal_SelectionChanged"/>
        
        </div>
    </form>
</body>
</html>
