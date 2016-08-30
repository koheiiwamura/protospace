$(function(){
  var setFileInput = $('.js-imgInput');
  setFileInput.each(function(){

    var selfFile = $(this),
    selfInput = $(this).find('input[type=file]');
    selfInput.change(function(){

      var file = $(this).prop('files')[0],
      fileRdr = new FileReader();

      if(!this.files.length){
        return;
      }
      else {
        if(file.type.match('image.*')){
          var preEditImage = selfFile.find('.preEditImage');

          fileRdr.onload = function() {
            selfFile.css({'background-image':'url('+fileRdr.result+')', 'background-size':'cover'});
            preEditImage.css({'display':'none'})
          }
          fileRdr.readAsDataURL(file);
        }
      }
    });
  });
});