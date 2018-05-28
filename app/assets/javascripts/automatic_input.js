// 価格とポイントの自動入力
$(function () {
    $('select').on('change', function () {
        var i = $("#receipt_service").prop("selectedIndex");
        // 初期値に「選択して下さい」が入っているため -1
        $('#receipt_payment').val(payment[i - 1]);
        $('#receipt_point').val(point[i - 1]);
        $('#coupon_remaining').val(count[i - 1]);
        $('#coupon_name').val(name[i - 1]);
        $('#validity').val(validity[i - 1]);
        $('#coupon_life').val(expiration_date);
    });
});
