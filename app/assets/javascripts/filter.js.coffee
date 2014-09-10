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


  $('#texture-widget').on 'click', ->
    $('.modal-overlay').show()
    $('#textures-modal').show()


  $('.textures .texture').on 'click', ->
    texture_id = $(@).attr('texture_id')
    texture_image = $(@).attr('image')

    $("#texture-widget img").attr('src', texture_image).show()

    $('#textures-modal').hide()
    $('.modal-overlay').hide()

    $('input[name=texture_id]').val parseInt texture_id