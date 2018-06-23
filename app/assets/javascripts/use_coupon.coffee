$(document).on "ready turbolinks:load", ->
  coupon_usage = ->
    if $("#buy").prop("checked")
      $("#use_coupon").show()
    else
      $("#use_coupon").hide()

  $("#buy").bind("click", coupon_usage)
  coupon_usage()
