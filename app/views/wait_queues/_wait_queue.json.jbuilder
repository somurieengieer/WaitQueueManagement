json.extract! wait_queue, :id, :name, :count, :admin_id, :reset_time, :auto_reset, :created_at, :updated_at
json.url wait_queue_url(wait_queue, format: :json)
