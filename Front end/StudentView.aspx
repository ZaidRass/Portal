<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentView.aspx.cs" Inherits="MS3.TempLol" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Info Display</title>
</head>
<body style="height: 27px">
    <form id="form1" runat="server">
        <table style="width: 100%; text-align: center; background-color: skyblue;">
            <tr>
                <td align="center">
                    <asp:PlaceHolder ID="userInfo" runat="server"></asp:PlaceHolder>
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="SVT" runat="server" Text="View My Thesis" OnClick="SVT_Click" />
        <br />
        <asp:Button ID="SST" runat="server" Text="Submit My Thesis" OnClick="SST_Click" />
        <br />
        <asp:Button ID="SVPR" runat="server" Text="View My Progress Report" OnClick="SVPR_Click" />
        <br />
        <asp:Button ID="SVD" runat="server" Text="View My Defense" OnClick="SVD_Click" />
        <br />
        <asp:Button ID="SUD" runat="server" Text="Update Defense Content" OnClick="SUD_Click" style="height: 29px" />
        <br />
        <asp:Button ID="SBPG" runat="server" Text="View Bachelor Project Grade" OnClick="SBPG_Click" />
        <br />
        <asp:Button ID="SVFM" runat="server" Text="View Free Meetings" OnClick="SVFM_Click" />
        <br />
        <asp:Button ID="SBM" runat="server" Text="Book A Meeting" OnClick="SBM_Click" />
        <br />
        <asp:Button ID="SVBM" runat="server" Text="View Booked Meetings" OnClick="SVBM_Click" />
        <br />
        <asp:Button ID="SATDL" runat="server" Text="Add To The To-Do List" OnClick="SATDL_Click" />
        <br />
        
    </form>
</body>
</html>
