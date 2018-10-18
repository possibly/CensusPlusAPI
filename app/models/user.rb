class User < ApplicationRecord
  has_many :census_plus_data
  has_many :servers
  has_many :players, :through => :servers
  has_many :guilds, :through => :servers 
end
