import 'package:product_app/helpers/helper.dart';

class ProductProvider with ChangeNotifier {
  final List<ProductModel> _products = [
    ProductModel(
      id: 1,
      name: "Bag",
      description: "Back Pack",
      price: 1000,
      imageUrl: "assets/images/shoe.jpg",
    ),
    ProductModel(
      id: 2,
      name: "Shirt",
      description: "Men Shirt",
      price: 50000,
      imageUrl: "assets/images/shoe.jpg",
    ),
    ProductModel(
      id: 2,
      name: "Shirt",
      description: "Men Shirt",
      price: 50000,
      imageUrl: "assets/images/shoe.jpg",
    ),
    ProductModel(
      id: 2,
      name: "Shirt",
      description: "Men Shirt",
      price: 50000,
      imageUrl: "assets/images/shoe.jpg",
    )
  ];

  List<ProductModel> get products => _products;

  ProductModel? _selectedProduct;
  ProductModel? get selectedproducts => _selectedProduct;

  void selectedproduct(ProductModel product) {
    _selectedProduct = product;
    notifyListeners();
  }
}
