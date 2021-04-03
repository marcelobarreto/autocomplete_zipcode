# frozen_string_literal: true

#
# Uncomment this and change the path if necessary to include your own
# components.
# See https://github.com/heartcombo/simple_form#custom-components to know
# more about custom components.
Dir[Rails.root.join('app/inputs/**/*.rb')].sort.each { |f| require f }
#
# Use this setup block to configure all options available in SimpleForm.

SimpleForm.setup do |config|
  config.custom_inputs_namespaces << 'AutocompleteZipcode'
end
