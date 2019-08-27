require "autocomplete_zipcode/version"

[:zipcode, :street, :neighborhood, :city, :state, :ibge].each do |input|
  autoload :"#{input.capitalize}Input", "autocomplete_zipcode/simple_form/#{input}_input"
end

module AutocompleteZicode
  class Engine < ::Rails::Engine; end
end
