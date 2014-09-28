$ ->


  waitForMap ->

    #http://geocode-maps.yandex.ru/1.x/?geocode=OLOLOLO
    @map = new ymaps.Map($("#map")[0], {center: [55.72459, 37.584649], zoom: 13})


    placemark = new ymaps.Placemark(
      [55.72459, 37.584649],
      {
        balloonContent: 'Москва, Фрунзенская набережная, дом 30'
      }
    )



    @map.geoObjects.add(placemark)
    placemark.balloon.open()

#    placemark.events.add("mouseenter", (that) =>
#      placemark.balloon.open()
#    )
#
#    placemark.events.add("mouseleave", (that) =>
#      placemark.balloon.close()
#    )


window.waitForMap = (callback) ->
  if ymaps.Map
    callback(this)
  else
    setTimeout(
      ->
        waitForMap(callback)
      500
    )

