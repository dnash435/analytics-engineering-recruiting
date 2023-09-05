select 
  o.order_id
  ,m.shop_id
  ,o.provider_id
  ,r.order_id as return_order_id
  ,m.benchmark_vertical
  ,json_value(r.return_policy, '$.gift_cards_enabled') AS gift_cards_enabled
  ,json_value(r.return_policy, '$.instant_exchange_enabled') AS instant_exchange_enabled
  ,json_value(r.return_policy, '$.refunds_enabled') AS refunds_enabled
  ,json_value(r.return_policy, '$.keep_item_threshold') AS keep_item_threshold
  ,json_value(r.return_policy, '$.persistent_credit_enabled') AS persistent_credit_enabled
  ,o.line_item_count as order_line_item_count
  ,o.gross_merchandise_value_usd
  ,cast(o.order_created_at as date) as order_date
  ,min(cast(r.return_created_at as date)) as return_date
from {{ref("stg__orders")}} o
left join {{ref("stg__returns")}} r
  on o.provider_id=r.provider_id
join {{ref("stg__merchants")}} m 
  on o.shop_id=m.shop_id
group by 1,2,3,4,5,6,7,8,9,10,11,12,13