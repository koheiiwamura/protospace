require 'rails_helper'


describe User do
  describe '#create' do
    describe 'with valid attribute' do
      it "is invalid with all information" do
        user = build(:user)
        expect(user).to be_valid
      end
    end
    describe 'without valid attribute' do
      it 'is invalid without an username' do
        user = build(:user, username:"")
        user.valid?
        expect(user.errors[:username]).to include("can't be blank")
      end
      it "is invalid without a email" do
        user = build(:user, email:"")
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end
      it "is invalid without a password" do
        user = build(:user, password:"")
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end
      it "is invalid without password_confirmation" do
        user = build(:user, password_confirmation:"")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("doesn't match Password")
      end
      it "is invalid without a member" do
        user = build(:user, member:"")
        user.valid?
        expect(user.errors[:member]).to include("can't be blank")
      end
      it "is invalid without a profile" do
        user = build(:user, profile:"")
        user.valid?
        expect(user.errors[:profile]).to include("can't be blank")
      end
      it "is invalid without a works" do
        user = build(:user, works:"")
        user.valid?
        expect(user.errors[:works]).to include("can't be blank")
      end
      it "is invalid with duplicate email" do
        user = create(:user)
        another_user = build(:user, email:user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("has already been taken")
      end
      it "is invalid without password over 8 characters" do
        user = build(:user,password:"aaaaaaaa",password_confirmation:"aaaaaaaa")
        expect(user).to be_valid
      end
      it "is invalid with a password that has less than 7 characters " do
        user = build(:user, password: "0000000", password_confirmation: "0000000")
        user.valid?
        expect(user.errors[:password][0]).to include("is too short")
      end
    end
  end
end