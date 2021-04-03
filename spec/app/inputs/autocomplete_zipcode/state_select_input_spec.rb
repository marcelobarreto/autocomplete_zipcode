# frozen_string_literal: true

class AutocompleteZipcode::StateSelectInput < SimpleForm::Inputs::CollectionSelectInput
  def input(wrapper_options)
    input_html_options[:data] ||= {}
    input_html_options[:data].merge!({ autocomplete_zipcode_provider: :state })
    super
  end
end
