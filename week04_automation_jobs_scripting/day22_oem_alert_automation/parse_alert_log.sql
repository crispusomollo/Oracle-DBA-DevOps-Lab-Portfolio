-- ============================================================
-- Simulate extraction of alerts from Oracle alert log
-- ============================================================
SET LINESIZE 200
SET FEEDBACK OFF
SET PAGESIZE 100
SPOOL ./output/alerts.json

SELECT JSON_ARRAYAGG(
  JSON_OBJECT(
    'Timestamp' VALUE TO_CHAR(sample_time, 'YYYY-MM-DD HH24:MI:SS'),
    'Component' VALUE component_id,
    'Severity' VALUE severity,
    'Message' VALUE message_text
  )
)
FROM (
  SELECT sample_time, component_id, severity, message_text
  FROM v$diag_alert_ext
  WHERE severity IN ('ERROR', 'CRITICAL')
  ORDER BY sample_time DESC FETCH FIRST 20 ROWS ONLY
);

SPOOL OFF
EXIT;

