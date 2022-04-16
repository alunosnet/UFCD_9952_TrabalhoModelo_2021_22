<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Entrada.aspx.cs" Inherits="UFCD_9952_TrabalhoModelo_2021_22.Func.Estadias.Entrada" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Entrada</h2>
    <asp:FormView DefaultMode="Insert" ID="FormView1" runat="server" DataKeyNames="ID" DataSourceID="SqlEstadias">
        <EditItemTemplate>
            ID:
            <asp:Label Text='<%# Eval("ID") %>' runat="server" ID="IDLabel1" /><br />
            id_quarto:
            <asp:TextBox Text='<%# Bind("id_quarto") %>' runat="server" ID="id_quartoTextBox" /><br />
            id_utilizador:
            <asp:TextBox Text='<%# Bind("id_utilizador") %>' runat="server" ID="id_utilizadorTextBox" /><br />
            data_entrada:
            <asp:TextBox Text='<%# Bind("data_entrada") %>' runat="server" ID="data_entradaTextBox" /><br />
            data_saida:
            <asp:TextBox Text='<%# Bind("data_saida") %>' runat="server" ID="data_saidaTextBox" /><br />
            fase:
            <asp:TextBox Text='<%# Bind("fase") %>' runat="server" ID="faseTextBox" /><br />
            <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Quarto:
            <asp:DropDownList SelectedValue='<%# Bind("id_quarto") %>' ID="DropDownList1" runat="server" DataSourceID="SqlQuartos" DataTextField="ID" DataValueField="ID"></asp:DropDownList>
            <asp:SqlDataSource runat="server" ID="SqlQuartos" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Quartos] WHERE ([Estado] = @Estado)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="1" Name="Estado" Type="Int32"></asp:Parameter>
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            Cliente:
            <asp:DropDownList SelectedValue='<%# Bind("id_utilizador") %>' ID="DropDownList2" runat="server" DataSourceID="SqlClientes" DataTextField="Nome" DataValueField="ID"></asp:DropDownList>
            <asp:SqlDataSource runat="server" ID="SqlClientes" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Utilizadores] WHERE ([Perfil] = @Perfil)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="C" Name="Perfil" Type="String"></asp:Parameter>
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            data_entrada:
            <asp:TextBox TextMode="Date" Text='<%# Bind("data_entrada") %>' runat="server" ID="data_entradaTextBox" /><br />
            data_saida:
            <asp:TextBox TextMode="Date" Text='<%# Bind("data_saida") %>' runat="server" ID="data_saidaTextBox" /><br />
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
            fase:
            <asp:Label Text='<%# Bind("fase") %>' runat="server" ID="faseLabel" /><br />
            <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" ID="EditButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="Delete" CommandName="Delete" ID="DeleteButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="New" CommandName="New" ID="NewButton" CausesValidation="False" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource runat="server" ID="SqlEstadias" 
        ConnectionString='<%$ ConnectionStrings:ConnectionString %>' 
        DeleteCommand="DELETE FROM [Estadias] WHERE [ID] = @ID" 
        InsertCommand="INSERT INTO [Estadias] ([id_quarto], [id_utilizador], [data_entrada], [data_saida], [fase]) VALUES (@id_quarto, @id_utilizador, @data_entrada, @data_saida, 'E');UPDATE Quartos SET Estado=0 WHERE id=@id_quarto;" 
        SelectCommand="SELECT [ID], [id_quarto], [id_utilizador], [data_entrada], [data_saida], [fase] FROM [Estadias]" 
        UpdateCommand="UPDATE [Estadias] SET [id_quarto] = @id_quarto, [id_utilizador] = @id_utilizador, [data_entrada] = @data_entrada, [data_saida] = @data_saida, [fase] = @fase WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="id_quarto" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="id_utilizador" Type="Int32"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="data_entrada"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="data_saida"></asp:Parameter>
            <asp:Parameter Name="fase" Type="String"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="id_quarto" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="id_utilizador" Type="Int32"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="data_entrada"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="data_saida"></asp:Parameter>
            <asp:Parameter Name="fase" Type="String"></asp:Parameter>
            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
