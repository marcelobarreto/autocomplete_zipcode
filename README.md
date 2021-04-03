# AutocompleteZipcode

This gem was built to "automagically" fills an address form, for Rails version >= 3.1.

## Status

[![Build Status](https://api.travis-ci.com/marcelobarreto/autocomplete_zipcode.svg?branch=master)](https://travis-ci.org/marcelobarreto/autocomplete_zipcode)
[![Maintainability](https://api.codeclimate.com/v1/badges/37008f3eeaaf2ea47122/maintainability)](https://codeclimate.com/github/marcelobarreto/autocomplete_zipcode/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/37008f3eeaaf2ea47122/test_coverage)](https://codeclimate.com/github/marcelobarreto/autocomplete_zipcode/test_coverage)
[![RubyGems](http://img.shields.io/gem/dt/autocomplete_zipcode.svg?style=flat)](http://rubygems.org/gems/autocomplete_zipcode)

## Try it

[Online](http://autocompletezipcode.herokuapp.com)

## Installation

Add the following gems to your application's Gemfile:

```ruby
gem 'autocomplete_zipcode'
```

And then execute:

```bash
bundle install
```

## Simple Usage

In app/assets/javascripts/application.js, you should add as follows:

```js
// app/assets/javascripts/application.js
//= require ...
//= require turbolinks
//= require jquery
//= require autocomplete_zipcode

$(document).on('ready', () => {
  AutocompleteZipcode.mount();
});
```

## Basic Example

```erb
<%= simple_form_for :example do |f| %>
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
<%= form_for :example do |f| %>
  ...
  <%= f.text_field :zipcode, data: { autocomplete_zipcode_provider: :zipcode } %>
  <%= f.text_field :street, data: { autocomplete_zipcode_provider: :street }  %>
  ...
<% end %>
```

## Handle invalid zipcodes

Simply add an event listener callback to `zipcode.error`, for example:

```js
// app/assets/javascripts/application.js

document.addEventListener('zipcode.error', () => {
  alert('Invalid zipcode!!!')
});
```

## Advanced Usage

```js
// app/assets/javascripts/application.js
//= require ...
//= require turbolinks
//= require jquery
//= require autocomplete_zipcode

$(document).on('ready', () => {
  AutocompleteZipcode.mount({
    onZipcodeSuccess: (containerEl, zipcodeEl) => {
      console.log(containerEl, zipcodeEl);
    },
    onZipcodeFail: (containerEl, zipcodeEl) => {
      console.log(containerEl, zipcodeEl);
    },
  });

  document.addEventListener('zipcode.success', () => {
    console.log('zipcode fetched successfully');
  });

  document.addEventListener('zipcode.error', () => {
    console.log('zipcode fetch failed');
  });
});
```

## Sample projects

For an online example, take a look at [this repository](https://github.com/marcelobarreto/autocomplete_zipcode_example).
You can also see it working on the dummy application (`spec/dummy`)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
