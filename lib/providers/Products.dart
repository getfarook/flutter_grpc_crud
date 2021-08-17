import 'dart:convert';
import 'package:flutter/material.dart';
import './product.dart';
import '../models/http_exception.dart';
import 'package:grpc/grpc.dart';
import '../protos_out/prod.pb.dart' as pb1;
import '../protos_out/prod.pbgrpc.dart' as pb2;
import './constants.dart';

class Products with ChangeNotifier {

  List<Product> _items = [];

  List<Product> get items{
    return [..._items];
  }

  Product findById(int id){
    return _items.firstWhere((prod) => prod.id == id);
  }

  var client = pb2.ProductServiceClient(
    ClientChannel(
      Constants.serverIp,
      port: Constants.port,
      options: ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    ),
  );

  Future<void> fetchAndSetProductsRpc() async {
    try{
      final response = await client.getProducts(pb1.GetProdRequest());
      final extractedData = response.myProducts;
      final List<Product> loadedProducts = [];
      extractedData.forEach((element) {
        loadedProducts.add(Product(
          id: element.id,
          name: element.name,
          price: element.price,
          description: element.details,
        ));
      });
      _items = loadedProducts;
      notifyListeners();
      //print(response.myProducts);
    }catch(error) {
      print(error);
      throw error;
    }
  }

  Future<void> addProductRpc(Product product) async {
    try{
      final response = await client.addProduct(
          pb1.Product()
            ..name = product.name
            ..price = product.price
            ..details = product.description
      );
      final newProduct = Product(
        name: product.name,
        price: product.price,
        description: product.description,
        id: response.id,
      );
      _items.add(newProduct);
      notifyListeners();
    }catch(error) {
      print(error);
      throw error;
    }

  }

  Future<void> updateProductRpc(int id, Product newProduct) async {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >=0){
      try{
        final response = await client.updateProduct(
          pb1.Product()
              ..id = id
              ..name = newProduct.name
              ..price = newProduct.price
              ..details = newProduct.description
        );
      } catch(error){
        print(error);
      }
      _items[prodIndex] = newProduct;
      notifyListeners();
    }else {
      print('....');
    }
  }

  Future<void> deleteProductRpc(int id) async{
    final existingProductIndex = _items.indexWhere((prod) => prod.id == id);
    var existingProduct = _items[existingProductIndex];
    _items.removeAt(existingProductIndex);
    notifyListeners();
    try{
      final response = await client.deleteProduct(
        pb1.ProdId()
            ..id = id
      );
    }catch(error){
      _items.insert(existingProductIndex, existingProduct);
      notifyListeners();
      print(error);
    }
    existingProduct = null;
  }

}