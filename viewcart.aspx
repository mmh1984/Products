<%@ Page Language="C#" AutoEventWireup="true" CodeFile="viewcart.aspx.cs" Inherits="viewcart" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="carts" ContentPlaceHolderID="ContentBody" runat="server">
    
     <div id="userproducts">
         <div class="payment">
             <h3>Paypal ID</h3>
             <table>
                 <tr>
                     <th>Email or username:</th>
                     <td>
                        <asp:TextBox ID="txtemail" runat="server" TextMode="Email"></asp:TextBox>
                     </td>
                     <td class="auto-style2">

                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Email cannot be empty" Font-Italic="True" ForeColor="Red" ControlToValidate="txtemail"></asp:RequiredFieldValidator>

                     </td>
                 </tr>
                  <tr>
                     <th>Password:</th>
                     <td>
                        <asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox>
                     </td>
                      <td class="auto-style2">
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*input password" Font-Italic="True" ForeColor="Red" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                     </td>
                 </tr>
                 <tr>
                     
                     <td colspan="2">
                        
                         <asp:Button ID="btnPay" runat="server" Text="Login and Pay" OnClick="btnPay_Click" />
                         <asp:Button ID="btnClear" runat="server" Text="Clear Cart" OnClick="btnClear_Click" />
                        
                     </td>
                     
                 </tr>
             </table>
         </div>
            <div class="cartdetails">
             <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
               
                <ItemTemplate>
              <table>
                <tr>
                    <td colspan="2"><img src='<%# Eval("photo") %>' alt="img" /></td>
                </tr>
                <tr>
                    <th>Watch ID:</th>
                    <td><%# Eval("watchid") %></td>
                </tr>
                       <tr>
                    <th>Model:</th>
                    <td><%# Eval("brand") %></td>
                </tr>
                <tr>
                    <th>Model:</th>
                    <td><%# Eval("model") %></td>
                </tr>

                   <tr>
                    <th>Price:</th>
                    <td><%# Eval("price") %></td>
                </tr>
                 </table>
                    <hr />
               </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WatchMen %>" SelectCommand="SELECT Carts.watchid, tblSellers.brand, tblSellers.model, tblSellers.price, tblSellers.description, tblSellers.quantity, tblSellers.photo, tblSellers.sellername FROM Carts CROSS JOIN tblSellers"></asp:SqlDataSource>

            </div>

         </div>  
     
    
</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style2 {
            width: 99px;
        }
    </style>
</asp:Content>
