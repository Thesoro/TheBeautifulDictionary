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

  scenario 'sign in' do
    visit root_path
    OmniAuth.config.test_mode = true
    Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
    OmniAuth.config.add_mock(:twitter,
                            {
                            uid: '12345',
                            info: { nickname: 'test_twitter_user'},
                            })
    click_on "Sign in with Twitter"
    page.must_have_content "Signed in as"
  end

  scenario 'sign out' do
    visit root_path
    OmniAuth.config.test_mode = true
    Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
    OmniAuth.config.add_mock(:twitter,
                            {
                            uid: '12345',
                            info: { nickname: 'test_twitter_user'},
                            })
    click_on "Sign in with Twitter"
    page.must_have_content "Signed in as"
    click_on "Sign out"
    page.must_have_content "Sign in with Twitter"
  end
end
