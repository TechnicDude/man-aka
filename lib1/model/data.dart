import 'package:manaqa_app/model/category.dart';
import 'package:manaqa_app/model/product.dart';

class AppData {
  static List<Product> productList = [
    Product(
        id: 1,
        name: 'Apple Air Max 200',
        price: 240.00,
        isSelected: true,
        isliked: false,
        lowerquotes: 1,
        totalcompany: 10,
        image: 'assets/images/apple1.jpg',
        category: "Trending Now"),
    Product(
        id: 2,
        name: 'Banana Air Max 97',
        price: 220.00,
        isliked: false,
        lowerquotes: 1,
        totalcompany: 14,
        image: 'assets/images/banana1.jpg',
        category: "Trending Now"),
    Product(
        id: 3,
        name: 'Red Apple Max 97',
        price: 220.00,
        isliked: false,
        lowerquotes: 1,
        totalcompany: 10,
        image: 'assets/images/apple2.jpg',
        category: "Trending Now"),
    Product(
        id: 4,
        name: 'Kivi Air Max 97',
        price: 220.00,
        isliked: false,
        lowerquotes: 1,
        totalcompany: 10,
        image: 'assets/images/kivi1.jpg',
        category: "Trending Now"),
  ];
  static List<Product> cartList = [
    Product(
        id: 1,
        name: 'Banana Air Max 200',
        price: 240.00,
        isSelected: true,
        isliked: false,
        lowerquotes: 1,
        totalcompany: 4,
        image: 'assets/images/banana1.jpg',
        category: "Trending Now"),
    Product(
        id: 2,
        name: 'Apple Air Max 97',
        price: 190.00,
        isliked: false,
        lowerquotes: 1,
        totalcompany: 13,
        image: 'assets/images/apple3.jpg',
        category: "Trending Now"),
    Product(
        id: 1,
        name: 'Best Banana Max 92607',
        price: 220.00,
        isliked: false,
        lowerquotes: 1,
        totalcompany: 10,
        image: 'assets/images/banana2.jpg',
        category: "Trending Now"),
    Product(
        id: 2,
        name: 'Apple Air Max 200',
        price: 240.00,
        isSelected: true,
        isliked: false,
        lowerquotes: 1,
        totalcompany: 10,
        image: 'assets/images/apple1.jpg',
        category: "Trending Now"),
    // Product(
    //     id:1,
    //     name: 'Nike Air Max 97',
    //     price: 190.00,
    //     isliked: false,
    //     image: 'assets/small_tilt_shoe_2.png',
    //     category: "Trending Now"),
  ];
  static List<Category> categoryList = [
    Category(
        id: 1,
        name: "Apple",
        image: 'assets/images/appl.jpg',
        isSelected: true),
    Category(id: 2, name: "Banana", image: 'assets/images/banana2.jpg'),
    Category(id: 3, name: "Watch", image: 'assets/images/gu.jpg'),
    Category(id: 4, name: "Watch", image: 'assets/images/pic1.jpg'),
    Category(id: 5, name: "Watch", image: 'assets/images/pic1.jpg'),
    Category(id: 6, name: "Watch", image: 'assets/images/pic1.jpg'),
    Category(id: 7, name: "Watch", image: 'assets/images/pic1.jpg'),
    Category(id: 8, name: "Watch", image: 'assets/images/pic1.jpg'),
    Category(id: 9, name: "Watch", image: 'assets/images/pic1.jpg'),
    Category(id: 10, name: "Watch", image: 'assets/images/pic1.jpg'),
    Category(id: 11, name: "Watch", image: 'assets/images/pic1.jpg'),
    Category(id: 12, name: "Watch", image: 'assets/images/pic1.jpg'),
    Category(id: 13, name: "Watch", image: 'assets/images/pic1.jpg'),
    Category(id: 14, name: "Watch", image: 'assets/images/pic1.jpg'),
  ];
  static List<String> showThumbnailList = [
    "assets/images/shoe_thumb_5.png",
    "assets/images/shoe_thumb_1.png",
    "assets/images/shoe_thumb_4.png",
    "assets/images/shoe_thumb_3.png",
  ];
  static String description =
      "Clean lines, versatile and timeless—the people shoe returns with the Nike Air Max 90. Featuring the same iconic Waffle sole, stitched overlays and classic TPU accents you come to love, it lets you walk among the pantheon of Air. ßNothing as fly, nothing as comfortable, nothing as proven. The Nike Air Max 90 stays true to its OG running roots with the iconic Waffle sole, stitched overlays and classic TPU details. Classic colours celebrate your fresh look while Max Air cushioning adds comfort to the journey.";
}
