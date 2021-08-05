import { createTheme } from '@material-ui/core';

const theme = createTheme({
  palette: {
    primary: {
      main: '#E27D60',
      contrastText: '#fff',
    },
    secondary: {
      main: '#85DCB',
    },
    info: {
      main: '#E8A87C',
    },
    error: {
      main: '#C38D9E',
    },
  },
});

export { theme as default };
