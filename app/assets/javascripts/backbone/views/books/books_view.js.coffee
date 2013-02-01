Shelfari.Views.Books ||= {}

class Shelfari.Views.Books.BooksView extends Backbone.View
  template: JST["backbone/templates/books/books"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
