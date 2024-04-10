<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="samplevalidatore.aspx.cs" Inherits="validators_ex.samplevalidatore" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">

        function isDateValid(dateStr) {
            return !isNaN(new Date(dateStr));
        }

        function validateDOB() {
            
            document.getElementById("lblDOBErrorMsg").innerHTML = '';
            if (!isDateValid(document.getElementById("txtdob").value)) {
                document.getElementById("lblDOBErrorMsg").innerHTML = "Enter valid DOB.";
            }
        }

        function validateStartDate() {
            document.getElementById("lblStartDateErrorMsg").innerHTML = '';
            if (!isDateValid(document.getElementById("txtstartdate").value)) {
                document.getElementById("lblStartDateErrorMsg").innerHTML = "Enter valid Date.";
            }
        }

        function validateEndDate() {
            document.getElementById("lblEndDateErrorMsg").innerHTML = '';
            if (!isDateValid(document.getElementById("txtenddate").value)) {
                document.getElementById("lblEndDateErrorMsg").innerHTML = "Enter valid Date.";
            }
        }

        function futureDateCheck() {
            validateDOB();
            document.getElementById("lblFutureDateErrorMsg").innerHTML = '';

            var givenDate = new Date(document.getElementById("txtdob").value);
            var currentDate = new Date();
            if(givenDate > currentDate )
            {
                document.getElementById("lblFutureDateErrorMsg").innerHTML = "Don't enter future date";
            }
        }

        function pastDateCheck() {
            validateStartDate()
            document.getElementById("lblPastDateErrorMsg").innerHTML = '';
            var startDate = new Date(document.getElementById("txtstartdate").value);
            var currentDate = new Date();
            if(startDate <= currentDate)
            {
                document.getElementById("lblPastDateErrorMsg").innerHTML = "Enter current or future date";
            }
        }

        function pastDateCheck2() {
            validateEndDate()
            document.getElementById("lblPastDateErrorMsg2").innerHTML = '';
            var x=new Date(document.getElementById("txtstartdate").value);
            var endDate = new Date(document.getElementById("txtenddate").value);
            var currentDate = new Date();
            if (endDate <= currentDate)
            {
                
                document.getElementById("lblPastDateErrorMsg2").innerHTML = "Enter current or future date.";
            }
        }

        function testonchange() {
           
            var x = document.getElementById("txtlastname").value;
            x = x.toUpperCase();
            document.getElementById("txtlastname").value = x;
        }
        function testonchange2() {

            var x = document.getElementById("txtfirstname").value;
            x = x.toUpperCase();
            document.getElementById("txtfirstname").value = x;
        }

        function val() {
            document.getElementById("errorMsg").innerHTML = "";
            const startdate = new Date(document.getElementById('txtstartdate').value);
            const enddate = new Date(document.getElementById('txtenddate').value);
           
            if (startdate > enddate) {
                document.getElementById("errorMsg").innerHTML = "Start date should be less than end date";
                return false;
            }
          
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
                <asp:TextBox ID="txtfirstname" runat="server" Width="164px" MaxLength="15"  onchange="testonchange2()"></asp:TextBox>
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
                <asp:TextBox ID="txtlastname" runat="server" Width="161px" onchange="testonchange()"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqlastname" runat="server"
                    ErrorMessage="Lastname is required" Style="color: red"
                    ControlToValidate="txtlastname"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2"
                    ControlToValidate="txtlastname"
                    ValidationExpression="^[a-z A-Z]*$"
                    Display="Static"
                    ErrorMessage="Lastname should not have special characters"
                    EnableClientScript="False"
                    runat="server" />
            </div>
            <br />

            <div style="width: 50%">
                <asp:Label ID="dob" runat="server" Text="DOB"></asp:Label>
                <div>
                    <asp:TextBox ID="txtdob" runat="server" onblur="futureDateCheck()" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqdob" runat="server"
                        ErrorMessage="DOB is required" Style="color: red"
                        ControlToValidate="txtlastname"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblDOBErrorMsg" runat="server" Style="color: red"></asp:Label>
                    <asp:Label ID="lblFutureDateErrorMsg" runat="server" Style="color: red"></asp:Label>
                </div>
            </div>
            <br />

            <div style="width: 100%">
                <asp:Label ID="startdate" Text="Start Date" runat="server">
                </asp:Label>
                <asp:TextBox ID="txtstartdate" runat="server" onblur="pastDateCheck()"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ErrorMessage="Date is required" Style="color: red"
                    ControlToValidate="txtstartdate"></asp:RequiredFieldValidator>
                <asp:Label ID="lblStartDateErrorMsg" runat="server" Style="color: red"></asp:Label> 
                <asp:Label ID="lblPastDateErrorMsg" runat="server" Style="color: red"></asp:Label> 
                <asp:Label ID="enddate" Text="End Date" runat="server"> </asp:Label>
                <asp:TextBox ID="txtenddate" runat="server" onblur="pastDateCheck2()"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ErrorMessage="Date is required" Style="color: red"
                    ControlToValidate="txtenddate"></asp:RequiredFieldValidator>
                <asp:Label ID="lblEndDateErrorMsg" runat="server" Style="color: red"></asp:Label>
                <asp:Label ID="lblPastDateErrorMsg2" runat="server" Style="color: red"></asp:Label> 
                <div>
                    <br />

                    <asp:Label ID="totalNoOfClaim" runat="server" Text="Total number of claim">
                    </asp:Label>
                    <div>
                        <asp:TextBox ID="txtTotalClaim" runat="server">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqtotal" runat="server" ErrorMessage="Enter number between 1-10" ControlToValidate="txtTotalClaim" Style="color: red">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <br />

                <div style="width: 100%; align-content: center">
                    <asp:Button ID="save" Text="SAVE" runat="server" OnClientClick="return val();" OnClick="save_Click" />
                    <asp:Label ID="errorMsg" runat="server" Style="color:red"></asp:Label>
                </div>
            </div>
    </form>
</body>
</html>
