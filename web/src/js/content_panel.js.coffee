$ = require 'cash-dom'
Pages = require './pages.js.coffee'
MainPage = require './pages/main/index.js.coffee'
FunPage = require './pages/fun/index.js.coffee'
WorkPage = require './pages/work/index.js.coffee'
DocsPage = require './pages/docs/index.js.coffee'

class ContentPanel
  
  renderPages: ->
    @mainPage.render()
    @funPage.render()
    @workPage.render()
    @docsPage.render()

  constructor: ->
    @hash = Pages.detectCurrentPage()
    @mainPage = new MainPage
    @funPage = new FunPage
    @workPage = new WorkPage
    @docsPage = new DocsPage

  updateVisibility: ->
    @renderPages()

    $(".#{Pages.PAGES.join(', .')}").removeClass('focus')
    $(".#{@hash}").addClass('focus')

  updatePage: ->
    @updateVisibility()

  setUpHashListener: ->
    $(window).on 'hashchange', =>
      @hash = Pages.detectCurrentPage()
      @updatePage()

  bootstrap: ->
    @setUpHashListener()
    @updatePage()
    @renderPages()

module.exports = ContentPanel
