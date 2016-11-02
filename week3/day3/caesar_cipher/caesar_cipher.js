function caesarCipher (message, shift = -3) {
  shift = shift > 26 ? shift % 26 : shift;

  function translateChar(char) {
    var upper = char == char.toUpperCase();
    var pos = char.toLowerCase().charCodeAt(0) + shift;

    if (char == char.toLowerCase()) {
      if (pos > 122) {
        pos -= 26;
      } else if (pos < 97) {
        pos += 26;
      }
    }
    var theChar = String.fromCharCode(pos);

    return upper ? theChar.toUpperCase() : theChar;
  } // translateChar

  function buildCypher(char) {
    return char.match(/[a-z]/i) ? translateChar(char) : char
  } // buildCypher

  return message.split("").map(buildCypher).join("");
} // caesarCipher


encrypted = caesarCipher("Et tu, brute?", 6);
console.log(encrypted);
//=> "Kz za, hxazk?"

encrypted = caesarCipher("Et tu, brute?", 1241234);
console.log(encrypted);

decrypted = caesarCipher("Kz za, hxazk?", -6);
console.log(decrypted);
