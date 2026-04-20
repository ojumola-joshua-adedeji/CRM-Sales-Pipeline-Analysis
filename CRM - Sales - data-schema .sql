-- Create database
CREATE DATABASE CRM;

-- Use database
USE CRM;

-- Create main CRM pipeline table
CREATE TABLE crm_pipeline (
    organization VARCHAR(255),
    country VARCHAR(100),
    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6),
    industry VARCHAR(100),
    organization_size VARCHAR(50),
    owner VARCHAR(255),

    -- Dates stored initially as text (to be cleaned later)
    lead_acquisition_date VARCHAR(50),

    product VARCHAR(255),

    -- Customer lifecycle status
    status VARCHAR(50),
    status_sequence VARCHAR(50),

    -- Sales pipeline stage
    stage VARCHAR(50),
    stage_sequence VARCHAR(50),

    -- Deal metrics
    deal_value DECIMAL(12,2),
    probability_percent DECIMAL(5,2),

    -- Closing dates
    expected_close_date VARCHAR(50),
    actual_close_date VARCHAR(50)
);
