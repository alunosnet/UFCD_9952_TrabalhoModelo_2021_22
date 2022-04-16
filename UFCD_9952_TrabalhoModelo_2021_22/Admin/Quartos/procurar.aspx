<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="procurar.aspx.cs" Inherits="UFCD_9952_TrabalhoModelo_2021_22.Admin.Quartos.procurar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Procurar quarto</h2>
    Lotação:<asp:TextBox TextMode="Number" Text="1" ID="tbLotacao" runat="server"></asp:TextBox>
    Preço:<asp:TextBox TextMode="Number" Text="1000" ID="tbPreco" runat="server"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="Procurar" />
    <asp:GridView EmptyDataText="Não foram encontrados quartos com essas caraterísticas"
        ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlQuartos" AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" InsertVisible="False" SortExpression="ID"></asp:BoundField>
            <asp:BoundField DataField="Piso" HeaderText="Piso" SortExpression="Piso"></asp:BoundField>
            <asp:BoundField DataField="Lotacao" HeaderText="Lotacao" SortExpression="Lotacao"></asp:BoundField>
            <asp:BoundField DataField="Preco_Dia" HeaderText="Preco_Dia" SortExpression="Preco_Dia"></asp:BoundField>
            <asp:CheckBoxField DataField="WC" HeaderText="WC" SortExpression="WC"></asp:CheckBoxField>
            <asp:CheckBoxField DataField="TV" HeaderText="TV" SortExpression="TV"></asp:CheckBoxField>
            <asp:CheckBoxField DataField="Cozinha" HeaderText="Cozinha" SortExpression="Cozinha"></asp:CheckBoxField>
            <asp:CheckBoxField DataField="AC" HeaderText="AC" SortExpression="AC"></asp:CheckBoxField>
            <asp:CheckBoxField DataField="Varanda" HeaderText="Varanda" SortExpression="Varanda"></asp:CheckBoxField>
            <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado"></asp:BoundField>
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource runat="server" ID="SqlQuartos" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' 
        SelectCommand="SELECT * FROM [Quartos] WHERE (([Lotacao] >= @Lotacao) AND ([Preco_Dia] <= @Preco_Dia) AND estado=1)">
        <SelectParameters>
            <asp:ControlParameter ControlID="tbLotacao" PropertyName="Text" Name="Lotacao" Type="Int32"></asp:ControlParameter>
            <asp:ControlParameter ControlID="tbPreco" PropertyName="Text" Name="Preco_Dia" Type="Decimal"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
