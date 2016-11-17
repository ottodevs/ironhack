/* global $, PokemonApp */
// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
PokemonApp.PokemonEvolutions = function (id, info) {
  this.id = id
  this.info = info
}

PokemonApp.PokemonEvolutions.prototype.render = function () {
  console.log(`Rendering evolutions for: #${this.id}`)

  $.ajax({
    url: `api/pokemon/${this.id}`,
    success: function (response) {
      $('.js-pkmn-name').text(response.name)
      $('.js-pkmn-number').text('#' + response.pkdx_id)
      $('.js-pkmn-height').text(response.height)
      $('.js-pkmn-weight').text(response.weight)

      /*
      - HP hit points
      Attack & defense
      Special attack & special defense (SP)
      Speed
      Types = water, fire, etc
      */

      $('.js-pokemon-modal').modal('show')
    }
  })
}

PokemonApp.idFromUri = function (pokemonUri) {
  var uriSegments = pokemonUri.split('/')
  var secondLast = uriSegments.length - 2
  return uriSegments[secondLast]
}

$(function () {
  $('.js-show-pokemon').click(function (event) {
    var $button = $(event.currentTarget)
    var pokemonUri = $button.data('pokemon-uri')

    var pokemon = new PokemonApp.Pokemon(pokemonUri)
    pokemon.render()
  })
})
