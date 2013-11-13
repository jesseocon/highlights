require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.build(:user) }
  
  subject { user }
  
  it 'should respond to the correct messages' do
    should respond_to(:name) 
    should respond_to(:email) 
    should respond_to(:admin)
  end 
  
  describe 'when the name is blank' do
    before { user.name = "" }
    it { should_not be_valid }
  end

  
  describe 'the admin column should not be true by default' do
    it 'should not have the value of true' do
      user.admin.should_not be_true
    end
  end
  

end