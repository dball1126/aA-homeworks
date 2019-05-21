function madLib(verb, adj, noun) {
    return 'We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.'
}

function isSubstring(phrase, subphrase) {
    return phrase.includes(subphrase);
}

function fizzBuzz(array) {
    const arr = [];
    array.forEach(ele => {
    if ((ele % 3 === 0) ^ (el % 5 === 0)) {
        arr.push(ele);
    }
});
return arr;
}

function isPrime (n) {
    if (n < 2) { return false; }

    for (let i = 2; i < n; i++) {
        if (n % i === 0) {
            return false 
        }
    }
    return true 
}

function sumOfNPrimes (n) {
    let sum = 0;
    let countPrimes = 0;
    let i = 2;
    
    while (countPrimes < n) {
        if (isPrime(i)) {
            sum += i;
            countPrimes++;
        }
        i++;
    }
    return sum;
}