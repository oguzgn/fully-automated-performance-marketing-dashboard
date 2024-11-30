WITH
  temp1 AS (
  SELECT
    tmain.Date,
    CASE
      WHEN tmain.Source___Medium LIKE '%cpc%' THEN "Paid"
      WHEN tmain.Source___Medium LIKE '%googleads.g.doubleclick.net%' THEN "Paid"
      WHEN tmain.Source___Medium LIKE '%tpc.googlesyndication.com%' THEN "Paid"
      WHEN tmain.Source___Medium LIKE '%safeframe.googlesyndication.com%' THEN "Paid"
      WHEN tmain.Source___Medium LIKE '%taboola%' THEN "Paid"
      WHEN tmain.Source___Medium LIKE '%affiliate%' THEN "Affiliate"
      WHEN tmain.Source___Medium LIKE '%partnership%' THEN "Partnership"
    ELSE
      "Non-paid"
    END AS Channel_Group,
    CASE
      WHEN tmain.Source___Medium LIKE '%google / cpc%' OR 
           tmain.Source___Medium LIKE '%googleads.g.doubleclick.net%' OR 
           tmain.Source___Medium LIKE '%tpc.googlesyndication.com%' OR 
           tmain.Source___Medium LIKE '%safeframe.googlesyndication.com%' THEN "Google Paid"
      WHEN tmain.Source___Medium LIKE '%facebook / cpc%' THEN "Facebook Paid"
      WHEN tmain.Source___Medium LIKE '%taboola%' THEN "Taboola Paid"
      WHEN tmain.Source___Medium LIKE '%tiktok / cpc%' THEN "Tiktok Paid"
      WHEN tmain.Source___Medium LIKE '%direct%' THEN "Direct"
      WHEN tmain.Source___Medium LIKE '%google / organic%' OR 
           tmain.Source___Medium LIKE '%bing%' OR 
           tmain.Source___Medium LIKE '%yahoo%' OR 
           tmain.Source___Medium LIKE '%yandex%' OR 
           tmain.Source___Medium LIKE '%duckduckgo%' OR 
           tmain.Source___Medium LIKE '%baidu%' THEN "Search Engines"
      WHEN tmain.Source___Medium LIKE '%affiliate%' THEN "Affiliate"
      WHEN tmain.Source___Medium LIKE '%partnership%' THEN "Partnership"
      WHEN tmain.Source___Medium LIKE '%IGShopping%' THEN "Instagram Shop"
      WHEN tmain.Source___Medium LIKE '%instagram%' OR 
           tmain.Source___Medium LIKE '%facebook%' THEN "Social Media"
      WHEN tmain.Source___Medium LIKE '%youtube / referral%' THEN "Social Media"
      WHEN tmain.Source___Medium LIKE '%share_button%' THEN "Share Button"
      WHEN tmain.Source___Medium LIKE '% / email%' THEN "E-mail"
      WHEN tmain.Source___Medium LIKE '% / offline%' THEN "Offline"
      WHEN tmain.Source___Medium LIKE '% / referral%' THEN "Referral"
      WHEN tmain.Source___Medium LIKE '%twitter / cpc%' THEN "Twitter Paid"
    ELSE
      "Others"
    END AS Channel,
    CASE
      WHEN tmain.campaign LIKE '%sales%' THEN "Sales"
      WHEN tmain.campaign LIKE '%purchase%' THEN "Purchase"
      WHEN tmain.campaign LIKE '%brandkwd%' THEN "Brand Keyword"
      WHEN tmain.campaign LIKE '%brand%' THEN "Brand"
    ELSE
    "Not Identified"
	  END
    AS Objective,
		CASE
      WHEN tmain.campaign LIKE 'tr-%' THEN "TR"
    ELSE
    "Not Identified"
	  END
    AS Country,
	  CASE
      WHEN tmain.campaign LIKE '%-ist-%' THEN "İstanbul"
      WHEN tmain.campaign LIKE '%-ank-%' THEN "Ankara"
      WHEN tmain.campaign LIKE '%-brs-%' THEN "Bursa"
      WHEN tmain.campaign LIKE '%-izm-%' THEN "İzmir"
      WHEN tmain.campaign LIKE '%-mar-%' THEN "Marmara"
    ELSE
    "Not Identified"
	  END
    AS City,
	  CASE
      WHEN tmain.campaign LIKE '%-broad-%' THEN "Broad"
      WHEN tmain.campaign LIKE '%-daba-%' THEN "DABA"
      WHEN tmain.campaign LIKE '%-target-%' THEN "Target"
      WHEN tmain.campaign LIKE '%-lookalike-%' THEN "Lookalike"
      WHEN tmain.campaign LIKE '%-remarketing-%' THEN "Remarketing"
      WHEN tmain.campaign LIKE '%-rm-%' THEN "Remarketing"
      WHEN tmain.campaign LIKE '%-searchintent_trans-%' THEN "Search - Transactional"
    ELSE
    "Not Identified"
	  END
    AS Audience,
	  CASE
      WHEN tmain.campaign LIKE '%-discovery-%' THEN "Discovery"
      WHEN tmain.campaign LIKE '%-display-%' THEN "Display"
      WHEN tmain.campaign LIKE '%-pmax-%' THEN "Pmax"
      WHEN tmain.campaign LIKE '%-search-%' THEN "Search"
      WHEN tmain.campaign LIKE '%-youtube-%' THEN "Youtube"
      WHEN tmain.campaign LIKE '%-facebook-%' THEN "Facebook"
      WHEN tmain.campaign LIKE '%-tiktok-%' THEN "Tiktok"
      WHEN tmain.campaign LIKE '%-native-%' THEN "Native"
      WHEN tmain.campaign LIKE '%-twitter-%' THEN "Twitter"
      WHEN tmain.campaign LIKE '%-all-%' THEN "All"
    ELSE
    "Not Identified"
	  END
    AS Network,
	  CASE
      WHEN tmain.campaign LIKE '%-tr-%' THEN "TR"
      WHEN tmain.campaign LIKE '%-en-%' THEN "EN"
      WHEN tmain.campaign LIKE '%-ar-%' THEN "AR"
    ELSE
    "Not Identified"
	  END
    AS LANGUAGE,
	  CASE
      WHEN tmain.campaign LIKE '%-top-%' THEN "Top"
      WHEN tmain.campaign LIKE '%-mid-%' THEN "Mid"
      WHEN tmain.campaign LIKE '%-low-%' THEN "Low"
    ELSE
    "Not Identified"
	  END
    AS Funnel_Stage,
	  CASE
      WHEN tmain.campaign LIKE '%-ao_%' THEN "Always On"
    ELSE
    "Not Identified"
	  END
    AS End_time,
	  CASE
      WHEN tmain.campaign LIKE '%_auc_%' THEN "Auction"
      WHEN tmain.campaign LIKE '%_rf_%' THEN "Reach & Frequency"
    ELSE
    "Not Identified"
		END
    AS Buying_type,
	  CASE
      WHEN tmain.campaign LIKE '%_awareness_%' THEN "Awareness"
      WHEN tmain.campaign LIKE '%_reach_%' THEN "Reach"
      WHEN tmain.campaign LIKE '%_traffic_%' THEN "Traffic"
      WHEN tmain.campaign LIKE '%_engagement_%' THEN "Engagement"
      WHEN tmain.campaign LIKE '%_app_%' THEN "App"
      WHEN tmain.campaign LIKE '%_video_%' THEN "Video"
      WHEN tmain.campaign LIKE '%\\_lead_%' THEN "Lead"
      WHEN tmain.campaign LIKE '%_messages_%' THEN "Messages"
      WHEN tmain.campaign LIKE '%_conversions_%' THEN "Conversions"
      WHEN tmain.campaign LIKE '%_catalog_%' THEN "Catalog"
      WHEN tmain.campaign LIKE '%_store_%' THEN "Store"
    ELSE
    "Not Identified"
	  END
    AS Campaign_Objective,
	  CASE
      WHEN tmain.campaign LIKE '%_regs_%' THEN "Registers"
      WHEN tmain.campaign LIKE '%_schedules_%' THEN "Schedules"
      WHEN tmain.campaign LIKE '%_addtowishlist_%' THEN "Add To Wishlist"
      WHEN tmain.campaign LIKE '%_opps_%' THEN "Opps"
      WHEN tmain.campaign LIKE '%_booking_opps_%' THEN "Booking Opps"
      WHEN tmain.campaign LIKE '%_app_opps_%' THEN "Appointment Opps"
      WHEN tmain.campaign LIKE '%_finance_opps_%' THEN "Finance Opps"
      WHEN tmain.campaign LIKE '%_booking_%' THEN "Booking"
      WHEN tmain.campaign LIKE '%_appointment_%' THEN "Appointment"
    ELSE
    "Not Identified"
	  END
    AS Campaign_Optimization_Conversion,
	  CASE
      WHEN tmain.campaign LIKE '%subcatalog%' THEN "Subcatalog"
      WHEN tmain.campaign LIKE '%dynamic%' THEN "Dynamic"
      WHEN tmain.campaign LIKE '%generic%' THEN "Generic"
      WHEN tmain.campaign LIKE '%category%' THEN "Category"
      WHEN tmain.campaign LIKE '%make%' THEN "make"
    ELSE
    "Not Identified"
	  END
    AS Campaign_Content,
    SPLIT(tmain.Campaign, '|')[OFFSET(0)] AS Campaign,
    tmain.Source___Medium,
    tmain.Cost  + 
    IFNULL(tfacebook.Cost, 0) + 
    IFNULL(ttaboola.Spend, 0) + 
    IFNULL(ttiktok.Cost, 0) + 
    IFNULL(ttwitter.Cost, 0) + 
    IFNULL(tbing.Cost, 0) AS Costs_TRY,
    (tmain.Cost * 1.2 + 
     IFNULL(tfacebook.Cost, 0) + 
     IFNULL(ttaboola.Spend, 0) + 
     IFNULL(ttiktok.Cost, 0) + 
     IFNULL(ttwitter.Cost, 0) + 
     IFNULL(tbing.Cost, 0)) / tusd.USD_TL AS Costs_USD,
    tmain.Clicks + 
    IFNULL(tfacebook.Link_clicks, 0) + 
    IFNULL(ttaboola.Clicks, 0) + 
    IFNULL(ttiktok.Clicks, 0) + 
    IFNULL(ttwitter.Clicks, 0) + 
    IFNULL(tbing.Clicks, 0) AS Clicks,
    tmain.Impressions + 
    IFNULL(tfacebook.Impressions, 0) + 
    IFNULL(ttaboola.Impressions, 0) + 
    IFNULL(ttiktok.Impressions, 0) + 
    IFNULL(ttwitter.Impressions, 0) + 
    IFNULL(tbing.Impressions, 0) AS Impressions,
    tmain.Sessions,
    tmain.Bounces,
    tmain.Users,
    tmain.New_Users,
    tvip.Users AS VIP_Users,
    tquote.Users AS Quotation_Users,
    tgoal.ga_goal4Completions AS Im_interested_id4,
    tgoal.ga_goal1Completions AS Appointment_Leads_id1,
    tgoal.ga_goal7Completions AS Checkout_Leads_id7,
    tgoal.ga_goal20Completions AS Profiled_Finance_Opps_id20,
    tgoal.ga_goal19Completions AS Scheduled_Appointment_id19,
    tgoal.ga_goal8Completions AS Online_Booking_id8,
    tgoal.ga_goal9Completions AS Regs_id9,
    tgoal.ga_goal18Completions AS Scheduled_Inspection_id18,
    (tgoal.ga_goal1Completions + tgoal.ga_goal7Completions) AS Checkout_Appointment_Opps,
    (tgoal.ga_goal1Completions + tgoal.ga_goal7Completions + tgoal.ga_goal20Completions) AS Total_Opps
  FROM
    `gsheet_dataset_us.master_mains` AS tmain
  LEFT JOIN
    `gsheet_dataset_us.master_goals` AS tgoal
  ON
    tmain.Date = tgoal.Date AND 
    tmain.Campaign = tgoal.Campaign AND 
    tmain.Source___Medium = tgoal.Source___Medium
  LEFT JOIN
    `gsheet_dataset_us.master_vips` AS tvip
  ON
    tmain.Date = tvip.Date AND 
    tmain.Campaign = tvip.Campaign AND 
    tmain.Source___Medium = tvip.Source___Medium
  LEFT JOIN
    `gsheet_dataset_us.master_quotations` AS tquote
  ON
    tmain.Date = tquote.Date AND 
    tmain.Campaign = tquote.Campaign AND 
    tmain.Source___Medium = tquote.Source___Medium
  LEFT JOIN
    `gsheet_dataset_us.Facebook` AS tfacebook
  ON
    tmain.Date = tfacebook.Date AND 
    tmain.Campaign = tfacebook.Campaign_name AND 
    tmain.Source___Medium = "facebook / cpc"
  LEFT JOIN
    `gsheet_dataset_us.Taboola` AS ttaboola
  ON
    tmain.Date = ttaboola.Date AND 
    tmain.Campaign = ttaboola.Campaign_name AND 
    tmain.Source___Medium = "taboola / cpc"
  LEFT JOIN
    `gsheet_dataset_us.Tiktok` AS ttiktok
  ON
    tmain.Date = ttiktok.Date AND 
    tmain.Campaign = ttiktok.Campaign_name AND 
    tmain.Source___Medium = "tiktok / cpc"
  LEFT JOIN
    `gsheet_dataset_us.Twitter` AS ttwitter
  ON
    tmain.Date = ttwitter.Date AND 
    tmain.Campaign = ttwitter.Campaign AND 
    tmain.Source___Medium = "twitter / cpc"
  LEFT JOIN
    `gsheet_dataset_us.Bing` AS tbing
  ON
    tmain.Date = tbing.Date AND 
    tmain.Campaign = tbing.Campaign_name AND 
    tmain.Source___Medium = "bing / cpc"
  LEFT JOIN
    `BQ_growth_us.USD_TRY` AS tusd
  ON
    tmain.Date = tusd.Date
)
SELECT
  Date,
  Website,
  Channel_Group,
  Channel,
  Objective,
  Country,
  City,
  Audience,
  Network,
  LANGUAGE,
  Funnel_Stage,
  End_time,
  Buying_type,
  Campaign_Objective,
  Campaign_Optimization_Conversion,
  Campaign_Content,
  Campaign,
  Source___Medium,
  SUM(Costs_TRY) AS Costs_TRY,
  SUM(Costs_USD) AS Costs_USD,
  SUM(Clicks) AS Clicks,
  SUM(Impressions) AS Impressions,
  SUM(Sessions) AS Sessions,
  SUM(Bounces) AS Bounces,
  SUM(Users) AS Users,
  SUM(New_Users) AS New_Users,
  SUM(VIP_Users) AS VIP_Users,
  SUM(Quotation_Users) AS Quotation_Users,
  SUM(Im_interested_id4) AS Im_interested_id4,
  SUM(Appointment_Leads_id1) AS Appointment_Leads_id1,
  SUM(Checkout_Leads_id7) AS Checkout_Leads_id7,
  SUM(Profiled_Finance_Opps_id20) AS Profiled_Finance_Opps_id20,
  SUM(Scheduled_Appointment_id19) AS Scheduled_Appointment_id19,
  SUM(Online_Booking_id8) AS Online_Booking_id8,
  SUM(Regs_id9) AS Regs_id9,
  SUM(Scheduled_Inspection_id18) AS Scheduled_Inspection_id18,
  SUM(Checkout_Appointment_Opps) AS Checkout_Appointment_Opps,
  SUM(Total_Opps) AS Total_Opps
FROM
  temp1
GROUP BY
  Date,
  Website,
  Channel_Group,
  Channel,
  Objective,
  Country,
  City,
  Audience,
  Network,
  LANGUAGE,
  Funnel_Stage,
  End_time,
  Buying_type,
  Campaign_Objective,
  Campaign_Optimization_Conversion,
  Campaign_Content,
  Campaign,
  Source___Medium
ORDER BY
  date DESC;
