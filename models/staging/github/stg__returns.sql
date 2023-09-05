with source_data as (
select
   *

from {{ ref('returns') }}
)

select
   return_id
  ,order_id
  ,provider_id
  ,shop_id 
  ,destination_id
  ,is_gift_return
  ,is_in_store_return
  ,return_policy
  ,return_state
  ,item_count 
  ,exchange_value_usd
  ,return_price_usd
  ,refund_value_usd
  ,total_shop_currency
  ,cast(rtrim(return_created_at, ' UTC') as datetime) as return_created_at
  ,cast(rtrim(return_processed_at, ' UTC') as datetime) as return_processed_at
from source_data
