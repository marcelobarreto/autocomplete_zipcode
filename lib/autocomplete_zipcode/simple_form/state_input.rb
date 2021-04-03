class StateInput < SimpleForm::Inputs::StringInput
  def input(wrapper_options)
    input_html_options[:data] ||= {}
    input_html_options[:data].merge!({ provider: :state })
    super
  end
end
