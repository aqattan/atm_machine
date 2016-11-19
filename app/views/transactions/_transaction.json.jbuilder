json.extract! transaction, :id, :transaction_no, :ammount, :transaction_type, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)