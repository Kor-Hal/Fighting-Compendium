select CH.name AS Character, S.notation AS State, C.notation AS Command, CT.symbol AS Link
FROM Inputs I LEFT OUTER JOIN States S ON I.idStartState = S.idState
LEFT OUTER JOIN Commands C ON I.idCommand = C.idCommand
LEFT OUTER JOIN CombinationTypes CT ON I.idCombinationType = CT.idCombinationType
JOIN Moves M ON I.idMove = M.idMove
JOIN Characters CH ON M.idCharacter = CH.idCharacter
ORDER BY I.ordering;

select M.name, '{' || GROUP_CONCAT(I.ordering || ':''' || CASE WHEN SS.notation IS NOT NULL THEN SS.notation || ' ' ELSE '' END || C.notation || ifnull(CT.symbol,'') || CASE WHEN ES.notation IS NOT NULL THEN ES.notation || ' ' ELSE '' END || '''', ', ') || '}' AS Movement
FROM Inputs I LEFT OUTER JOIN States SS ON I.idStartState = SS.idState
LEFT OUTER JOIN States ES ON I.idEndState = ES.idState
LEFT OUTER JOIN Commands C ON I.idCommand = C.idCommand
LEFT OUTER JOIN CombinationTypes CT ON I.idCombinationType = CT.idCombinationType
JOIN Moves M ON I.idMove = M.idMove
JOIN Characters CH ON M.idCharacter = CH.idCharacter
GROUP BY M.name;

