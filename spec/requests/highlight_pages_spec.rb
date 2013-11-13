require 'spec_helper' 

describe 'Highlight pages' do
  let(:user)        { FactoryGirl.create(:user) }
  let(:user2)       { FactoryGirl.create(:user) }
  let(:highlight)   { FactoryGirl.create(:highlight, user_id: user.id) }
  let(:highlight2)  { FactoryGirl.create(:highlight, user_id: user2.id) }
  
  subject { page }
  
  describe 'ones own show page as a logged in user' do
    before do
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'
      visit user_highlight_path(user, highlight)
    end
    
    it { should have_link('Edit') }
    it { should have_link('See All Highlights') }
     
    
  end
  
  describe 'someone elses show page as a logged in user' do
    before do
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'
      visit user_highlight_path(user2, highlight2)
    end
    
    it { should_not have_link('Edit') }
    it { should have_link('See All Highlights') }
  end
  
  describe 'someone elses show page as a guest user' do
    before { visit user_highlight_path(user, highlight) }
    
    it { should_not have_link('Edit') }
    it { should have_link('See All Highlights') } 
  end
  
  describe 'ones own highlights#index action' do
    before do
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'
      visit user_highlights_path(user)
    end
    it { should have_selector('h3', text: 'Create a new highlight!') }
    it { should have_link('Back to users') }
  end
  
  describe 'someone elses highlights#index action' do
    before do
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'
      visit user_highlights_path(user2)
    end
    
    it { should_not have_selector('h3', text: 'Create a new highlight!') }
    it { should have_link('Back to users') }
  end
  
  
end

















