require 'faker'

FactoryGirl.define do 
  factory :post do 
    type 'Status'
    body 'one two tie my shoe'
  end
end