require_relative '../spec_helper'

RSpec.shared_examples "common-rec-total" do |klass|
  subject { klass.new }

  let(:arr_01) { %w{123 + 34 + 56 + 24 + 67 - 112 + 25} }
  let(:arr_02) { %w{25 + 15 - -15 + 30 + -15 + 50 - 25} }
  let(:arr_03) { %w{25 + 50 - 15 - 10 + 25 + 75 - 50 + 15} }

  let(:arr_bad_01) { %w{+ 34 + 56 + 24 + 67 - 112 + 25} }
  let(:arr_bad_02) { %w{34 + 56 + 24 + 67 - 112 + 25 -} }
  let(:arr_bad_03) { %w{34 + +56 + 24 + 67 - 112 + 25 -} }

  context 'happy path' do
    it 'gets the right total' do
      expect(subject.rec_total(arr_01)).to eq 217
    end
  end

  context 'happy path, subtracting a negative integer' do
    it 'gets the right total' do
      expect(subject.rec_total(arr_02)).to eq 95
    end
  end

  context 'happy path, another typical example' do
    it 'gets the right total' do
      expect(subject.rec_total(arr_03)).to eq 115
    end
  end

  context 'edge case; empty array' do
    it 'gets the right total' do
      expect(subject.rec_total([])).to eq 0
    end
  end

  context 'edge case; one item in array, number' do
    it 'gets the right total' do
      expect(subject.rec_total([11])).to eq 11
    end
  end

  context 'edge case; one item in array, operator' do
    it 'raises exception' do
      expect{subject.rec_total(['+'])}.to raise_error StandardError
    end
  end

  context 'not so happy path' do
    context 'starts with operator' do
      it 'raises exception' do
        expect{subject.rec_total(arr_bad_01)}.to raise_error StandardError
      end
    end

    context 'ends with operator' do
      it 'raises exception' do
        expect{subject.rec_total(arr_bad_02)}.to raise_error StandardError
      end
    end

    context 'specifies a positive integer with a plus sign' do
      it 'raises exception' do
        expect{subject.rec_total(arr_bad_03)}.to raise_error StandardError
      end
    end
  end
end

RSpec.describe RecTotal do
  it_behaves_like "common-rec-total", RecTotal
  it_behaves_like "common-rec-total", RecTotal02
end

