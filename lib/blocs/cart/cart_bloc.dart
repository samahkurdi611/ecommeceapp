import 'package:bloc/bloc.dart';
import 'package:ecommerce_ap/models/cart_model.dart';
import 'package:ecommerce_ap/models/models.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<CartStarted>(_mapCartStartedToState);
    on<CartProductAdded>(_mapCartProductAddedToState);
    on<CartProductRemoved>(_mapCartCartProductRemovedToState);
  }

  void _mapCartStartedToState(
      CartStarted event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      await Future.delayed(Duration(seconds: 1));
      emit(CartLoaded());
    } catch (_) {}
  }

  void _mapCartProductAddedToState(
      CartProductAdded event, Emitter<CartState> emit) async {
    if (state is CartLoaded) {
      try {
        emit(CartLoaded(
            cart: Cart(
                products: List.from(state.cart.products)..add(event.product))));
      } catch (_) {}
    }
  }

  void _mapCartCartProductRemovedToState(
      CartProductRemoved event, Emitter<CartState> emit) async {
    if (state is CartLoaded) {
      try {
        emit(CartLoaded(
            cart: Cart(
                products: List.from(state.cart.products)
                  ..remove(event.product))));
      } catch (_) {}
    }
  }
}
