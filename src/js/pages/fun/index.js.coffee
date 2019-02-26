Page = require '../../page.js.coffee'

class FunPage extends Page
  NAME: 'fun'

  URLS: [
  ]

  constructor: ->
    # Item-based method is too expensive, use this instead
    @collection = @URLS.map (item)=>
      {html: ()-> "<a class='nav' href='#{item[0]}'>#{item[1]} <span style='color: #555555;'>#{item[0]}</span></a>"}

module.exports = FunPage
