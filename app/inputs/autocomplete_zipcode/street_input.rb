# frozen_string_literal: true

module AutocompleteZipcode
  class StreetInput < SimpleForm::Inputs::StringInput
    def input(wrapper_options)
      input_html_options[:data] ||= {}
      input_html_options[:data][:autocomplete_zipcode_provider] = :street
      super
    end
  end
end
