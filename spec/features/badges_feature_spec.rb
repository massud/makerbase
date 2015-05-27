require 'rails_helper'

feature 'Badges' do

  include OmniauthHelper
  include UsersHelper

  before(:each) do
    oauth_sign_in
  end

  after(:each) do
    oauth_sign_out
  end

  context 'badges have been added' do

    before do
      Badge.create(name: 'Welcome')
    end

  scenario 'displaying a welcome badge' do

    visit '/badges'
    expect(page).to have_content 'Welcome'
    end
  end

  context 'viewing badges' do

    let!(:welcome){ Badge.create(name: 'Welcome')}

    scenario 'lets a user view a badge' do
      visit '/badges'
      click_link 'Welcome'
      expect(page).to have_content 'Welcome'
      expect(current_path).to eq "/badges/#{welcome.id}"
    end
  end
end