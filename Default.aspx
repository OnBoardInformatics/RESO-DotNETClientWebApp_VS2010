<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApp.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js"></script>
    <style type="text/css">
        #val_string {
            width: 259px;
        }
        #val_operator {
            width: 166px;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {

            $("#btn_string").click(function () {

                var val_text = $("#txt_url").val();

                var val_valu = $("#val_string").val();
                var val_cddl = $("#ddl_string").val();
                var val_oper = $("#val_operator").val();

                //alert(value_cdd)
                if (val_text != "") {
                    val_text = val_text + " and " + val_cddl + " " + val_oper + " '" + val_valu + "'";
                }
                else {
                    val_text = val_cddl + " " + val_oper + " '" + val_valu + "'";
                }

                $("#txt_url").val(val_text);

            });

        }
);
    </script> 

</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table border="1">
            <tr>
                <td><asp:Label ID="lblToken" runat="server" Text="Application Token"></asp:Label></td>
                <td colspan="4"><asp:TextBox ID="txtToken" runat="server" Width="592px"></asp:TextBox></td>
            </tr>   
            <tr>
                <td >
                  <asp:Label ID="lblFilter" runat="server" Text="Filter"></asp:Label>  
                </td>
                <td>
                    <select id="ddl_string">
                        <option value="OriginatingSystemKey">OriginatingSystemKey</option>
                        <option value="MLSStatus">MLSStatus</option>
                        <option value="City">City</option>
                        <option value="StateOrProvince">StateOrProvince</option>
                        <option value="PostalCode">PostalCode</option>
                        <option value="PropertyType">PropertyType</option>
                    </select>                    
                </td>
                <td>
                    <select id="val_operator">
                        <option value="eq">Equal</option>
                        <option value="ne">Not Equal</option>
                        <option value="gt">Greater Than</option>
                        <option value="ge">Greater Than or Equal</option>
                        <option value="lt">Less Than</option>
                        <option value="le">Less Than or Equal</option>
                    </select>  
                </td>
                <td>
                    <input type="text" id="val_string" />
                </td>
                <td>
                    <input type="button" id="btn_string" value="Add Filter" />
                </td>
            </tr> 
            <tr>
                <td><asp:Label ID="lbl_uri" runat="server" Text="Query URI"></asp:Label></td>
                <td colspan="3"><asp:TextBox ID="txt_url" runat="server" Width="592px"></asp:TextBox></td>
                <td>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit Query" Width="111px" />
                </td>
            </tr> 
       </table>
       <table>  
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server"></asp:GridView>
                </td>
            </tr>                           
        </table>
   
    </div>
    </form>
</body>
</html>
