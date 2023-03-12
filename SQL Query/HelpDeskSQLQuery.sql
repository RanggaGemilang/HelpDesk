/****** DATA WRANGLING with SQL ******/
SELECT
	  [ticket_number],
	  CONCAT([requestor_fname], ' ', [requestor_lname]) AS requestor_name, /** Concating First Name with the Last Name**/
      [owner_group],
      [issue_category],
      [ticket_type],
	  CASE 
		WHEN [severity] like '%Low' THEN 'Low'
		WHEN [severity] like '%Medium' THEN 'Medium'
		WHEN [severity] like '%High' THEN 'High'
		ELSE 'Unassigned' END AS severity, /** Re-categorize the Severity Table **/
	  CASE 
		WHEN [severity] like '1%' THEN '1'
		WHEN [severity] like '2%' THEN '2'
		WHEN [severity] like '3%' THEN '3'
		ELSE '0' END AS severity_num, /** Re-categorize the Severity Table **/
      [days_open],
      CASE 
		WHEN [statisfaction_score] like '%Unknown' THEN 'Unknown'
		WHEN [statisfaction_score] like '%Unsatisfied' THEN 'Unsatisfied'
		ELSE 'Satisfied' END AS satisfaction_ind, /** Re-categorize the Satisfaction Table **/
      [ticket_status],
      [created_date]
  FROM [CustomerData].[dbo].[Help Desk]