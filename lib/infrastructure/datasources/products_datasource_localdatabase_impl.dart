import 'package:performance_record/domain/datasources/product_datasource.dart';
import 'package:performance_record/domain/entities/product_entity.dart';
import 'package:performance_record/infrastructure/helpers/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class ProductsDatasourceLocalDatabaseImpl extends ProductsDatasource {
  final DatabaseHelper _databaseHelper =
      DatabaseHelper(); // Instancia de DatabaseHelper

  @override
  Future<bool> addProduct(ProductEntity product) async {
    final db = await _databaseHelper.database; // Obtener la base de datos
    try {
      await db.insert(
        'products', // Nombre de la tabla
        {
          'nameProduct': product.nameProduct, // Mapa de valores a insertar
        },
        conflictAlgorithm: ConflictAlgorithm.replace, // Manejo de conflictos
      );
      return true;
    } on DatabaseException catch (e) {
      // Manejo específico de la excepción de la base de datos
      print('Error al insertar el producto: ${e.toString()}');
      return false;
    } catch (e) {
      // Manejo de cualquier otra excepción
      print('Error inesperado: $e');
      return false;
    }
  }

  @override
  Future<bool> deleteProduct(String id) async {
    final db = await _databaseHelper.database;
    try {
      await db.delete(
        'products', // Nombre de la tabla
        where: 'idProduct = ?', // Condición para eliminar
        whereArgs: [id], // Argumentos para la condición
      );
      return true;
    } on DatabaseException catch (e) {
      // Manejo específico de la excepción de la base de datos
      print('Error al eliminar el producto: ${e.toString()}');
      return false;
    } catch (e) {
      // Manejo de cualquier otra excepción
      print('Error inesperado: $e');
      return false;
    }
  }

  @override
  Future<ProductEntity> getProduct(String id) async {
    final db = await _databaseHelper.database;
    try {
      final List<Map<String, dynamic>> maps = await db.query(
        'products', // Nombre de la tabla
        where: 'idProduct = ?', // Condición de búsqueda
        whereArgs: [id], // Argumentos para la búsqueda
      );

      if (maps.isNotEmpty) {
        return ProductEntity(
          idProduct: maps.first['idProduct'], // Convertir a String
          nameProduct: maps.first['nameProduct'],
        );
      } else {
        throw Exception('Product not found');
      }
    } on DatabaseException catch (e) {
      // Manejo específico de la excepción de la base de datos
      print('Error al obtener el producto: ${e.toString()}');
      throw Exception('No se pudo obtener el producto: ${e.toString()}');
    } catch (e) {
      // Manejo de cualquier otra excepción
      print('Error inesperado: $e');
      throw Exception('Error inesperado: $e');
    }
  }

  @override
  Future<List<ProductEntity>> getProducts() async {
    final db = await _databaseHelper.database;
    try {
      final List<Map<String, dynamic>> maps = await db.query('products');

      return List.generate(maps.length, (i) {
        return ProductEntity(
          idProduct: maps[i]['idProduct'],
          nameProduct: maps[i]['nameProduct'],
        );
      });
    } on DatabaseException catch (e) {
      // Manejo específico de la excepción de la base de datos
      print('Error al obtener los productos: ${e.toString()}');
      throw Exception('No se pudo obtener los productos: ${e.toString()}');
    } catch (e) {
      // Manejo de cualquier otra excepción
      print('Error inesperado: $e');
      throw Exception('Error inesperado: $e');
    }
  }

  @override
  Future<bool> updateProduct(ProductEntity product) async {
    final db = await _databaseHelper.database;
    try {
      await db.update(
        'products', // Nombre de la tabla
        {
          'nameProduct': product.nameProduct, // Mapa de valores a actualizar
        },
        where: 'idProduct = ?', // Condición para la actualización
        whereArgs: [product.idProduct], // Argumentos para la condición
      );
      return true;
    } on DatabaseException catch (e) {
      // Manejo específico de la excepción de la base de datos
      print('Error al actualizar el producto: ${e.toString()}');
      return false;
    } catch (e) {
      // Manejo de cualquier otra excepción
      print('Error inesperado: $e');
      return false;
    }
  }
}
