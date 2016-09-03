require 'rails_helper'

describe Prototype do
  describe 'associations' do
    context 'with comments' do
      let!(:prototype) { create(:prototype, :prototype_with_comments) }
      it 'deletes the comments when prototype is deleted' do
        expect { prototype.destroy }.to change { Comment.count }.by(-1)
      end
    end
    context 'with comments' do
      let!(:prototype) { create(:prototype, :prototype_with_likes) }
      it 'deletes the likes when prototype is deleted' do
        expect { prototype.destroy }.to change { Like.count }.by(-1)
      end
    end
  end
  describe "validations" do
    describe 'with valid attributes' do
      it "is invalid with all information" do
        prototype = build(:prototype)
        expect(prototype).to be_valid
      end
    end
    describe 'without valid attributes' do
      it 'is invalid without a title' do
        prototype = build(:prototype, title:"")
        prototype.valid?
        expect(prototype.errors[:title]).to include("can't be blank")
      end
      it 'is invalid without a catch_copy' do
        prototype = build(:prototype, catch_copy:"")
        prototype.valid?
        expect(prototype.errors[:catch_copy]).to include("can't be blank")
      end
      it 'is invalid without a concept' do
        prototype = build(:prototype, concept:"")
        prototype.valid?
        expect(prototype.errors[:concept]).to include("can't be blank")
      end
    end
    describe '#liked_by' do
      context 'when liked by a user' do
        it 'returns true' do
          user = create(:user)
          prototype = create(:prototype, user:user)
          like = create(:like, prototype:prototype, user: user)
          expect(prototype.like_user(user.id)).to be_truthy
        end
      end
      context 'when not liked by a user' do
        it 'returns nil' do
          user = create(:user, email:"aaaaa@gmail.com")
          another_user = create(:user, email:"bbbbb@gmail.com")
          prototype = create(:prototype, user:user)
          like = create(:like, prototype:prototype, user: another_user)
          expect(prototype.like_user(user.id)).to be_falsey
        end
      end
    end
    describe '#reject_sub_images(attributed)' do
      context 'doesn’t save a record with nil content' do
        it 'returns error' do
          image = build(:image, :sub, image:nil)
          image.valid?
          expect(image.errors[:image]).to include("can't be blank")
        end
      end
    end
  end
end