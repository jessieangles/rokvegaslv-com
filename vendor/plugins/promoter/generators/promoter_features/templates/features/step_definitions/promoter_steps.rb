Given /^that I am a web site visitor$/ do
  # Nothing needs to happen here.
end

Then /^I should see a selector "([^\"]*)"$/ do |selector|
  response.should have_selector(selector)
end
