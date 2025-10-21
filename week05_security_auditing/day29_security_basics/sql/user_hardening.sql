-- Disable unused accounts
ALTER USER ANONYMOUS ACCOUNT LOCK;
ALTER USER OUTLN ACCOUNT LOCK;

-- Enforce password change for default users
ALTER USER SYSTEM PASSWORD EXPIRE;

-- Assign least privilege roles
GRANT APP_READ_ONLY TO APP_USER;
REVOKE CREATE ANY TABLE FROM APP_USER;

-- Lock test/demo accounts if any exist
BEGIN
  FOR usr IN (SELECT username FROM dba_users WHERE username LIKE 'TEST%') LOOP
    EXECUTE IMMEDIATE 'ALTER USER ' || usr.username || ' ACCOUNT LOCK';
  END LOOP;
END;
/

EXIT;

