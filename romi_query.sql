( 	select ad_date,
			SUM(value)/SUM(spend) ::NUMERIC as Romi
	
			from facebook_ads_basic_daily 
	join facebook_campaign ON facebook_ads_basic_daily.campaign_id = facebook_campaign.campaign_id 
	join facebook_adset ON facebook_ads_basic_daily.adset_id = facebook_adset.adset_id 
	group by ad_date
	having SUM(spend) > 0
)

union all

(	select ad_date,
			SUM(value)/SUM(spend) ::NUMERIC as Romi

	from google_ads_basic_daily 
	group by ad_date
	having SUM(spend) > 0
)

order by romi desc
limit 5;
