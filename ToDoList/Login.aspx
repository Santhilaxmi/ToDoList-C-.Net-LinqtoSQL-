<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ToDoList.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>        
    <style>
    .content {
        max-width: 500px;
        margin: auto;
        padding-top :200px;
        padding-left :200px;
        padding-right :200px;
        padding-bottom :200px;
    }
</style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="content">
            <table style="align-items: center">
                <tr>
                    <td>
                        <asp:Label ID="lblUserName" runat="server" Text="UserName: " Width ="90px"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtUserName" runat="server" Width ="150px">
                        </asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblPassword" runat="server" Text="Password: " Width ="90px"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width ="150px"></asp:TextBox>
                    </td>
                </tr>
                <tr><td width="120px"></td>

                    <td>
                        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick ="btnLogin_Click" />                        
                    </td>
                </tr>
                </table>
            <table>
                <tr>
                    <td width="120px"></td>
                    <td>
                        <asp:Label ID ="lblresult" runat ="server" Text ="" ForeColor ="Red"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
