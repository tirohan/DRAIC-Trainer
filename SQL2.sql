SELECT
  Country,
  COUNT(CASE WHEN [SESSION] = 'Y'
    AND [CHAT] = 'Y'
    AND [SESSION] <> 'Direct to Agent'
    AND [SESSION] <> 'Unsatisfied'
    THEN 1 END) AS ResolvedSessions,
  COUNT(*) AS TotalSessions,
  COUNT(CASE WHEN [SESSION] = 'Y'
    AND [CHAT] = 'Y'
    AND [SESSION] <> 'Direct to Agent'
    AND [SESSION] <> 'Unsatisfied'
    AND [CHAT] = 'Last chat recommendation?' THEN 1 END) AS RecommendationContrib,
  COUNT(CASE WHEN [SESSION] = 'Y'
    AND [CHAT] = 'Y'
    AND [SESSION] <> 'Direct to Agent'
    AND [SESSION] <> 'Unsatisfied'
    AND [CHAT] = 'No answer?' THEN 1 END) AS NoAnswerContrib,
  COUNT(CASE WHEN [SESSION] = 'Y'
    AND [CHAT] = 'Y'
    AND [SESSION] <> 'Direct to Agent'
    AND [SESSION] <> 'Unsatisfied'
    AND [CHAT] = 'Answer Type' THEN 1 END) AS AnswerTypeContrib,
  COUNT(CASE WHEN [SESSION] = 'Y'
    AND [CHAT] = 'Y'
    AND [SESSION] <> 'Direct to Agent'
    AND [SESSION] <> 'Unsatisfied'
    AND [CHAT] = 'Query Resolved?' THEN 1 END) AS QueryResolvedContrib
FROM (
  SELECT 'Country 1' AS Country, [SESSION], [CHAT]
  FROM [Country 1]
  UNION ALL
  SELECT 'Country 2' AS Country, [SESSION], [CHAT]
  FROM [Country 2]
  UNION ALL
  SELECT 'Country 3' AS Country, [SESSION], [CHAT]
  FROM [Country 3]
  UNION ALL
  SELECT 'Country 4' AS Country, [SESSION], [CHAT]
  FROM [Country 4]
) AS AllCountries
GROUP BY Country;