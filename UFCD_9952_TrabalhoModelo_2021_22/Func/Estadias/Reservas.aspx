<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Reservas.aspx.cs" Inherits="UFCD_9952_TrabalhoModelo_2021_22.Func.Estadias.Reservas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Lista de Reservas</h2>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlReservas">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True"></asp:CommandField>
            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" InsertVisible="False" SortExpression="ID"></asp:BoundField>
            <asp:BoundField DataField="id_quarto" HeaderText="id_quarto" SortExpression="id_quarto" ReadOnly="True"></asp:BoundField>
            <asp:BoundField DataField="id_utilizador" HeaderText="id_utilizador" SortExpression="id_utilizador" ReadOnly="True"></asp:BoundField>
            <asp:BoundField DataField="data_entrada" HeaderText="data_entrada" SortExpression="data_entrada" ReadOnly="True"></asp:BoundField>
            <asp:BoundField DataField="data_saida" HeaderText="data_saida" SortExpression="data_saida" ReadOnly="True"></asp:BoundField>
            <asp:TemplateField HeaderText="fase" SortExpression="fase">
                <EditItemTemplate>
                    <asp:DropDownList SelectedValue='<%# Bind("fase") %>' ID="DropDownList1" runat="server">
                        <asp:ListItem Value="RF">Reserva Feita</asp:ListItem>
                        <asp:ListItem Value="RC">Reserva Confirmada</asp:ListItem>
                        <asp:ListItem Value="E">CheckIn</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("fase") %>' ID="Label1"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlReservas" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="DELETE FROM Estadias WHERE id=@id" SelectCommand="SELECT [ID], [id_quarto], [id_utilizador], [data_entrada], [data_saida], [fase] FROM [Estadias] WHERE (([fase] = @fase) OR ([fase] = @fase2))" UpdateCommand="UPDATE estadias SET fase=@fase WHERE id=@id">
        <DeleteParameters>
            <asp:Parameter Name="id"></asp:Parameter>
        </DeleteParameters>
        <SelectParameters>
            <asp:Parameter DefaultValue="RF" Name="fase"></asp:Parameter>
            <asp:Parameter DefaultValue="RC" Name="fase2"></asp:Parameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="fase"></asp:Parameter>
            <asp:Parameter Name="id"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
