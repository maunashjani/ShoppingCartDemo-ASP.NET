<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="ShoppingCartDemo.Account" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Account</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style>
        /* Remove the navbar's default rounded borders and increase the bottom margin */
        .navbar {
            margin-bottom: 50px;
            border-radius: 0;
        }

        /* Remove the jumbotron's default bottom margin */
        .jumbotron {
            margin-bottom: 0;
        }

        /* Add a gray background color and some padding to the footer */
        footer {
            background-color: #f2f2f2;
            padding: 25px;
        }
    </style>
</head>
<body>
    <div class="jumbotron">
        <div class="container text-center">
            <h1>Shopping Cart Demo</h1>
            <p>Mission, Vission & Values</p>
        </div>
    </div>

    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Logo</a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="Home.aspx">Home</a></li>
                    <li><a href="#">Products</a></li>
                    <li><a href="#">Deals</a></li>
                    <li><a href="#">Stores</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="Account.aspx"><span class="glyphicon glyphicon-user"></span>Your Account</a></li>
                    <li><a href="Cart.aspx"><span class="glyphicon glyphicon-shopping-cart"></span>Cart</a></li>
                </ul>
            </div>
        </div>
    </nav>


    <form id="form1" runat="server">


        <div class="container">

            <h1>Your Orders:</h1>
            <hr />
            <asp:GridView ID="GridView1" CssClass="table table-responsive table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" ReadOnly="True" SortExpression="OrderID" />
                    <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" Visible="False" />
                    <asp:BoundField DataField="OrderDateTime" HeaderText="OrderDateTime" SortExpression="OrderDateTime" />
                    <asp:BoundField DataField="TotalAmount" HeaderText="TotalAmount" SortExpression="TotalAmount" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingCartDemoDBConnectionString %>" SelectCommand="SELECT * FROM [Orders] WHERE ([CustomerID] = @CustomerID)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="1" Name="CustomerID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

            <h2>Order Details:</h2>
            <hr />
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="RecordID" DataSourceID="SqlDataSource2">
                <AlternatingItemTemplate>
                    <li style="">RecordID:
                        <asp:Label ID="RecordIDLabel" runat="server" Text='<%# Eval("RecordID") %>' />
                        <br />
                        OrderID:
                        <asp:Label ID="OrderIDLabel" runat="server" Text='<%# Eval("OrderID") %>' />
                        <br />
                        ProductID:
                        <asp:Label ID="ProductIDLabel" runat="server" Text='<%# Eval("ProductID") %>' />
                        <br />
                        Quantity:
                        <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity") %>' />
                        <br />
                        Amount:
                        <asp:Label ID="AmountLabel" runat="server" Text='<%# Eval("Amount") %>' />
                        <br />
                    </li>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <li style="">RecordID:
                        <asp:Label ID="RecordIDLabel1" runat="server" Text='<%# Eval("RecordID") %>' />
                        <br />
                        OrderID:
                        <asp:TextBox ID="OrderIDTextBox" runat="server" Text='<%# Bind("OrderID") %>' />
                        <br />
                        ProductID:
                        <asp:TextBox ID="ProductIDTextBox" runat="server" Text='<%# Bind("ProductID") %>' />
                        <br />
                        Quantity:
                        <asp:TextBox ID="QuantityTextBox" runat="server" Text='<%# Bind("Quantity") %>' />
                        <br />
                        Amount:
                        <asp:TextBox ID="AmountTextBox" runat="server" Text='<%# Bind("Amount") %>' />
                        <br />
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </li>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    No data was returned.
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <li style="">OrderID:
                        <asp:TextBox ID="OrderIDTextBox" runat="server" Text='<%# Bind("OrderID") %>' />
                        <br />
                        ProductID:
                        <asp:TextBox ID="ProductIDTextBox" runat="server" Text='<%# Bind("ProductID") %>' />
                        <br />
                        Quantity:
                        <asp:TextBox ID="QuantityTextBox" runat="server" Text='<%# Bind("Quantity") %>' />
                        <br />
                        Amount:
                        <asp:TextBox ID="AmountTextBox" runat="server" Text='<%# Bind("Amount") %>' />
                        <br />
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </li>
                </InsertItemTemplate>
                <ItemSeparatorTemplate>
                    <br />
                </ItemSeparatorTemplate>
                <ItemTemplate>
                    <li style="">RecordID:
                        <asp:Label ID="RecordIDLabel" runat="server" Text='<%# Eval("RecordID") %>' />
                        <br />
                        OrderID:
                        <asp:Label ID="OrderIDLabel" runat="server" Text='<%# Eval("OrderID") %>' />
                        <br />
                        ProductID:
                        <asp:Label ID="ProductIDLabel" runat="server" Text='<%# Eval("ProductID") %>' />
                        <br />
                        Quantity:
                        <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity") %>' />
                        <br />
                        Amount:
                        <asp:Label ID="AmountLabel" runat="server" Text='<%# Eval("Amount") %>' />
                        <br />
                    </li>
                </ItemTemplate>
                <LayoutTemplate>
                    <ul id="itemPlaceholderContainer" runat="server" style="">
                        <li runat="server" id="itemPlaceholder" />
                    </ul>
                    <div style="">
                    </div>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <li style="">RecordID:
                        <asp:Label ID="RecordIDLabel" runat="server" Text='<%# Eval("RecordID") %>' />
                        <br />
                        OrderID:
                        <asp:Label ID="OrderIDLabel" runat="server" Text='<%# Eval("OrderID") %>' />
                        <br />
                        ProductID:
                        <asp:Label ID="ProductIDLabel" runat="server" Text='<%# Eval("ProductID") %>' />
                        <br />
                        Quantity:
                        <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity") %>' />
                        <br />
                        Amount:
                        <asp:Label ID="AmountLabel" runat="server" Text='<%# Eval("Amount") %>' />
                        <br />
                    </li>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingCartDemoDBConnectionString %>" SelectCommand="SELECT * FROM [OrderDetails] WHERE ([OrderID] = @OrderID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="OrderID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <br>
        <br />
    </form>

    <footer class="container-fluid text-center">
        <p>Website Credits</p>
        <form class="form-inline">
            Get deals:
    <input type="email" class="form-control" size="50" placeholder="Email Address">
            <button type="button" class="btn btn-danger">Sign Up</button>
        </form>
    </footer>
</body>
</html>
