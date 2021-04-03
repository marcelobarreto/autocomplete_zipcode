# frozen_string_literal: true

class StreetInput < SimpleForm::Inputs::StringInput
  def input(wrapper_options)
    input_html_options[:data] ||= {}
    input_html_options[:data].merge!({ autocomplete_zipcode_provider: :street })
    super
  end
end
