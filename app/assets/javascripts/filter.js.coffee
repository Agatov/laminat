$ ->

  $('#price-widget .section').on 'click', ->
    $('#price-widget .section').removeClass('active')
    $(@).addClass('active')

    $('input[name=min_price]').val parseInt $(@).attr('min')
    $('input[name=max_price]').val parseInt $(@).attr('max')



  $('#type-widget .section').on 'click', ->

    $('#type-widget .section').removeClass('active')
    $(@).addClass('active')

    $('input[name=type]').val parseInt $(@).attr('type')