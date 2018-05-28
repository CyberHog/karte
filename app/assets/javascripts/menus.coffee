$(document).on "ready turbolinks:load", ->
  Is_this_a_coupon = ->
    if $("#coupon").prop("checked")
      $("#count").show()
    else
      $("#count").hide()

  $("#coupon").bind("click", Is_this_a_coupon)
  Is_this_a_coupon()
