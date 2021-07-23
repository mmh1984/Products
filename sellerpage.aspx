<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sellerpage.aspx.cs" Inherits="sellerpage" MasterPageFile="~/MasterPage.master"%>
<asp:Content ID="sellers" ContentPlaceHolderID="ContentBody" runat="server">
<div id="default">

    <div id="usermenu">

        <asp:Image ID="Image1" runat="server" />
        <h3>
            <asp:Literal ID="Literal1" runat="server"></asp:Literal></h3>
        <ul>
            <li><a href="edituser.aspx?user=seller">Edit Profile</a></li>
            <li><a href="addwatch.aspx"> Sell an item</a> </li>
            <li><a href="sellerpage.aspx?logout=true">Logout</a></li>
        </ul>
    </div>
    <div id="yourproducts" class="userproducts">
        
        <asp:Literal ID="Literal2" runat="server"></asp:Literal>
        <p>Search Product <asp:TextBox ID="txtsearch" runat="server" Width="180px"></asp:TextBox><asp:Button ID="Button1" runat="server" Text="Search" />
            *click on the photo to edit
        </p>
       
         <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <HeaderTemplate>
                <ul>    
            </HeaderTemplate>
            <ItemTemplate>
                <li>
                    <ul>
                        <li><a href="editwatch.aspx?id=<%# Eval("Id") %>"><img src='<%# Eval("photo") %>' alt="image"/></a></li>
                        <li>Product Name:<em><%# Eval("brand") %></em></li>
                        <li>Brand:<em> <%# Eval("model") %></em></li>
                    </ul>

                </li>
            </ItemTemplate>
            <FooterTemplate>
                </ul>
            </FooterTemplate>
        </asp:Repeater>
       
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WatchMen %>" SelectCommand="SELECT * FROM [tblSellers]"></asp:SqlDataSource>
       
    </div>


</div>

    </asp:Content>