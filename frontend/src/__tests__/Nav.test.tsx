import { render, getByAltText, cleanup } from '@testing-library/react';
import App from '../App';

afterEach(cleanup);

describe('NavBar', () => {
  const { container } = render(<App />);

  test('On small screens it should open a drawer', () => {});
});
