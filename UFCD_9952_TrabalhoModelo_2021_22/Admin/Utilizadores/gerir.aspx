<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="gerir.aspx.cs" Inherits="UFCD_9952_TrabalhoModelo_2021_22.Admin.Utilizadores.gerir" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Gerir utilizadores</h2>
    Nome:<asp:TextBox AutoPostBack="true" ID="TextBox1" runat="server"></asp:TextBox>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlUtilizadores" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton runat="server" Text="Detalhes" CommandName="Select" CausesValidation="False" ID="LinkButton1"></asp:LinkButton>
                    <asp:LinkButton OnClientClick="return confirm('Confirma que pretende remover o utilizador?')" runat="server" Text="Apagar" CommandName="Delete" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" InsertVisible="False" SortExpression="ID"></asp:BoundField>
            <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome"></asp:BoundField>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>
            <asp:BoundField DataField="Perfil" HeaderText="Perfil" SortExpression="Perfil"></asp:BoundField>
            <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado"></asp:BoundField>
            <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="alterar_estado.aspx?id={0}" Text="Alterar estado" HeaderText="Bloquear/Desbloquear"></asp:HyperLinkField>
        </Columns>
    </asp:GridView>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDetalhes">
        <EditItemTemplate>
            ID:
            <asp:Label Text='<%# Eval("ID") %>' runat="server" ID="IDLabel1" /><br />
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
            <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
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
         
            Perfil:
            <asp:Label Text='<%# Bind("Perfil") %>' runat="server" ID="PerfilLabel" /><br />
            Estado:
            <asp:Label Text='<%# Bind("Estado") %>' runat="server" ID="EstadoLabel" /><br />

        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource runat="server" ID="SqlDetalhes" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Utilizadores] WHERE ([ID] = @ID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" PropertyName="SelectedValue" Name="ID" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="SqlUtilizadores" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="DELETE FROM [Utilizadores] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Utilizadores] ([Nome], [Morada], [CP], [CC], [NIF], [Data_Nascimento], [Nr_Telefone], [Email], [Password], [Perfil], [Estado]) VALUES (@Nome, @Morada, @CP, @CC, @NIF, @Data_Nascimento, @Nr_Telefone, @Email, @Password, @Perfil, @Estado)" SelectCommand="SELECT * FROM [Utilizadores] WHERE ([Nome] LIKE '%' + @Nome + '%')" UpdateCommand="UPDATE [Utilizadores] SET [Nome] = @Nome, [Morada] = @Morada, [CP] = @CP, [CC] = @CC, [NIF] = @NIF, [Data_Nascimento] = @Data_Nascimento, [Nr_Telefone] = @Nr_Telefone, [Email] = @Email, [Password] = @Password, [Perfil] = @Perfil, [Estado] = @Estado WHERE [ID] = @ID">
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
            <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="Nome" Type="String"></asp:ControlParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Nome" Type="String"></asp:Parameter>
            <asp:Parameter Name="Morada" Type="String"></asp:Parameter>
            <asp:Parameter Name="CP" Type="String"></asp:Parameter>
            <asp:Parameter Name="CC" Type="String"></asp:Parameter>
            <asp:Parameter Name="NIF" Type="String"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="Data_Nascimento"></asp:Parameter>
            <asp:Parameter Name="Nr_Telefone" Type="String"></asp:Parameter>
            <asp:Parameter Name="Email" dbType="AnsiString"></asp:Parameter>
            <asp:Parameter Name="Password" dbType="AnsiString"></asp:Parameter>
            <asp:Parameter Name="Perfil" Type="String"></asp:Parameter>
            <asp:Parameter Name="Estado" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
