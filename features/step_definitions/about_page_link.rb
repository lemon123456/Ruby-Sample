Given /^a user visits the home page$/ do
  visit root_path
end

When /^he click on the about page link$/ do
  click_link('About')
end

Then /^he should see "About Us" on the page$/ do
  page.has_content?("About Us")
end
