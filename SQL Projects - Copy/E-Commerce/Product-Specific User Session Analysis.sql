                                     --Product-Specific User Session Analysis with SQL


create temporary table landingpage
select website_session_id,
pageview_url,
max(case when pageview_url = '/the-original-mr-fuzzy' then website_pageview_id
when pageview_url = '/the-forever-love-bear' then website_pageview_id else null
 end) as mrfuzzy_lovebear

from website_pageviews
where created_at < '2013-04-10'
 and created_at > '2013-01-6'
group by website_session_id,pageview_url
 having mrfuzzy_lovebear is not null

 ;

-- We show the total of sessions for each product and for all the pages clicked after the product pages.
-- We calculate the funnel of each page relative to the main pages of the either of the two products.alter
-- Thus the funnel of each page is not relative to the previous page.alter
select
pageview_url,

max(cart_page) as to_cart_page,
max(cart_page)/Total_sessions as CVR_cart_page,
max(shipping_page) as to_shipping_page ,
max(shipping_page)/Total_sessions as CVR_shipping_page,
max(billing_page) as to_billing_page,
max(billing_page)/Total_sessions as CVR_billing_page,
max(thankyou_page) as to_thankyou_page,
max(thankyou_page)/Total_sessions as CVR_thankyou_page
from(
select 
landingpage.pageview_url,
-- landingpage.website_session_id,
   
    
    count(distinct landingpage.website_session_id) as Total_sessions,
	sum(CASE WHEN website_pageviews.pageview_url = '/cart' and website_pageviews.website_pageview_id > landingpage.mrfuzzy_lovebear THEN 1 else 0 END) AS cart_page,
	sum(CASE WHEN website_pageviews.pageview_url = '/shipping' and website_pageviews.website_pageview_id > landingpage.mrfuzzy_lovebear THEN 1 else 0  END) AS shipping_page,
	sum(CASE WHEN website_pageviews.pageview_url = '/billing-2' and website_pageviews.website_pageview_id > landingpage.mrfuzzy_lovebear THEN 1 else 0  END) AS billing_page,
	sum(CASE WHEN website_pageviews.pageview_url = '/thank-you-for-your-order' and website_pageviews.website_pageview_id > landingpage.mrfuzzy_lovebear THEN 1 else 0 END) AS thankyou_page
    from landingpage join website_pageviews on landingpage.website_session_id = website_pageviews.website_session_id
     group by landingpage.pageview_url
    )
    as model 
    group by pageview_url;
