<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="adicionar.aspx.cs" Inherits="UFCD_9952_TrabalhoModelo_2021_22.Admin.Quartos.adicionar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:FormView OnItemInserting="FormView1_ItemInserting" DefaultMode="Insert" ID="FormView1" runat="server" DataKeyNames="ID" DataSourceID="SqlQuartos">
        <EditItemTemplate>
            ID:
            <asp:Label Text='<%# Eval("ID") %>' runat="server" ID="IDLabel1" /><br />
            Piso:
            <asp:TextBox Text='<%# Bind("Piso") %>' runat="server" ID="PisoTextBox" /><br />
            Lotacao:
            <asp:TextBox Text='<%# Bind("Lotacao") %>' runat="server" ID="LotacaoTextBox" /><br />
            Preco_Dia:
            <asp:TextBox Text='<%# Bind("Preco_Dia") %>' runat="server" ID="Preco_DiaTextBox" /><br />
            WC:
            <asp:CheckBox Checked='<%# Bind("WC") %>' runat="server" ID="WCCheckBox" /><br />
            TV:
            <asp:CheckBox Checked='<%# Bind("TV") %>' runat="server" ID="TVCheckBox" /><br />
            Cozinha:
            <asp:CheckBox Checked='<%# Bind("Cozinha") %>' runat="server" ID="CozinhaCheckBox" /><br />
            AC:
            <asp:CheckBox Checked='<%# Bind("AC") %>' runat="server" ID="ACCheckBox" /><br />
            Varanda:
            <asp:CheckBox Checked='<%# Bind("Varanda") %>' runat="server" ID="VarandaCheckBox" /><br />
            Fotografia:
            <asp:TextBox Text='<%# Bind("Fotografia") %>' runat="server" ID="FotografiaTextBox" /><br />
            Estado:
            <asp:TextBox Text='<%# Bind("Estado") %>' runat="server" ID="EstadoTextBox" /><br />
            <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Piso:
            <asp:TextBox TextMode="Number" Text='<%# Bind("Piso") %>' runat="server" ID="PisoTextBox" />
            <!--Preenchimento obrigatório-->
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                Display="Dynamic" ControlToValidate="PisoTextBox"
                ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
            <!-- >=0 -->
            <asp:RangeValidator ID="RangeValidator1" runat="server"
                Display="Dynamic" ControlToValidate="PisoTextBox"
                Type="Integer" MinimumValue="0" MaximumValue="9999"
                ErrorMessage="O número não é válido"></asp:RangeValidator>
            <br />
            Lotação:
            <asp:TextBox TextMode="Number" Text='<%# Bind("Lotacao") %>' runat="server" ID="LotacaoTextBox" />
            <!--Preenchimento obrigatório-->
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                Display="Dynamic" ControlToValidate="LotacaoTextBox"
                ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
            <!-- lotacao>1 and lotacao<=5 -->
            <asp:RangeValidator ID="RangeValidator2" runat="server"
                Display="Dynamic" ControlToValidate="LotacaoTextBox"
                Type="Integer" MinimumValue="2" MaximumValue="5"
                ErrorMessage="O número não é válido"></asp:RangeValidator>
            <br />
            Preço Dia:
            <asp:TextBox TextMode="Number" Text='<%# Bind("Preco_Dia") %>' runat="server" ID="Preco_DiaTextBox" />
            <!--Preenchimento obrigatório-->
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                Display="Dynamic" ControlToValidate="Preco_DiaTextBox"
                ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
            <!-- >0 -->
            <asp:RangeValidator ID="RangeValidator3" runat="server"
                Display="Dynamic" ControlToValidate="Preco_DiaTextBox"
                Type="Currency" MinimumValue="1" MaximumValue="9999"
                ErrorMessage="O número não é válido"></asp:RangeValidator>
            <br />
            WC:
            <asp:CheckBox Checked='<%# Bind("WC") %>' runat="server" ID="WCCheckBox" /><br />
            TV:
            <asp:CheckBox Checked='<%# Bind("TV") %>' runat="server" ID="TVCheckBox" /><br />
            Cozinha:
            <asp:CheckBox Checked='<%# Bind("Cozinha") %>' runat="server" ID="CozinhaCheckBox" /><br />
            AC:
            <asp:CheckBox Checked='<%# Bind("AC") %>' runat="server" ID="ACCheckBox" /><br />
            Varanda:
            <asp:CheckBox Checked='<%# Bind("Varanda") %>' runat="server" ID="VarandaCheckBox" /><br />
            Fotografia:
            <asp:FileUpload runat="server" ID="Fotografia" />
            <!--Preenchimento obrigatório-->
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                Display="Dynamic" ControlToValidate="Fotografia"
                ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
            <br />
            <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
        </InsertItemTemplate>
        <ItemTemplate>
            ID:
            <asp:Label Text='<%# Eval("ID") %>' runat="server" ID="IDLabel" /><br />
            Piso:
            <asp:Label Text='<%# Bind("Piso") %>' runat="server" ID="PisoLabel" /><br />
            Lotacao:
            <asp:Label Text='<%# Bind("Lotacao") %>' runat="server" ID="LotacaoLabel" /><br />
            Preco_Dia:
            <asp:Label Text='<%# Bind("Preco_Dia") %>' runat="server" ID="Preco_DiaLabel" /><br />
            WC:
            <asp:CheckBox Checked='<%# Bind("WC") %>' runat="server" ID="WCCheckBox" Enabled="false" /><br />
            TV:
            <asp:CheckBox Checked='<%# Bind("TV") %>' runat="server" ID="TVCheckBox" Enabled="false" /><br />
            Cozinha:
            <asp:CheckBox Checked='<%# Bind("Cozinha") %>' runat="server" ID="CozinhaCheckBox" Enabled="false" /><br />
            AC:
            <asp:CheckBox Checked='<%# Bind("AC") %>' runat="server" ID="ACCheckBox" Enabled="false" /><br />
            Varanda:
            <asp:CheckBox Checked='<%# Bind("Varanda") %>' runat="server" ID="VarandaCheckBox" Enabled="false" /><br />
            Fotografia:
            <asp:Label Text='<%# Bind("Fotografia") %>' runat="server" ID="FotografiaLabel" /><br />
            Estado:
            <asp:Label Text='<%# Bind("Estado") %>' runat="server" ID="EstadoLabel" /><br />
            <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" ID="EditButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="Delete" CommandName="Delete" ID="DeleteButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="New" CommandName="New" ID="NewButton" CausesValidation="False" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource runat="server" ID="SqlQuartos" 
        ConnectionString='<%$ ConnectionStrings:ConnectionString %>' 
        DeleteCommand="DELETE FROM [Quartos] WHERE [ID] = @ID" 
        InsertCommand="INSERT INTO [Quartos] ([Piso], [Lotacao], [Preco_Dia], [WC], [TV], [Cozinha], [AC], [Varanda], [Fotografia]) VALUES (@Piso, @Lotacao, @Preco_Dia, @WC, @TV, @Cozinha, @AC, @Varanda, @Fotografia)" 
        SelectCommand="SELECT * FROM [Quartos]" 
        UpdateCommand="UPDATE [Quartos] SET [Piso] = @Piso, [Lotacao] = @Lotacao, [Preco_Dia] = @Preco_Dia, [WC] = @WC, [TV] = @TV, [Cozinha] = @Cozinha, [AC] = @AC, [Varanda] = @Varanda, [Fotografia] = @Fotografia, [Estado] = @Estado WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Piso" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Lotacao" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Preco_Dia" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="WC" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="TV" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="Cozinha" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="AC" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="Varanda" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="Fotografia"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Piso" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Lotacao" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Preco_Dia" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="WC" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="TV" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="Cozinha" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="AC" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="Varanda" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="Fotografia" Type="Object"></asp:Parameter>
            <asp:Parameter Name="Estado" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
