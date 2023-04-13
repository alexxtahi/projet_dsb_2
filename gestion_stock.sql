-- Création des tables

CREATE TABLE CATEGORIE (
   id_cat INT NOT NULL,
   lib_cat VARCHAR(100) NOT NULL,
   PRIMARY KEY (id_cat)
);

CREATE TABLE PRODUIT (
   id_prod INT NOT NULL,
   nom_prod VARCHAR(100) NOT NULL,
   descri_prod VARCHAR(255),
   prix_achat_prod DOUBLE NOT NULL,
   prix_vente_prod DOUBLE NOT NULL,
   qte_stock INT NOT NULL,
   date_peremption DATE,
   date_appro DATE NOT NULL,
   id_cat INT NOT NULL,
   PRIMARY KEY (id_prod),
   FOREIGN KEY (id_cat) REFERENCES CATEGORIE(id_cat)
);

CREATE TABLE CLIENT (
   id_client INT NOT NULL,
   nom_client VARCHAR(40) NOT NULL,
   prenom_client VARCHAR(40) NOT NULL,
   sexe_client VARCHAR(1),
   PRIMARY KEY (id_client)
);

CREATE TABLE FOURNISSEUR (
   id_fourn INT NOT NULL,
   nom_fourn VARCHAR(40) NOT NULL,
   prenom_fourn VARCHAR(40) NOT NULL,
   sexe_fourn VARCHAR(1) NOT NULL,
   contact_fourn VARCHAR(15),
   mail_fourn VARCHAR(15),
   PRIMARY KEY (id_fourn)
);

CREATE TABLE PROMOTION (
   id_promo INT NOT NULL,
   lib_promo VARCHAR(100) NOT NULL,
   pourcentage_reduction DOUBLE,
   date_debut DATE NOT NULL,
   date_fin DATE NOT NULL,
   PRIMARY KEY (id_promo)
);

CREATE TABLE ASSOCIATION (
   id_asso INT NOT NULL,
   nom_asso VARCHAR(100) NOT NULL,
   PRIMARY KEY (id_asso)
);

CREATE TABLE DON (
   id_don INT NOT NULL,
   lib_don VARCHAR(100),
   date_reception DATE NOT NULL,
   id_asso INT NOT NULL,
   PRIMARY KEY (id_don),
   FOREIGN KEY (id_asso) REFERENCES ASSOCIATION(id_asso)
);


CREATE TABLE LIVRER (
   id_fourn INT NOT NULL,
   id_prod INT NOT NULL,
   date_livraison DATE NOT NULL,
   qte_livree INT NOT NULL,
   PRIMARY KEY (id_fourn, id_prod),
   FOREIGN KEY (id_fourn) REFERENCES FOURNISSEUR(id_fourn),
   FOREIGN KEY (id_prod) REFERENCES PRODUIT(id_prod)
);

CREATE TABLE ACHETER (
   id_client INT NOT NULL,
   id_prod INT NOT NULL,
   qte_achetee INT NOT NULL,
   prix_vente_actuel DOUBLE NOT NULL,
   PRIMARY KEY (id_client, id_prod),
   FOREIGN KEY (id_client) REFERENCES CLIENT(id_client),
   FOREIGN KEY (id_prod) REFERENCES PRODUIT(id_prod)
);

CREATE TABLE CONTENIR (
   id_don INT NOT NULL,
   id_prod INT NOT NULL,
   qte_donnee INT NOT NULL,
   PRIMARY KEY (id_don, id_prod),
   FOREIGN KEY (id_don) REFERENCES DON(id_don),
   FOREIGN KEY (id_prod) REFERENCES PRODUIT(id_prod)
);

CREATE TABLE CONCERNER (
   id_promo INT NOT NULL,
   id_prod INT NOT NULL,
   PRIMARY KEY(id_promo, id_prod),
   FOREIGN KEY(id_promo) REFERENCES PROMOTION(id_promo),
   FOREIGN KEY(id_prod) REFERENCES PRODUIT(id_prod)
);

-- Insertion des n-uplets

INSERT INTO CATEGORIE
VALUES (2, 'Boisson'),
(10, 'Electro ménager'),
(7, 'Viande'),
(3, 'Ustensile');

INSERT INTO PRODUIT
VALUES (3, 'Steak haché', NULL, 9, 13.5, 20, '2023-07-03', '2023-02-17', 7),
(4, 'Mixeur T40', 'Mixeur de la marque T40 à 2000 tours par minute', 20, 50, 12, NULL, '2023-01-09', 10),
(5, 'Coca Cola 100ml', 'The one & only super Coca cola !', 0.5, 2.2, 83, '2023-12-01', '2022-05-03', 2),
(6, 'Lipton Ice Tea', 'Délicieux thé dans une canette', 0.35, 1.77, 67, '2023-12-04', '2022-05-03', 2),
(7, 'Saucisses suisses', '1kg de bonne viande suisse', 5.5, 10, 14, '2023-06-20', '2023-03-21', 7);

INSERT INTO CLIENT
VALUES (33, 'BALE', 'Cassandre', 'F'),
(47, 'MAJORS', 'Jonathan', 'M'),
(5, 'RODRIGUEZ', 'Emmanuella', 'F');

INSERT INTO FOURNISSEUR
VALUES (12,'JONES', 'Jessica', 'F', '+33612345678', 'jessicajones001@gmail.com'),
(14,'CONORS', 'Damien', 'M', '+33687654321', NULL);

INSERT INTO PROMOTION
VALUES (1, 'Cyber Week', 15.0, '2023-12-01', '2023-12-04'),
(2, 'Black Friday', 25.0, '2023-11-20', '2023-11-24');

INSERT INTO ASSOCIATION
VALUES (1,'Epifree'),
(2,'CMI Rennes'),
(3,'Bouffe Pour Tous');

INSERT INTO DON
VALUES (1, "Don aux familles démunis", '2021-05-25', 3),
(3, "Distribution mensuelle aux assos", '2023-02-03', 1),
(8, "Distribution d'articles en voie de péremption", '2023-03-12', 1),
(14, "Don d'appareils défectueux", '2023-01-13', 2);

INSERT INTO LIVRER
VALUES (14, 5, '2022-12-05', 100),
(14, 6, '2022-12-05', 70),
(12, 3, '2023-02-17', 15);

INSERT INTO ACHETER
VALUES (5, 5, 2, 2.2),
(47, 3, 3, 11);

INSERT INTO CONCERNER
VALUES (1, 4),
(2, 5),
(2, 4);

INSERT INTO CONTENIR
VALUES (1, 3, 50),
(1, 7, 36),
(3, 5, 14),
(3, 6, 17),
(3, 7, 23),
(8, 3, 10),
(14, 4, 8);
