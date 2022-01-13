import 'package:bloc/bloc.dart';
import 'package:ecommerce_ap/models/models.dart';
import 'package:ecommerce_ap/models/wishlist_model.dart';
import 'package:equatable/equatable.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoaded()) {
    on<StartWishlist>(_mapStratWishlistToState);
    on<AddWishlistProduct>(_mapAddWishlistToState);
    on<RemoveWishlistProduct>(_mapRemoveWishlistToState);
  }

  void _mapStratWishlistToState(
      StartWishlist event, Emitter<WishlistState> emit) async {
    emit(WishlistLoading());
    try {
      await Future.delayed(Duration(seconds: 1));
      emit(WishlistLoaded());
    } catch (_) {}
  }

  void _mapAddWishlistToState(
      AddWishlistProduct event, Emitter<WishlistState> emit) async {
    if (state is WishlistLoaded) {
      try {
        emit(WishlistLoaded(
            wishlist: Wishlist(
                products: List.from(state.wishlist.products)
                  ..add(event.product))));
      } catch (_) {}
    }
  }

  void _mapRemoveWishlistToState(
      RemoveWishlistProduct event, Emitter<WishlistState> emit) async {
    if (state is WishlistLoaded) {
      try {
        emit(WishlistLoaded(
            wishlist: Wishlist(
                products: List.from(state.wishlist.products)
                  ..remove(event.product))));
      } catch (_) {}
    }
  }
}
