Page = require '../../page.js.coffee'
http = require 'http'
$ = require 'cash-dom'

class WorkPage extends Page
  NAME: 'work'

  url = "http://localhost:3030/work"

  constructor: ->
    @collection = []

  render: ->
    http.get url, (res) =>
      status = res.statusCode

      if status == 200
        res.on 'data', (chunk) ->
          urls = JSON.parse(chunk)

          # Item-based method is too expensive, use this instead
          collection = urls.map (item)=>
            {html: ()-> "<a class='nav' href='#{item[0]}'>#{item[1]} </a>"}

          $('#work').empty()

          collection.forEach (item) ->
            $('#work').append(item.html())
      else
        console.log('api status: ' + status)

module.exports = WorkPage
