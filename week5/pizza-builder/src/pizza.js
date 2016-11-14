// Write your Pizza Builder JavaScript in this file.
$(document).ready(function () {
  console.log('werwer')
  updatePrice()
  $('.btn').click(function () {
    updatePrice()
  })

  $('.btn-pepperonni').click(function () {
    $('.pep').toggle()
    $('li:contains("pepperonni")').toggle()
    $(this).toggleClass('active')
  })

  $('.btn-mushrooms').click(function () {
    $('.mushroom').toggle()
    $('li:contains("mushrooms")').toggle()
    $('.btn-mushrooms').toggleClass('active')
  })

  $('.btn-green-peppers').click(function () {
    $('.green-pepper').toggle()
    $('li:contains("green peppers")').toggle()
    $('.btn-green-peppers').toggleClass('active')
  })

  $('.btn-sauce').click(function () {
    $('.sauce').toggleClass('sauce-white')
    $('li:contains("white sauce")').toggle()
    $('.btn-sauce').toggleClass('active')
  })

  $('.btn-crust').click(function () {
    $('.crust').toggleClass('crust-gluten-free')
    $('li:contains("gluten-free crust")').toggle()
    $('.btn-crust').toggleClass('active')
  })
})

function updatePrice () {
  var prices = $('li:visible:contains("$")')
  var price = 10
  for (var i = 0; i < prices.length; i++) {
    price += parseInt($(prices[i]).text()[1])
  }
  $('strong').text('$' + price)
}
