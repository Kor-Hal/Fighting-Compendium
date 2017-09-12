select CH.name AS Character, S.notation AS State, C.notation AS Command, CT.symbolPath AS Link
FROM Inputs I LEFT OUTER JOIN States S ON I.idStartState = S.idState
LEFT OUTER JOIN Commands C ON I.idCommand = C.idCommand
LEFT OUTER JOIN CombinationTypes CT ON I.idCombinationType = CT.idCombinationType
JOIN Moves M ON I.idMove = M.idMove
JOIN Characters CH ON M.idCharacter = CH.idCharacter
ORDER BY I.ordering;