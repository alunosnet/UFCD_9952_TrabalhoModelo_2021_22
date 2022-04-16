<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="historico.aspx.cs" Inherits="UFCD_9952_TrabalhoModelo_2021_22.Cliente.historico" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Histórico de Estadias</h2>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="Sqlhistorico">
        <Columns>
            <asp:BoundField DataField="id_quarto" HeaderText="id_quarto" SortExpression="id_quarto"></asp:BoundField>
            <asp:BoundField DataField="data_entrada" HeaderText="data_entrada" SortExpression="data_entrada"></asp:BoundField>
            <asp:BoundField DataField="data_saida" HeaderText="data_saida" SortExpression="data_saida"></asp:BoundField>
            <asp:BoundField DataField="custo" HeaderText="custo" SortExpression="custo"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="Sqlhistorico" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [id_quarto], [data_entrada], [data_saida], [custo] FROM [Estadias] WHERE ([id_utilizador] = @id_utilizador)">
        <SelectParameters>
            <asp:SessionParameter SessionField="id" Name="id_utilizador" Type="Int32"></asp:SessionParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
