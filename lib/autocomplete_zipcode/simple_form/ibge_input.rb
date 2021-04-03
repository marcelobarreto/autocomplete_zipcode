class IbgeInput < SimpleForm::Inputs::StringInput
    def input(wrapper_options)
      input_html_options[:data] ||= {}
      input_html_options[:data].merge!({ autocomplete_zipcode_provider: :ibge })
      super
    end
  end