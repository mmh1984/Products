<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addwatch.aspx.cs" Inherits="addwatch" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="sell" ContentPlaceHolderID="ContentBody" runat="server">
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
                <td>*Product Image</td>
                <td><asp:FileUpload ID="FileUpload1" runat="server"/>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="FileUpload1" ErrorMessage="*please fill in this field" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click"/>

                    <input id="Reset1" type="reset" value="reset" />
                </td>
                

                
                <td ></td>
            </tr>
        
        </table>
             <a href="sellerpage.aspx">Back</a>
        </div>
</div>

    </asp:Content> 
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style2 {
            height: 19px;
        }
    </style>
</asp:Content>
 