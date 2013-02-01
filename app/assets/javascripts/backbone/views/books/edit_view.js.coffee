Shelfari.Views.Books ||= {}

class Shelfari.Views.Books.EditView extends Backbone.View
  template : JST["backbone/templates/books/edit"]

  events :
    "submit #edit-books" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (books) =>
        @model = books
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
