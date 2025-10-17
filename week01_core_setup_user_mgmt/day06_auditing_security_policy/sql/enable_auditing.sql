-- =====================================================
-- Enable Unified Auditing if not already enabled
-- =====================================================
ALTER SESSION SET CONTAINER = FREEPDB1;

-- Enable auditing for selected actions globally
AUDIT CREATE SESSION;
AUDIT ALTER USER BY ACCESS;
AUDIT DROP USER BY ACCESS;

PROMPT Unified Auditing enabled and session/user events monitored.

EXIT;
