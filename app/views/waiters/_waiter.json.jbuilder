json.extract! waiter, :id, :name, :wait_queue_id, :order_number, :created_at, :updated_at, :status
json.url waiter_url(waiter, format: :json)
