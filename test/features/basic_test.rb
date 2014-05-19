require 'test_helper'

feature 'I have an app' do

  before do
    Word.create spelling: 'awesome'
  end

  after do
    Word.delete_all
  end

  scenario 'cool' do
    visit root_path
    page.status_code.must_equal 200
  end
end
