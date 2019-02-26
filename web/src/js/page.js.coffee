$ = require 'cash-dom'

class Page
  BASE_URL: "http://#{process.env['API_HOST']}:3000/"

  constructor: ->
    @collection = @COLLECTION.map (item)=>
      new (require("./pages/#{@NAME}/#{item}.js.coffee"))

  render: ->
    $("section##{@NAME}").empty()
    # need something like virtual DOM to make it interactive here
    @collection.forEach (item)=>
      $("section##{@NAME}").append(item.html())

module.exports = Page
