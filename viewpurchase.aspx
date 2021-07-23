<%@ Page Language="C#" AutoEventWireup="true" CodeFile="viewpurchase.aspx.cs" Inherits="viewpurchase" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="view" ContentPlaceHolderID="ContentBody" runat="server">
    <div id="default">
        <div class="purchasehistory">
            <a href="product.aspx">Back</a>
            <br />
        Select a date:
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="date" DataValueField="date"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WatchMen %>" SelectCommand="SELECT DISTINCT [date] FROM [Carts]"></asp:SqlDataSource>

    <asp:Button ID="Button1" runat="server" Text="Display" OnClick="Button1_Click" />
        <br />
    <asp:Button ID="Button2" runat="server" Text="View All" OnClick="Button2_Click" />


        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="watchid" HeaderText="watchid" SortExpression="watchid" />
                <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                <asp:BoundField DataField="paypalid" HeaderText="paypalid" SortExpression="paypalid" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WatchMen %>" SelectCommand="SELECT [watchid], [date], [paypalid] FROM [Carts]"></asp:SqlDataSource>

        </div>
</div>
</asp:Content>
