require "spec_helper"

feature "motivational quote is produced at random" do
  #as a non-morning person
  #I need some encouragement in the morning
  #to get my day started off right

  #Acceptance Criteria:
  # I can read an inspiring quote when I visit the home page

  scenario "a random motivational quote appears every visit to the page" do
    visit '/'
    expect(page).to have_content(/Advice of the day: .+/)
   end
 end
