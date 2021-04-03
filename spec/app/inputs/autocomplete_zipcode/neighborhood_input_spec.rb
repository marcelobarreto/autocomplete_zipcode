# frozen_string_literal: true

require 'spec_helper'

describe AutocompleteZipcode::NeighborhoodInput do
  let(:mock) { {} }
  before { allow(mock).to receive(:text_field).and_return({ data: { autocomplete_zipcode_provider: :neighborhood } }) }
  let(:subject) { described_class.new(mock, nil, nil, nil).input({}) }

  describe 'it has autocomplete_zipcode data attributes' do
    it { expect(subject[:data]).to eq({ autocomplete_zipcode_provider: :neighborhood }) }
  end
end