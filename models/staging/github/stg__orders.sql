with source_data as (
select
   *

from {{ ref('orders') }}
)


select
   order_id
  ,provider_id   
  ,shop_id  
  ,fulfillment_status
  ,processing_method
  ,sales_channel   
  ,source_name
  ,line_item_count
  ,gross_merchandise_value_usd
  ,order_created_at  
  ,order_processed_at
from source_data