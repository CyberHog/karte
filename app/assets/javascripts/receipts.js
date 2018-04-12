$(function () {
                var payment;

                $('select').on('change', function () {
                    var i = $(this).val();
                    $('#receipt_payment').val(payment[i]);
                });
            });
