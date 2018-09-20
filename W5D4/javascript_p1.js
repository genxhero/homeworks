
 function mysteryScoping1() {
 var x = 'out of block';
 if (true) {
 var x = 'in block';
 console.log(x);
 }
 console.log(x);
 }

function mysteryScoping2() {
   const x = 'out of block';
   if (true) {
     const x = 'in block';
     console.log(x);
   }
   console.log(x);
 }

 function mysteryScoping3() {
   const x = 'out of block';
   if (true) {
     var x = 'in block';
     console.log(x);
   }
   console.log(x);
 }

 function mysteryScoping4() {
   let x = 'out of block';
   if (true) {
     let x = 'in block';
     console.log(x);
   }
   console.log(x);
 }

 function mysteryScoping5() {
   let x = 'out of block';
   if (true) {
     let x = 'in block';
     console.log(x);
   }
   let x = 'out of block again';
   console.log(x);
 }

 function madLib(v, a, n) {
 var literal = "We will " + v + " the " + a + " " + n;
 console.log(literal);
 }

 function isSubstring(searchString, subString) {
 var found = searchString.includes(subString);
 console.log(found);
 }

 function fizzBuzz(array) {
    let newArray = [];

    for (let i=0; i<items.length; i++) {
		    if ((array[i] % 3) === 0 && (array[i] % 5) === 0) {
       		continue;
   		    }

  			if ((array[i] % 3) === 0 || (array[i] % 5) === 0) {
 			      newArray.push(array[i]);
           }
 		 }
	 return newArray;
 }
