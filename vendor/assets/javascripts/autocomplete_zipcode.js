const AutocompleteZipcode = {
  config: {
    container: 'form',
    stateType: 'select',
    selectorPrefix: 'data-autocomplete-zipcode-provider',
    serviceUrl: ({ zipcode }) => `https://viacep.com.br/ws/${zipcode}/json`,
  },
  inputs: {
    street: 'logradouro',
    neighborhood: 'bairro',
    city: 'localidade',
    state: 'uf',
    ibge: 'ibge',
  },
  mount: (config = AutocompleteZipcode.config) => {
    if (typeof jQuery === 'undefined') {
      console.error('jQuery is required by autocomplete_zipcode gem')
      return;
    }
    const { inputs } = AutocompleteZipcode;
    const { container, stateType, selectorPrefix, serviceUrl } = config;

    const observable = $(container).find(`[${selectorPrefix}="zipcode"]`);

    observable.keyup((e) => {
      e.preventDefault();
      e.stopPropagation();

      const { target: { value } } = e;
      const $el = $(e.target);
      const $container = $el.parents().closest($(container));
      const zipcode = value.replace(/[^0-9]/g, '');

      if(zipcode.length === 8) {
        $.get(serviceUrl({ zipcode })).then(response => {
          if (response.erro) {
            document.dispatchEvent(new Event('zipcode.error'));
            return;
          } else {
            for (var key in inputs) $container.find(`[${selectorPrefix}="${key}"]`).val(response[inputs[key]]);
            document.dispatchEvent(new Event('zipcode.success'));
            return;
          }
        });
      }
    });
  },
};
