# frozen_string_literal: true

require 'spec_helper'
require 'pry'
require_relative "#{Rails.root}/../../app/inputs/autocomplete_zipcode/city_input"

describe AutocompleteZipcode::CityInput do
  let(:mock) { OpenStruct.new(text_field: 1) }
  let(:subject) { described_class.new(mock, nil, nil, nil).input({}) }

  describe 'it has autocomplete_zipcode data attributes' do
    it { expect(subject[:data]).to eq({ autocomplete_zipcode_provider: :city }) }
  end
end