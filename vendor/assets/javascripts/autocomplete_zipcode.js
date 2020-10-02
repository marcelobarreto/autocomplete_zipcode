const inputs = {
  street: 'logradouro',
  neighborhood: 'bairro',
  city: 'localidade',
  state: 'uf',
  ibge: 'ibge',
};

const ready = () => {
  const zipCodeInput = $('[data-provider="zipcode"]');
  zipCodeInput.keyup(() => {
    const zipcode = zipCodeInput.val().replace(/[^0-9]/g, '');

    if(zipcode.length === 8) {
      $.get(`https://viacep.com.br/ws/${zipcode}/json`).then(response => {
        let event;
        if (response.erro) {
          event = new Event('zipcode.error');
        } else {
          event = new Event('zipcode.success');
        }

        document.dispatchEvent(event);

        for(var key in inputs) {
          $(`[data-provider="'${key}'"]`).val(response[inputs[key]]);
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
