class Shelfari.Models.Books extends Backbone.Model
  paramRoot: 'book'

  defaults:
    title: null
    author: null
    status: null

class Shelfari.Collections.BooksCollection extends Backbone.Collection
  model: Shelfari.Models.Books
  url: '/books'
