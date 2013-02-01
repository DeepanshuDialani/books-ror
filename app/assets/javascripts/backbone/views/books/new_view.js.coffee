Shelfari.Views.Books ||= {}

class Shelfari.Views.Books.NewView extends Backbone.View
  template: JST["backbone/templates/books/new"]

  events:
    "submit #new-books": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (books) =>
        @model = books
        window.location.hash = "/#{@model.id}"

      error: (books, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
