<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titile" Runat="Server">
    Home
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
               
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" Runat="Server">
     <script>
    $(document).ready(function(){
        $('.bxslider').bxSlider();
  
    });
         </script>
<div id="default">
   
    <div id="slider">
        <h1>Latest</h1>
        <asp:Literal ID="products" runat="server"></asp:Literal>
    </div>
    <div id="message">
        <h1>Watches for men</h1>
        <br />
        <p>Our collection of watches for men includes the finest luxury and designer brands from around the world. We stock the most desirable men’s watches in the UK, so whether you’re looking for Swiss craftsmanship or cutting edge design, we’re sure to have the men’s watch you’re looking for.</p>
    </div>


</div>

    
</asp:Content>

