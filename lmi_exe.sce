// Find diagonal matrix X (i.e. X = diag(diag(X), p=1) such that
//A1'*X+X*A1+Q1 < 0, A2'*X+X*A2+Q2 < 0 (q=2) and trace(X) is maximized

// Constants
rand("seed", 0);
n  = 2;
A1 = rand(n, n);
A2 = rand(n, n);
//Xs = diag(1:n);
//Q1 = -(A1'*Xs+Xs*A1+0.1*eye());
//Q2 = -(A2'*Xs+Xs*A2+0.2*eye());

lmitool("prob", "X", "A1, A2"); // Create prob.sci
deletefile "prob.sci";
copyfile("SCI/modules/optimization/demos/prob_bak.sci", "prob.sci"); // Replace prob.sci by prob_bak.sci
exec("prob.sci", -1);

X = prob(A1, A2) // Run optimization, X = [1.0635042 0; 0 2.0784841]

[Y, Z, c] = prob_eval(X); // Check evaluaton function value at the point found
// Y = 0
// Z = list([0.0731600 0.7080179; 0.7080179 0.7186999], [0.1154910 0.5345239; 0.5345239 1.4843684])
// c = -1.0635042

deletefile "prob.sci"; // Delete created file
