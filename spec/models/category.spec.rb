require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.create(name: 'John', email: 'john@test.com', password: '1234test') }

  subject do
    Category.create(user: user, name: 'Food', icon: 'https://unsplash.com/photos/USAT3jVsYIc')
  end

  context '#validation' do
    it 'should accept user, name, and icon' do
      expect(subject).to be_valid
    end

    it 'should validate_presence_of(:name)' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should validate_presence_of(:name)' do
      subject.icon = nil
      expect(subject).to_not be_valid
    end
  end

  context '#association' do
    it 'should confirm category belong to an user' do
      expect(subject.user).to eq(user)
    end

    it 'should confirm user name' do
      expect(subject.user.name).to eq('John')
    end
  end
end