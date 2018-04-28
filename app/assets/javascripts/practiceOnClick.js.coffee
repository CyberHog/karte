$(document).on "ready page:load", ->
  change_practice = ->
    if $("#clinic").prop("checked")
      $("#private_user").show()
    else
      $("#private_user").hide()

  $("#clinic").bind("click", change_practice)
  change_practice()
