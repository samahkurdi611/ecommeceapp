import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_ap/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:ecommerce_ap/repositories/product/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  StreamSubscription? _productSubscription;

  ProductBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(ProductLoading()) {
    on<LoadProducts>(_mapLoadProductsToState);
    on<UpdateProducts>(_mapUpdateProductsToState);
  }

  void _mapLoadProductsToState(
      LoadProducts event, Emitter<ProductState> emit) async {
    _productSubscription?.cancel();
    _productSubscription = _productRepository.getAllProducts().listen(
          (products) => add(
            UpdateProducts(products),
          ),
        );
  }

  void _mapUpdateProductsToState(
      UpdateProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoaded(products: event.products));
  }
}
