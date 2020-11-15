$ = require 'cash-dom'

class Page
  BASE_URL: "http://startpage-api.chickenoncow.com"

  constructor: ->
    @collection = @COLLECTION.map (item)=>
      new (require("./pages/#{@NAME}/#{item}.js.coffee"))

  render: ->
    $("section##{@NAME}").empty()
    # need something like virtual DOM to make it interactive here
    @collection.forEach (item)=>
      $("section##{@NAME}").append(item.html())

module.exports = Page
