$ ->


  $('.cart-table td .ololo').on 'change', ->

    tr = $(@).parents('tr')
    cart_product_id = tr.attr('cart_product_id')


    request = $.ajax({
      type: 'PUT',
      url: "/cart_products/#{cart_product_id}.json",
      data: {
        'cart_product[count]': $(@).val()
      }
    })



    request.done (data) ->
      cart_product_sum = tr.find('.cart-product-sum .value number')
      cart_product_sum_old = parseInt cart_product_sum.text()
      cart_product_sum.text(parseInt(data.price))

      total_price_value = parseInt $('.total-price .value number').text()
      total_price_value  = total_price_value - cart_product_sum_old + parseInt(data.price)
      $('.total-price .value number').text total_price_value

