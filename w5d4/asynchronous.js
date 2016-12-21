window.setTimeout(function() {
  alert('HAMMERTIME');
}, 5000);



function hammerTime(time) {
  window.setTimeout(function() {
    alert(`${time} is hammertime!`);
  });
}

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


function teaAndBiscuits() {
  let first, second;

  reader.question('Some tea?', function(res1) {
    first = res1;
    console.log(`You said ${res1}`);
    reader.question('Some biscuits?', function(res2) {
      second = res2;
      console.log(`You said ${res2}`);
      const firstRes = (first === 'yes') ? 'do' : 'don\'t';
      const secondRes = (second === 'yes') ? 'do' : 'don\'t';
      console.log(`So you ${firstRes} want tea and you ${secondRes} want biscuits.`);
      reader.close();
    });
  });


}

teaAndBiscuits();
