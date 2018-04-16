// 行追加
function addList(obj) {
  // tbody要素に指定したIDを取得し、変数「tbody」に代入
  var tbody = document.getElementById("receipt_table");
  // objの親の親のノードを取得し（つまりtr要素）、変数「tr」に代入
  var tr = obj.parentNode.parentNode;
  // selectがあるtr（行）を複製し、変数「list」に代入
  var list = tbody.childNodes[1].cloneNode(true);
  //　複製したノード「list」を直後の兄弟ノードの上に挿入
  // （「tr」の下に挿入）
  tbody.insertBefore(list, tr.nextSibling);
}

// 行削除
function removeList(obj) {

  // tbody要素に指定したIDを取得し、変数「tbody」に代入
  var tbody = document.getElementById("receipt_table");
  // objの親の親のノードを取得し（つまりtr要素）、変数「tr」に代入
  var tr = obj.parentNode.parentNode;
  // 「tbody」の子ノード「tr」を削除
  tbody.removeChild(tr);
}