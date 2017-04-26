var ready = function() {
  zipcode_input = $('[data-provider="zipcode"]')
  zipcode_input.keyup(function(e){
    var zipcode = zipcode_input.val().replace(/[^0-9]/g, '');
    if(zipcode.length == 8) {
      $.get('http://viacep.com.br/ws/'+ zipcode +'/json/').then(function(response) {
        if (response.erro) {
          var event = new Event('zipcode.error');

          document.dispatchEvent(event);
        }

        var inputs = {
          street: 'logradouro',
          neighborhood: 'bairro',
          city: 'localidade',
          state: 'uf'
        }

        for(var key in inputs) {
          $('[data-provider="' + key + '"]').val(response[inputs[key]])
        }
      });
    };
  })
};

if (typeof Turbolinks == "undefined") {
  $(document).ready(ready);
} else {
  $(document).on("turbolinks:load", ready);
}
