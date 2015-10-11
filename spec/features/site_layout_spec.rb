require 'rails_helper'

RSpec.feature 'layout list' do
  scenario 'visits root path' do
    visit root_path
    expect(page).to have_content('Welcome')
  end
end