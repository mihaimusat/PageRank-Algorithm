% Musat Mihai-Robert 313CB

function R = Iterative(nume, d, eps)
	% Functie care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eroarea care apare in algoritm.
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
  R1(1:p, 1) = 1/p;         % initializez R(t0) conform enuntului
  R2 = zeros(p, 1);         % R anterior lui R(t0) este un vector coloana plin cu zerouri
  V1 = ones(p, 1);          % V1 = vector coloana plina cu 1 
  
  while (norm(R1-R2) >= eps)            % conditia de oprire 
   R2 = R1;                             % actualizez R anterior
   R1 = d * M * R1 + (1 - d) * V1 / p;  % aplic formula matriciala din enunt   
  endwhile
 
  R = R1;

  fclose(infile);
 
endfunction