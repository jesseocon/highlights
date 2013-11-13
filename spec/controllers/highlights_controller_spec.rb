require 'spec_helper'

describe HighlightsController do
  
  let(:user1) {FactoryGirl.create(:user) }
  let(:user2) {FactoryGirl.create(:user) }
  let(:highlight) { FactoryGirl.create(:highlight, user_id: user1.id) }
  let(:highlight2) { FactoryGirl.create(:highlight, user_id: user2.id) }
  
  context 'as a guest (non-logged in user)'
  it 'can access the users index page' do
    get :index, user_id: user1.id
    response.should be_success
  end
  
  it 'can access the user show page' do
    get :show, user_id: user1.id, id: highlight.id
    response.should be_success
  end
  
  it 'cannot access the user edit page' do
    get :edit, user_id: user1.id, id: highlight.id
    response.should_not be_success
  end
  
  it 'cannot access the new page' do
    get :new, user_id: user1.id
    response.should_not be_success
  end
  
  context 'as a logged in user' do
    before { sign_in user1 }
    
    it 'can access its own highlights#index action' do
      get :index, user_id: user1.id
      response.should be_success
    end
    
    it 'can access others highlights#index action' do
      get :index, user_id: user2.id
      response.should be_success
    end
    
    it "can access it's own edit action" do
      get :edit, user_id: user1.id, id: highlight.id
      response.should be_success
    end
    
    it 'cannot access others edit action' do
      get :edit, user_id: user2.id, id: highlight2.id
      response.should_not be_success
    end
    
    it 'can access its own new action' do
      get :new, user_id: user1.id
      response.should be_success
    end
    
    it 'cannnot access others new action' do
      get :new, user_id: user2.id
      response.should_not be_success
    end
    
  end

end
