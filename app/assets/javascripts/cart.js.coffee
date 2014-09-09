$ ->


  $('.cart-table td .ololo').on 'change', ->
    console.log $(@).val()

    request = $.ajax({
      type: 'PUT',
      url: '/cart',
      data: {
        product_id: $(@).attr('product_id'),
        count: $(@).val()
      }
    })

    request.done ->
      console.log 'olololo'