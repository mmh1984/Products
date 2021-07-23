<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="log" ContentPlaceHolderID="ContentBody" runat="server">
    <div id="default">
        <div id="loginpage">

            
            <br />
        <h2>Member Login</h2>
    
      <table>
            
            <tr>
                <td>
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal></td>
            </tr>
            
            <tr>
                <td>
                    Username</td>
            </tr>
            
            <tr>
                <td>
                    <asp:TextBox ID="txtusername" runat="server"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*this field cannot be empty" Font-Size="Small" ForeColor="Red" ControlToValidate="txtusername"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Password</td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="txtpassword" runat="server" TextMode="Password"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*this field cannot be empty" Font-Size="Small" ForeColor="Red" ControlToValidate="txtpassword"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click"/>
                    <a href="register.aspx">Signup</a></td>
            </tr>
        </table>
             <fieldset>
                 <legend>Login Options</legend>
         <ul>
             <li>Log in as seller: Sell products </li>
             <li>Log in as buyer: Buy products </li>
         </ul>
     </fieldset>


    </div>

        </div>
</asp:Content>
