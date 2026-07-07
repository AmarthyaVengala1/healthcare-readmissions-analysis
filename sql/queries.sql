SELECT 
    r.facility_name,
    r.state,
    r.measure_name,
    r.excess_readmission_ratio,
    h.hospital_ownership,
    h.hospital_overall_rating
FROM Readmissions r
JOIN Hospital_Info h 
    ON r.facility_id = h.facility_id
LIMIT 20;


SELECT 
    state,
    ROUND(AVG(excess_readmission_ratio), 4) AS avg_excess_ratio,
    COUNT(*) AS num_records
FROM Readmissions
WHERE excess_readmission_ratio IS NOT NULL
    AND excess_readmission_ratio != 'N/A'
    AND excess_readmission_ratio != 'Too Few to Report'
GROUP BY state
ORDER BY avg_excess_ratio DESC
LIMIT 15;


SELECT 
    h.hospital_ownership,
    ROUND(AVG(r.excess_readmission_ratio), 4) AS avg_excess_ratio,
    COUNT(*) AS num_records
FROM Readmissions r
JOIN Hospital_Info h ON r.facility_id = h.facility_id
WHERE r.excess_readmission_ratio IS NOT NULL
    AND r.excess_readmission_ratio != 'N/A'
    AND r.excess_readmission_ratio != 'Too Few to Report'
GROUP BY h.hospital_ownership
ORDER BY avg_excess_ratio DESC;


SELECT 
    measure_name,
    ROUND(AVG(excess_readmission_ratio), 4) AS avg_excess_ratio,
    COUNT(*) AS num_records
FROM Readmissions
WHERE excess_readmission_ratio IS NOT NULL
    AND excess_readmission_ratio != 'N/A'
    AND excess_readmission_ratio != 'Too Few to Report'
GROUP BY measure_name
ORDER BY avg_excess_ratio DESC;


CREATE VIEW state_readmission_summary AS
SELECT 
    state,
    ROUND(AVG(excess_readmission_ratio), 4) AS avg_excess_ratio,
    COUNT(*) AS num_records
FROM Readmissions
WHERE excess_readmission_ratio IS NOT NULL
    AND excess_readmission_ratio != 'N/A'
    AND excess_readmission_ratio != 'Too Few to Report'
GROUP BY state
ORDER BY avg_excess_ratio DESC;


CREATE VIEW ownership_readmission_summary AS
SELECT 
    h.hospital_ownership,
    ROUND(AVG(r.excess_readmission_ratio), 4) AS avg_excess_ratio,
    COUNT(*) AS num_records
FROM Readmissions r
JOIN Hospital_Info h ON r.facility_id = h.facility_id
WHERE r.excess_readmission_ratio IS NOT NULL
    AND r.excess_readmission_ratio != 'N/A'
    AND r.excess_readmission_ratio != 'Too Few to Report'
GROUP BY h.hospital_ownership
ORDER BY avg_excess_ratio DESC;


CREATE VIEW condition_readmission_summary AS
SELECT 
    measure_name,
    ROUND(AVG(excess_readmission_ratio), 4) AS avg_excess_ratio,
    COUNT(*) AS num_records
FROM Readmissions
WHERE excess_readmission_ratio IS NOT NULL
    AND excess_readmission_ratio != 'N/A'
    AND excess_readmission_ratio != 'Too Few to Report'
GROUP BY measure_name
ORDER BY avg_excess_ratio DESC;


CREATE VIEW full_joined_data AS
SELECT 
    r.facility_name,
    r.state,
    r.measure_name,
    r.excess_readmission_ratio,
    r.number_of_discharges,
    r.number_of_readmissions,
    h.hospital_ownership,
    h.hospital_overall_rating,
    h.hospital_type
FROM Readmissions r
JOIN Hospital_Info h ON r.facility_id = h.facility_id
WHERE r.excess_readmission_ratio IS NOT NULL
    AND r.excess_readmission_ratio != 'N/A'
    AND r.excess_readmission_ratio != 'Too Few to Report';

