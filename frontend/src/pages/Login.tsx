import { Link } from 'react-router-dom';
import LoginForm from '../components/forms/LoginForm';

import { Container } from '@material-ui/core';

const Login = () => {
  return (
    <Container className='container'>
      <LoginForm />
      <div className='mt-1'>
        <Link to='/register'>Not a member yet? Sign up here! </Link>
      </div>
    </Container>
  );
};

export default Login;
