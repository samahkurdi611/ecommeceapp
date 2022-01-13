import 'package:ecommerce_ap/blocs/cart/cart_bloc.dart';
import 'package:ecommerce_ap/models/cart_model.dart';
import 'package:ecommerce_ap/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CartScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'Cart'),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/checkout');
                  },
                  child: Text('Go To CHECKOUT',
                      style: Theme.of(context).textTheme.headline3!),
                ),
              ],
            ),
          ),
        ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CartLoaded) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.cart.freeDeliveryString,
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.popAndPushNamed(context, '/');
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.black,
                                  shape: RoundedRectangleBorder(),
                                  elevation: 0,
                                ),
                                child: Text(
                                  'Add More İtems',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            height: 400,
                            child: ListView.builder(
                              itemCount: state.cart
                                  .productQuantity(state.cart.products)
                                  .keys
                                  .length,
                              itemBuilder: (BuildContext context, int index) {
                                return CartProductCard(
                                  product: state.cart
                                      .productQuantity(state.cart.products)
                                      .keys
                                      .elementAt(index),
                                  quantity: state.cart
                                      .productQuantity(state.cart.products)
                                      .values
                                      .elementAt(index),
                                );
                              },
                            ),
                          ),
                          OrderSuumary(),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Text('Something went wrong');
            }
          },
        ));
  }
}
