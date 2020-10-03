create database pro;
use pro;

# cream tabela gen
create table gen(
	id int not null auto_increment primary key,
    nume_gen varchar (30) not null);

# cream tabela romane 
create table romane(
	id int primary key not null auto_increment,
    nume varchar(50),
    valoare float(6,2),
    autor varchar(50),
    data_aparitie date,
    awards varchar(50),
    disponibilitate enum('Da', 'Nu'),
    editura varchar(50),
	id_gen int,
    foreign key carti_fk (id_gen)
    references gen(id)
    );
    
    select * from carti;
    
	# cream tabela klient 
    create table klient(
		id int primary key auto_increment,
        nume varchar(50),
        prenume varchar(50),
        email varchar(50),
        telefon int,
        client_premium enum ('Da', 'Nu'),
        adresa varchar(100)
        );
        
	create table comanda(
		id int primary key auto_increment not null,
        data_comanda date,
        valoare int,
        id_client int,
        foreign key klient_fk(id_client)
        references klient(id)
        );
        
	create table factura(
		id_carte int,
        id_comanda int
        );
        
	# adaugam PK in tabela factura
		alter table factura add primary key (id_carte, id_comanda);
	# modificam numele tabelei 'romane' in 'carti'
		alter table romane rename carti;
	# adaugam FK in factura -> carti
		alter table factura add foreign key fk_carte (id_carte)
		references carti(id);
	# adaugam FK in factura -> comanda
		alter table factura add foreign key fk_comanda (id_comanda)
        references comanda(id);
	# adugam coloana 'rating' in tabela carti
		alter table carti add rating decimal (4,2);
	# adaugam coloana 'domiciliu' in tabela klient
		alter table klient add domiciliu varchar (50);
	# modificam tipul campului 'valoare', din tabela comanda, din int in float(10,2)
		alter table comanda change valoare valoare float (10,2);
	# modificam tipul campului 'awards', din tabela carti, din varchar in enum
		alter table carti change awards awards enum ('Da', 'Nu');
	# modificam tipul coloanei 'telefon', din tabela klient, din int in char
		alter table klient change telefon telefon char (10);
	# stergem campul 'adresa' din tabela klient
		alter table klient drop adresa;
	# modificam numele coloanei 'valoare' din tabela carti in pret
		alter table carti change valoare pret float (6,2);
    # adugam coloana 'nr_pagini' in tabela carti
		alter table carti add nr_pagini int;
	# modificam tipul coloanei 'data_aparitie', din tabela carti, din date in char si in acelasi timp ii schimbam si numele din data_aparitie
    # in an_aparitie
		alter table carti change data_aparitie data_aparitie char(4);
    
	select * from carti;
    select * from comanda;
    select * from factura;
    select * from gen;
    select * from klient;
    
show create table carti;

# populam tabela gen
insert into gen
	values(1,'Roman'),
		(2,'Drama'),
        (3,'Comedie'),
        (4,'Basm'),
        (5,'Dezvoltare personala'),
        (6,'Nuvela'),
        (7,'Istorie'),
        (8,'Religie'),
        (9,'Politist'),
        (10,'Enciclopedie'),
        (11,'Povestire in rama'),
        (12,'Altele');

# populam tabela carti

insert into carti
	values(1,'Baltagul', 22, 'Mihail Sadoveanu', 2016, 'Da', 'Da', 'Mihail Sadoveanu', 1, 4.5, 210),
		(2, 'Hanu Ancutei', 19.5, 'Mihail Sadoveanu', 2018, 'Da', 'Da', 'Mihail Sadoveanu', 11, 4.2, 152),
        (3, 'Maitreyi',16.15, 'Mircea Eliade', 2009, 'Da', 'Nu', 'Tana',1, 4.8, 175),
        (4, 'Enigma Otiliei', 14.88, 'George Calinescu', 2015, 'Da', 'Da', 'Andreas', 1, 4.9,480),
        (5, 'Nunta in cer', 16.15, 'Mircea Eliade', 2013, 'Nu', 'Nu', 'Tana', 1,4.8,160),
        (6, 'Ion', 13, 'Liviu Rebreanu', 2016,'Nu','Nu', 'Eduard', 1,3.8,448),
        (7, 'Toate panzele sus', 43.4,'Radu Tudoran',2018,'Nu','Nu','ART',1,4.1,624),
        (8, 'De ce iubim femeile', 27.55, 'Mircea Cartarescu', 2018,'Nu', 'Da', 'Humanitas', 12,4.3,192),
        (9, 'Arta fericirii', 37.05, 'Dalai Lama', 2015,'Da', 'Nu', 'Humanitas',5,4.4,344),
        (10, 'Cel mai bogat om din Babilon', 19.39, 'George S. Clason', 2004, 'Da', 'Da', 'Amaltea', 5,4.9,120),
        (11, 'Abilitati de comunicare', 29, 'Allan Pease', 2009, 'Da', 'Da', 'Curtea Veche', 5,5,97),
        (12, 'Limbajul trupului in mediul de afaceri', 25, 'Allan Pease', 2016,'Nu', 'Nu', 'Curtea Veche', 5,4.8,126),
        (13, 'Povestea lui Harap-Alb', 12.9, 'Ion Creanga', 2012,'Nu','Nu', 'ART', 4,3.9,168),
        (14, 'O scrisoare pierduta', 15, 'I.L. Caragiale', 2011, 'Da','Da', 'Tana', 3,4.3,255),
        (15, 'Moara cu noroc', 10.6, 'Ioan Slavici', 2013, 'Nu','Da', 'Poseidon', 6,3.9,256),
        (16, 'Caligula', 29, 'Anthony A. Barrett', 2010, 'Nu','Nu', 'Curtea Veche', 7,4.3,326),
        (17, 'Despre suflet si inviere', 24, 'Sf. Grigore de Nyssa', 2011, 'Nu', 'Da', 'Tana', 8,3.5,388),
        (18, 'Zece negri mititei', 39.9, 'Agatha Christie', 2018, 'Da', 'Da', 'ART', 9,4.9,304),
        (19, 'Tabloul', 29.9,'Agatha Christie', 2016, 'Nu', 'Da', 'ART', 9,4.2,368),
        (20, 'Capara cu trei iezi', 12.9, 'Ion Creanga', 2015, 'Nu', 'Nu', 'Poseidon', 4, 3.7,64),
        (21, 'Lumea in date si fapte', 66.5, 'Russell Ash', 2017, 'Da', 'Da', 'Prut',10, 3.4,320);

select * from carti;



# populam tabela klient
insert into klient
	values (1, 'Pretorian', 'Liviu', 'preto_97@yahoo.com', '0741125582', 'Da', 'Bucuresti'),
			(2, 'Barbu', 'Sorin', 'barbu19@gmail.com', '0743213540', 'Da', 'Bucuresti'),
            (3, 'Neagu', 'Cristinel', 'cristineagu@gmail.com', '0742123654', 'Da', 'Slatina'),
            (4, 'Dumitrescu', 'Aurel', 'auridum13@yahoo.com', '0732169636', 'Nu', 'Slatina'),
            (5, 'Caplea', 'Alina', 'caplea_98@gmail.com', '0738568982','Da','Slatina'),
            (6, 'Stoian', 'Diana', 'stoian@yahoo.com', '0726745214', 'Nu', 'Caracal'),
            (7, 'Mocioaca','Madalina', 'mada@yahoo.com', '0789745230', 'Nu', 'Caracal'),
            (8, 'Curea', 'Elena', 'elenacurea@gmail.com', '0782324125', 'Da', 'Galati'),
            (9, 'Badescu', 'Bianca', 'bibi@gmail.com', '0743698457', 'Da', 'Galati'),
            (10, 'Cange', 'Marius', 'mariusica@yahoo,com','0732148745', 'Nu', 'Galati'),
            (11, 'Nita', 'Alexandru', 'nitaalex@yahoo.com', '0741265874','Nu', 'Bucuresti'),
            (12, 'Badescu', 'Madalin' ,'madalinbadescu@gmail.com', '0744564123','Nu', 'Bucuresti'),
            (13, 'Oprescu', 'Diana', 'dina@gmail.com', '0789321457','Da','Bucuresti'),
            (14,'Popescu', 'Georgiana', 'georgpop@yahoo.com','0784623154','Nu', 'Bucuresti'),
            (15, 'Bacioiu', 'Theodor', 'theo@gmail.com', '0754321456','Nu', 'Bucuresti'),
            (16, 'David', 'Daniel', 'dani99@yahoo.com', '0754136987','Da', 'Bucuresti'),
            (17, 'Amariei', 'Nicolae', 'amarieinicu@yahoo.com', '0765432658','Da','Valcea'),
            (18, 'Kelcioi', 'Nicusor', 'kelcio94@yahoo.com', '0721654782', 'Nu','Tulcea'),
            (19, 'Apostol', 'Liviu', 'liviu@gmail.com','0214369741','Da','Constanta');
            
select * from klient;


set sql_safe_updates = 0;

#populam tabela comanda
insert into comanda
	values (1, '2017-03-02',22,10),
			(2, '2016-04-05',16.15,3),
            (3,'2015-11-30',26,5),
            (4,'2017-12-25',54,2),
            (5,'2018-06-06',12.9,3),
            (6,'2019-05-10',43.4,10),
            (7,'2019-01-07',39,2),
            (8,'2019-02-15',66.5,7),
            (9,'2018-12-25',29.9,1),
            (10,'2018-04-02',29,6),
            (11,'2017-03-21',27.55,1),
            (12,'2017-02-16',37,10),
            (13,'2015-08-20',15,4),
            (14,'2016-09-17',12.9,5);
            

# update-uri
update carti set awards = 'Da' where nume = 'Ion';
update carti set disponibilitate = 'Da' where id = 5;
update comanda set data_comanda = '2016-03-21' where id = 11;

#populam tabela factura
insert into factura
	values(1, 1),
		   (3, 2),
           (13,5),
           (7,6),
           (21,8),
           (19,9),
           (16,10),
           (8,11),
           (14,13),
		   (20,14);
           
select * from comanda;
select * from carti;
select * from factura;
select * from gen;
select * from klient;

# delete-uri

delete from carti where nume = 'Hanu Ancutei';
delete from carti where id = 4;
delete from klient where id = 12;


# subinterogari

# afisati cartile care au acelasi autor ca si cartea 'Maitreyi'
select * from carti where autor = (select autor from carti where nume = 'Maitreyi');
# afisati cartile care au acelasi gen ca si cartea 'Arta fericirii'
select * from carti where id_gen = (select id_gen from carti where nume = 'Arta fericirii');
# afisati clientii care sunt din acelasi oras cu Pretorian Liviu
select * from klient where domiciliu = (select domiciliu from klient where nume = 'Pretorian' and prenume= 'Liviu'); 

# join-uri

# afisati cartea, autorul si genul pentru cartile care au ratingul mai mare de 4.5.
select c.nume, c.autor, g.nume_gen 
	from carti as c
	join gen g on c.id_gen = g.id
    where rating > 4.5;

# afisati numele, prenumele si data comenzii persoanlor care au comandat in anul 2019.
select k.nume, k.prenume, c.data_comanda
	from klient k
    join comanda c on k.id = c.id_client
    where year(data_comanda) = 2019;
    
# afisati numele, prenumele si valoarea comenzii pentru clientii din Galati;
select k.nume, k.prenume, c.valoare
	from klient k
    left join comanda c on k.id = c.id_client
    where domiciliu = 'Galati';

# having

# afisati numele, ratingul maxim si id-ul genului cartii, in functie de gen, avand ratingul mai mare sau egal cu 4.8.
select nume, max(rating), id_gen 
	from carti 
    group by id_gen 
    having max(rating) >= 4.8;
    
# selectati pretul cel mai ieftin al cartii in functie de disponibilitate.
 select min(pret), disponibilitate
	from carti
    group by disponibilitate
    having min(pret) > 0;
    
# afisati orasele de provienineta ale clientilor daca in acestea se regaseste doar un reprezentant;
select domiciliu
	from klient
    group by domiciliu
    having count(domiciliu) = 1;
    
    
# functii predefinite MySQL

# afisati suma preturilor tuturor cartilor care se regasesc in tabela carti in functie de disponibilitate
select sum(pret), disponibilitate 
	from carti 
    group by disponibilitate;

# afisati comenzile care s-au facut inainte de 2019
select * 
	from comanda 
	where year(data_comanda) < 2019;

# afisati numele, prenumele si adresa de email  ale clientilor care au email-urile pe yahoo
select nume, prenume, email 
	from klient 
	where email like '%yahoo%';


# view-uri

# creati un view in care sa afisati cartile premiate si genul lor.
create view v$cartipremiate as
select c.nume, c.awards, g.nume_gen
	from carti c
    join gen g
    on c.id_gen = g.id
    having awards = 'da';
select * from v$cartipremiate;

# creati un view in care sa afisati numele, prenumele si valoarea comenzii clientilor care au facut comenzi de minim 35 lei.
create view v$comandaminima as
select k.nume, k.prenume, c.valoare 
	from klient k
    join comanda c
    on k.id = c.id_client
    having c.valoare >=35;
select * from v$comandaminima;



# proceduri 

# creati o procedura care sa afiseze numele, prenumele si data comenzii clientilor care au comenzi dupa un anumit an dat. 
delimiter //
create procedure an_comenzi(in p_an int)
begin
	select k.nume, k.prenume, c.data_comanda 
		from comanda c
        join klient k 
        on c.id_client = k.id 
        where year(c.data_comanda) >= p_an;
end;
//
delimiter ;
call an_comenzi(2019);



# creati o procedura care sa afiseze numele, prenumele si valoarea comeznii clientilor care au valoarea comenzii mai mare decat 
# valoarea data.
delimiter //
create procedure valoare_comanda(in p_val decimal(5.2))
begin
	select k.nume, k.prenume, c.valoare 
		from comanda c
        join klient k 
        on c.id_client = k.id 
        where c.valoare > p_val;
end;
//
delimiter ;
call valoare_comanda(30.00);



# creati o procedura care sa afiseze numele, numarul paginilor si genul cartii intr-un mesaj, operelor care provin de la o editura data. 
delimiter //
create procedure edituraa (in p_editura varchar(255))
begin
	select c.nume, c.nr_pagini, g.nume_gen
		from carti c
        left join gen g
        on c.id_gen = g.id
        where c.editura = p_editura;
end; 
//
delimiter ;
call edituraa ('Tana');



# functii 


# sa se scrie o functie care primeste ca parametru id-ul unei carti si returneaza genul si autorul acesteia intr-un mesaj corespunzator.
delimiter //
create function gen_carte (p_id int)
returns varchar (255)
begin
	declare v_autor varchar(50);
    declare v_nume_gen varchar(50);
	select c.autor, g.nume_gen
    into v_autor, v_nume_gen
		from carti c
        left join gen g
        on c.id_gen = g.id
        where c.id = p_id;
	return concat_ws(' ', 'Autorul cartii este',v_autor,'iar genul acesteia este', v_nume_gen);
end;
//
delimiter ;
select gen_carte (3);

select* from comanda;

# sa se scrie o functie care primeste id-ul unei carti ca parametru si care returneaza intr-un mesaj numele, pretul si
# numarul de pagini ale acesteia
delimiter //
create function informatii (p_id int)
returns varchar(255)
begin
	declare v_nume varchar(50); 
    declare v_pret decimal (4.2);
    declare v_nr_pagini int;
	select nume, pret, nr_pagini 
    into v_nume, v_pret, v_nr_pagini
    from carti where id = p_id;
    return concat_ws(' ','Cartea', v_nume,'are pretul de', v_pret,'lei iar numarul de pagini este de', v_nr_pagini);
end;
//
delimiter ; 
select informatii (1);


# sa se scrie o functie care primeste ca parametru un id din tabela klient si care sa returneze un mesaj in care sa ne spuna
# daca respectivul client are cont premium sau nu
delimiter //
create function client_premium (p_id int)
returns varchar (255)
begin
	declare mesaj varchar(255);
	declare v_client_premium enum ('Da', 'Nu');
	select client_premium 
    into v_client_premium
    from klient k
    where k.id = p_id;
    if v_client_premium = 'Da' then set mesaj ='Clientul are cont premium';
		else set mesaj = 'Clientul nu are cont premium';
	end if;
    return mesaj;
end;
//
delimiter ;
select client_premium (1);
select client_premium (4);


# cursori

# sa se scrie o procedura care primeste ca parametru un gen si care returneaza toate cartile genului respectiv.
# sa se foloseasca un cursor

delimiter //
create procedure nume_carte(IN p_gen varchar(50))
begin
	declare v_nume varchar(50);
    declare v_nume_gen varchar(50);
    declare semafor varchar(50) default 'verde';
  
    declare c1 cursor for select c.nume, g.nume_gen
								from carti c
                                right join gen g
                                on c.id_gen = g.id
                                where p_gen = g.nume_gen;
                                
    declare continue handler for not found
    begin
		set semafor = 'rosu';
    end;
    open c1;
   
    bucla: loop
        fetch c1
			into v_nume, v_nume_gen;
        if (semafor = 'rosu') then
			leave bucla;
        end if;
        select v_nume;
        
    end loop bucla;
    close c1;
end
//
delimiter ;
call nume_carte ('Roman');
call nume_carte ('Politist');
call nume_carte ('Drama');



# sa se scrie o procedura care primeste un nume de gen ca parametru si returneaza media preturilor cartilor care apartin genului respectiv
delimiter //
create function medie_carte_gen (p_gen varchar(50))
returns float(6.2)
begin
	declare v_pret float(6.2);
    declare v_nr int;
    declare v_suma float(6.2);
    declare v_nume_gen varchar(50);
    declare semafor varchar(50) default 'verde';
  
    declare c2 cursor for select c.pret, g.nume_gen
								from carti c
                                right join gen g
                                on c.id_gen = g.id
                                where p_gen = g.nume_gen;
                                
    declare continue handler for not found
    begin
		set semafor = 'rosu';
    end;
    set v_suma = 0;
    set v_nr = 0;
    
    open c2;
    bucla: loop
        fetch c2
			into v_pret, v_nume_gen;
        if (semafor = 'rosu') then
			leave bucla;
        end if;
        set v_suma = v_suma + v_pret;
        set v_nr = v_nr+1;
        
    end loop bucla;
    return v_suma/v_nr;
    close c2;
end
//
delimiter ;
select medie_carte_gen ('Roman');
select medie_carte_gen('Religie');
select medie_carte_gen ('Drama');




# sa se scrie o procedura care primeste ca paramestru un oras si care sa returneze numele, prenumele, telefonul si valoarea comenzii clientilor 
# din orasul introdus;
delimiter //
create procedure detalii_clienti_oras(IN p_oras varchar(50))
begin
	declare v_nume varchar(50);
    declare v_prenume varchar(50);
    declare v_telefon char (10);
    declare v_valoare float (10.2);
    declare semafor varchar(50) default 'verde';
  
    declare c3 cursor for select k.nume, k.prenume, k.telefon, c.valoare
								from klient k
                                left join comanda c
                                on c.id_client = k.id
                                where p_oras = k.domiciliu;
                                
    declare continue handler for not found
    begin
		set semafor = 'rosu';
    end;
    open c3;
   
    bucla: loop
        fetch c3
			into v_nume, v_prenume, v_telefon, v_valoare;
        if (semafor = 'rosu') then
			leave bucla;
        end if;
        if v_valoare is null then set v_valoare = 0;
        end if;
        select concat_WS(' ','Clientul',v_nume, v_prenume,'avand nr de telefon:', v_telefon,'are comanda in valoare de', v_valoare,'lei');
        
    end loop bucla;
    close c3;
end
//
delimiter ;

call detalii_clienti_oras ('Galati');
call detalii_clienti_oras ('Tulcea');
drop procedure detalii_clienti_oras;


# triggeri

create table inregistrari(
	id int primary key auto_increment,
    text_inregistrare varchar(255),
    data_inregistrare date
);
# sa se creeze un trigger pt insert la tabelul klient,
# care sa salveze in tabelul inregistrari numele, prenumele, id-ul si data inregistrarii noului client.
delimiter //
create trigger evidenta_la_inserare after insert on klient
for each row
begin
	declare v_sir_final varchar(255);
    set v_sir_final = concat_ws(' ','S-a inserat clientul', new.nume, new.prenume,'cu id-ul',new.id);
	insert into inregistrari
		values(null, v_sir_final, current_date());
end;
//
delimiter ;

insert into klient 
	values (null, 'Popovici', 'Laurentiu', 'poplaur@gmail.com', '0745231658', 'Da', 'Slatina');

select * from inregistrari;



# sa se creeze un trigger pt update la tabelul klient care sa salveze noile modificfi in tabelul inregistrari.
delimiter //
create trigger evidenta_la_update after update on klient
for each row
begin
	declare v_sir_inserat varchar(255);
    declare v_linia_veche varchar(255);
    declare v_linia_noua varchar(255);
    set v_linia_veche = concat_ws(' ', old.id, old.nume, old.prenume, old.email, old.telefon, old.client_premium, old.domiciliu);
    set v_linia_noua = concat_ws(' ', new.id, new.nume, new.prenume, new.email, new.telefon, new.client_premium, new.domiciliu);
    set v_sir_inserat = concat('Linia ', v_linia_veche, ' a devenit ', v_linia_noua);
    insert into inregistrari
		values (null, v_sir_inserat, current_date());
    
end;
//
delimiter ;

update klient
set nume = 'Broboana'
where id = 21;

select * from inregistrari;



# scrieti un trigger pentru delete la tabela klient care insereze vechile iregistrari in tabela inregistrari
delimiter //
create trigger evidenta_la_delete after delete on klient
for each row
begin
	declare v_sir_initial varchar(255);
    set v_sir_initial = concat_ws(' ','S-a sters clientul:', old.nume, old.prenume, old.email, old.telefon, old.client_premium, old.domiciliu);
	insert into inregistrari
		values(null, v_sir_initial, current_date());
end;
//
delimiter ;

delete from klient
where nume = 'Broboana';

select * from inregistrari;









