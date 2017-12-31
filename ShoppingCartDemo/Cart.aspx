<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="ShoppingCartDemo.Cart" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Cart</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
    <script>
        function successalert() {
            swal({
                title: 'Thank You!',
                text: 'Your Order has been placed successfully.',
                type: 'success'
            }).then(() => {
                window.location.href = "Home.aspx";
            });
        }
    </script>
</head>
<body>
    <div class="jumbotron">
        <div class="container text-center">
            <h1>Shopping Cart Demo</h1>
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
        <div>

            <asp:GridView ID="GridView1" CssClass="table table-hover table-responsive" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" OnRowUpdated="GridView1_RowUpdated" OnRowDeleted="GridView1_RowDeleted">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" Visible="false" SortExpression="ID" />
                    <asp:BoundField DataField="ProductID" HeaderText="ProductID" ReadOnly="true" SortExpression="ProductID" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                    <asp:BoundField DataField="Price" HeaderText="Price" ReadOnly="true" SortExpression="Price" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount" ReadOnly="true" SortExpression="Amount" />
                    <asp:BoundField DataField="CartID" HeaderText="CartID" SortExpression="CartID" Visible="false" />
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ShoppingCartDemoDBConnectionString %>" DeleteCommand="DELETE FROM [Cart] WHERE [ID] = @ID"
                InsertCommand="INSERT INTO [Cart] ([ProductID], [Quantity], [Price], [Amount], [CartID]) VALUES (@ProductID, @Quantity, @Price, @Amount, @CartID)"
                SelectCommand="SELECT * FROM [Cart] WHERE ([CartID] = @CartID)"
                UpdateCommand="UPDATE [Cart] SET [Quantity] = @Quantity, [Amount] = @Quantity*Price WHERE [ID] = @ID">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ProductID" Type="Int32" />
                    <asp:Parameter Name="Quantity" Type="Int32" />
                    <asp:Parameter Name="Price" Type="Decimal" />
                    <asp:Parameter Name="Amount" Type="Decimal" />
                    <asp:Parameter Name="CartID" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="CartID" SessionField="CartID" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ProductID" Type="Int32" />
                    <asp:Parameter Name="Quantity" Type="Int32" />
                    <asp:Parameter Name="Price" Type="Decimal" />
                    <asp:Parameter Name="Amount" Type="Decimal" />
                    <asp:Parameter Name="CartID" Type="String" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <br />
            <br />

            <div class="row">
                <div class="pull-right col-md-3">
                    Total Amount: &#8377;
                    <asp:Label ID="lblTotalAmount" runat="server" Text="Label"></asp:Label>
                    <br />
                    <br />
                    <asp:Button ID="btnCheckout" CssClass="btn btn-success" runat="server" Text="Checkout" OnClick="btnCheckout_Click" />
                    <br />
                    <br />
                </div>
            </div>

        </div>
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
