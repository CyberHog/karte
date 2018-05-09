$(document).on "ready turbolinks:load", ->
  change_expired_at = ->
    if $("#notice_no_expiration").prop("checked")
      $("#notice_expired_at").hide()
    else
      $("#notice_expired_at").show()

  $("#notice_no_expiration").bind("click", change_expired_at)
  change_expired_at()
