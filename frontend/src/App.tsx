import './App.css';
import { BrowserRouter as Router, Route } from 'react-router-dom';

import Header from './components/global/Header';
import Footer from './components/global/Footer';
import HomePage from './pages/HomePage';

const App = () => {
  return (
    <div className="App">
      <Header />
      <Router>
        <Route path='/' component={HomePage} exact />
      </Router>
      <Footer />
    </div>
  );
}

export default App;
