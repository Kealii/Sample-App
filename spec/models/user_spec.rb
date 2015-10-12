require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(name: "Miguel",
                     email: "miguel@abc.com",
                     password: 'password')
  end

  it 'should be valid' do
    expect(@user).to be_valid
  end

  it 'should have a name' do
    @user.name = '   '
    expect(@user).to be_invalid
  end

  it 'should have an email' do
    @user.email = '   '
    expect(@user).to be_invalid
  end

  it 'should have a name less than 51 chars' do
    @user.name = "a" * 51
    expect(@user).to be_invalid
  end

  it 'should have an email less than 256 chars' do
    @user.email = "a" * 244 + "@example.com"
    expect(@user).to be_invalid
  end

  it 'should accept valid email addresses' do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      expect(@user).to be_valid, "#{valid_address.inspect} should be valid"
    end
  end

  it 'should reject invalid email addresses' do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      expect(@user).to be_invalid
    end
  end

  it 'should reject duplicate email addresses' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    expect(duplicate_user).to be_invalid
  end

  it 'should have a non-blank password' do
    @user.password = " " * 6
    expect(@user).to be_invalid
  end

  it 'should have a password longer than 5 chars' do
    @user.password = "a" * 5
    expect(@user).to be_invalid
  end
end