var comp = new StylesheetSwitcher({
    target: document.querySelector('style-switcher'),
    data: {
      id: 'mySSS',
      label: 'Theme:',
      stylesheets: [
        {label: 'Feds', linkHrefContains: 'fed'},
        {label: 'Zeon', linkHrefContains: 'zeon'},
      ],
    },
  });

  comp.on('selectionChange', console.log);
  comp.setSelected('Feds');