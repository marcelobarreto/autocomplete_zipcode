# frozen_string_literal: true

require 'autocomplete_zipcode/version'

module AutocompleteZipcode
  class Engine < ::Rails::Engine; end
end

autoload :ZipcodeInput, "autocomplete_zipcode/simple_form/zipcode_input"
autoload :StreetInput, "autocomplete_zipcode/simple_form/street_input"
autoload :NeighborhoodInput, "autocomplete_zipcode/simple_form/neighborhood_input"
autoload :CityInput, "autocomplete_zipcode/simple_form/city_input"
autoload :StateInput, "autocomplete_zipcode/simple_form/state_input"
autoload :StateSelectInput, "autocomplete_zipcode/simple_form/state_select_input"
autoload :IbgeInput, "autocomplete_zipcode/simple_form/ibge_input"
