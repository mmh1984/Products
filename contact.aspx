<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="contact_us" %>


<asp:Content ID="Content1" ContentPlaceHolderID="titile" runat="Server">
    Contact us
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="Server">
     
    <div id="contact" class="contact">
     <div id="contactform">
        <fieldset>
            <legend>Contact us</legend>
            <p><i>address:</i></p>
            <p><i>phone:</i></p>
            <table >
                <tr>
                    <td>
                        <b>Name:</b>
                    </td>
                    <td>
                        <asp:TextBox ID="txtName" Width="200px" runat="server"></asp:TextBox>
                        <br />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <b>Email:</b>
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmail" Width="200px" runat="server"  TextMode="Email"></asp:TextBox>
                        <br />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <b>Subject:</b>
                    </td>
                    <td>
                        <asp:TextBox ID="txtSubject" Width="200px" runat="server"></asp:TextBox>
                        <br />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="vertical-align: top">
                        <b>Comments:</b>
                    </td>
                    <td style="vertical-align: top">
                        <br />
                        <asp:TextBox ID="txtComments" Width="269px" runat="server" Rows="4" TextMode="MultiLine" Height="79px"></asp:TextBox>
                    </td>
                    <td style="vertical-align: top">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Label ID="Label1" runat="server" Font-Bold="true"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Button ID="Button1" runat="server" Text="submit"  />
                    </td>
                </tr>

            </table>
        </fieldset>
        </div>

    <div id="map">
    
     </div>
   
      <script src="http://maps.googleapis.com/maps/api/js"></script>
<script>
function initialize() {
  var mapProp = {
      center: new google.maps.LatLng(4.912982, 114.935343),
     zoom:15,
    mapTypeId:google.maps.MapTypeId.ROADMAP
  };
  var map=new google.maps.Map(document.getElementById("map"),mapProp);
}
google.maps.event.addDomListener(window, 'load', initialize);
</script>
 </div>      
                    
                
              
</asp:Content>

