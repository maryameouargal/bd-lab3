

-- ETAPE  1
USE bibliotheque;

-- ETAPE 2 
SELECT * FROM auteur;

-- ETAPE  3
SELECT id, nom FROM abonne;

-- ETAPE 4
SELECT titre, disponible FROM ouvrage WHERE disponible = TRUE;

-- ETAPE 5
SELECT * FROM emprunt WHERE date_debut > '2025-06-01';

-- ETAPE 6
-- AND
SELECT titre FROM ouvrage WHERE disponible = FALSE AND auteur_id = 8;

-- OR  
SELECT nom FROM abonne WHERE email LIKE '%@gmail.com' OR email LIKE '%@yahoo.com';

-- NOT
SELECT * FROM abonne WHERE NOT (email LIKE '%@example.com');

-- ETAPE  7
SELECT nom FROM auteur WHERE nom LIKE 'M%';
SELECT email FROM abonne WHERE email LIKE '%@%';

-- ETAPE  8
SELECT nom FROM abonne WHERE id IN (6, 7, 8);
SELECT * FROM emprunt WHERE date_debut BETWEEN '2025-05-01' AND '2025-05-31';

-- ETAPE 9
SELECT * FROM emprunt WHERE date_fin IS NULL;
SELECT * FROM emprunt WHERE date_fin IS NOT NULL;

-- ETAPE  10
SELECT titre, disponible FROM ouvrage ORDER BY titre ASC;
SELECT * FROM abonne ORDER BY id LIMIT 10;
SELECT * FROM abonne ORDER BY id LIMIT 5 OFFSET 5;

-- ETAPE 11
-- 1.les trois ouvrages les plus récemment ajoutés 
SELECT * FROM ouvrage ORDER BY id DESC LIMIT 3;

-- 2. les auteurs dont le nom contient au moins cinq caractères
SELECT nom FROM auteur WHERE LENGTH(nom) >= 5;

-- 3.  les abonnés dont l’email ne provient pas de example.com
SELECT nom, email FROM abonne WHERE email NOT LIKE '%@example.com';

-- 4. les emprunts ayant duré plus de 30 jours
SELECT * FROM emprunt 
WHERE DATEDIFF(date_fin, date_debut) > 30 
   OR (date_fin IS NULL AND DATEDIFF(CURDATE(), date_debut) > 30);

-- 5. lister les abonnés Gmail par ordre alphabétique
SELECT nom, email FROM abonne 
WHERE email LIKE '%@gmail.com' 
ORDER BY nom ASC;