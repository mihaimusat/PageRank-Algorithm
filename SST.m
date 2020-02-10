% Musat Mihai-Robert 313CB

function x = SST(A, b)
  % Functie care rezolva sistem superior triunghiular
  % Intrari: 
  % A = matrice sistem
  % b = vector termeni liberi
  % Iesiri: 
  % x = vector necunoscute
  
  [n n] = size(A);
  x = zeros(n, 1);
  x(n) = b(n) / A(n, n);
  for i = n-1:-1:1
    x(i) = (b(i) - A(i, i+1:n) * x(i+1:n)) / A(i, i);
  endfor
endfunction