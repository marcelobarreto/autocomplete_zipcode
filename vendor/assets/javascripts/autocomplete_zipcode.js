const AutocompleteZipcode = {
  config: {
    container: 'form',
    stateType: 'select',
    selectorPrefix: 'data-autocomplete-zipcode-provider',
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
    const { container, stateType, selectorPrefix } = config;

    const $container = $(container);
    console.log($container);
    console.log(`[${selectorPrefix}="zipcode"]`);
    const observable = $container.find(`[${selectorPrefix}="zipcode"]`);
    console.log(observable);

    observable.keyup(() => {
      const zipcode = observable.val().replace(/[^0-9]/g, '');

      if(zipcode.length === 8) {
        $.get(`https://viacep.com.br/ws/${zipcode}/json`).then(response => {
          if (response.erro) {
            document.dispatchEvent(new Event('zipcode.error'))
          } else {
            document.dispatchEvent(new Event('zipcode.success'))
          }

          console.log(response);
          for(var key in inputs) {
            $container.find(`[${selectorPrefix}="'${key}'"]`).val(response[inputs[key]]);
          }
        });
      };
    });
  },
};
