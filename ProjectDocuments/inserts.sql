-- Games
INSERT INTO Games (name) VALUES ('Dead or Alive 5 Ultimate');

-- Keys
INSERT INTO Keys (name) VALUES ('UP');
INSERT INTO Keys (name) VALUES ('DOWN');
INSERT INTO Keys (name) VALUES ('LEFT');
INSERT INTO Keys (name) VALUES ('RIGHT');
INSERT INTO Keys (name) VALUES ('Button1');
INSERT INTO Keys (name) VALUES ('Button2');
INSERT INTO Keys (name) VALUES ('Button3');
INSERT INTO Keys (name) VALUES ('Button4');
INSERT INTO Keys (name) VALUES ('Button5');
INSERT INTO Keys (name) VALUES ('Button6');
INSERT INTO Keys (name) VALUES ('Button7');
INSERT INTO Keys (name) VALUES ('Button8');

-- Combination Types
INSERT INTO CombinationTypes (symbolPath) VALUES (','); -- TODO Mettre un vrai chemin vers le symbole et non le dessin, ou voir pour mettre un blob et stocker l'image
INSERT INTO CombinationTypes (symbolPath) VALUES ('~'); -- TODO Mettre un vrai chemin vers le symbole et non le dessin, ou voir pour mettre un blob et stocker l'image
INSERT INTO CombinationTypes (symbolPath) VALUES ('+'); -- TODO Mettre un vrai chemin vers le symbole et non le dessin, ou voir pour mettre un blob et stocker l'image

-- Characters
INSERT INTO Characters (idGame, name) VALUES ((SELECT idGame FROM Games WHERE name = 'Dead or Alive 5 Ultimate'), 'Rig');

-- States
INSERT INTO States (idCharacter, idGame, name, notation) VALUES ((SELECT C.idCharacter FROM Characters C JOIN Games G ON C.idGame = G.idGame WHERE G.name = 'Dead or Alive 5 Ultimate' AND C.name =  'Rig'), (SELECT idGame FROM Games WHERE name = 'Dead or Alive 5 Ultimate'), 'Turn Leg Cut', 'TLC');

-- Commands
INSERT INTO Commands (idGame, idKey, notation, description) VALUES ((SELECT idGame FROM Games WHERE name = 'Dead or Alive 5 Ultimate'), (SELECT idKey FROM Keys WHERE name = 'UP'), '8', NULL);
INSERT INTO Commands (idGame, idKey, notation, description) VALUES ((SELECT idGame FROM Games WHERE name = 'Dead or Alive 5 Ultimate'), (SELECT idKey FROM Keys WHERE name = 'DOWN'), '2', NULL);
INSERT INTO Commands (idGame, idKey, notation, description) VALUES ((SELECT idGame FROM Games WHERE name = 'Dead or Alive 5 Ultimate'), (SELECT idKey FROM Keys WHERE name = 'LEFT'), '4', NULL);
INSERT INTO Commands (idGame, idKey, notation, description) VALUES ((SELECT idGame FROM Games WHERE name = 'Dead or Alive 5 Ultimate'), (SELECT idKey FROM Keys WHERE name = 'RIGHT'), '6', NULL);
INSERT INTO Commands (idGame, idKey, notation, description) VALUES ((SELECT idGame FROM Games WHERE name = 'Dead or Alive 5 Ultimate'), (SELECT idKey FROM Keys WHERE name = 'Button1'), 'H', 'Hold');
INSERT INTO Commands (idGame, idKey, notation, description) VALUES ((SELECT idGame FROM Games WHERE name = 'Dead or Alive 5 Ultimate'), (SELECT idKey FROM Keys WHERE name = 'Button2'), 'K', 'Kick');
INSERT INTO Commands (idGame, idKey, notation, description) VALUES ((SELECT idGame FROM Games WHERE name = 'Dead or Alive 5 Ultimate'), (SELECT idKey FROM Keys WHERE name = 'Button5'), 'P', 'Punch');
INSERT INTO Commands (idGame, idKey, notation, description) VALUES ((SELECT idGame FROM Games WHERE name = 'Dead or Alive 5 Ultimate'), (SELECT idKey FROM Keys WHERE name = 'Button6'), 'T', 'Throw');

-- Moves
INSERT INTO Moves (idCharacter, name) VALUES ((SELECT C.idCharacter FROM Characters C JOIN Games G ON C.idGame = G.idGame WHERE G.name = 'Dead or Alive 5 Ultimate' AND C.name =  'Rig'), 'Test_name');

-- Inputs (exemples fixés)
INSERT INTO Inputs (idStartState, idCommand, idCombinationType, idMove, ordering) VALUES (NULL, (SELECT C.idCommand FROM Commands C JOIN Games G ON C.idGame = G.idGame WHERE G.name = 'Dead or Alive 5 Ultimate' AND C.notation = 'K'), (SELECT idCombinationType FROM CombinationTypes WHERE symbolPath = ','), (SELECT M.idMove FROM Moves M JOIN Characters C ON M.idCharacter = C.idCharacter WHERE C.name = 'Rig'), 1);
INSERT INTO Inputs (idStartState, idCommand, idCombinationType, idMove, ordering) VALUES (NULL, (SELECT C.idCommand FROM Commands C JOIN Games G ON C.idGame = G.idGame WHERE G.name = 'Dead or Alive 5 Ultimate' AND C.notation = 'K'), (SELECT idCombinationType FROM CombinationTypes WHERE symbolPath = '~'), (SELECT M.idMove FROM Moves M JOIN Characters C ON M.idCharacter = C.idCharacter WHERE C.name = 'Rig'), 2);
INSERT INTO Inputs (idStartState, idCommand, idCombinationType, idMove, ordering) VALUES (NULL, (SELECT C.idCommand FROM Commands C JOIN Games G ON C.idGame = G.idGame WHERE G.name = 'Dead or Alive 5 Ultimate' AND C.notation = '4'), (SELECT idCombinationType FROM CombinationTypes WHERE symbolPath = ','), (SELECT M.idMove FROM Moves M JOIN Characters C ON M.idCharacter = C.idCharacter WHERE C.name = 'Rig'), 3);
INSERT INTO Inputs (idStartState, idCommand, idCombinationType, idMove, ordering) VALUES ((SELECT S.idState FROM States S JOIN Characters C ON S.idCharacter = C.idCharacter JOIN Games G ON S.idGame = G.idGame WHERE G.name = 'Dead or Alive 5 Ultimate' AND C.name = 'Rig' AND S.notation = 'TLC'), (SELECT C.idCommand FROM Commands C JOIN Games G ON C.idGame = G.idGame WHERE G.name = 'Dead or Alive 5 Ultimate' AND C.notation = 'K'), (SELECT idCombinationType FROM CombinationTypes WHERE symbolPath = '~'), (SELECT M.idMove FROM Moves M JOIN Characters C ON M.idCharacter = C.idCharacter WHERE C.name = 'Rig'), 4);
INSERT INTO Inputs (idStartState, idCommand, idCombinationType, idMove, ordering) VALUES (NULL, (SELECT C.idCommand FROM Commands C JOIN Games G ON C.idGame = G.idGame WHERE G.name = 'Dead or Alive 5 Ultimate' AND C.notation = 'K'), (SELECT idCombinationType FROM CombinationTypes WHERE symbolPath = '+'), (SELECT M.idMove FROM Moves M JOIN Characters C ON M.idCharacter = C.idCharacter WHERE C.name = 'Rig'), 5);
INSERT INTO Inputs (idStartState, idCommand, idCombinationType, idMove, ordering) VALUES (NULL, (SELECT C.idCommand FROM Commands C JOIN Games G ON C.idGame = G.idGame WHERE G.name = 'Dead or Alive 5 Ultimate' AND C.notation = 'H'), NULL, (SELECT M.idMove FROM Moves M JOIN Characters C ON M.idCharacter = C.idCharacter WHERE C.name = 'Rig'), 6);
