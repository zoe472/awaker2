$( document ).on('turbolinks:load', function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
 
      reader.onload = function (e) {
        $('#preview').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  //  idをみて変化したときに動く（画像のプレビュー機能）
  $("#picture").change(function(){
    // ここで上のfunctionを読み込む
    readURL(this);
  });
    });
