// 価格とポイントの自動入力
document.addEventListener('turbolinks:load', function () {
    $(".title").click(function(){
    if(is_smartphone()){
      window.href=$(this).attr("data-href");
    }
    });
});

function is_smartphone(){
  return ($(window).width()<480);//スマートフォンならtrue、そうでないならfalseを返す関数
}
