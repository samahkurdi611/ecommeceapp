import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({
    required this.name,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [name, imageUrl];

  static Category fromSnapshot(DocumentSnapshot snap) {
    Category category = Category(
      name: snap['name'],
      imageUrl: snap['imageUrl'],
    );

    return category;
  }

  static List<Category> categories = [
    Category(
      name: 'Smoothies',
      imageUrl:
          'https://images.unsplash.com/photo-1502741224143-90386d7f8c82?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fHNtb290aGllfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    ),
    Category(
      name: 'Dessert',
      imageUrl:
          'https://images.unsplash.com/photo-1602400430611-632f5fc44272?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzl8fGRlc3NlcnRzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    ),
    Category(
      name: 'Coffee',
      imageUrl:
          'https://images.unsplash.com/photo-1459755486867-b55449bb39ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8Y29mZWV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
    ),
  ];
}
