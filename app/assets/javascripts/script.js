$(document).ready(function(){
  $('#content').masonry({
    isAnimated: true,
    columWidth: 340,
    itemSelector: '.item',
    isFitWidth: true
  }).imagesLoaded(function(){
    $(this).masonry('reload');
  });
});