function deleteTournament (event) {
  event.preventDefault()

  let tournamentId = $(event.target).val()

  var request = $.ajax({
    url: '/api/tournaments',
    type: 'DELETE',
    data: {id: tournamentId},
    success: function () {
      $(event.target).closest('li').remove()
    }
  })
}
