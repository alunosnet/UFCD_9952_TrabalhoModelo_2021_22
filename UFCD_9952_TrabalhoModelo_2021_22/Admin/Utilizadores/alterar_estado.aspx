<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="alterar_estado.aspx.cs" Inherits="UFCD_9952_TrabalhoModelo_2021_22.Admin.Utilizadores.alterar_estado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Alterar estado da conta de utilizador</h2>
    <asp:FormView OnItemUpdated="FormView1_ItemUpdated" DefaultMode="Edit" ID="FormView1" runat="server" DataKeyNames="ID" DataSourceID="SqlUtilizador">
        <EditItemTemplate>
            ID:
            <asp:Label Text='<%# Eval("ID") %>' runat="server" ID="IDLabel1" /><br />
            Nome:
            <asp:Label Text='<%# Bind("Nome") %>' runat="server" ID="NomeTextBox" /><br />
            Morada:
            <asp:Label Text='<%# Bind("Morada") %>' runat="server" ID="MoradaTextBox" /><br />
            CP:
            <asp:Label Text='<%# Bind("CP") %>' runat="server" ID="CPTextBox" /><br />
            CC:
            <asp:Label Text='<%# Bind("CC") %>' runat="server" ID="CCTextBox" /><br />
            NIF:
            <asp:Label Text='<%# Bind("NIF") %>' runat="server" ID="NIFTextBox" /><br />
            Data_Nascimento:
            <asp:Label Text='<%# Bind("Data_Nascimento") %>' runat="server" ID="Data_NascimentoTextBox" /><br />
            Nr_Telefone:
            <asp:Label Text='<%# Bind("Nr_Telefone") %>' runat="server" ID="Nr_TelefoneTextBox" /><br />
            Email:
            <asp:Label Text='<%# Bind("Email") %>' runat="server" ID="EmailTextBox" /><br />
            Perfil:
            <asp:Label Text='<%# Bind("Perfil") %>' runat="server" ID="PerfilTextBox" /><br />
            Estado:
            <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("Estado") %>'>
                <asp:ListItem Text="Ativada" Value="1"></asp:ListItem>
                <asp:ListItem Text="Bloqueada" Value="0"></asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;
            <a href="gerir.aspx">Cancelar</a>
        </EditItemTemplate>
        <InsertItemTemplate>
            Nome:
            <asp:TextBox Text='<%# Bind("Nome") %>' runat="server" ID="NomeTextBox" /><br />
            Morada:
            <asp:TextBox Text='<%# Bind("Morada") %>' runat="server" ID="MoradaTextBox" /><br />
            CP:
            <asp:TextBox Text='<%# Bind("CP") %>' runat="server" ID="CPTextBox" /><br />
            CC:
            <asp:TextBox Text='<%# Bind("CC") %>' runat="server" ID="CCTextBox" /><br />
            NIF:
            <asp:TextBox Text='<%# Bind("NIF") %>' runat="server" ID="NIFTextBox" /><br />
            Data_Nascimento:
            <asp:TextBox Text='<%# Bind("Data_Nascimento") %>' runat="server" ID="Data_NascimentoTextBox" /><br />
            Nr_Telefone:
            <asp:TextBox Text='<%# Bind("Nr_Telefone") %>' runat="server" ID="Nr_TelefoneTextBox" /><br />
            Email:
            <asp:TextBox Text='<%# Bind("Email") %>' runat="server" ID="EmailTextBox" /><br />
            Password:
            <asp:TextBox Text='<%# Bind("Password") %>' runat="server" ID="PasswordTextBox" /><br />
            Perfil:
            <asp:TextBox Text='<%# Bind("Perfil") %>' runat="server" ID="PerfilTextBox" /><br />
            Estado:
            <asp:TextBox Text='<%# Bind("Estado") %>' runat="server" ID="EstadoTextBox" /><br />
            <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
        </InsertItemTemplate>
        <ItemTemplate>
            ID:
            <asp:Label Text='<%# Eval("ID") %>' runat="server" ID="IDLabel" /><br />
            Nome:
            <asp:Label Text='<%# Bind("Nome") %>' runat="server" ID="NomeLabel" /><br />
            Morada:
            <asp:Label Text='<%# Bind("Morada") %>' runat="server" ID="MoradaLabel" /><br />
            CP:
            <asp:Label Text='<%# Bind("CP") %>' runat="server" ID="CPLabel" /><br />
            CC:
            <asp:Label Text='<%# Bind("CC") %>' runat="server" ID="CCLabel" /><br />
            NIF:
            <asp:Label Text='<%# Bind("NIF") %>' runat="server" ID="NIFLabel" /><br />
            Data_Nascimento:
            <asp:Label Text='<%# Bind("Data_Nascimento") %>' runat="server" ID="Data_NascimentoLabel" /><br />
            Nr_Telefone:
            <asp:Label Text='<%# Bind("Nr_Telefone") %>' runat="server" ID="Nr_TelefoneLabel" /><br />
            Email:
            <asp:Label Text='<%# Bind("Email") %>' runat="server" ID="EmailLabel" /><br />
            Password:
            <asp:Label Text='<%# Bind("Password") %>' runat="server" ID="PasswordLabel" /><br />
            Perfil:
            <asp:Label Text='<%# Bind("Perfil") %>' runat="server" ID="PerfilLabel" /><br />
            Estado:
            <asp:Label Text='<%# Bind("Estado") %>' runat="server" ID="EstadoLabel" /><br />
            <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" ID="EditButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="Delete" CommandName="Delete" ID="DeleteButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="New" CommandName="New" ID="NewButton" CausesValidation="False" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource runat="server" ID="SqlUtilizador" 
        ConnectionString='<%$ ConnectionStrings:ConnectionString %>' 
        DeleteCommand="DELETE FROM [Utilizadores] WHERE [ID] = @ID" 
        InsertCommand="INSERT INTO [Utilizadores] ([Nome], [Morada], [CP], [CC], [NIF], [Data_Nascimento], [Nr_Telefone], [Email], [Password], [Perfil], [Estado]) VALUES (@Nome, @Morada, @CP, @CC, @NIF, @Data_Nascimento, @Nr_Telefone, @Email, @Password, @Perfil, @Estado)" SelectCommand="SELECT * FROM [Utilizadores] WHERE ([ID] = @ID)" 
        UpdateCommand="UPDATE [Utilizadores] SET [Estado] = @Estado WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Nome" Type="String"></asp:Parameter>
            <asp:Parameter Name="Morada" Type="String"></asp:Parameter>
            <asp:Parameter Name="CP" Type="String"></asp:Parameter>
            <asp:Parameter Name="CC" Type="String"></asp:Parameter>
            <asp:Parameter Name="NIF" Type="String"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="Data_Nascimento"></asp:Parameter>
            <asp:Parameter Name="Nr_Telefone" Type="String"></asp:Parameter>
            <asp:Parameter Name="Email" Type="String"></asp:Parameter>
            <asp:Parameter Name="Password" Type="String"></asp:Parameter>
            <asp:Parameter Name="Perfil" Type="String"></asp:Parameter>
            <asp:Parameter Name="Estado" Type="Int32"></asp:Parameter>
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="id" Name="ID" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Nome" Type="String"></asp:Parameter>
            <asp:Parameter Name="Morada" Type="String"></asp:Parameter>
            <asp:Parameter Name="CP" Type="String"></asp:Parameter>
            <asp:Parameter Name="CC" Type="String"></asp:Parameter>
            <asp:Parameter Name="NIF" Type="String"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="Data_Nascimento"></asp:Parameter>
            <asp:Parameter Name="Nr_Telefone" Type="String"></asp:Parameter>
            <asp:Parameter Name="Email" Type="String"></asp:Parameter>
            <asp:Parameter Name="Password" Type="String"></asp:Parameter>
            <asp:Parameter Name="Perfil" Type="String"></asp:Parameter>
            <asp:Parameter Name="Estado" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
