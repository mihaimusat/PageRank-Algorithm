% Musat Mihai-Robert 313CB

function [R1 R2] = PageRank(nume, d, eps) 
  % Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out
  
  infile = fopen(nume, 'r'); 
  p = fscanf(infile, '%i', 1); 
  frewind(infile); % plasez cursorul la inceputul fisierului 

  outname = strcat(nume, '.out'); % creez fisierul .out
  outfile = fopen(outname, 'w'); 
  fprintf(outfile, '%i \n', p);
 
  R1 = Iterative(nume, d, eps); % prima cerinta 
  fprintf(outfile, '%7.6f \n', R1); 
  fprintf(outfile, '\n'); 

  R2 = Algebraic(nume, d); % a doua cerinta 
  fprintf(outfile, '%7.6f \n', R2); 
  fprintf(outfile, '\n'); 
 
  for k = 1:p+1        % citesc oricate linii primesc ca input
    fgets(infile);
  endfor

  val1 = fscanf(infile, '%f', 1);
  val2 = fscanf(infile, '%f', 1);  

  n = p;            % fie n numarul de pagini citite
  R2 = R2(:);       % vreau sa transform R2 in vector coloana pentru sortare
  ind = [1:n];

   % fac o sortare descrescatoare a indicilor 
   for i = 1:n-1
       for j = i+1:n
         if (R2(ind(i)) < R2(ind(j)))
          aux = ind(i); 
          ind(i) = ind(j);
          ind(j) = aux;
         endif
       endfor 
   endfor
   
   
  for i = 1:n 
    fprintf(outfile, '%-2i ', i);
    fprintf(outfile, '%-2i ', ind(i));
    prcrt = R2(ind(i)); % retin PageRank-ul curent
    rez = Apartenenta(prcrt, val1, val2); % aplic functia membru 
    fprintf(outfile, '%7.6f \n', rez); % afisez rezultatul intors de aceasta 
  endfor

  fclose(infile);
  fclose(outfile);

endfunction 