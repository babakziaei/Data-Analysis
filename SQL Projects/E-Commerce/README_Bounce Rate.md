# Bounce Rate Analysis: Landing Page Performance Assessment under a 50/50 Traffic Distribution Scenario

## Overview:

The provided SQL script is engineered to evaluate the efficacy of two landing pages ('/home' and 'lander-1') in a context where traffic is evenly distributed between them (50/50 scenario). The script's execution progresses through four distinct steps, effectively leading to a robust understanding of user engagement and landing page retention. 

## Process Breakdown:

### Step 1: 

This step isolates the initial `website_pageview_id` for the sessions meeting our predefined criteria. To qualify, the sessions should be initiated prior to '2012-07-28', associated with a `website_pageview_id` higher than 23504, and originate from a particular Google Search campaign. The outcome of this process is temporarily housed in a table named `first_pageviews_demo`.

### Step 2: 

Utilizing the data compiled in the prior step, this phase correlates each session with the appropriate landing page. The association process occurs through matching the minimum `website_pageview_id` acquired earlier with the `website_pageview_id` in the `website_pageviews` table. The outcome is preserved in a fresh temporary table known as `session_w_landing_page_demo`.

### Step 3: 

Here, 'bounce' sessions are identified, defined as sessions during which only a single page is viewed. It employs the data from `session_w_landing_page_demo` and `website_pageviews` tables to tally the number of pages accessed in each session. Sessions wherein just one page was viewed are considered 'bounces', and this data is kept in another temporary table called `bounced_sessions_only`.

### Step 4: 

In the final step, the gathered data is aggregated to calculate the total count of sessions and bounced sessions for each landing page. The script then computes a 'bounce rate' by dividing the number of bounced sessions by the total sessions for each landing page. The resultant values are displayed for comprehensive analysis.

This SQL script heavily capitalizes on the `GROUP BY` clause and temporary tables to implement its multi-stage analytical process. The insights derived from the execution of this script can provide valuable understanding of the comparative effectiveness of different landing pages in retaining user engagement.

You can view the SQL script flow diagram in the image below for a better understanding of the process:

![Script Flow Diagram](https://github.com/babakziaei/Data-Analysis/assets/126654048/6a693d7d-ba2c-44c6-90e2-1168394d9434)
