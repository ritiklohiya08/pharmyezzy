<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FinalProject.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table style="width:1150px; color:white; height:30px">

        <tr style="width:1110px; height:310px">
                    <td colspan="3">
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:Timer ID="Timer1" Interval="2000" runat="server" OnTick="Timer1_Tick"></asp:Timer>
                                <asp:Image ID="Image2" BackColor="White" BorderColor="Gray" BorderStyle="Double" Height="270px" Width="1140px" ImageAlign="Middle" runat="server" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>

        <!-- content -->
        <tr>
            <td colspan="2" style="text-align:right">
                <asp:Label ID="Label4" runat="server" Font-Bold="true" Font-Italic="true" Font-Names="Bahnschrift SemiBold" style="color: #000000"></asp:Label>
                <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="true" Font-Names="Arial Rounded MT Bold" NavigateUrl="~/Login.aspx">Click to Login</asp:HyperLink>
                <asp:Button ID="Button1" runat="server" Text="Log Out" BorderColor="White" Font-Bold="true" Font-Names="Comic Sans MS" ForeColor="Aqua" Height="27px" Width="105px" OnClick="Button1_Click"/>

            </td>
            <td style="text-align:right">
                <asp:DropDownList ID="ProductCategories" runat="server" Font-Bold="true" Font-Size="Medium" AutoPostBack="true">
                </asp:DropDownList>&nbsp;
                <asp:TextBox ID="TextBox1" runat="server" Height="21px" Width="174px"></asp:TextBox>
                <asp:ImageButton ID="ImageButton2" Height="29px" Width="26px" ImageUrl="~/images/search1.png" runat="server" OnClick="ImageButton2_Click" />
            </td>
        </tr>
    </table>

    <asp:DataList ID="DataList1" runat="server" DataKeyField="ProductId" DataSourceID="SqlDataSource1" Height="293px" Width="310px" RepeatColumns="4" OnItemCommand="DataList1_ItemCommand" OnItemDataBound="DataList1_ItemDataBound" RepeatDirection="Horizontal" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" >
        <ItemTemplate>
            <table>
                <tr>
                    <td style="text-align: center; background-color:rebeccapurple">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Pname") %>' Font-Bold="true" Font-Names="Open Sans Extrabold" ForeColor="White"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td style="text-align:center">
                        <asp:Image CssClass="All" ID="Image1" runat="server" BorderWidth="1px" Height="279px" Width="278px" ImageUrl='<%# Eval("Pimage") %>'/>
                        <div class="all">
                            &nbsp;Stock:&nbsp;
                            <asp:Label CssClass="txtStock" ID="Label5" runat="server" Text='<%# Eval("Pquantity") %>' BackColor='<%# (int)Eval("Pquantity") <= 10 ? System.Drawing.Color.Red : System.Drawing.Color.Green %>' >
                            </asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("ProductId") %>' Visible="false"></asp:Label>

                    </td>
                </tr>

                <tr>
                    <td style="text-align:center">
                        <asp:Label ID="Label2" runat="server" Text="Price: Rs." Font-Bold="true" Font-Names="Arial"></asp:Label>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Pprice") %>' Font-Bold="true" Font-Names="Arial"></asp:Label>

                    </td>
                </tr>
                <tr>
                    <td align="center">
                        Quantity
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td style="text-align: center">
                        <asp:ImageButton ID="ImageButton1" runat="server" Height="40px" ImageUrl="images/addtocart.png" Width="160px" CommandArgument='<%# Eval("ProductId") %>'  CommandName="AddToCart"/>
                    </td>
                </tr>

            </table>
        </ItemTemplate>
    </asp:DataList>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT [ProductId], [Pname], [Pimage], [Pprice], [Pquantity] FROM [Product1]">
        
    </asp:SqlDataSource>

</asp:Content>
