               -- Investigating Bounce Rates: An Analysis of Landing Page Performance under Equal Traffic Distribution




create temporary table first_pageviews_demo 
SELECT 
    wp.website_session_id,
    MIN( wp.website_pageview_id) AS min_pageview_id
  
FROM
    website_pageviews wp
        INNER JOIN
    website_sessions ws ON wp.website_session_id = ws.website_session_id -- to prohibit inconsistencies between registered sessions in two tables.
WHERE                                                                    -- sessions_id in website_sessions are grouped. but in website_pageviews they make a row for each page visit.

    ws.created_at  <  '2012-07-28'
    and wp.website_pageview_id > 23504
    and utm_source='gsearch'
    and utm_campaign='nonbrand'
GROUP BY wp.website_session_id;

-- next, we'll bring in the landing page to each session - Deriving landing page based on min of page id in each session.

 create temporary table session_w_landing_page_demo
SELECT 
    first_pageviews_demo.website_session_id,
    website_pageviews.pageview_url AS landing_page
FROM
    first_pageviews_demo
        LEFT JOIN
    website_pageviews ON website_pageviews.website_pageview_id = first_pageviews_demo.min_pageview_id;
    
    
 Create temporary table bounced_sessions_only

SELECT 
    session_w_landing_page_demo.website_session_id,
    session_w_landing_page_demo.landing_page,
    COUNT(website_pageviews.website_pageview_id) AS count_of_pages_viewed
FROM
    session_w_landing_page_demo
        LEFT JOIN
    website_pageviews ON website_pageviews.website_session_id = session_w_landing_page_demo.website_session_id
    -- all non-aggregated select clauses have to be in the group
GROUP BY session_w_landing_page_demo.website_session_id , session_w_landing_page_demo.landing_page
HAVING COUNT(website_pageviews.website_pageview_id) = 1;
    

-- final output
   -- add a bounce rate column and group by landing page
   -- only for /lander-1' or '/home'

 SELECT 
    session_w_landing_page_demo.landing_page,
    session_w_landing_page_demo.website_session_id,
    bounced_sessions_only.website_session_id AS bounced_website_session_id
FROM
    session_w_landing_page_demo
        LEFT JOIN
    bounced_sessions_only ON session_w_landing_page_demo.website_session_id = bounced_sessions_only.website_session_id
ORDER BY session_w_landing_page_demo.website_session_id

;
 SELECT 
    session_w_landing_page_demo.landing_page,
    COUNT(DISTINCT session_w_landing_page_demo.website_session_id) AS sessions,
    COUNT(DISTINCT bounced_sessions_only.website_session_id) AS bounced_session,
    COUNT(DISTINCT bounced_sessions_only.website_session_id) / COUNT(DISTINCT session_w_landing_page_demo.website_session_id) AS bounced_rates
FROM
    session_w_landing_page_demo
        LEFT JOIN
    bounced_sessions_only ON session_w_landing_page_demo.website_session_id = bounced_sessions_only.website_session_id
    -- where session_w_landing_page_demo.landing_page = '/home' 
GROUP BY session_w_landing_page_demo.landing_page

 
;
