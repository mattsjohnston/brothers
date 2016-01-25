$ ->
  $('a.panel-expand').click (e) ->
    $(e.currentTarget).children('.caret').toggleClass 'caret-reversed'
    $(e.currentTarget).closest('.panel').toggleClass 'panel-expanded'
