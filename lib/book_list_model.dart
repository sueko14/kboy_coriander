import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'book.dart';

// ドメインモデル
class BookListModel extends ChangeNotifier {
  List<Book> books = [];
  Future fetchBooks() async {
    final documents =
        await FirebaseFirestore.instance.collection("books").get();
    final books =
        documents.docs.map((doc) => Book(doc.data()["title"])).toList();
    this.books = books;
    notifyListeners(); //booksに新しいのが入ったらお知らせします
  }
}
