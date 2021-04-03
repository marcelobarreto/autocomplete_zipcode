const AutocompleteZipcode = {
  config: {
    container: 'form',
    stateType: 'select',
  },
  inputs: {
    street: 'logradouro',
    neighborhood: 'bairro',
    city: 'localidade',
    state: 'uf',
    ibge: 'ibge',
  },
  mount: (config = AutocompleteZipcode.config) => {
    const { inputs } = AutocompleteZipcode.inputs;
    const { container, stateType } = config;

    const $container = $(container);
    const zipCodeInput = $container.find('[data-provider="zipcode"]');

    zipCodeInput.keyup(() => {
      const zipcode = zipCodeInput.val().replace(/[^0-9]/g, '');

      if(zipcode.length === 8) {
        $.get(`https://viacep.com.br/ws/${zipcode}/json`).then(response => {
          if (response.erro) {
            document.dispatchEvent(new Event('zipcode.error'))
          } else {
            document.dispatchEvent(new Event('zipcode.success'))
          }

          for(var key in inputs) {
            $container.find(`[data-provider="'${key}'"]`).val(response[inputs[key]]);
          }
        });
      };
    });
  },
};
