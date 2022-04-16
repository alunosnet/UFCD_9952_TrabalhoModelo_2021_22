<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="reserva.aspx.cs" Inherits="UFCD_9952_TrabalhoModelo_2021_22.Cliente.reserva" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Reservar Quarto</h2>
    <asp:FormView DefaultMode="Insert" ID="FormView1" runat="server" DataKeyNames="ID" DataSourceID="SqlReserva">
        <EditItemTemplate>
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
            ID:
            <asp:Label Text='<%# Eval("ID") %>' runat="server" ID="IDLabel1" /><br />
            <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Quarto:
            <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("id_quarto") %>' DataSourceID="SqlQuartos" DataTextField="ID" DataValueField="ID"></asp:DropDownList>
            <asp:SqlDataSource runat="server" ID="SqlQuartos" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [ID] FROM [Quartos]"></asp:SqlDataSource>
            <br />
            data entrada:
            <asp:TextBox TextMode="Date" Text='<%# Bind("data_entrada") %>' runat="server" ID="data_entradaTextBox" />
            <!--Campo obrigatório-->
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="data_entradaTextBox"
                ErrorMessage="Tem de indicar uma data"></asp:RequiredFieldValidator>
            <br />
            data saida:
            <asp:TextBox TextMode="Date" Text='<%# Bind("data_saida") %>' runat="server" ID="data_saidaTextBox" />
            <!--Campo obrigatório-->
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="data_saidaTextBox"
                ErrorMessage="Tem de indicar uma data"></asp:RequiredFieldValidator>
            <br />
            <!--Validar: data saída > data entrada-->
            <asp:CompareValidator ID="CompareValidator1" runat="server"
                ControlToValidate="data_saidaTextBox"
                ControlToCompare="data_entradaTextBox"
                Operator="GreaterThanEqual" Type="Date"
                Display="Dynamic"
                ErrorMessage="A data de saída tem de ser posterior à data de entrada"></asp:CompareValidator>
            <!--Validar: reservas do quarto dentro do período indicado-->
            <asp:CustomValidator ID="CustomValidator1" runat="server"
                ControlToValidate="DropDownList1" OnServerValidate="CustomValidator1_ServerValidate"
                Display="Dynamic"
                ErrorMessage="O quarto selecionado não está disponível no período indicado"></asp:CustomValidator>
            <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
        </InsertItemTemplate>
        <ItemTemplate>
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
            ID:
            <asp:Label Text='<%# Eval("ID") %>' runat="server" ID="IDLabel" /><br />
            <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" ID="EditButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="Delete" CommandName="Delete" ID="DeleteButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="New" CommandName="New" ID="NewButton" CausesValidation="False" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource runat="server" ID="SqlReserva" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="DELETE FROM [Estadias] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Estadias] ([id_quarto], [id_utilizador], [data_entrada], [data_saida], [fase]) VALUES (@id_quarto, @id_utilizador, @data_entrada, @data_saida, @fase)" SelectCommand="SELECT [id_quarto], [id_utilizador], [data_entrada], [data_saida], [fase], [ID] FROM [Estadias]" UpdateCommand="UPDATE [Estadias] SET [id_quarto] = @id_quarto, [id_utilizador] = @id_utilizador, [data_entrada] = @data_entrada, [data_saida] = @data_saida, [fase] = @fase WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="id_quarto" Type="Int32"></asp:Parameter>
            <asp:SessionParameter SessionField="id" Name="id_utilizador" Type="Int32"></asp:SessionParameter>
            <asp:Parameter DbType="Date" Name="data_entrada"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="data_saida"></asp:Parameter>
            <asp:Parameter Name="fase" Type="String" DefaultValue="RF"></asp:Parameter>
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
