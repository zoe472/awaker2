$(document).on('turbolinks:load', function(){
  $(function(){
    function buildHTML(count) {
      var html = `<div class="preview-box" id="preview-box__${count}">
                    <div class="upper-box">
                      <img src="" alt="preview">
                    </div>
                    <div class="lower-box">
                      <div class="delete-box" id="delete_btn_${count}">
                        <span>削除</span>
                      </div>
                    </div>
                  </div>`
      return html;
    }

    function setLabel() {
      //プレビューボックスのwidthを取得し、maxから引くことでラベルのwidthを決定
      var prevContent = $('.item__contents__photoflame__container').prev();
      labelWidth = (620 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
      console.log(labelWidth)
      $('.item__contents__photoflame__container').css('width', labelWidth);
    }

    $(document).on('change', '.hidden-field', function() {
      setLabel();
      //hidden-fieldのidの数値のみ取得
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      //labelボックスのidとforを更新
      $('item__contents__photoflame__container__label-box').attr({id: `label-box--${id}`,for: `tweet_toukouimages_attributes_${id}_image`});
      //選択したfileのオブジェクトを取得
      var file = this.files[0];
      var reader = new FileReader();
      //readAsDataURLで指定したFileオブジェクトを読み込む
      reader.readAsDataURL(file);
      //読み込み時に発火するイベント
      reader.onload = function() {
        var image = this.result;
        //プレビューが元々なかった場合はhtmlを追加
        if ($(`#preview-box__${id}`).length == 0) {
          var count = $('.preview-box').length;
          var html = buildHTML(id);
          //ラベルの直前のプレビュー群にプレビューを追加
          var prevContent = $('.item__contents__photoflame__container').prev();
          $(prevContent).append(html);
        }
        //イメージを追加
        $(`#preview-box__${id} img`).attr('src', `${image}`);
        var count = $('.preview-box').length;
        //プレビューが5個あったらラベルを隠す 
        if (count == 5) { 
          $('.item__contents__photoflame__container').hide();
        }

        //ラベルのwidth操作
        setLabel();
        //ラベルのidとforの値を変更
        if(count < 5){
          //プレビューの数でラベルのオプションを更新する
          $('.item__contents__photoflame__container__label-box').attr({id: `label-box--${count}`,for: `tweet_toukouimages_attributes_${count}_image`});
        }
      }
    });

     // 画像の削除
     $(document).on('click', '.delete-box', function() {
      var count = $('.preview-box').length;
      setLabel(count);
      //item_images_attributes_${id}_image から${id}に入った数字のみを抽出
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      //取得したidに該当するプレビューを削除
      $(`#preview-box__${id}`).remove();
      //フォームの中身を削除 
      $(`#tweet_toukouimages_attributes_${id}_image`).val("");

      //削除時のラベル操作
      var count = $('.preview-box').length;
      //5個めが消されたらラベルを表示
      if (count == 4) {
        $('.item__contents__photoflame__container').show();
      }
      if (count == 0){
        $('.item__contents__photoflame__container__label-box').attr({id: `label-box--0`,for: `tweet_toukouimages_attributes_0_image`});
      }
      setLabel(count);

      if(id < 5){
        //削除された際に、空っぽになったfile_fieldをもう一度入力可能にする
        $('.item__contents__photoflame__container__label-box').attr({id: `label-box--${id}`,for: `tweet_toukouimages_attributes_${id}_image`});
      }
    });
  });
})

$(function() {
  $('.first').on('click', function () {
    $('.first').removeClass('first');
    $('.item__contents__photoflame__container__label-box').removeClass('hidden-field');

  });
});