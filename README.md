# AutocompleteZipcode

This gem was built to "automagically" fills an address form, for Rails version >= 3.1.


## Installation

Add the following gems to your application's Gemfile:

```ruby
gem 'autocomplete_zipcode'
```

And then execute:

```bash
$ bundle install
```

## Usage

In app/assets/javascripts/application.js, you should add as follows:

```js
//= require ...
//= require autocomplete_zipcode
//= require ...
```

Basic Example:

```erb
<%= simple_form_for :example do | f | %>
  ...
  <%= f.input :zipcode, as: :zipcode %>
  <%= f.input :street, as: :street %>
  <%= f.input :neighborhood, as: :neighborhood %>
  <%= f.input :city, as: :city %>
  <%= f.input :state, as: :state %>
  ...
<% end %>
```

If you are not using simple_form, then simply add the `data-provider="zipcode"` and the other fields name to the input field yourself.

```erb
<%= form_for :example do | f | %>
  ...
  <%= f.text_field :zipcode, data: {provider: :zipcode} %>
  <%= f.text_field :street, data: {provider: :street}  %>
  ...
<% end %>
```

## Handle invalid zipcodes

Simply add an event listener callback to `zipcode.error`, for example:

```js
document.addEventListener('zipcode.error', function(e) {
  alert('Invalid zipcode!!!')
});
```

## Sample projects

For an example, take a look at the `example` folder in this repository.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
