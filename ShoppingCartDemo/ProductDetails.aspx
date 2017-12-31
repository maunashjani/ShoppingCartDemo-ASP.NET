<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="ShoppingCartDemo.ProductDetails" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Product</title>
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
                title: 'Cart!',
                text: 'Product added to cart.',
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

            <div class="row">
                <div class="col-md-3">
                    <asp:Image ID="Image1" CssClass="img-responsive" runat="server" />
                </div>

                <div class="col-md-5">
                    Product ID:
                    <asp:Label ID="lblProductID" runat="server" Text="Label"></asp:Label>
                    <br />
                    <br />
                    Product Name:
                    <asp:Label ID="lblProductName" runat="server" Text="Label"></asp:Label>
                    <br />
                    <br />
                    Product Price: &#8377;
                    <asp:Label ID="lblProductPrice" runat="server" Text="Label"></asp:Label>
                    <br />
                    <br />
                    Quantity:
                    <asp:TextBox ID="txtQuantity" CssClass="form-control" AutoPostBack="true" Text="1" runat="server" OnTextChanged="txtQuantity_TextChanged"></asp:TextBox>
                    <br />
                    <br />
                    Amount: &#8377;
                    <asp:Label ID="lblAmount" runat="server" Text="Label"></asp:Label>
                    <br />
                    <br />
                    <asp:Button ID="btnAddToCart" CssClass="btn btn-success" runat="server" Text="Add To Cart" OnClick="btnAddToCart_Click" />
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
