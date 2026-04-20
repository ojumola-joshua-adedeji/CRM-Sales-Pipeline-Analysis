-- =========================
-- ANALYSIS.SQL
-- =========================

-- -------------------------
-- Check stage distribution
-- -------------------------
SELECT stage, COUNT(*)
FROM crm_pipeline
GROUP BY stage;

-- -------------------------
-- Check status vs stage relationship
-- -------------------------
SELECT status, stage, COUNT(*)
FROM crm_pipeline
GROUP BY status, stage;

-- -------------------------
-- Validate closed deals
-- -------------------------
SELECT stage, actual_close_date
FROM crm_pipeline
WHERE stage IN ('Won', 'Lost');

-- -------------------------
-- Check detailed pipeline breakdown
-- -------------------------
SELECT status, status_sequence, stage, COUNT(*)
FROM crm_pipeline
GROUP BY status, status_sequence, stage
ORDER BY status_sequence;

-- -------------------------
-- Data consistency checks
-- -------------------------
-- Won deals without close date
SELECT COUNT(*)
FROM crm_pipeline
WHERE stage = 'Won'
AND actual_close_date IS NULL;

-- Won deals with close date
SELECT COUNT(*)
FROM crm_pipeline
WHERE stage = 'Won'
AND actual_close_date IS NOT NULL;

-- -------------------------
-- Deep analysis: where wins come from
-- -------------------------
SELECT status, stage, COUNT(*)
FROM crm_pipeline
WHERE stage = 'Won'
GROUP BY status, stage;

-- -------------------------
-- Final KPI: Win Rate
-- -------------------------
SELECT 
    COUNT(*) AS total_deals,
    SUM(CASE WHEN stage = 'Won' THEN 1 ELSE 0 END) AS won_deals,
    ROUND(SUM(CASE WHEN stage = 'Won' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS win_rate
FROM crm_pipeline;
