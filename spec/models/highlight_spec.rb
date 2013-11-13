require 'spec_helper'

describe Highlight do
  let(:user) {FactoryGirl.create(:user) }
  let(:highlight) { FactoryGirl.create(:highlight) }
  
  subject { highlight }
  
  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:user_id) }
  
  it { should be_valid }
  
  describe 'when the title is not present' do
    before { highlight.title = '' }
    it { should_not be_valid }
  end
  
  describe 'when the description is not present' do
    before { highlight.description = '' }
    it { should_not be_valid }
  end

end
