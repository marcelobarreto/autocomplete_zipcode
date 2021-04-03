# frozen_string_literal: true

if defined?(SimpleForm)
  Dir[Rails.root.join('app/inputs/**/*.rb')].sort.each { |f| require f }

  SimpleForm.setup do |config|
    config.custom_inputs_namespaces << 'AutocompleteZipcode'
  end
end
