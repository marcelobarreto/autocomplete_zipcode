# frozen_string_literal: true

require 'autocomplete_zipcode/version'
require 'rails'

module AutocompleteZipcode
  if defined?(SimpleForm)
    autoload :ZipcodeInput, 'app/inputs/autocomplete_zipcode/zipcode_input'
    autoload :StreetInput, 'app/inputs/autocomplete_zipcode/street_input'
    autoload :NeighborhoodInput, 'app/inputs/autocomplete_zipcode/neighborhood_input'
    autoload :CityInput, 'app/inputs/autocomplete_zipcode/city_input'
    autoload :StateInput, 'app/inputs/autocomplete_zipcode/state_input'
    autoload :StateSelectInput, 'app/inputs/autocomplete_zipcode/state_select_input'
    autoload :IbgeInput, 'app/inputs/autocomplete_zipcode/ibge_input'
  end
end
