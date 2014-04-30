require 'test_helper'

feature 'I have an app' do
  scenario 'cool' do
    visit root_path
    page.status_code.must_equal 200
  end
end
