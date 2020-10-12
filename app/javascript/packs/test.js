console.log('COami');
document.addEventListener('DOMContentLoaded', () => {
  var allowedKeys = {
    38: 'up',
  };

  // the 'official' Konami Code sequence
  var konamiCode = ['up', 'up'];

  // a variable to remember the 'position' the user has reached so far.
  var konamiCodePosition = 0;

  // add keydown event listener
  document.addEventListener('keydown', function (e) {
    // get the value of the key code from the key map
    var key = allowedKeys[e.keyCode];
    // get the value of the required key from the konami code
    var requiredKey = konamiCode[konamiCodePosition];

    // compare the key with the required key
    if (key == requiredKey) {
      // move to the next key in the konami code sequence
      konamiCodePosition++;

      // if the last key is reached, activate cheats
      if (konamiCodePosition == konamiCode.length) {
        activateCheats();
        konamiCodePosition = 0;
      }
    } else {
      konamiCodePosition = 0;
    }
  });

  function activateCheats() {
    document.body.style.backgroundImage =
      "url('https://wallpaperaccess.com/full/1553875.png')";

    // var audio = new Audio('audio/pling.mp3');
    // audio.play();

    alert('cheats activated');
    // let outer_div = documen
    // console.log(outer_div);
  }
});
