import 'package:ecommerce_ap/blocs/cart/cart_bloc.dart';
import 'package:ecommerce_ap/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerce_ap/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomNavBar extends StatelessWidget {
  final String screen;
  final Product? product;
  const CustomNavBar({
    Key? key,
    required this.product,
    required this.screen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _selectNavBar(context, screen)!,
        ),
      ),
    );
  }

  List<Widget>? _selectNavBar(context, screen) {
    switch (screen) {
      case '/':
        return _buildNavBar(context);
      case '/catalog':
        return _buildNavBar(context);
      case '/wishlist':
        return _buildNavBar(context);
      case '/product':
        return _builAddToCartNavBar(context, product);
      case '/cart':
        return _buildGoToCheckoutNavBar(context);
      case '/checkout':
        return _buildOrderNowNavBar(context);

      default:
        _buildNavBar(context);
    }
  }

  List<Widget> _buildNavBar(context) {
    return [
      IconButton(
        icon: Icon(Icons.home, color: Colors.white),
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
      ),
      IconButton(
        icon: Icon(Icons.shopping_cart, color: Colors.white),
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
      ),
      IconButton(
        icon: Icon(Icons.person, color: Colors.white),
        onPressed: () {
          Navigator.pushNamed(context, '/user_profile');
        },
      ),
    ];
  }

  List<Widget> _builAddToCartNavBar(context, product) {
    return [
      IconButton(
        icon: Icon(Icons.person, color: Colors.white),
        onPressed: () {},
      ),
      BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoading) {
            return CircularProgressIndicator();
          }
          if (state is WishlistLoaded) {
            return IconButton(
              icon: Icon(Icons.favorite, color: Colors.white),
              onPressed: () {
                final snackBar =
                    SnackBar(content: Text('Added to your Wishlist!'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            );
          }
          return Text('Something went wrong');
        },
      ),
      BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoaded) {
            return ElevatedButton(
              onPressed: () {
                context.read<CartBloc>().add(CartProductAdded(product));
                Navigator.pushNamed(context, '/cart');
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.white, shape: RoundedRectangleBorder()),
              child: Text(
                'Add To Cart',
                style: Theme.of(context).textTheme.headline2,
              ),
            );
          }
          return Text('Something went Wrong');
        },
      )
    ];
  }

  List<Widget> _buildGoToCheckoutNavBar(context) {
    return [
      ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/checkout');
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: RoundedRectangleBorder(),
        ),
        child: Text(
          'Go To CHECKOUT',
          style: Theme.of(context).textTheme.headline3,
        ),
      )
    ];
  }

  List<Widget> _buildOrderNowNavBar(context) {
    return [
      ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: RoundedRectangleBorder(),
        ),
        child: Text(
          'ORDER NOW',
          style: Theme.of(context).textTheme.headline3,
        ),
      )
    ];
  }
}

 /*;*/