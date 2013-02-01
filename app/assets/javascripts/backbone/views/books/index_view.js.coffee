Shelfari.Views.Books ||= {}

class Shelfari.Views.Books.IndexView extends Backbone.View
  template: JST["backbone/templates/books/index"]

  initialize: () ->
    @options.books.bind('reset', @addAll)

  addAll: () =>
    @options.books.each(@addOne)

  addOne: (books) =>
    view = new Shelfari.Views.Books.BooksView({model : books})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(books: @options.books.toJSON() ))
    @addAll()

    return this
