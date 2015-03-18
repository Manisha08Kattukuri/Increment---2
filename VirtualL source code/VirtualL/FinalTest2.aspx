<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FinalTest2.aspx.cs" Inherits="VirtualL.FinalTest2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Online Exam Page</title>
<link href="StyleSheet.css" rel ="Stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
    <div>
     
        <asp:Label ID="Label1" runat="server" Font-Size="Medium" ForeColor="DarkRed" Style="z-index: 100;
            left: 64px; position: absolute; top: 19px" Text="Name : " Width="68px"></asp:Label>
        
        <asp:TextBox ID="txtName" runat="server" Style="z-index: 101; left: 149px; position: absolute;
            top: 20px" ReadOnly="True"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Style="z-index: 102; left: 321px; position: absolute;
            top: 18px" Text="Start Exam" ToolTip="Enter Your Name" OnClick="Button1_Click" />
        <asp:TextBox ID="txtScore" runat="server" Style="z-index: 103; left: 681px; position: absolute;
            top: 276px" Visible="False" Width="63px">0</asp:TextBox>
        
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

        <asp:Timer ID="Timer1" OnTick="Timer1_Tick" runat="server" Interval="1000">
            </asp:Timer>
        
        <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
            </Triggers>
            <ContentTemplate>
               Remaing Time for You: <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
            </ContentTemplate>
        </asp:UpdatePanel>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <asp:Panel ID="Panel1" runat="server" BackColor="#E0E0E0" BorderColor="#E0E0E0" Height="364px"
            Style="z-index: 104; left: 60px; position: absolute; top: 54px" Visible="False"
            Width="707px" ForeColor="#0000C0">
            <asp:Label ID="lblName" runat="server" Style="z-index: 100; left: 9px; position: absolute;
            top: -1px; right: 311px;" Text="Name : " ForeColor="#0000C0" Width="387px"></asp:Label>
            &nbsp;
            <asp:Label ID="lblScore" runat="server" ForeColor="Green" Style="z-index: 102; left: 567px;
                position: absolute; top: 11px" Text="Score : " Width="136px" 
                Visible="False"></asp:Label>
            <asp:Panel ID="Panel3" runat="server" Height="14px" 
                style="left:427px; z-index: 106; position: absolute; top: 10px; width: 119px; margin-bottom: 0px;">
          <span id="cd" style ="left:100px;"></span>
            </asp:Panel>
            <asp:Panel ID="Panel2" runat="server" Height="214px" Style="z-index: 103; left: 8px;
                position: absolute; top: 40px" Width="696px">
                <asp:RadioButtonList ID="RblOption" runat="server" Style="z-index: 102; left: 30px;
                    position: absolute; top: 36px" Width="515px">
                </asp:RadioButtonList>
                <asp:Label ID="lblQuestion" runat="server" Style="z-index: 100; left: 3px; position: absolute;
                    top: 7px" Text="Label" Width="682px"></asp:Label>
            <asp:Button ID="Button2" runat="server" Style="z-index: 106; left: 289px; position: absolute;
            top: 178px; height: 26px;" Text="Next" ToolTip="Click Here to Take Next Question" 
                    OnClick="Button2_Click" UseSubmitBehavior="False" />
            </asp:Panel>
            
            <asp:Label ID="Label3" runat="server" Text="Label" Visible="false" ForeColor="Red" Font-Bold="True"
            Style="position: absolute;top: 22px"></asp:Label>
            <asp:Button ID="Button3" runat="server" Text="Next Session" Visible="false" 
                Height="32px" onclick="Button3_Click1" Width="120px" 
                Style="position: absolute;top: 18px; left: 266px;" />
        </asp:Panel>
        </ContentTemplate>
         <Triggers>
        <asp:PostBackTrigger ControlID="Button3" />
        </Triggers>
        </asp:UpdatePanel>          
    
    </div>
    </form>
</body>
</html>


