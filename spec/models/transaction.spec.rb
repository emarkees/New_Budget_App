require 'rails_helper'

RSpec.describe Transaction, type: :model do
  let(:user) { User.create(name: 'Sammed', email: 'sammed@test.com', password: '1234test') }
  let(:category) { Category.create(name: 'Mc Donald') }

  subject do
    Transaction.create(user: user, name: 'Ice cream', amount: 24, category_id: category.id)
  end

  context '#validation' do
    it 'should accept user, name, amount, category' do
      expect(subject).to_not be_valid
    end

    it 'should validate_presence_of(:name)' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should validate_presence_of(:amount)' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end

    it 'should validate_presence_of(:user)' do
      subject.user = nil
      expect(subject).to_not be_valid
    end

    it 'should validate_presence_of(:category)' do
      subject.category = nil
      expect(subject).to_not be_valid
    end
  end

  context '#association' do
    it 'should confirm category belongs to a user' do
      expect(subject.user).to eq(user)
    end

    it 'should confirm user name' do
      expect(subject.user.name).to eq('Sammed')
    end

    
  end
end
