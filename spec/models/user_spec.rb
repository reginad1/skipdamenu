require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Attributes" do
    it "has email" do
      email ="jail@bad.com"
      user = create(:user,email:email)
      expect(user.email).to eq email
    end
    it "has password" do
      password ="asdfghjklqwertyuiop"
      user = create(:user,password:password)
      expect(user.password).to eq password
    end
  end

  describe "methods" do
    it "has email_required?" do
      user = create(:user)
      pending("don't know how to test this")
      expect(user.email_required?).to eq email
    end
    it "has password_required?" do
      user = create(:user)
      pending("don't know how to test this")
      expect(user.password_required?).to eq password
    end
    it "has email_required?" do
      pending("don't know how to test this")
      expect(User.from_omniauth(auth)).to eq email
    end
  end
end
