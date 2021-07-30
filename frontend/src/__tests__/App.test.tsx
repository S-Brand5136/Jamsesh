import { render, getByAltText, cleanup, getByText, getByLabelText, fireEvent, getByTestId } from '@testing-library/react';
import App from '../App';

afterEach(cleanup);

describe('App', () => {

  test('When a visitor visits renders homepage, navbar and footer', () => {
    const { container } = render(<App />);
    
    const logoButton = getByAltText(container, 'logo');
    const login = getByText(container, 'Login');
    const register = getByText(container, 'Register');
    const recentEvents = getByText(container, 'Recent Events');
    const footer = getByLabelText(container, 'footer')

    expect(logoButton).toBeInTheDocument();
    expect(login).toBeInTheDocument();
    expect(register).toBeInTheDocument();
    expect(recentEvents).toBeInTheDocument();
    expect(footer).toBeInTheDocument();
  });

  test('It should open a drawer when login or register is clicked', () => {
    const { container } = render(<App />);

    const login = getByText(container, 'Login');
    const register = getByText(container, 'Register');  
    
    // Simulate logging in
    fireEvent.click(login);

    const form = getByTestId(container, 'login-form');

    expect(getByText(form, 'Email:')).toBeInTheDocument();
    expect(getByText(form, 'Password:')).toBeInTheDocument();

    fireEvent.click(getByAltText(form, 'close'))

    expect(form).toBeEmptyDOMElement();

    // Simulate registering
    fireEvent.click(register)

    const registerForm = getByTestId(container, 'register-form');

    expect(getByText(registerForm, 'Email:')).toBeInTheDocument();
    expect(getByText(registerForm, 'Password:')).toBeInTheDocument();
  })

})

