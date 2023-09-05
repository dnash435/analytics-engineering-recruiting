with source_data as (
select
   *

from {{ ref('merchants') }}
)

select
  shop_id
  ,provider_id
  ,benchmark_vertical
  ,merchant_currency
  ,merchant_currency_symbol  
  ,msm_market_segment
  ,is_portal_active
  ,merchant_created_at
  ,merchant_updated_at
  
from source_data
