$(document).on 'turbolinks:load', ->
  $('.datepicker').pickadate {
    monthsFull:  ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"],
    monthsShort: ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"],
    weekdaysFull: ["日曜日", "月曜日", "火曜日", "水曜日", "木曜日", "金曜日", "土曜日"],
    weekdaysShort:  ["日", "月", "火", "水", "木", "金", "土"],
    weekdaysLetter: ["日", "月", "火", "水", "木", "金", "土"],
    labelMonthNext: "翌月",
    labelMonthPrev: "前月",
    labelMonthSelect: "月を選択",
    labelYearSelect: "年を選択",
    today: "今日",
    clear: "クリア",
    close: "閉じる",
    # Creates a dropdown to control month and year
    selectMonths: true,
    selectYears: 100,
    # Using a string along with the parsing format (defaults to `format` option).

    showMonthAfterYear: true,
    # Close upon selecting a date,
    closeOnSelect: true,
    format: 'yyyy年m月d日'
  }
