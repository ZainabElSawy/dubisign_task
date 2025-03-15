import '../../../home/data/model/product_model.dart';

class CartWithProducts {
  final List<ProductWithQuantity> products;
  final double totalPrice;

  CartWithProducts({required this.products, required this.totalPrice});
}

class ProductWithQuantity {
  final ProductModel product;
  final int quantity;

  ProductWithQuantity({required this.product, required this.quantity});
}
