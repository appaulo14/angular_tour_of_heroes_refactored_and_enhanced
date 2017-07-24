require 'spec_helper'

FactoryGirl.define do
    factory :hero do
      name                      {Faker::Name.name}
    end    
end
