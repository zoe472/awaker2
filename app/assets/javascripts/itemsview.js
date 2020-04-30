$(function() {
  // 「imageList」内の「img」をマウスオーバーした場合
  $('#imageList img').hover(function(){
    // マウスオーバーしている画像をメインの画像に反映
    $('#mainImage img').attr('src', $(this).attr('src'));
    $((this).classList.contains("action"));
    $((this).classList.toggle("action"));
  });
});