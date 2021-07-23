<%@ Page Language="C#" AutoEventWireup="true" CodeFile="product.aspx.cs" Inherits="product" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="prod" ContentPlaceHolderID="ContentBody" runat="server">
    <div class="userproducts">
        <div id="dashboard">
            <h2>Welcome</h2>
              <asp:Image ID="Image1" runat="server" />
        <h3>
            <asp:Literal ID="Literal1" runat="server"></asp:Literal></h3>
        <ul>
            <li><a href="edituser.aspx?user=buyer">Edit Profile</a></li>
            <li><a href="viewcart.aspx">View Cart</a> </li>
            <li><a href="viewpurchase.aspx">View Purchases</a> </li>
            <li><a href="product.aspx?logout=true">Logout</a></li>
        </ul>

        </div>
     <p>Search Product <asp:TextBox ID="txtsearch" runat="server" Width="180px"></asp:TextBox><asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" />
            *click on the photo to view
        </p>
       
         <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <HeaderTemplate>
                <ul>
                    
            </HeaderTemplate>
            <ItemTemplate>
                <li>
                    <ul>
                        <li><a href="product.aspx?id=<%# Eval("Id") %>"><img src='<%# Eval("photo") %>' alt="image"/></a></li>
                        <li>Product Name:<em><%# Eval("brand") %></em></li>
                        <li>Brand:<em> <%# Eval("model") %></em></li>
                        <li>Price:<em> <%# Eval("price") %></em></li>
                        <li>Seller:<em> <%# Eval("sellername") %></em></li>
                    </ul>

                </li>
            </ItemTemplate>
            <FooterTemplate>
                </ul>
            </FooterTemplate>
        </asp:Repeater>
       
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WatchMen %>" SelectCommand="SELECT * FROM [tblSellers]"></asp:SqlDataSource>
       </div>
</asp:Content>