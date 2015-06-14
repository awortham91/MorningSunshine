require "spec_helper"

feature "the weather forecast is displayed for the next 24 hours" do
  #as a person who gets cold easily
  #I really care about the upcoming weather
  #to know whether to call in sick

  #Acceptance Criteria:
  # I can see the forcast incremnented in an easy to interpret way
  scenario 'the weather is shown in degrees farenheit on page' do
    visit '/'
    expect(page).to have_content('°')
  end
end

feature "user is told the weather and its impact on their day" do
   #as a lazy person who still has to go to work
   #I need to know what to wear
   #because going naked to work is frowned upon

   #Acceptance Criteria:
   # I will be able to dress myself because of the text
  #  visit '/'
end
