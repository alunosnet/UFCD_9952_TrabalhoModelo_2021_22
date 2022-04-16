<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="adicionar.aspx.cs" Inherits="UFCD_9952_TrabalhoModelo_2021_22.Admin.Utilizadores.adicionar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:FormView DefaultMode="Insert" ID="FormView1" runat="server" DataKeyNames="ID" DataSourceID="SqlUtilizadores">
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
            <div class="mb-3">
                <label for="ContentPlaceHolder1_FormView1_NomeTextBox" class="form-label">Nome:</label>
                <asp:TextBox class="form-control" placeholder="Nome completo" MaxLength="50" Text='<%# Bind("Nome") %>' runat="server" ID="NomeTextBox" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ControlToValidate="NomeTextBox" Display="Dynamic" CssClass="alert-danger"
                    ErrorMessage="Campo de preenchimento obrigatório"></asp:RequiredFieldValidator>
            </div>
            <div class="mb-3">
                <label for="ContentPlaceHolder1_FormView1_MoradaTextBox" class="form-label">Morada:</label>
                <asp:TextBox CssClass="form-control" placeholder="Morada" MaxLength="100" Text='<%# Bind("Morada") %>' runat="server" ID="MoradaTextBox" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ControlToValidate="MoradaTextBox" Display="Dynamic" CssClass="alert-danger"
                    ErrorMessage="Campo de preenchimento obrigatório"></asp:RequiredFieldValidator>
            </div>
            <div class="mb-3">
                <label for="ContentPlaceHolder1_FormView1_CPTextBox" class="form-label">Código Postal:</label>
                <asp:TextBox CssClass="form-control" placeholder="Código postal" MaxLength="8" Text='<%# Bind("CP") %>' runat="server" ID="CPTextBox" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                    ControlToValidate="CPTextBox" Display="Dynamic" CssClass="alert-danger"
                    ErrorMessage="Campo de preenchimento obrigatório"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator1" runat="server"
                    ControlToValidate="CPTextBox" OnServerValidate="CustomValidator1_ServerValidate"
                    Display="Dynamic" CssClass="alert-danger"
                    ErrorMessage="O código postal não é válido"></asp:CustomValidator>
            </div>
            <div class="mb-3">
                <label for="ContentPlaceHolder1_FormView1_CCTextBox" class="form-label">Cartão do cidadão:</label>
                <asp:TextBox CssClass="form-control" placeholder="Cartão do cidadão" MaxLength="12" Text='<%# Bind("CC") %>' runat="server" ID="CCTextBox" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                    ControlToValidate="CCTextBox" Display="Dynamic" CssClass="alert-danger"
                    ErrorMessage="Campo de preenchimento obrigatório"></asp:RequiredFieldValidator>
            </div>
            <div class="mb-3">
                <label for="ContentPlaceHolder1_FormView1_NIFTextBox" class="form-label">NIF:</label>
                <asp:TextBox CssClass="form-control" placeholder="Nº de Identificação Fiscal" MaxLength="9" Text='<%# Bind("NIF") %>' runat="server" ID="NIFTextBox" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                    ControlToValidate="NIFTextBox" Display="Dynamic" CssClass="alert-danger"
                    ErrorMessage="Campo de preenchimento obrigatório"></asp:RequiredFieldValidator>
            </div>
            <div class="mb-3">
                <label for="ContentPlaceHolder1_FormView1_Data_NascimentoTextBox" class="form-label">Data Nascimento:</label>
                <asp:TextBox CssClass="form-control" TextMode="Date" Text='<%# Bind("Data_Nascimento") %>' runat="server" ID="Data_NascimentoTextBox" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                    ControlToValidate="Data_NascimentoTextBox" Display="Dynamic" CssClass="alert-danger"
                    ErrorMessage="Campo de preenchimento obrigatório"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator2" runat="server"
                    ControlToValidate="Data_NascimentoTextBox" OnServerValidate="CustomValidator2_ServerValidate"
                    Display="Dynamic" CssClass="alert-danger"
                    ErrorMessage="Tem de ter pelo menos 18 anos de idade e no máximo 150"></asp:CustomValidator>
            </div>
            <div class="mb-3">
                <label for="ContentPlaceHolder1_FormView1_Nr_TelefoneTextBox" class="form-label">Nr Telefone:</label>
                <asp:TextBox CssClass="form-control" placeholder="Nr de telefone" MaxLength="13" Text='<%# Bind("Nr_Telefone") %>' runat="server" ID="Nr_TelefoneTextBox" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                    ControlToValidate="Nr_TelefoneTextBox" Display="Dynamic" CssClass="alert-danger"
                    ErrorMessage="Campo de preenchimento obrigatório"></asp:RequiredFieldValidator>
            </div>
            <div class="mb-3">
                <label for="ContentPlaceHolder1_FormView1_EmailTextBox" class="form-label">Email:</label>
                <asp:TextBox CssClass="form-control" placeholder="O seu email" MaxLength="150" TextMode="Email" Text='<%# Bind("Email") %>' runat="server" ID="EmailTextBox" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                    ControlToValidate="EmailTextBox" Display="Dynamic" CssClass="alert-danger"
                    ErrorMessage="Campo de preenchimento obrigatório"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator3" runat="server" Display="Dynamic"
                    ControlToValidate="EmailTextBox" OnServerValidate="CustomValidator3_ServerValidate"
                    CssClass="alert-danger"
                    ErrorMessage="Já existe uma conta com esse email"></asp:CustomValidator>
            </div>
            <div class="mb-3">
                <label for="ContentPlaceHolder1_FormView1_PasswordTextBox" class="form-label">Password:</label>
                <asp:TextBox CssClass="form-control" MaxLength="64" TextMode="Password" Text='<%# Bind("Password") %>' runat="server" ID="PasswordTextBox" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                    ControlToValidate="PasswordTextBox" Display="Dynamic" CssClass="alert-danger"
                    ErrorMessage="Campo de preenchimento obrigatório"></asp:RequiredFieldValidator>
            </div>
            Perfil:
            <asp:DropDownList CssClass="form-control" SelectedValue='<%# Bind("Perfil") %>' runat="server" ID="PerfilTextBox" >
                <asp:ListItem Text="Cliente" Value="C" />
                <asp:ListItem Text="Funcionário" Value="F" />
                <asp:ListItem Text="Administrador" Value="A" />
            </asp:DropDownList>
            <br />
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
    <asp:SqlDataSource runat="server" ID="SqlUtilizadores" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' 
        DeleteCommand="DELETE FROM [Utilizadores] WHERE [ID] = @ID" 
        InsertCommand="INSERT INTO [Utilizadores] ([Nome], [Morada], [CP], [CC], [NIF], [Data_Nascimento], [Nr_Telefone], [Email], [Password], [Perfil], [Estado]) VALUES (@Nome, @Morada, @CP, @CC, @NIF, @Data_Nascimento, @Nr_Telefone, @Email, HASHBYTES('SHA2_512',@Password), @Perfil, 1)" 
        SelectCommand="SELECT * FROM [Utilizadores]" 
        UpdateCommand="UPDATE [Utilizadores] SET [Nome] = @Nome, [Morada] = @Morada, [CP] = @CP, [CC] = @CC, [NIF] = @NIF, [Data_Nascimento] = @Data_Nascimento, [Nr_Telefone] = @Nr_Telefone, [Email] = @Email, [Password] = @Password, [Perfil] = @Perfil, [Estado] = @Estado WHERE [ID] = @ID">
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
            <asp:Parameter Name="Email" DbType="AnsiString"></asp:Parameter>
            <asp:Parameter Name="Password" DbType="AnsiString"></asp:Parameter>
            <asp:Parameter Name="Perfil" Type="String"></asp:Parameter>
            <asp:Parameter Name="Estado" Type="Int32"></asp:Parameter>
        </InsertParameters>
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
