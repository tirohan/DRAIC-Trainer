SELECT Country, TotalUnsatisfiedSessions, TotalChatbotSessions
FROM (
    SELECT 'Country 1' AS Country,
           COUNT(CASE WHEN [SESSION] = 'Y' THEN 1 END) AS TotalUnsatisfiedSessions,
           COUNT(*) - COUNT(CASE WHEN [SESSION] = 'Direct to Agent' THEN 1 END) AS TotalChatbotSessions
    FROM [Country 1]
   
    UNION ALL
   
    SELECT 'Country 2' AS Country,
           COUNT(CASE WHEN [SESSION] = 'Y' THEN 1 END) AS TotalUnsatisfiedSessions,
           COUNT(*) - COUNT(CASE WHEN [SESSION] = 'Direct to Agent' THEN 1 END) AS TotalChatbotSessions
    FROM [Country 2]
   
    UNION ALL
   
    SELECT 'Country 3' AS Country,
           COUNT(CASE WHEN [SESSION] = 'Y' THEN 1 END) AS TotalUnsatisfiedSessions,
           COUNT(*) - COUNT(CASE WHEN [SESSION] = 'Direct to Agent' THEN 1 END) AS TotalChatbotSessions
    FROM [Country 3]
   
    UNION ALL
   
    SELECT 'Country 4' AS Country,
           COUNT(CASE WHEN [SESSION] = 'Y' THEN 1 END) AS TotalUnsatisfiedSessions,
           COUNT(*) - COUNT(CASE WHEN [SESSION] = 'Direct to Agent' THEN 1 END) AS TotalChatbotSessions
    FROM [Country 4]
) AS AllCountries
WHERE TotalChatbotSessions > 0
ORDER BY TotalUnsatisfiedSessions DESC;