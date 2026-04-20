-- =========================
-- CLEANING.SQL
-- =========================

-- Optimize MySQL performance for large updates
SET GLOBAL innodb_buffer_pool_size = 3221225472;
SET GLOBAL innodb_log_buffer_size = 268435456;

-- -------------------------
-- Remove unwanted spaces
-- -------------------------
UPDATE crm_pipeline SET organization = TRIM(organization);
UPDATE crm_pipeline SET industry = TRIM(industry);
UPDATE crm_pipeline SET stage = TRIM(stage);

-- -------------------------
-- Convert empty strings to NULL
-- (Important: '' is NOT NULL in MySQL)
-- -------------------------
UPDATE crm_pipeline SET lead_acquisition_date = NULL WHERE lead_acquisition_date = '';
UPDATE crm_pipeline SET expected_close_date = NULL WHERE expected_close_date = '';
UPDATE crm_pipeline SET actual_close_date = NULL WHERE actual_close_date = '';
UPDATE crm_pipeline SET stage = NULL WHERE stage = '';

-- -------------------------
-- Speed up bulk operations
-- -------------------------
SET autocommit = 0;
SET foreign_key_checks = 0;
SET unique_checks = 0;
ALTER TABLE crm_pipeline DISABLE KEYS;
