//establecer a lo largo de mi app, la instancia de nuestro product repository impl
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:performance_record/domain/repositories/products_repository.dart';
import 'package:performance_record/infrastructure/datasources/products_datasource_localdatabase_impl.dart';
import 'package:performance_record/infrastructure/repositories/products_repository_impl.dart';

final productsRepositoryProvider = Provider<ProductsRepository>((ref) {
  return ProductsRepositoryImpl(
      datasource: ProductsDatasourceLocalDatabaseImpl());
});
