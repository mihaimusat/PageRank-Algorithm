% Musat Mihai-Robert 313CB

	Tema 1 MN - PageRank
	--------------------

	Pentru implementarea temei, am folosit pe langa functiile date in sablonul temei si doua functii ajutatoare : QR, cu ajutorul careia aplic algoritmul Gram-Schmidt modificat unei matrice si SST, prin care rezolv un sistem superior triunghiular, asa cum am facut la laborator si la curs.
	Aceste functii imi sunt cu adevarat necesare mai ales pentru inversarea unei matrice, algoritmul fiind descris pe larg in comentariile de la inceputul fisierului Gram-Schmidt.m.
	La implementarea algoritmului Iterative, dupa ce am citit cele p resurse web am grija sa construiesc A matricea de adiacenta astfel : mai intai pun toti vecinii intr-un vector, si elimin duplicatele daca exista, apoi retin indicele la care am gasit drum de la nodul citit la acelasi nod din lista de vecini si il eliberez, iar matricea de adiacenta se construieste acum daca am link de la nod la orice pagina din vector.De asemenea, matricea K descrisa in enunt o construiesc punand gradele de iesire pe diagonala folosind functia numel.In continuare, nu fac altceva decat sa respect pas cu pas relatiile matriciale din enunt si am grija sa actulizez PageRank-ul doar cand diferenta dintre cel obtinut la pasul curent si cel obtinut anterior sa fie mai mica decat un eps dat.

	R1(1:p, 1) = 1/p;  % initializare conform enuntului
	R2 = zeros(p, 1);  % PageRank anterior 
	
 	while (norm(R1-R2) >= eps)           
   		R2 = R1;                             
   		R1 = d * M * R1 + (1 - d) * V1 / p; %V1 = vector coloana plin cu 1 
  	endwhile
	
	R = R1; % acesta e de fapt PageRank-ul curent 

	La implementarea algoritmului Algebraic, singura diferenta fata de functia anterioara este faptul ca se schimba modul de calculare a PageRank-ului conform relatiilor din enunt deoarece timpul t sau altfel spus numarul de pasi pe care trebuie sa ii fac tinde la infinit : 

	Rfact = GramSchmidt(I - d * M); % PageRank anterior
	R = Rfact * (1 - d) * I1 / p; % PageRank curent

	La implementarea functiei Apartenenta, algoritmul este unul banal, fiind necesar doar sa calculez coeficientii a si b pentru ca functia data in enunt sa fie continua peste tot si sa scriu cum arata functia pe ramuri cu a si b obtinuti :
	
	a = 1 / (val2 - val1);
	b = -val1 * a;	
	
	La implementarea functiei PageRank, dupa ce citesc p numarul de pagini web plasez cursorul la inceputul fisierului folosind functia frewind pentru ca vreau sa obtin fisierul .out.Afisez p, apoi PageRank-ul pentru cerinta 1 si pentru cerinta 2.In continuare eu am nevoie sa citesc din fisier pana la newline sau sfarsit de fisier pentru a citi cele 2 valori val1 si val2, deci folosesc fgets.Transform PageRank-ul obtinut la cerinta 2 in vector coloana pentru a face o sortare descrescatoare a indicilor asa cum este precizat in enunt, pentru a obtine un clasament al celor mai importante pagini in functie de locul obtinut, numarul paginii si gradul de apartenenta al paginii la multimea paginilor importante. 



