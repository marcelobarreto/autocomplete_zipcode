# frozen_string_literal: true

require 'spec_helper'

describe AutocompleteZipcode::StateSelectInput do
  let(:mock) { {}}
  before { allow(mock).to receive(:collection_select).and_return({ data: { autocomplete_zipcode_provider: :state } }) }

  let(:subject) { described_class.new(mock, nil, nil, nil).input({}) }

  describe 'it has autocomplete_zipcode data attributes' do
    it { expect(subject[:data]).to eq({ autocomplete_zipcode_provider: :state }) }
  end
end