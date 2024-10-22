import 'package:performance_record/domain/datasources/product_datasource.dart';
import 'package:performance_record/domain/entities/product_entity.dart';
import 'package:performance_record/domain/repositories/products_repository.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final ProductsDatasource datasource;

  ProductsRepositoryImpl({required this.datasource});

  @override
  Future<bool> addProduct(ProductEntity product) {
    return datasource.addProduct(product);
  }

  @override
  Future<bool> deleteProduct(String id) {
    return datasource.deleteProduct(id);
  }

  @override
  Future<ProductEntity> getProduct(String id) {
    return datasource.getProduct(id);
  }

  @override
  Future<List<ProductEntity>> getProducts() {
    return datasource.getProducts();
  }

  @override
  Future<bool> updateProduct(ProductEntity product) {
    return datasource.updateProduct(product);
  }
}
