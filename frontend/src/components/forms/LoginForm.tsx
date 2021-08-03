import { useState } from 'react';
import { useHistory } from 'react-router-dom';

import { TextField, Grid, Button } from '@material-ui/core';
import {} from '@material-ui/icons';

const LoginForm = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const history = useHistory();

  const submitHandler = () => {
    console.log('email', email);
    console.log('password', password);

    history.push('/');
  };

  return (
    <form noValidate onSubmit={() => submitHandler()}>
      <Grid container spacing={3}>
        <Grid item xs={12}>
          <TextField
            fullWidth={true}
            label='Email'
            variant='outlined'
            helperText='Enter Email'
            value={email}
            onChange={(e) => setEmail(e.target.value)}
          />
        </Grid>
        <Grid item xs={12}>
          <TextField
            fullWidth={true}
            label='Password'
            variant='outlined'
            autoComplete='current-password'
            type='password'
            helperText='Enter Password'
            value={password}
            onChange={(e) => setPassword(e.target.value)}
          />
        </Grid>
        <Grid item xs={12}>
          <Button
            type='submit'
            fullWidth={true}
            variant='contained'
            onClick={() => submitHandler()}
          >
            Login
          </Button>
        </Grid>
      </Grid>
    </form>
  );
};

export default LoginForm;
