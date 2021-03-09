# frozen_string_literal: true

RSpec.describe PrintSpeak::CategorizationService do
  let(:base) { { quantity: 1, price: 10.00 } }

  let(:general_music_cd) { base.merge(product: 'music cd') }
  let(:book) { base.merge(product: 'some type of book') }
  let(:food) { base.merge(product: 'some type of food') }
  let(:food_chocolate) { base.merge(product: 'chocolate bar') }
  let(:medical) { base.merge(product: 'some type of medical') }
  let(:medical_headache) { base.merge(product: 'headache pills') }

  let(:imported_book) { base.merge(product: 'imported book') }
  let(:imported_food) { base.merge(product: 'imported food') }
  let(:imported_medical) { base.merge(product: 'imported medical') }

  describe '#infer_category' do
    subject { described_class.infer_category(opts) }

    context 'for a book' do
      let(:opts) { book }

      it { is_expected.to eq(:book) }
    end
    context 'for a music cd' do
      let(:opts) { general_music_cd }

      it { is_expected.to eq(:general) }
    end
    context 'for some food' do
      let(:opts) { food }

      it { is_expected.to eq(:food) }
    end
    context 'for some food variant named food_chocolate' do
      let(:opts) { food_chocolate }

      it { is_expected.to eq(:food) }
    end
    context 'for some medical' do
      let(:opts) { medical }

      it { is_expected.to eq(:medical) }
    end
    context 'for some medical variant named headache pills' do
      let(:opts) { medical_headache }

      it { is_expected.to eq(:medical) }
    end
  end

  describe '#infer_imported' do
    subject { described_class.infer_imported(opts) }

    context 'local products' do
      context 'for a book' do
        let(:opts) { book }

        it { is_expected.to be_falsey }
      end
      context 'for some food' do
        let(:opts) { food }

        it { is_expected.to be_falsey }
      end
      context 'for some medical' do
        let(:opts) { medical }

        it { is_expected.to be_falsey }
      end
    end

    context 'imported products' do
      context 'for a book' do
        let(:opts) { imported_book }

        it { is_expected.to be_truthy }
      end
      context 'for some food' do
        let(:opts) { imported_food }

        it { is_expected.to be_truthy }
      end
      context 'for some medical' do
        let(:opts) { imported_medical }

        it { is_expected.to be_truthy }
      end
    end
  end
end
