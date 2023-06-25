/*==============================================================*/
/* Table : GAMES                                                */
/*==============================================================*/
DROP TABLE IF EXISTS Games
GO

CREATE TABLE Games (
   idGame INTEGER PRIMARY KEY,
   name VARCHAR(100) NOT NULL
)
GO

/*==============================================================*/
/* Table : COMBINATIONTYPES                                     */
/*==============================================================*/
DROP TABLE IF EXISTS CombinationTypes
GO

CREATE TABLE CombinationTypes (
   idCombinationType INTEGER PRIMARY KEY,
   symbol BLOB NULL,
   description TEXT NULL
)
GO

/*==============================================================*/
/* Table : KEYS                                                 */
/*==============================================================*/
DROP TABLE IF EXISTS Keys
GO

CREATE TABLE Keys (
   idKey INTEGER PRIMARY KEY,
   name VARCHAR(50) NOT NULL
)
GO

/*==============================================================*/
/* Table : PATCHES                                              */
/*==============================================================*/
DROP TABLE IF EXISTS Patches
GO

CREATE TABLE Patches (
   idPatch INTEGER PRIMARY KEY,
   idGame INTEGER NOT NULL,
   version VARCHAR(50) NOT NULL,
   changelog TEXT NULL,
   FOREIGN KEY (idGame) REFERENCES Games (idGame)
)
GO

/*==============================================================*/
/* Table : PROPERTIES                                           */
/*==============================================================*/
DROP TABLE IF EXISTS Properties
GO

CREATE TABLE Properties (
   idProperty INTEGER PRIMARY KEY,
   name VARCHAR(50) NOT NULL,
   fieldName TEXT NOT NULL
)
GO

/*==============================================================*/
/* Table : CHARACTERS                                           */
/*==============================================================*/
DROP TABLE IF EXISTS Characters
GO

CREATE TABLE Characters (
   idCharacter INTEGER PRIMARY KEY,
   idGame INTEGER NOT NULL,
   name VARCHAR(100) NOT NULL,
   FOREIGN KEY (idGame) REFERENCES Games (idGame)
)
GO

/*==============================================================*/
/* Table : COMMANDS                                             */
/*==============================================================*/
DROP TABLE IF EXISTS Commands
GO

CREATE TABLE Commands (
   idCommand INTEGER PRIMARY KEY,
   idGame INTEGER NOT NULL,
   idKey INTEGER NOT NULL,
   notation VARCHAR(50) NOT NULL,
   description TEXT NULL,
   FOREIGN KEY (idGame) REFERENCES Games (idGame),
   FOREIGN KEY (idKey) REFERENCES Keys (idKey)
)
GO

/*==============================================================*/
/* Table : MOVES                                                */
/*==============================================================*/
DROP TABLE IF EXISTS Moves
GO

CREATE TABLE Moves (
   idMove INTEGER PRIMARY KEY,
   idCharacter INTEGER NOT NULL,
   name VARCHAR(50) NOT NULL,
   FOREIGN KEY (idCharacter) REFERENCES Characters (idCharacter)
)
GO

/*==============================================================*/
/* Table : INPUTS                                               */
/*==============================================================*/
DROP TABLE IF EXISTS Inputs
GO

CREATE TABLE Inputs (
   idInput INTEGER PRIMARY KEY,
   idStartState INTEGER NULL,
   idEndState INTEGER NULL,
   idCommand INTEGER NOT NULL,
   idCombinationType INTEGER NULL,
   idMove INTEGER NOT NULL,
   ordering INTEGER NOT NULL,
   FOREIGN KEY (idMove) REFERENCES Moves (idMove),
   FOREIGN KEY (idCombinationType) REFERENCES CombinationTypes (idCombinationType),
   FOREIGN KEY (idCommand) REFERENCES Commands (idCommand),
   FOREIGN KEY (idStartState) REFERENCES States (idState),
   FOREIGN KEY (idEndState) REFERENCES States (idState)
)
GO

/*==============================================================*/
/* Table : MOVESPROPERTIES                                      */
/*==============================================================*/
DROP TABLE IF EXISTS MovesProperties
GO

CREATE TABLE MovesProperties (
   idMoveProperty INTEGER PRIMARY KEY,
   idProperty INTEGER NOT NULL,
   idMove INTEGER NOT NULL,
   idPatch INTEGER NOT NULL,
   valueNumeric NUMERIC NULL,
   valueReal REAL NULL,
   valueText TEXT NULL,
   FOREIGN KEY (idMove) REFERENCES Moves (idMove),
   FOREIGN KEY (idProperty) REFERENCES Properties (idProperty),
   FOREIGN KEY (idPatch) REFERENCES Patches (idPatch)
)
GO

/*==============================================================*/
/* Table : STATES                                               */
/*==============================================================*/
DROP TABLE IF EXISTS States
GO

CREATE TABLE States (
   idState INTEGER PRIMARY KEY,
   idCharacter INTEGER NULL,
   idGame INTEGER NOT NULL,
   name VARCHAR(50) NULL,
   notation VARCHAR(10) NOT NULL,
   FOREIGN KEY (idGame) REFERENCES Games (idGame),
   FOREIGN KEY (idCharacter) REFERENCES Characters (idCharacter)
)
GO
