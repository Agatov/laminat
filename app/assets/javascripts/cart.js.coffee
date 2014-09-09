$ ->


  $('.cart-table td .ololo').on 'change', ->

    tr = $(@).parents('tr')
    cart_product_id = tr.attr('cart_product_id')
    meters_per_pack = parseFloat tr.attr('meters_per_pack')

    request = $.ajax({
      type: 'PUT',
      url: "/cart_products/#{cart_product_id}.json",
      data: {
        'cart_product[count]': $(@).val()
      }
    })

    request.done (data) =>
      cart_product_sum = tr.find('.cart-product-sum .value number')
      cart_product_sum_old = parseInt cart_product_sum.text()
      cart_product_sum.text(parseInt(data.price))

      total_price_value = parseInt $('.total-price .value number').text()
      total_price_value  = total_price_value - cart_product_sum_old + parseInt(data.price)
      $('.total-price .value number').text total_price_value

      # Меняем количество метров
      tr.find('.meters').text(parseFloat((meters_per_pack * $(@).val()).toFixed(3)))

      # "Мигаем виджетом корзины"
      $(".cart-widget").animate({'opacity': '0.2'}, 400, ->

        #Обновляем данные в виджете сверху
        $("#cart-products-count").text parseInt(data.count)
        $("#cart-products-sum").text parseInt(data.sum)

        $(".cart-widget").animate({'opacity': '1'}, 400)
      )

