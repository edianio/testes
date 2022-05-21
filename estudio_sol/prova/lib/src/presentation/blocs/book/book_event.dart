abstract class BookEvent{}

class AllBooksEvent implements BookEvent{}

class BookByIdEvent implements BookEvent{
  final int id;

  BookByIdEvent(this.id);
}

class FavoriteBooksEvent implements BookEvent{}