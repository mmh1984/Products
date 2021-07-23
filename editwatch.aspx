<%@ Page Language="C#" AutoEventWireup="true" CodeFile="editwatch.aspx.cs" Inherits="editwatch" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="editprod" ContentPlaceHolderID="ContentBody" runat="server">
    <div id="default">
      <div id="loginpage">
           

        <h1>Watch Details</h1>
        <p>Fields with * are required
        </p>
        <asp:Literal ID="Literal1" runat="server"></asp:Literal>


        <table>
         
            
            <tr>
                <td>*Brand</td>
                <td>
                    <asp:DropDownList ID="brand" runat="server">
                        <asp:ListItem>Luminox</asp:ListItem>
                        <asp:ListItem>Omega</asp:ListItem>
                        <asp:ListItem>Fossil</asp:ListItem>
                        <asp:ListItem>Guess</asp:ListItem>
                        <asp:ListItem>Swatch</asp:ListItem>
                        <asp:ListItem>Seiko</asp:ListItem>
                        <asp:ListItem>Rotary</asp:ListItem>
                        <asp:ListItem>Citizen</asp:ListItem>
                        <asp:ListItem>Sekonda</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>*Model</td>
                <td>
                    <asp:TextBox ID="txtmodel" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtmodel" ErrorMessage="*please fill in this field" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">*Description</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtdesc" runat="server" Height="85px" TextMode="MultiLine" Width="197px"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtdesc" ErrorMessage="*please fill in this field" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>

            <tr>
                <td>*Price</td>
                <td>
                    <asp:TextBox ID="txtprice" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtprice" ErrorMessage="*please fill in this field" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>*Quantity</td>
                <td>
                    <asp:TextBox ID="txtqty" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtqty" ErrorMessage="*please fill in this field" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
           
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />

                    &nbsp;<asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />

                </td>
                

                
                <td ></td>
            </tr>
        
        </table>
             <a href="sellerpage.aspx">Back</a>
        </div>
</div>

</asp:Content>