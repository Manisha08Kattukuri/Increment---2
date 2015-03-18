<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="useregistration.aspx.cs" Inherits="VirtualL.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style1
    {
        width: 100%;
    }
    .style2
    {
        width: 302px;
    }
    .style3
    {
        width: 189px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
    <tr>
        <td class="style3">
            &nbsp;</td>
        <td class="style2">
            Fill the details below</td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextBox1" ErrorMessage="Enter User ID:" ValidationGroup="v1">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style3">
            Enter User Id:</td>
        <td class="style2">
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="TextBox2" ErrorMessage="Must enter name" 
                ValidationGroup="v1">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style3">
            Enter Name:</td>
        <td class="style2">
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="TextBox3" ErrorMessage="must enter password" 
                ValidationGroup="v1">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style3">
            Enter Password:</td>
        <td class="style2">
            <asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox>
        </td>
        <td>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="TextBox4" ErrorMessage="must enter email in correct format" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                ValidationGroup="v1">*</asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="style3">
            Enter Email :</td>
        <td class="style2">
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            &nbsp;</td>
        <td class="style2">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" ValidationGroup="v1" 
                onclick="btnSubmit_Click" />
        </td>
        <td>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                ValidationGroup="v1" />
            <br />
            <asp:Label ID="Label2" runat="server"></asp:Label>
        </td>
    </tr>   
</table>
</asp:Content>

