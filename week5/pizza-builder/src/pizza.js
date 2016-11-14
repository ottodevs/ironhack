/* global $ */

// Write your Pizza Builder JavaScript in this file.
$(document).ready(function () {
  setupButtons()
  updatePrice()
})

function setupButtons () {
  var buttons = $('.btn')
  var toppings = ['pep', 'mushroom', 'green-pepper', 'sauce', 'crust', 'sauce-white', 'crust-gluten-free']
  for (let i = 0; i < buttons.length; i++) { // let is important here
    $(buttons[i]).click(function () {
      var panelSelector = $(this).text().toLowerCase()
      $(`.price>ul>li:contains(${panelSelector})`).fadeToggle(1000)
      $(this).toggleClass('active')
      i < 3
      ? $(`.${toppings[i]}`).toggle()
      : $(`.${toppings[i]}`).toggleClass(`${toppings[i + 2]}`)
      updatePrice()
    })
  }
}

function updatePrice () {
  var price = 10
  var activeToppings = $('.controls>ul>li').children('.active')
  for (var i = 0; i < activeToppings.length; i++) {
    price += parseInt($(activeToppings[i]).attr('data-price'), 10)
  }
  $('strong').text('$' + price)
}
