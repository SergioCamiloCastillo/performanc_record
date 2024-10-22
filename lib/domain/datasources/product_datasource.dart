import 'package:performance_record/domain/entities/product_entity.dart';

abstract class ProductsDatasource {
  Future<List<ProductEntity>> getProducts();
  Future<ProductEntity> getProduct(String id);
  Future<bool> addProduct(ProductEntity product);
  Future<bool> updateProduct(ProductEntity product);
  Future<bool> deleteProduct(String id);
}
