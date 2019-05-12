class MkRoom < ActiveRecord::Base
    has_many :user
    has_one :list
end
