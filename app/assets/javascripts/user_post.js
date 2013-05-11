$('input[name=text]').click(function () {
      $('#textpost').slideToggle($(this).is(':checked'));
  });
$('input[name=link]').click(function () {
  $('#linkpost').slideToggle($(this).is(':checked'));
});
$('input[name=image]').click(function () {
  $('#imagepost').slideToggle($(this).is(':checked'));
});