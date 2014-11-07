RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end

def register(user,password)
  visit signup_path
  fill_in "First name", with: user.first_name
  fill_in "Last name", with: user.last_name
  fill_in "Email address", with: user.email_address
  fill_in "Password", with: user.password
  fill_in "Password confirmation", with: user.password
  click_on "Register"
end
