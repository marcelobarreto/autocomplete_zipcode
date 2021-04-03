# frozen_string_literal: true

module AutocompleteZipcode
  class CityInput < SimpleForm::Inputs::StringInput
    def input(wrapper_options)
      input_html_options[:data] ||= {}
      input_html_options[:data][:autocomplete_zipcode_provider] = :city
      super
    end
  end
end
