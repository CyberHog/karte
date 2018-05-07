$ ->

  #******************************

  # 確認ダイアログ data-confirm のカスタマイズ

  #******************************


  $(document.body).on 'confirm', (event) ->
    elem = event.target
    message = $(elem).data('confirm')

    UIkit.modal.confirm(
      message
      ->
        $(elem).data('confirm', null)
        $(elem).trigger('click.rails')
      center: true
      labels: { 'Ok': 'はい', 'Cancel': 'キャンセル'}
    )
    false
