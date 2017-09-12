/*==============================================================*/
/* Table : GAMES                                                */
/*==============================================================*/
CREATE TABLE Games (
   idGame INTEGER PRIMARY KEY,
   name VARCHAR(100) NOT NULL
)
GO

/*==============================================================*/
/* Table : COMBINATIONTYPES                                     */
/*==============================================================*/
CREATE TABLE CombinationTypes (
   idCombinationType INTEGER PRIMARY KEY,
   symbol BLOB NULL,
   description TEXT NULL
)
GO

/*==============================================================*/
/* Table : KEYS                                                 */
/*==============================================================*/
CREATE TABLE Keys (
   idKey INTEGER PRIMARY KEY,
   name VARCHAR(50) NOT NULL
)
GO

/*==============================================================*/
/* Table : PATCHES                                              */
/*==============================================================*/
CREATE TABLE Patches (
   idPatch INTEGER PRIMARY KEY,
   version VARCHAR(50) NOT NULL,
   changelog TEXT NULL
)
GO

/*==============================================================*/
/* Table : PROPERTIES                                           */
/*==============================================================*/
CREATE TABLE Properties (
   idProperty INTEGER PRIMARY KEY,
   name VARCHAR(50) NOT NULL,
   fieldName TEXT NOT NULL
)
GO

/*==============================================================*/
/* Table : CHARACTERS                                           */
/*==============================================================*/
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
CREATE TABLE MovesProperties (
   idMoveProperty INTEGER PRIMARY KEY,
   idProperty INTEGER NOT NULL,
   idMove INTEGER NOT NULL,
   valueNumeric NUMERIC NULL,
   valueReal REAL NULL,
   valueText TEXT NULL,
   FOREIGN KEY (idMove) REFERENCES Moves (idMove),
   FOREIGN KEY (idProperty) REFERENCES Properties (idProperty)
)
GO

/*==============================================================*/
/* Table : PATCHEDIN
/*==============================================================*/
CREATE TABLE PatchedIn (
   idPatch INTEGER NOT NULL,
   idMoveProperty INTEGER NOT NULL,
   FOREIGN KEY (idMoveProperty) REFERENCES MovesProperties (idMoveProperty),
   FOREIGN KEY (idPatch) REFERENCES Patches (idPatch),
   CONSTRAINT PK_PatchedInID PRIMARY KEY (idPatch, idMoveProperty)
)
GO

/*==============================================================*/
/* Table : STATES                                               */
/*==============================================================*/
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