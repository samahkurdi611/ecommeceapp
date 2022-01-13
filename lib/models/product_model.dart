import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isPopular,
    required this.isRecommended,
  });

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
      name: snap['name'],
      category: snap['category'],
      imageUrl: snap['imageUrl'],
      price: snap['price'],
      isPopular: snap['isPopular'],
      isRecommended: snap['isRecommended'],
    );

    return product;
  }

  @override
  List<Object?> get props => [
        name,
        category,
        imageUrl,
        price,
        isPopular,
        isRecommended,
      ];

  static List<Product> products = [
    Product(
      name: 'Smoothies #1',
      category: 'Smoothies',
      imageUrl:
          'https://images.unsplash.com/photo-1600718374662-0483d2b9da44?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fHNtb290aGllfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      price: 10.20,
      isPopular: true,
      isRecommended: true,
    ),
    Product(
      name: 'Smoothies #2',
      category: 'Smoothies',
      imageUrl:
          'https://images.unsplash.com/photo-1623065422902-30a2d299bbe4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fHNtb290aGllfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      price: 13.60,
      isPopular: true,
      isRecommended: true,
    ),
    Product(
      name: 'Coffee #1',
      category: 'Coffee',
      imageUrl:
          'https://images.unsplash.com/photo-1613187869034-fa8e42b2ab1c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDN8fGNhcHB1Y2Npbm98ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      price: 11.5,
      isPopular: true,
      isRecommended: false,
    ),
    Product(
      name: 'Dessert #1',
      category: 'Dessert',
      imageUrl:
          'https://images.unsplash.com/photo-1551024601-bec78aea704b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZGVzc2VydHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      price: 20.34,
      isPopular: true,
      isRecommended: true,
    ),
    Product(
      name: 'Dessert #2',
      category: 'Dessert',
      imageUrl:
          'https://images.unsplash.com/photo-1614707267537-b85aaf00c4b7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjJ8fGRlc3NlcnR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      price: 17.20,
      isPopular: true,
      isRecommended: true,
    ),
    Product(
      name: 'Coffee #2',
      category: 'Coffee',
      imageUrl:
          'https://images.unsplash.com/photo-1517701550927-30cf4ba1dba5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTN8fGNhcHB1Y2Npbm98ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      price: 8.5,
      isPopular: false,
      isRecommended: true,
    ),
    Product(
      name: 'Dessert #3',
      category: 'Dessert',
      imageUrl:
          'https://images.unsplash.com/photo-1627834377411-8da5f4f09de8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjV8fGNob2NvbGF0ZSUyMGNha2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      price: 30.7,
      isPopular: true,
      isRecommended: true,
    ),
    Product(
      name: 'Smoothies #3',
      category: 'Smoothies',
      imageUrl:
          'https://images.unsplash.com/photo-1572490122747-3968b75cc699?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjZ8fHNtb290aGllfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      price: 3.5,
      isPopular: false,
      isRecommended: true,
    ),
    Product(
      name: 'Smoothies #4',
      category: 'Smoothies',
      imageUrl:
          'https://images.unsplash.com/photo-1553530666-ba11a7da3888?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8c21vb3RoaWV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      price: 10.80,
      isPopular: false,
      isRecommended: false,
    ),
    Product(
      name: 'Smoothies #5',
      category: 'Smoothies',
      imageUrl:
          'https://images.unsplash.com/photo-1611928237590-087afc90c6fd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjF8fHNtb290aGllfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      price: 10.60,
      isPopular: false,
      isRecommended: false,
    ),
    Product(
      name: 'Deesert #4',
      category: 'Dessert',
      imageUrl:
          'https://images.unsplash.com/photo-1541599188778-cdc73298e8fd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGRlc3NlcnR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      price: 13.22,
      isPopular: false,
      isRecommended: false,
    ),
    Product(
      name: 'Dessert #5',
      category: 'Dessert',
      imageUrl:
          'https://images.unsplash.com/photo-1620980776848-84ac10194945?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzV8fGRlc3NlcnR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      price: 7.66,
      isPopular: false,
      isRecommended: false,
    ),
    Product(
      name: 'Dessert #6',
      category: 'Dessert',
      imageUrl:
          'https://images.unsplash.com/photo-1614174486496-344ef3e9d870?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTd8fGRlc3NlcnR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      price: 15.99,
      isPopular: false,
      isRecommended: false,
    ),
    Product(
      name: 'Coffee #3',
      category: 'Coffee',
      imageUrl:
          'https://images.unsplash.com/photo-1620360289100-030b032e5a27?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fGNhcHB1Y2Npbm98ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      price: 9.10,
      isPopular: false,
      isRecommended: false,
    ),
    Product(
      name: 'Coffee #4',
      category: 'Coffee',
      imageUrl:
          'https://images.unsplash.com/photo-1534778101976-62847782c213?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y2FwcHVjY2lub3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      price: 5.50,
      isPopular: false,
      isRecommended: false,
    ),
    Product(
      name: 'Coffee #5',
      category: 'Coffee',
      imageUrl:
          'https://images.unsplash.com/photo-1610889556528-9a770e32642f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZXNwcmVzc298ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      price: 3.30,
      isPopular: false,
      isRecommended: false,
    ),
    Product(
      name: 'Coffee #6',
      category: 'Coffee',
      imageUrl:
          'https://images.unsplash.com/photo-1619970291267-0e61f239c59e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDJ8fGNvZmVlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      price: 3.30,
      isPopular: false,
      isRecommended: false,
    ),
  ];
}
