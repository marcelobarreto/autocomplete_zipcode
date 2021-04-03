# frozen_string_literal: true

module AutocompleteZipcode
  class StateSelectInput < SimpleForm::Inputs::CollectionSelectInput
    def input(wrapper_options)
      input_html_options[:data] ||= {}
      input_html_options[:data][:autocomplete_zipcode_provider] = :state
      super
    end
  end
end
