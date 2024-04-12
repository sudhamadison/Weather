<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResponsiveWebDesign.aspx.cs" Inherits="validators_ex.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ResponsiveWebDesign</title>
    <link rel="stylesheet" href="style/forms.css" />
    <script src="validators/formValidators.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <img src="style/images/logo.jpg" class="img-responsive" />
                </div>
                <div class="col-md-9" style="color:orangered;  padding: 70px">
                    <h1 style="font-size:60px">INSURANCE COMPANY</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <h1 style="color:green; position: center">Claim Form</h1>
                    <hr />
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-6 ">
                            <asp:Label ID="Firstname" runat="server" Text="First Name" Maxlength="15" CssClass="formInput"></asp:Label>
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox ID="txtfirstname" runat="server" CssClass="formInput" onchange="testonchange2()"></asp:TextBox>
                        </div>
                        <div class="col-md-12">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                ErrorMessage="Firstname  is required"
                                ControlToValidate="txtfirstname" CssClass="errorMessage"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                                ControlToValidate="txtfirstname"
                                ValidationExpression="^[a-z A-Z]*$"
                                Display="Dynamic"
                                ErrorMessage="Firstname should not have special characters"
                                CssClass="errorMessage"
                                EnableClientScript="False"
                                runat="server" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <asp:Label ID="Lastname" runat="server" Text="Last Name" Maxlength="15" CssClass="formInput"></asp:Label>
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox ID="txtlastname" runat="server" CssClass="formInput" onchange="testonchange()"></asp:TextBox>
                        </div>
                        <div class="col-md-12">
                            <asp:RequiredFieldValidator ID="reqlastname" runat="server"
                                ErrorMessage="Lastname is required" CssClass="errorMessage"
                                ControlToValidate="txtlastname"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2"
                                ControlToValidate="txtlastname"
                                ValidationExpression="^[a-z A-Z]*$"
                                Display="Static"
                                ErrorMessage="Lastname should not have special characters"
                                CssClass="errorMessage"
                                EnableClientScript="False"
                                runat="server" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <asp:Label ID="dob" runat="server" Text="DOB" CssClass="formInput"></asp:Label>
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox ID="txtdob" runat="server" CssClass="formInput" onblur="futureDateCheck()"></asp:TextBox>
                        </div>
                        <div class="col-md-12">
                            <asp:RequiredFieldValidator ID="reqdob" runat="server"
                                ErrorMessage="DOB is required" CssClass="errorMessage"
                                ControlToValidate="txtlastname"></asp:RequiredFieldValidator>
                            <asp:Label ID="lblDOBErrorMsg" runat="server" CssClass="errorMessage"></asp:Label>
                            <asp:Label ID="lblFutureDateErrorMsg" runat="server" CssClass="errorMessage"></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <asp:Label ID="startdate" Text="Start Date" runat="server" CssClass="formInput"> </asp:Label>
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox ID="txtstartdate" runat="server" onblur="pastDateCheck()" CssClass="formInput"></asp:TextBox>
                        </div>
                        <div class="col-md-12">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                ErrorMessage="Date is required" CssClass="errorMessage"
                                ControlToValidate="txtstartdate"></asp:RequiredFieldValidator>
                            <asp:Label ID="lblStartDateErrorMsg" runat="server" CssClass="errorMessage"></asp:Label>
                            <asp:Label ID="lblPastDateErrorMsg" runat="server" CssClass="errorMessage"></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <asp:Label ID="enddate" Text="End Date" runat="server" CssClass="formInput"> </asp:Label>
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox ID="txtenddate" runat="server" onblur="pastDateCheck2()" CssClass="formInput"></asp:TextBox>
                        </div>
                        <div class="col-md-12">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                ErrorMessage="Date is required" CssClass="errorMessage"
                                ControlToValidate="txtenddate"></asp:RequiredFieldValidator>
                            <asp:Label ID="lblEndDateErrorMsg" runat="server" CssClass="errorMessage"></asp:Label>
                            <asp:Label ID="lblPastDateErrorMsg2" runat="server" CssClass="errorMessage"></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <asp:Label ID="totalNoOfClaim" runat="server" Text="Total number of claim" CssClass="formInput"> </asp:Label>
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox ID="txtTotalClaim" runat="server" CssClass="formInput"></asp:TextBox>
                        </div>
                        <div class="col-md-12">
                            <asp:RequiredFieldValidator ID="reqtotal" runat="server" ErrorMessage="Enter number between 1-10" ControlToValidate="txtTotalClaim" CssClass="errorMessage">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12" style="padding-left: 60px">
                            <asp:Button ID="save" Text="SAVE" runat="server" OnClientClick="return val();" OnClick="save_Click" CssClass="formInput" />
                            <asp:Label ID="errorMsg" runat="server" CssClass="errorMessage"></asp:Label>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <img src="style/images/samplepic.jpg" class="img-responsive" alt="InsuranceCompany" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
