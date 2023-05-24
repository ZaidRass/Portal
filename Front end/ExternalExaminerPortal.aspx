<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExternalExaminerPortal.aspx.cs" Inherits="MS3.ExternalExaminerPortal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
                <asp:Label ID="Label1" runat="server" Text="External Examiner id: "></asp:Label>
                <asp:TextBox ID="EEID" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label2" runat="server" Text="Student id: "></asp:Label>
                <asp:TextBox ID="sid" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label3" runat="server" Text="Thesis title: "></asp:Label>
                <asp:TextBox ID="thesistitle" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label4" runat="server" Text="External Examiner Grade: "></asp:Label>
                <asp:TextBox ID="EEgrade" runat="server"></asp:TextBox>
                <br />
                <asp:Button ID="Grade" runat="server" Text="Submit" OnClick="Grade_Click" />
                <br />
                <br />
            </div>
        </div>
        <div>
                <asp:Label ID="Label5" runat="server" Text="External Examiner id: "></asp:Label>
                <asp:TextBox ID="EEID1" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label6" runat="server" Text="Student id: "></asp:Label>
                <asp:TextBox ID="sid1" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label7" runat="server" Text="Defense Location: "></asp:Label>
                <asp:TextBox ID="DefenseLocation" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label8" runat="server" Text="External Examiner Grade: "></asp:Label>
                <asp:TextBox ID="EEgrade1" runat="server"></asp:TextBox>
                <br />
                <asp:Button ID="Submit" runat="server" Text="Submit" OnClick="Submit_Click" />
            </div>
    </form>
</body>
</html>
