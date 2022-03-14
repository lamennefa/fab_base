/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     14/03/2022 13:03:20                          */
/*==============================================================*/


drop table if exists Achat;

drop table if exists Article;

drop table if exists Categorie;

drop table if exists Client;

drop table if exists Forunisseur;

drop table if exists Role;

drop table if exists Utilisateur;

drop table if exists Vente;

/*==============================================================*/
/* Table: Achat                                                 */
/*==============================================================*/
create table Achat
(
   idAch                int not null,
   idUti                int not null,
   idFou                int not null,
   idArt                int not null,
   dateAchat            datetime,
   quantite             varchar(254),
   prix                 int,
   prixtotal            int,
   primary key (idAch),
   key AK_Identifier_1 (prixtotal)
);

/*==============================================================*/
/* Table: Article                                               */
/*==============================================================*/
create table Article
(
   idArt                int not null,
   idCat                int not null,
   prix                 int,
   quantite             varchar(254),
   libelle              varchar(254),
   primary key (idArt),
   key AK_Identifier_1 (quantite)
);

/*==============================================================*/
/* Table: Categorie                                             */
/*==============================================================*/
create table Categorie
(
   idCat                int not null,
   nom                  varchar(254),
   primary key (idCat)
);

/*==============================================================*/
/* Table: Client                                                */
/*==============================================================*/
create table Client
(
   idClient             int not null,
   nom                  varchar(254),
   prenom               varchar(254),
   adresse              varchar(254),
   telephone            varchar(254),
   email                varchar(254),
   primary key (idClient)
);

/*==============================================================*/
/* Table: Forunisseur                                           */
/*==============================================================*/
create table Forunisseur
(
   idFou                int not null,
   nom                  varchar(254),
   prenom               varchar(254),
   adresse              varchar(254),
   telephone            varchar(254),
   email                varchar(254),
   primary key (idFou)
);

/*==============================================================*/
/* Table: Role                                                  */
/*==============================================================*/
create table Role
(
   idRol                int not null,
   nom                  varchar(254),
   primary key (idRol)
);

/*==============================================================*/
/* Table: Utilisateur                                           */
/*==============================================================*/
create table Utilisateur
(
   idUti                int not null,
   idRol                int not null,
   nom                  varchar(254),
   email                varchar(254),
   primary key (idUti)
);

/*==============================================================*/
/* Table: Vente                                                 */
/*==============================================================*/
create table Vente
(
   idVen                int not null,
   idUti                int not null,
   idClient             int not null,
   idArt                int not null,
   dateVente            datetime,
   quante               varchar(254),
   prix                 int,
   prixtotal            int,
   primary key (idVen)
);
 insert into Achat (idAch, idUti, idFou, idArt, dateAchat, quantite, prix, prixtotal)
 values 
 ('01', '01', '02', '02', '23/01/19', '5', '5000', '15000'),
 ('02', '01', '02', '02', '20/02/19', '3', '2000', '10000');

  insert into Categorie (idCat, nom)
 values 
 ('01', 'moyen');

 insert into Article (idArt, idCat, prix, quantite, libelle)
 values 
 ('01', '01', '7000', '10', 'lunettes'),
 ('02', '01', '3000', '15', 'telephone');


 insert into Client (idClient, nom, prenom, adresse, telephone, email)
 values 
 ('01', 'mbembe', 'leon', 'zogona', '502501', 'leon.com'),
 ('02', 'solos', 'fab', '1200lgmt', '75020601', 'fab.com');

 insert into Forunisseur (idFou, nom, prenom, adresse, telephone, email)
 values 
 ('01', 'devo', 'hamidou', 'zone1', '50250', 'dev.com'),
 ('02', 'lamenne', 'fabrice', '1200lgm', '7502060', 'lam.com');

 insert into Role (idRol, nom)
 values 
 ('01', 'distributeur');

 insert into Utilisateur (idUti, idRol, nom, email)
 values 

 ('01', '01', 'niclas', 'nico.com');
 
insert into Vente (idVen, idUti, idClient, idArt, datevente, quante, prix, prixtotal)
 values 
 ('01', '01', '01', '01', '23/01/19', '5', '5000', '15000'),
 ('02', '01', '2', '02', '20/02/19', '3', '2000', '10000');


alter table Achat add constraint FK_association5 foreign key (idArt)
      references Article (idArt) on delete restrict on update restrict;

alter table Achat add constraint FK_association6 foreign key (idFou)
      references Forunisseur (idFou) on delete restrict on update restrict;

alter table Achat add constraint FK_association8 foreign key (idUti)
      references Utilisateur (idUti) on delete restrict on update restrict;

alter table Article add constraint FK_association1 foreign key (idCat)
      references Categorie (idCat) on delete restrict on update restrict;

alter table Utilisateur add constraint FK_association4 foreign key (idRol)
      references Role (idRol) on delete restrict on update restrict;

alter table Vente add constraint FK_association2 foreign key (idUti)
      references Utilisateur (idUti) on delete restrict on update restrict;

alter table Vente add constraint FK_association3 foreign key (idClient)
      references Client (idClient) on delete restrict on update restrict;

alter table Vente add constraint FK_association7 foreign key (idArt)
      references Article (idArt) on delete restrict on update restrict;

