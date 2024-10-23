import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:performance_record/domain/entities/product_entity.dart';
import 'package:performance_record/domain/repositories/products_repository.dart';

class ProductsNotifier extends StateNotifier<ProductsState> {
  final ProductsRepository productsRepository;
  ProductsNotifier({required this.productsRepository})
      : super(ProductsState()) {
    loadNextPage();
  }
  Future loadNextPage() async {
    if (state.isLoading || state.products.isEmpty) {
      return;
    }
    state = state.copyWith(isLoading: true);
    final products = await productsRepository.getProducts();
    if (products.isEmpty) {
      state = state.copyWith(isLoading: false);
      return;
    }
    state = state.copyWith(
      isLoading: false,
      products: [...state.products, ...products],
    );
  }
}

class ProductsState {
  final bool isLoading;
  final List<ProductEntity> products;
  ProductsState({
    this.isLoading = false,
    this.products = const [],
  });

  ProductsState copyWith({
    bool? isLoading,
    List<ProductEntity>? products,
  }) {
    return ProductsState(
      isLoading: isLoading ?? this.isLoading,
      products: products ?? this.products,
    );
  }
}
