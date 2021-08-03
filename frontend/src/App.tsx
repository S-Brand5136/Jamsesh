import './styles/App.scss';
import { BrowserRouter as Router, Route } from 'react-router-dom';

import Header from './components/navbar';
import Footer from './components/Footer';
import HomePage from './pages/HomePage';

const App = () => {
  return (
    <div className='App'>
      <Router>
        <Header />
        <Route path='/' component={HomePage} exact />
        <Footer />
      </Router>
    </div>
  );
};

export default App;
