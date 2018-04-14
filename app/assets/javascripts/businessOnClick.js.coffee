$(document).on "ready page:load", ->
  change_business = ->
    if $("#business").prop("checked")
      $("#private_user").show()
    else
      $("#private_user").hide()

  $("#business").bind("click", change_business)
  change_business()
