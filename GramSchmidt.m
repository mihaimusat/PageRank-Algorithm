% Musat Mihai-Robert 313CB

function B = GramSchmidt(A)
	% Functie care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% Aceasta functie are la baza urmatoarele idei : 
  % Mai intai descompunem A : A=Q*R folosind algoritmul Gram-Schmidt modificat 
  % Apoi ne folosim de faptul ca Q este ortogonala 
	% Deci inversa matricei A, matricea B este egala cu B=inv(R)*inv(Q) 
  % Observam acum ca fiecare coloana din B poate fi obtinuta astfel:
  % Inmultind matricea inv(R) care este tot superior triunghiulara
  % Cu coloana corespunzatoare din inv(Q)
  % Prin urmare, ajungem la concluzia ca avem de rezolvat un sistem superior triunghiular 
  % Pentru fiecare coloana a lui B 
  
  [Q R] = QR(A);                    
  Q = Q';          %Q este matrice ortogonala => inv(Q)=Q'
  [n m] = size(R); 
  B = zeros(n, n);  
  for i = 1:n 
    B(1:n, i) = SST(R, Q(1:n,i));
  endfor
endfunction 