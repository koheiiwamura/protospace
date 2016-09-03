require 'rails_helper'


describe Image do
  describe '#create' do
    it 'has the wrong content format' do
      extend ActionDispatch::TestProcess
      image = build(:image, :main, image: fixture_file_upload("img/sample_avatar.jpp", 'image/jpp'))
      image.valid?
      expect(image.errors[:image]).to include("You are not allowed to upload \"jpp\" files, allowed types: jpg, jpeg, gif, png")
    end
    context 'with valid attributes' do
      it 'has a valid factory' do
        prototype = create(:prototype)
        image = create(:image, :main, prototype: prototype)
        expect(image.prototype).to eq prototype
      end
    end
    context 'without image attribute' do
      it 'returns error' do
        image = build(:image, :main, image:nil)
        image.valid?
        expect(image.errors[:image]).to include("can't be blank")
      end
    end
    context 'without roll attribute' do
      it 'returns error' do
        image = build(:image, roll: nil)
        image.valid?
        expect(image.errors[:roll]).to include("can't be blank")
      end
    end
  end
end