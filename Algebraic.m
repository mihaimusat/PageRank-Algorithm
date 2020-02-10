% Musat Mihai-Robert 313CB

function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina. 

  infile = fopen(nume, 'r');
  p = fscanf(infile, '%i', 1);
  
  A = zeros(p);
  K = zeros(p);
  
  for i = 1:p
    nod = fscanf(infile, '%i', 1); % citesc nod
    nr = fscanf(infile, '%i', 1);  % citesc numarul de noduri cu care se invecineaza nodul citit
    V = fscanf(infile, '%i', nr);  % citesc nodurile vecine
    V = unique(V);                 % elimin duplicatele din vector
    ind = find(V == nod);          % retin indexul la care se afla link de la o pagina la ea insusi
    V(ind) = [];                   % si elimin aceasta pagina 
    K(nod, nod) = numel(V);        % pun gradul exterior pe diagonala
    A(nod, V) = 1;                 % obtin matricea de adiacenta  
  endfor

  M = (GramSchmidt(K) * A)';           
  fclose(infile); 

  I = eye(p);                     % matricea unitate
  I1 = ones(p, 1);                % I1 = vector coloana plin cu 1
  Rfact = GramSchmidt(I - d * M);
  R = Rfact * (1 - d) * I1 / p;
 
endfunction 