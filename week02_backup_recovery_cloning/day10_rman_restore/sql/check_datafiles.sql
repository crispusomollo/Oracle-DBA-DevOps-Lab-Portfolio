-- =====================================================
-- List current datafiles and status
-- =====================================================
SET LINES 200
COL FILE_NAME FOR A80
SELECT FILE_ID, FILE_NAME, STATUS FROM dba_data_files ORDER BY FILE_ID;

