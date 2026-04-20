-- =========================
-- TRANSFORMATION.SQL
-- =========================

-- -------------------------
-- Convert text to DATE format
-- -------------------------
UPDATE crm_pipeline
SET lead_acquisition_date = STR_TO_DATE(lead_acquisition_date, '%m/%d/%Y');

UPDATE crm_pipeline
SET expected_close_date = STR_TO_DATE(expected_close_date, '%m/%d/%Y');

UPDATE crm_pipeline
SET actual_close_date = STR_TO_DATE(actual_close_date, '%m/%d/%Y');

-- -------------------------
-- Change column types permanently
-- -------------------------
ALTER TABLE crm_pipeline MODIFY actual_close_date DATE;
ALTER TABLE crm_pipeline MODIFY lead_acquisition_date DATE;
ALTER TABLE crm_pipeline MODIFY expected_close_date DATE;

-- -------------------------
-- Rebuild missing pipeline stages
-- Using business logic from status
-- -------------------------
UPDATE crm_pipeline
SET stage =
CASE
    WHEN stage IS NOT NULL THEN stage

    WHEN status = 'New' THEN 'Initial contact'
    WHEN status = 'Qualified' THEN 'Nurturing'
    WHEN status = 'Disqualified' THEN 'Lost'
    WHEN status = 'Sales Accepted' THEN 'Opened'

    WHEN status = 'Customer' THEN 'Won'
    WHEN status = 'Churned Customer' THEN 'Lost'

    ELSE stage
END
WHERE stage IS NULL;

-- -------------------------
-- Re-enable constraints
-- -------------------------
COMMIT;
SET autocommit = 1;
SET foreign_key_checks = 1;
SET unique_checks = 1;
ALTER TABLE crm_pipeline ENABLE KEYS;
