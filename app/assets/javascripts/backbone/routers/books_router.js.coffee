class Shelfari.Routers.BooksRouter extends Backbone.Router
  initialize: (options) ->
    @books = new Shelfari.Collections.BooksCollection()
    @books.reset options.books

  routes:
    "new"      : "newBooks"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newBooks: ->
    @view = new Shelfari.Views.Books.NewView(collection: @books)
    $("#books").html(@view.render().el)

  index: ->
    @view = new Shelfari.Views.Books.IndexView(books: @books)
    $("#books").html(@view.render().el)

  show: (id) ->
    books = @books.get(id)

    @view = new Shelfari.Views.Books.ShowView(model: books)
    $("#books").html(@view.render().el)

  edit: (id) ->
    books = @books.get(id)

    @view = new Shelfari.Views.Books.EditView(model: books)
    $("#books").html(@view.render().el)
