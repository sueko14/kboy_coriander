import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ドメインモデル
class AddBookModel extends ChangeNotifier {
  String bookTitle = "";
  Future addBookToFirestore() async {
    if (bookTitle.isEmpty) {
      throw ("タイトルを入力してください");
    }
    FirebaseFirestore.instance.collection("books").add({
      "title": bookTitle,
      "createdAt": Timestamp.now(),
    });
  }
}
