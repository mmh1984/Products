<%@ Page Language="C#" AutoEventWireup="true" CodeFile="edituser.aspx.cs" Inherits="edituser" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="edituser" ContentPlaceHolderID="ContentBody" runat="server">
    <div id="default">
        <div id="loginpage">
           

        <h1>Edit Profile</h1>
        <p>Fields with * are required
        </p>
        <p>User ID: <asp:Literal ID="Literal1" runat="server"></asp:Literal></p>


        <table>
         
            
            <tr>
                <td style="font-weight: 700">Login Details</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
         
            
            
            <tr>
                <td>*username</td>
                <td>
                    <asp:TextBox ID="txtusername" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtusername" ErrorMessage="*please fill in this field" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>*password</td>
                <td>
                    <asp:TextBox ID="txtpass" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtpass" ErrorMessage="*please fill in this field" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">*repeat password</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtconfirm" runat="server" MaxLength="10" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtpass" ControlToValidate="txtconfirm" ErrorMessage="*passwords didnt match" Font-Size="Small" ForeColor="Red"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>

            <tr>
                <td>*Fullname</td>
                <td>
                    <asp:TextBox ID="txtfname" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtfname" ErrorMessage="*please fill in this field" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>*Date of Birth</td>
                <td>
                    <asp:TextBox ID="txtdob" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtdob" ErrorMessage="*please fill in this field" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>*Gender</td>
                <td>
                    <asp:DropDownList ID="gender" runat="server">
                        <asp:ListItem Selected="True">Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>*Email</td>
                <td>
                    <asp:TextBox ID="txtemail" runat="server" TextMode="Email"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtemail" ErrorMessage="*please fill in this field" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
           
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click"  />

                    <input id="Reset1" type="reset" value="reset" />
                </td>
                

                
                <td ></td>
            </tr>
        
        </table>
           <asp:Literal ID="Literal3" runat="server"></asp:Literal>
            
        </div>
    </div>
</asp:Content>