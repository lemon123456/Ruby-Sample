require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  before {@user = User.new(name: "Example User", email: "user@example.com")}

	subject {@user}

	it {should respond_to(:name)}
	it {should respond_to(:email)}

	it {should be_valid}

	describe "When name is not present" do 
		before {@user.name = ""}
		it {should_not be_valid}
	end

	describe "When name is too long" do
		before {@user.name = "a"*51}
		it {should_not be_valid}
	end


	describe "When email is not present" do
		before {@user.email = ""}		
		it {should_not be_valid}
	end

	describe "When email format is invalid" do
		it "should be invalid" do
			addresses = %w[user@foo,com user_at_foo.org example.user@foo.foo@bar_bar.com foo@bar+baz.com]
			addresses.each do |invalid_address|
				@user.email = invalid_address
				expect(@user).not_to be_valid
			end 
		end
	end

	describe "When email format is valid" do
		it "should be valid" do
			addresses = %w[user@foo.bar.org.com aliya@ximalah.org]
			addresses.each do |valid_address|
				@user.email = valid_address
				expect(@user).to be_valid
			end
		end
	end

	describe "When email address is already taken" do
		before do
			user_with_same_email = @user.dup
			user_with_same_email.email = @user.email.upcase
			user_with_same_email.save
		end
		it {should_not be_valid}
	end


end
