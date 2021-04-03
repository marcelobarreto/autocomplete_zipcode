# frozen_string_literal: true

class AutocompleteZipcode::ZipcodeInput < SimpleForm::Inputs::StringInput
  def input(wrapper_options)
    input_html_options[:data] ||= {}
    input_html_options[:data].merge!({ autocomplete_zipcode_provider: :zipcode })
    super
  end
end