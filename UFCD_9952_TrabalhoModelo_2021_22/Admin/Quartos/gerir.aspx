<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="gerir.aspx.cs" Inherits="UFCD_9952_TrabalhoModelo_2021_22.Admin.Quartos.gerir" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView OnRowDataBound="GridView1_RowDataBound" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlQuartos" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True"></asp:CommandField>
            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" InsertVisible="False" SortExpression="ID"></asp:BoundField>
            <asp:TemplateField HeaderText="Piso" SortExpression="Piso">
                <EditItemTemplate>
                    <asp:TextBox TextMode="Number" runat="server" Text='<%# Bind("Piso") %>' ID="PisoTextBox"></asp:TextBox>
                    <!--Preenchimento obrigatório-->
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                        Display="Dynamic" ControlToValidate="PisoTextBox"
                        ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                    <!-- >=0 -->
                    <asp:RangeValidator ID="RangeValidator1" runat="server"
                        Display="Dynamic" ControlToValidate="PisoTextBox"
                        Type="Integer" MinimumValue="0" MaximumValue="9999"
                        ErrorMessage="O número não é válido"></asp:RangeValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("Piso") %>' ID="Label1"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Lotacao" SortExpression="Lotacao">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("Lotacao") %>' ID="LotacaoTextBox"></asp:TextBox>
                    <!--Preenchimento obrigatório-->
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                        Display="Dynamic" ControlToValidate="LotacaoTextBox"
                        ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                    <!-- lotacao>1 and lotacao<=5 -->
                    <asp:RangeValidator ID="RangeValidator2" runat="server"
                        Display="Dynamic" ControlToValidate="LotacaoTextBox"
                        Type="Integer" MinimumValue="2" MaximumValue="5"
                        ErrorMessage="O número não é válido"></asp:RangeValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("Lotacao") %>' ID="Label2"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Preco_Dia" SortExpression="Preco_Dia">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("Preco_Dia","{0:C}") %>' ID="Preco_DiaTextBox"></asp:TextBox>
                    <!--Preenchimento obrigatório-->
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                        Display="Dynamic" ControlToValidate="Preco_DiaTextBox"
                        ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                    <!-- >0 -->
                    <asp:RangeValidator ID="RangeValidator3" runat="server"
                        Display="Dynamic" ControlToValidate="Preco_DiaTextBox"
                        Type="Currency" MinimumValue="1" MaximumValue="9999"
                        ErrorMessage="O número não é válido"></asp:RangeValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("Preco_Dia","{0:C}") %>' ID="Label3"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:CheckBoxField DataField="WC" HeaderText="WC" SortExpression="WC"></asp:CheckBoxField>
            <asp:CheckBoxField DataField="TV" HeaderText="TV" SortExpression="TV"></asp:CheckBoxField>
            <asp:CheckBoxField DataField="Cozinha" HeaderText="Cozinha" SortExpression="Cozinha"></asp:CheckBoxField>
            <asp:CheckBoxField DataField="AC" HeaderText="AC" SortExpression="AC"></asp:CheckBoxField>
            <asp:CheckBoxField DataField="Varanda" HeaderText="Varanda" SortExpression="Varanda"></asp:CheckBoxField>
            <asp:BoundField ReadOnly="true" DataField="Estado" HeaderText="Estado" SortExpression="Estado"></asp:BoundField>
            <asp:TemplateField HeaderText="Fotografia">
                <ItemTemplate>
                    <asp:Image ID="fotografia" runat="server" Width="200px" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlQuartos" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' 
        DeleteCommand="DELETE FROM [Quartos] WHERE [ID] = @ID" 
        InsertCommand="INSERT INTO [Quartos] ([Piso], [Lotacao], [Preco_Dia], [WC], [TV], [Cozinha], [AC], [Varanda], [Fotografia], [Estado]) VALUES (@Piso, @Lotacao, @Preco_Dia, @WC, @TV, @Cozinha, @AC, @Varanda, @Fotografia, @Estado)" 
        SelectCommand="SELECT * FROM [Quartos]" 
        UpdateCommand="UPDATE [Quartos] SET [Piso] = @Piso, [Lotacao] = @Lotacao, [Preco_Dia] = @Preco_Dia, [WC] = @WC, [TV] = @TV, [Cozinha] = @Cozinha, [AC] = @AC, [Varanda] = @Varanda,  [Estado] = @Estado WHERE [ID] = @ID">
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
            <asp:Parameter Name="Fotografia" Type="Object"></asp:Parameter>
            <asp:Parameter Name="Estado" Type="Int32"></asp:Parameter>
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
