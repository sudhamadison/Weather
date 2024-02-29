<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WeatherReport.aspx.cs" Inherits="WeatherApp.WeatherReport" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="MainContent">


    <div style="width: 100%">
        <div style="margin-bottom: 40px;"></div>

        <div style="width: 50%; text-align: left">
            <asp:Label ID="labelZipcode" runat="server" Text="Enter zipcode"></asp:Label>
            <asp:TextBox ID="textboxZipcode" runat="server"></asp:TextBox>
        </div>

        <div style="margin-bottom: 20px;"></div>

        <div style="width: 50%; text-align: left">
            <asp:Label ID="labelDate" runat="server" Text="Select Date"></asp:Label>
            <asp:DropDownList ID="ddlDate" runat="server"></asp:DropDownList>
        </div>

        <div style="margin-bottom: 20px;"></div>

        <div style="width: 15%; text-align: center">
            <asp:Button ID="buttonSubmit" runat="server" Text="Submit" OnClick="buttonSubmit_Click"></asp:Button>
        </div>

    </div>
<div>
    <asp:GridView ID="gvWeatherReport" runat="server" AutoGenerateColumns >
        <Columns>
            <asp:BoundField DataField="zipcode" HeaderText="Zipcode" />
            <asp:BoundField DataField="city" HeaderText="City" />
            <asp:BoundField DataField="state_name" HeaderText="State" />
            <asp:BoundField DataField="sunrise" HeaderText="Sunrise" />
            <asp:BoundField DataField="sunset" HeaderText="Sunset" />
            <asp:BoundField DataField="max_temp" HeaderText="MaximumTemp" />
            <asp:BoundField DataField="min_temp" HeaderText="MinimumTemp" />
            <asp:BoundField DataField="humidity" HeaderText="Humidity" />
            <asp:BoundField DataField="pressure" HeaderText="Pressure" />
            <asp:BoundField DataField="climate" HeaderText="Climate" />
            <asp:BoundField DataField="alert" HeaderText="Weather_alert" />
            <asp:BoundField DataField="weather_date" HeaderText="WeatherDate" />
        </Columns>
    </asp:GridView>
</div>


</asp:Content>




