<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Saida.aspx.cs" Inherits="UFCD_9952_TrabalhoModelo_2021_22.Func.Estadias.Saida" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Processar Saída</h2>
    <asp:FormView OnItemUpdated="FormView1_ItemUpdated" DefaultMode="Edit" ID="FormView1" runat="server" DataKeyNames="ID" DataSourceID="SqlEstadia">
        <EditItemTemplate>
            ID:
            <asp:Label Text='<%# Eval("ID") %>' runat="server" ID="IDLabel1" /><br />
            id_quarto:
            <asp:Label Text='<%# Bind("id_quarto") %>' runat="server" ID="id_quartoTextBox" /><br />
            id_utilizador:
            <asp:Label Text='<%# Bind("id_utilizador") %>' runat="server" ID="id_utilizadorTextBox" /><br />
            data_entrada:
            <asp:Label Text='<%# Bind("data_entrada") %>' runat="server" ID="data_entradaTextBox" /><br />
            data_saida:
            <asp:Label Text='<%# Bind("data_saida") %>' runat="server" ID="data_saidaTextBox" /><br />
            custo:
            <asp:Label Text='<%# Bind("custo_calculado") %>' runat="server" ID="custoTextBox" /><br />
            <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;
            <a href="Estadias.aspx">Voltar</a>
        </EditItemTemplate>
        <InsertItemTemplate>
            id_quarto:
            <asp:TextBox Text='<%# Bind("id_quarto") %>' runat="server" ID="id_quartoTextBox" /><br />
            id_utilizador:
            <asp:TextBox Text='<%# Bind("id_utilizador") %>' runat="server" ID="id_utilizadorTextBox" /><br />
            data_entrada:
            <asp:TextBox Text='<%# Bind("data_entrada") %>' runat="server" ID="data_entradaTextBox" /><br />
            data_saida:
            <asp:TextBox Text='<%# Bind("data_saida") %>' runat="server" ID="data_saidaTextBox" /><br />
            custo:
            <asp:TextBox Text='<%# Bind("custo") %>' runat="server" ID="custoTextBox" /><br />
            <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
        </InsertItemTemplate>
        <ItemTemplate>
            ID:
            <asp:Label Text='<%# Eval("ID") %>' runat="server" ID="IDLabel" /><br />
            id_quarto:
            <asp:Label Text='<%# Bind("id_quarto") %>' runat="server" ID="id_quartoLabel" /><br />
            id_utilizador:
            <asp:Label Text='<%# Bind("id_utilizador") %>' runat="server" ID="id_utilizadorLabel" /><br />
            data_entrada:
            <asp:Label Text='<%# Bind("data_entrada") %>' runat="server" ID="data_entradaLabel" /><br />
            data_saida:
            <asp:Label Text='<%# Bind("data_saida") %>' runat="server" ID="data_saidaLabel" /><br />
            custo:
            <asp:Label Text='<%# Bind("custo") %>' runat="server" ID="custoLabel" /><br />

        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource runat="server" ID="SqlEstadia" 
        ConnectionString='<%$ ConnectionStrings:ConnectionString %>' 
        SelectCommand="SELECT [ID], [id_quarto], [id_utilizador], [data_entrada], [data_saida], [custo], 
        datediff(day,data_entrada,data_saida)*(select Preco_Dia from quartos where id=id_quarto) as custo_calculado FROM [Estadias] WHERE ([ID] = @ID)" 
        DeleteCommand="DELETE FROM [Estadias] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Estadias] ([id_quarto], [id_utilizador], [data_entrada], [data_saida], [custo]) VALUES (@id_quarto, @id_utilizador, @data_entrada, @data_saida, @custo)" 
        UpdateCommand="UPDATE [Estadias] SET [custo] = datediff(day,data_entrada,data_saida)*(select Preco_Dia from quartos where id=id_quarto), Fase='T' WHERE [ID] = @ID; UPDATE Quartos SET Estado=1 WHERE id=@id_quarto;">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="id_quarto" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="id_utilizador" Type="Int32"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="data_entrada"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="data_saida"></asp:Parameter>
            <asp:Parameter Name="custo" Type="Decimal"></asp:Parameter>
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="id" Name="ID" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="id_quarto" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="id_utilizador" Type="Int32"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="data_entrada"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="data_saida"></asp:Parameter>
            <asp:Parameter Name="custo" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
