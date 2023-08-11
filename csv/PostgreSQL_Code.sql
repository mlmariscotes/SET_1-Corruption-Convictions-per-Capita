SELECT * FROM state_income

WITH totals AS (
    SELECT
        SUM(average_income + minimum_income + maximum_income) AS total_income_all_states,
        SUM(conviction_per_capita) AS total_convictions_all_states
    FROM state_income
)
SELECT 
    state_usa, average_income, minimum_income, maximum_income, conviction_per_capita,
    (average_income + minimum_income + maximum_income) AS total_income_state,
    ROUND(((average_income + minimum_income + maximum_income) / total_income_all_states), 4) * 100 AS percentage_income_state,
    ROUND((conviction_per_capita / total_convictions_all_states) * 100, 4) AS percentage_convictions_state
FROM state_income, totals


