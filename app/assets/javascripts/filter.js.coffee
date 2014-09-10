$ ->

  console.log 'ololo'

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

    $('#textures-modal').hide()
    $('.modal-overlay').hide()

    if texture_id == 'empty'
      $('#texture-widget img').attr('src', '').hide()
      $('input[name=texture_id]').val ''

    else
      $("#texture-widget img").attr('src', texture_image).show()
      $('input[name=texture_id]').val parseInt texture_id


  $('#color-picker').on 'change', ->
    $('input[name=color_id]').val $(@).val()