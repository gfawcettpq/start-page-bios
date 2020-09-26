Page = require '../../page.js.coffee'
http = require 'http'
$ = require 'cash-dom'

class FunPage extends Page
  NAME: 'fun'

  url = "http://localhost:3030/fun"

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
            {html: ()-> "<a class='nav' target='_top' href='#{item[0]}'>#{item[1]}</a>"}

          $('#fun').empty()

          collection.forEach (item) ->
            $('#fun').append(item.html())
      else
        console.log('api status: ' + status)


module.exports = FunPage
