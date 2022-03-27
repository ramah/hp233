class Book {
  String isbn;
  String title;
  num price;
  String cover;
  List<dynamic> synopsis;

  Book(this.isbn, this.title, this.price, this.cover, this.synopsis);
  Book.fromMap(Map<String, dynamic> data)
      : isbn = data['isbn'],
        title = data['title'],
        price = data['price'],
        cover = data['cover'],
        synopsis = data['synopsis'] as List<dynamic>;
}
