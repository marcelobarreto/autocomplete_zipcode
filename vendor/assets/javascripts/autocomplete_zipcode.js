const AutocompleteZipcode = {
  config: {
    container: 'form',
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
  mount: ({ onSuccess, onFail, config = AutocompleteZipcode.config }) => {
    if (typeof jQuery === 'undefined') {
      console.error('jQuery is required by autocomplete_zipcode gem')
      return;
    }
    const { inputs } = AutocompleteZipcode;
    const { container, selectorPrefix, serviceUrl } = config;

    const observable = $(container).find(`[${selectorPrefix}="zipcode"]`);

    observable.keyup((e) => {
      e.preventDefault();
      e.stopPropagation();

      const { target: { value } } = e;
      const $el = $(e.target);
      const $container = $el.parents().closest($(container));
      const zipcode = value.replace(/[^0-9]/g, '');

      if (zipcode.length === 8) {
        $.get(serviceUrl({ zipcode })).then(response => {
          if (response.erro) {
            onFail?.call(this, $container[0], $el[0]);
            document.dispatchEvent(new Event('zipcode.error'));
          } else {
            for (var key in inputs) $container.find(`[${selectorPrefix}="${key}"]`).val(response[inputs[key]]);
            onSuccess?.call(this, $container[0], $el[0]);
            document.dispatchEvent(new Event('zipcode.success'));
          }
        });
      }
    });
  },
};
