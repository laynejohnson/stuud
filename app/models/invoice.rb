class Invoice < ApplicationRecord
  belongs_to :user
  belongs_to :client
  belongs_to :event
end
