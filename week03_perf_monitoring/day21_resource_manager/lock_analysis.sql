-- ============================================================
-- Detect blocking sessions and locks
-- ============================================================
SET LINESIZE 200
SET FEEDBACK OFF
SPOOL ./output/blocking_sessions.json
SELECT JSON_ARRAYAGG(
  JSON_OBJECT(
    'Blocking_SID' VALUE l1.sid,
    'Blocking_User' VALUE s1.username,
    'Blocked_SID' VALUE l2.sid,
    'Blocked_User' VALUE s2.username,
    'Object' VALUE o.object_name,
    'Lock_Type' VALUE l1.type,
    'Mode_Held' VALUE l1.lmode,
    'Mode_Requested' VALUE l2.request
  )
) AS lock_report
FROM v$lock l1
JOIN v$lock l2 ON l1.id1 = l2.id1 AND l1.id2 = l2.id2 AND l1.block = 1
JOIN v$session s1 ON s1.sid = l1.sid
JOIN v$session s2 ON s2.sid = l2.sid
LEFT JOIN all_objects o ON o.object_id = l1.id1;
SPOOL OFF
EXIT;

