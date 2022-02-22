<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ToDo.aspx.cs" Inherits="ToDoList.ToDo1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>     
    <style>
        .content {
            max-width: 800px;
            margin: auto;
            padding-top: 200px;
            padding-left: 200px;
            padding-right: 200px;
            padding-bottom: 200px;
        }            
    </style>   
    <script >
       // Function to check if any task is selected or not
        function btnDeleteItem_OnClientClick(sender) {
            var count = 0;
            //Reference the GridView.
            var grid = document.getElementById("<%=gvTaskView.ClientID%>");

            //Reference the CheckBoxes in GridView.
            var checkBoxes = grid.getElementsByTagName("INPUT");
            for (var i = 0; i < checkBoxes.length; i++) {
                if (checkBoxes[i].checked) { 
                    count++;
                    break;
                }
            }
            if (count == 0) {
                alert("Select atleast one Task");
                return false;
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">       
        <div class="content">
            <table>
                <tr>
                    <td>
                        <asp:Label ID="lblUserName" runat="server" Text="UserName: "></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblUsrValue" runat="server"></asp:Label>
                    </td>
                    <td width="60%"></td>
                    <td>
                        <asp:LinkButton ID="lnkLogout" runat="server" Text="LogOut" OnClick="lnkLogout_Click"></asp:LinkButton>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="lblTask" runat="server" Text="Tasklists" ForeColor="#663300" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>                     

                        <asp:GridView ID="gvTaskView" runat="server" AutoGenerateColumns="false" Width="80%" DataKeyNames="ToDoID">
                            <Columns>
                                <asp:TemplateField HeaderStyle-Width="50px" ItemStyle-Width="50px">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkRow" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="ToDoID" HeaderText="" ItemStyle-Width="0px" Visible="false" />
                                <asp:BoundField DataField="Description" HeaderText="Description" ItemStyle-Width="250px" ItemStyle-HorizontalAlign="Left" />
                                <asp:BoundField DataField="Timestamp" HeaderText="TimeStamp" ItemStyle-Width="250px" ItemStyle-HorizontalAlign="Center" />
                            </Columns>
                        </asp:GridView>

                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td>
                        <asp:TextBox ID="txtToDoName" runat="server" Text =""></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btnAddItem" runat="server" Text="Add Task" OnClick="btnAddItem_Click" />
                    </td>
                    <td>
                        <asp:Button ID="btnDeleteItem" runat="server" Text="Delete Task" OnClick="btnDeleteItem_Click" OnClientClick ="return btnDeleteItem_OnClientClick(this);"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID ="lblErrMsg" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
