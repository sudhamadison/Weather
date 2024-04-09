<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="samplevalidatore.aspx.cs" Inherits="validators_ex.samplevalidatore" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function testonblur()
        {
            alert('thi is onblur');
        }
        function val() {

            const startdate = new Date(document.getElementById('txtstartdate').value);
            const enddate = new Date(document.getElementById('txtenddate').value);
            console.log(startdate);
            console.log(enddate);

            if (startdate > enddate) {
                document.getElementById("errorMsg").innerHTML = "Start date should be less than end date";
                return false;
            }
            document.getElementById("errorMsg").innerHTML = "";
            return true;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width: 100%">
            <div style="width: 50%">
                <asp:Label ID="Firstname" runat="server" Text="First Name"></asp:Label>
            </div>
            <div style="width: 50%">
                <asp:TextBox ID="txtfirstname" runat="server" Width="164px" MaxLength="15" onblur="testonblur()"></asp:TextBox>
                <asp:Label ID="Label1" runat="server"></asp:Label>

                <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                    ControlToValidate="txtfirstname"
                    ValidationExpression="^[a-z A-Z]*$"
                    Display="Dynamic"
                    ErrorMessage="Firstname should not have special characters"
                    EnableClientScript="False"
                    Style="color: red"
                    runat="server" />
            </div>
            <br />

            <div style="width: 50%">
                <asp:Label ID="Lastname" runat="server" Text="Last Name" Maxlength="15"></asp:Label>
            </div>
            <div style="width: 50%">
                <asp:TextBox ID="txtlastname" runat="server" Width="161px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqlastname" runat="server"
                    ErrorMessage="Lastname is required" Style="color: red"
                    ControlToValidate="txtlastname"></asp:RequiredFieldValidator>
            </div>
            <div style="width: 50%">
                <asp:Label ID="dob" runat="server" Text="DOB"></asp:Label>
                <div>
                    <asp:TextBox ID="txtdob" runat="server" ReadOnly="true"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqdob" runat="server"
                        ErrorMessage="DOB is required" Style="color: red"
                        ControlToValidate="txtlastname"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2"
                        ControlToValidate="txtlastname"
                        ValidationExpression="^[a-z A-Z]*$"
                        Display="Static"
                        ErrorMessage="Lastname should not have special characters"
                        EnableClientScript="False"
                        runat="server" />
                </div>
            </div>
           
            <div style="width: 100%">
                <asp:Label ID="startdate" Text="Start Date" runat="server">
                </asp:Label>

                <asp:TextBox ID="txtstartdate" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ErrorMessage="Date is required" Style="color: red"
                    ControlToValidate="txtstartdate"></asp:RequiredFieldValidator>

                <asp:Label ID="enddate" Text="End Date" runat="server">
                </asp:Label>

                <asp:TextBox ID="txtenddate" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ErrorMessage="Date is required" Style="color: red"
                    ControlToValidate="txtenddate"></asp:RequiredFieldValidator>

                <div>
                    <asp:Label ID="totalNoOfClaim" runat="server" Text="Total number of claim">

                    </asp:Label>
                    <div>
                        <asp:TextBox ID="txtTotalClaim" runat="server">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqtotal" runat="server" ErrorMessage="Enter number between 1-10" ControlToValidate="txtTotalClaim" Style="color: red">

                        </asp:RequiredFieldValidator>

                    </div>
                </div>
                <div style="width: 100%; align-content: center">
                    <asp:Button ID="save" Text="SAVE" runat="server" OnClientClick="val();" OnClick="save_Click" />

                    <asp:Label ID="errorMsg" runat="server"></asp:Label>

                </div>
            </div>
    </form>
</body>
</html>
