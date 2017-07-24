require 'rails_helper'

RSpec.describe Hero, type: :model do
  
    before(:each) do
        @it = FactoryGirl.build(:hero)
    end

    it 'should be valid from factory' do
        expect(@it).to be_valid
    end

    it 'should have a name attribute' do
        expect(@it).to respond_to(:name)
    end

    describe 'name' do
        it 'should be required' do
            @it.name=nil
            expect(@it).to_not be_valid
        end
    end

end
