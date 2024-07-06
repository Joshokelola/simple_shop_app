class Product {
  final String name;
  final String price;
  final String image;

  Product({
    required this.name,
    required this.price,
    required this.image,
  });
}

List<Product> products = [
  Product(name: 'Tv 1', price: '\$200', image: './assets/Tv_1.jpg'),
  Product(name: 'Tv 2', price: '\$100', image: './assets/Tv_2.jpg'),
  Product(name: 'Tv 3', price: '\$340', image: './assets/TV_3.jpg'),
  Product(name: 'Tv 4', price: '\$110', image: './assets/tv_4.jpg'),
  Product(name: 'Tv 5', price: '\$230', image: './assets/Tv_5.jpg'),
  Product(name: 'Tv 6', price: '\$450', image: './assets/tv_6.jpg'),
];

List<Product> cartItems = [];
