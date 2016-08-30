var fileArray = new Array();
var readerArray = new Array();
var imagesArray = new Array();

$(function(){
  $fileInput = $('#fileInput');
  $imgBox = $('#js-imagesBox');

  if(window.File) {
    $fileInput.change(function(){
      fileArray[0] = fileInput.files[0];
      readerArray[0] = new FileReader();
      readerArray[0].onload = function(e){
        html = '<img src="'+e.target.result+'" class="avatar-size" />';
        $imgBox.html(html);
      };
      readerArray[0].readAsDataURL(fileArray[0]);
    });
  };
});
