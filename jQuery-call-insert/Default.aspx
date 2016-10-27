<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="../alertifyjs/css/alertify.min.css" rel="stylesheet" />
    <link href="../alertifyjs/css/alertify.rtl.min.css" rel="stylesheet" />
    <title>jQuery AJAX call to insert records to database</title>
    
</head>
<body>
    <form id="form1" runat="server">
    <div>     
        <table align="center" class="style1">
            <tr>
                <td> Name  </td>
                <td> <asp:TextBox ID="txtName" runat="server" ClientIDMode="Static"></asp:TextBox></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    Age
                </td>
                <td>
                    <asp:TextBox ID="txtAge" runat="server" ClientIDMode="Static"></asp:TextBox>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                   Sex
                </td>
                <td>
                    <asp:TextBox ID="txtSex" runat="server" ClientIDMode="Static"></asp:TextBox>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>          
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    <input type="submit" id="btnsubmit" value="Submit" />
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
    
    </form>

      <script type="text/javascript" src="//code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="../alertifyjs/alertify.js"></script>
    <script src="../alertifyjs/alertify.min.js"></script>
    
    <script type="text/javascript">
        $("#form1").submit(function (e) {
            e.preventDefault();
                var name = $('#txtName').val();
                var age = $('#txtAge').val();
                var sex = $('#txtSex').val();
            if (name =='') {
                alertify.error("Name is required");
                return false;
            }
                $.ajax({
                    type: "POST",
                    url: 'Default.aspx/Insert_Data',
                    data: "{'name':'" + name + "','age':'" + age + "','sex':'" + sex + "'}",
                    contentType: "application/json; charset=utf-8",
                    cache: false,
                    processData: false,
                    success: function (res) {
                        console.log(res);
                        //alert(res);
                        //return false;

                        if (res.d == true) {
                            alertify.success("Data Saved Successfully !!");
                            //location.href = 'rootcategory.php';
                        } else {
                             alertify.error("Saved Faild !!");
                        }
                       
                    },
                    error: function (res) {
                        alertify.error("Error !!");
                    }
                });

            });
       

    </script>
</body>
</html>
