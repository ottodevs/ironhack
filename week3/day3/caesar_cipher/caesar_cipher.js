function caesarCipher (message, shift = -3) {
  var a = 26; // from alphabet letters
  var d = 97; // ascii displacemente
  shift = Math.abs(shift) > a ? shift % a : shift;

  function translateChar(char) {
    var upper = char == char.toUpperCase();
    var pos = char.toLowerCase().charCodeAt(0) + shift - d;

      // if (pos 2) {
      //   pos -= 26;
      // } else if (pos < 97) {
      //   pos += 26;
      // }
      // The above if-else shit elegantly becomes this:

    var theChar = String.fromCharCode((pos + a) % a + d);

    return upper ? theChar.toUpperCase() : theChar;
  } // translateChar

  function buildCypher(char) {
    return char.match(/[a-z]/i) ? translateChar(char) : char
  } // buildCypher

  return message.split("").map(buildCypher).join("");
} // caesarCipher



// Some tests:
encrypted = caesarCipher("Et tu, brute?", 6);
console.log(encrypted);
//=> "Kz za, hxazk?"

encrypted = caesarCipher("Et tu, brute?", 1241234);
console.log(encrypted);

decrypted = caesarCipher("Kz za, hxazk?", -6);
console.log(decrypted);

theSentence = "Roses are red and violets are blue, I want to be an Ironhacker, what about you?"
theShift = -34533240958324256259683240598324545;

encrypted = caesarCipher(theSentence, theShift);
decrypted = caesarCipher(encrypted, -theShift);
console.log("Here you go!\n" + encrypted + "\n" + decrypted);
