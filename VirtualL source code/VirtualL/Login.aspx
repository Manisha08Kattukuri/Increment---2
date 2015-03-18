<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="VirtualL.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style1
    {
        width: 100%;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
    <tr>
        <td>
            Enter User ID:</td>
        <td>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextBox1" ErrorMessage="Must Enter User Id" 
                ValidationGroup="g1"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            Enter Password:</td>
        <td>
            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="TextBox2" ErrorMessage="Must enter password" 
                ValidationGroup="g1"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            <asp:HyperLink ID="HyperLink1" runat="server" 
                NavigateUrl="~/useregistration.aspx">New User? Sign Up</asp:HyperLink>
        </td>
        <td>
            <asp:Button ID="btnLogin" runat="server" Text="Login" ValidationGroup="g1" 
                onclick="btnLogin_Click" />
        </td>
        <td>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                ValidationGroup="g1" />
            <br />
            <asp:Label ID="Label2" runat="server"></asp:Label>
        </td>
    </tr>
</table>
</asp:Content>

