import 'package:flutter/material.dart';
import 'package:kboy_coriander/book_list_model.dart';
import 'package:provider/provider.dart';

class BookListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BookListModel>(
      create: (_) => BookListModel()..fetchBooks(),
      // 画面生成されてBookListModelが作られたらfetchbooksも呼ぶ
      // するとbooksが変更されるとnotifyListenerされて、Consumerの中身も書き換わる
      child: Scaffold(
        appBar: AppBar(
          title: Text('本一覧'),
        ),
        body: Consumer<BookListModel>(
          builder: (context, model, child) {
            final books = model.books;
            final listTiles =
                books.map((book) => ListTile(title: Text(book.title))).toList();
            return ListView(
              children: listTiles,
            );
          },
        ),
      ),
    );
  }
}
