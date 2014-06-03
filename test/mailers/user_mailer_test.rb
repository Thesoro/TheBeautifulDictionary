require "test_helper"

feature "Word Request Mailer Test" do
  scenario "submit form data to request a new word for the dictionary" do
    # When I visit /messages
    visit new_message_path

    # Then the existing posts should be loaded
    fill_in "Your name", with: comments(:lana).author_email
    fill_in "Your email", with: comments(:lana).author_email
    fill_in "Your request", with: comments(:lana).content

    # When I submit the form
    click_on "Submit your request"
    page.text.must_include "Your request has been sent! Thanks for contacting us."
  end
end
