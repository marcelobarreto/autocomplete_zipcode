# frozen_string_literal: true

require 'spec_helper'

describe AutocompleteZipcode::ZipcodeInput do
  let(:mock) { {} }
  let(:data) { { autocomplete_zipcode_provider: :zipcode } }
  before { allow(mock).to receive(:text_field).and_return({ data: data }) }
  let(:subject) { described_class.new(mock, nil, nil, nil).input({}) }

  describe 'it has autocomplete_zipcode data attributes' do
    it { expect(subject[:data]).to eq(data) }
  end
end