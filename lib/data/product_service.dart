import '../models/product.dart';

class ProductService{
  static List<Product> products=<Product>[];

  ProductService._internal();

  static ProductService _singleton = ProductService._internal();

  factory ProductService(){
    return _singleton;
  }
  static List<Product> getAll(){
    products.add(new Product(1, "Acer Laptop", 6000));
    products.add(new Product(2, "Lenova Laptop", 7000));
    products.add(new Product(3, "Monster Laptop", 5000));
    return products;
  }


}