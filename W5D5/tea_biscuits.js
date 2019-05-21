


const readline = require('readline');

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function teaAndBiscuits() {

reader.question("Would you like tea?", function(response) {

    console.log("You replied ${response}.");

reader.question("Would you like some biscuits?", function(response2) {

    console.log("You replied ${respponse}.");

    const first = (response === 'yes') ? 'do' : 'don\'t';

    const second = (respnse2 === 'yes') ? 'do' : 'don\'t';

    console.log("So you ${response} want tea and you ${response} want biscuits");

    reader.close(); }); }); }



