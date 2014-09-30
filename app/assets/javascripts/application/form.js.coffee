$ ->

  $('#send-form').on 'click', ->
    form = $(@).parents('.form')

    username = form.find('input[name=name]')
    phone = form.find('input[name=phone]')
    content = form.find('textarea[name=content]')

    shake_fields = []

    if username.val() < 2
      shake_fields.push username

    if phone.val() < 5
      shake_fields.push phone

    if shake_fields.length > 0
      shake_field(field) for field in shake_fields
      return false

    $.post(
      '/orders.json',
    {
      'order[name]': username.val(),
      'order[phone]': phone.val(),
      'order[content]': content.val(),
    },
    (data) =>

    )

    show_thank_you()
#    reachGoal 'new_order'


  $('#send-call-form').on 'click', ->
    form = $(@).parents('.form')

    username = form.find('input[name=name]')
    phone = form.find('input[name=phone]')

    shake_fields = []

    if username.val() < 2
      shake_fields.push username

    if phone.val() < 5
      shake_fields.push phone

    if shake_fields.length > 0
      shake_field(field) for field in shake_fields
      return false

    $.post(
      '/orders/fast.json',
    {
      'order[name]': username.val(),
      'order[phone]': phone.val()
    },
    (data) =>

    )

    show_thank_you()



window.show_thank_you = ->

  form_block = $('.modal .form')

  form_block.animate({opacity: 0}, 1000, ->
    form_block.hide()
    thank_you_block = $('.modal-thank')
    thank_you_block.show()
    thank_you_block.animate({opacity: 1}, 1000, ->
      $('input[type=text]').val('')
    )
  )


window.shake_field = (field) ->
  shake(field, i) for i in [1..10]


window.shake = (field, i) ->

  if i%2
    field.animate({width: '-=15'}, 100)
  else
    field.animate({width: '+=15'}, 100)