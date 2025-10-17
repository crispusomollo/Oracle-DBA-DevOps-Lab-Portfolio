-- ============================================================
-- Real-Time SQL Monitoring - Active Sessions
-- ============================================================
SET LINESIZE 200
SET PAGESIZE 100
SET FEEDBACK OFF
SPOOL ./output/active_sessions.json
SELECT JSON_OBJECT(
  'SID' VALUE s.sid,
  'Username' VALUE s.username,
  'Status' VALUE s.status,
  'Machine' VALUE s.machine,
  'Program' VALUE s.program,
  'SQL_ID' VALUE s.sql_id,
  'SQL_Text' VALUE q.sql_text,
  'Elapsed_Seconds' VALUE ROUND(s.last_call_et),
  'Wait_Event' VALUE s.event
) AS session_info
FROM v$session s
JOIN v$sql q ON s.sql_id = q.sql_id
WHERE s.type = 'USER'
AND s.status = 'ACTIVE'
AND s.username IS NOT NULL
FETCH FIRST 10 ROWS ONLY;
SPOOL OFF
EXIT;

