$ ->

  $('.meters-packs-form .fields .meters').on 'change', ->
    meters_per_pack = parseFloat $('.meters-packs-form .fields').attr('meters_per_pack')
    $('.meters-packs-form .fields .packs').val(Math.ceil(parseInt($(@).val() / meters_per_pack)))
    calculate_total_price()


  $('.meters-packs-form .fields .packs').on 'change', ->
    meters_per_pack = parseFloat $('.meters-packs-form .fields').attr('meters_per_pack')
    $('.meters-packs-form .fields .meters').val(meters_per_pack * parseInt($(@).val()))
    calculate_total_price()


  $('#add-to-cart').on 'click', ->
    $.post(
      '/cart_products.json',
      {
        'cart_product[count]': $('input.packs').val(),
        'cart_product[product_id]': $('input#product-id').val()
      },
      (data) =>

        # Обнуляем данные формы
        $('input.packs').val('0')
        $('input.meters').val('0')
        calculate_total_price()

        # "Мигаем виджетом корзины"
        $(".cart-widget").animate({'opacity': '0.2'}, 400, ->

          #Обновляем данные в виджете сверху
          $("#cart-products-count").text parseInt(data.count)
          $("#cart-products-sum").text parseInt(data.sum)

          $(".cart-widget").animate({'opacity': '1'}, 400)
        )
    )

  $('#set-asside').on 'click', ->
    $.post(
      '/cart_products/set_asside',
      {
        'product_id': $('input#product-id').val()
      },
      (data) =>
        $(@).addClass('deferred')
        $(@).text('Пробник заказан')
    )


window.calculate_total_price = ->
  total_price = parseInt ($('.meters-packs-form .fields .packs').val() * $('#pack-price').text())
  $('#total-price').text total_price
