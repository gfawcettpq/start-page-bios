Page = require '../../page.js.coffee'
http = require 'http'
$ = require 'cash-dom'

class DocsPage extends Page
  NAME: 'docs'

  url = "http://localhost:3030/docs"

  constructor: ->
    @collection = []

  render: ->
    http.get url, (res) ->
      status = res.statusCode

      if status == 200
        res.on 'data', (chunk) ->
          urls = JSON.parse(chunk)

          # Item-based method is too expensive, use this instead
          collection = urls.map (item)=>
            {html: ()-> "<a class='nav' href='#{item[0]}'>#{item[1]}</a>"}

          $('#docs').empty()

          collection.forEach (item) ->
            $('#docs').append(item.html())
      else
        console.log('api status: ' + status)

module.exports = DocsPage
