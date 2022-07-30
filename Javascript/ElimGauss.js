// Javascript has no complex data type...
class Complex {
    constructor(a,b) {
        this.a = a;
        this.b = b;
    }
}

// Simple transpose function hack
function transpose(x) {
    for (let i = 0; i < x.length; i++) {
        x[i] = [x[i]];
    }
    return x;
}

function  elimGauss(A,b) {
    x = [];
    // Constant declarations
    const n = A.length	// Matrix dimension
    // Forward elimination process
    for (let k = 0; k < n-1; k++) {
        for (let i = k+1; i < n; i++) {
            F = A[i][k]/A[k][k];
            console.log(A[k][k]);
            for (let j = 0; j < n; j++) {
                A[i][j] = A[i][j] - F*A[k][j];
            }
            b[i][0] = b[i][0] - F*b[k][0];
        }
    }
    // Reverse substitution process
    x = new Array(n); // Array with n elements
    for (let i = n-1; i > -1; i--) {
        let suma = 0;
        for (let j = i+1; j < n; j++) {
            suma = suma + A[i][j]*x[j];
        }
        x[i] = (b[i][0] - suma)/A[i][i];
    }
    // Transpose result 
    //x = x';
    x = transpose(x);
    return x;
}

let A = [[1,-1],[2,0]];
let b = [[5],[2]];
console.log(elimGauss(A,b));

let a1 = new Complex(1,-4);
A = [[a1,-1],[2,0]];
b = [[5],[2]];
console.log(elimGauss(A,b));

