# frozen_string_literal: true

module AutocompleteZipcode
  class StateInput < SimpleForm::Inputs::StringInput
    def input(wrapper_options)
      input_html_options[:data] ||= {}
      input_html_options[:data].merge!({ autocomplete_zipcode_provider: :state })
      super
    end
  end
end
