function playSomeSound(genre) {
  SC.get('/tracks', {
    genres: genre
  }, function(tracks){
    var random = Math.floor(Math.random() * 49);
    SC.oEmbed(tracks[random].uri, { auto_play: true }, document.getElementById('target'));
  });
}

window.onload = function() {
  SC.initialize({
    client_id: 'ffb7dc6e9ae3f482155566e06f917c29'
  });

  var menuLinks = document.getElementsByClassName('genre');
  for (var i = 0; i < menuLinks.length; i++){
    var menuLink = menuLinks[i];
    menuLink.onclick = function(e) {
      e.preventDefault();
      playSomeSound(menuLink.innerHtml);
    };
  }
};