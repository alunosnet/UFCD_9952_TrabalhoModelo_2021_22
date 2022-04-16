<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Estadias.aspx.cs" Inherits="UFCD_9952_TrabalhoModelo_2021_22.Func.Estadias.Estadias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Lista de estadias</h2>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlEstadias">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" InsertVisible="False" SortExpression="ID"></asp:BoundField>
            <asp:BoundField DataField="id_quarto" HeaderText="id_quarto" SortExpression="id_quarto"></asp:BoundField>
            <asp:BoundField DataField="id_utilizador" HeaderText="id_utilizador" SortExpression="id_utilizador"></asp:BoundField>
            <asp:BoundField DataField="data_entrada" HeaderText="data_entrada" SortExpression="data_entrada"></asp:BoundField>
            <asp:BoundField DataField="data_saida" HeaderText="data_saida" SortExpression="data_saida"></asp:BoundField>
            <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="saida.aspx?id={0}" Text="Checkout" HeaderText="Checkout"></asp:HyperLinkField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlEstadias" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [ID], [id_quarto], [id_utilizador], [data_entrada], [data_saida] FROM [Estadias] WHERE ([fase] = @fase)">
        <SelectParameters>
            <asp:Parameter DefaultValue="E" Name="fase" Type="String"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
