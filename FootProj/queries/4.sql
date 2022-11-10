SELECT'________________________________________________________________________';
SELECT'4. List all coaches with a winning record. (Win percentage above 50%). List the coach, the team they coach, and their win%'; 
SELECT'________________________________________________________________________';
SELECT c_name, c_team, c_winPercentage
FROM coaches
WHERE c_winPercentage>=.500
ORDER BY c_winPercentage DESC;