class Library {
  List<Map<String, dynamic>> books = [];
  void addBook(String title, String author, int year) {
    books.add({'title': title, 'author': author, 'year': year});
  }

  void printBooks() {
    books.forEach((item) => print(
        "Title: ${item['title']}, Author: ${item['author']}, Year: ${item['year']}"));
  }
}

void main(List<String> arguments) {
  Library lib = new Library();
  lib.addBook("1984", "George Orwell", 1949);
  lib.addBook("To Kill a Mockingbird", "Harper Lee", 1960);
  lib.printBooks();
}
