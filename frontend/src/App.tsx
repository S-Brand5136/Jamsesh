import './styles/App.scss';
import { BrowserRouter as Router, Route } from 'react-router-dom';

import Header from './components/navbar';
import Footer from './components/Footer';
import HomePage from './pages/HomePage';
import Login from './pages/Login';
import Register from './pages/Register';

const App = () => {
  return (
    <div className='App'>
      <Router>
        <Header />
        <Route path='/' component={HomePage} exact />
        <Route path='/login' component={Login} exact />
        <Route path='/register' component={Register} exact />
        <Footer />
      </Router>
    </div>
  );
};

export default App;
