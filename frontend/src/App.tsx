import './styles/App.scss';
import { BrowserRouter as Router, Route } from 'react-router-dom';

import Header from './components/navbar';
import Footer from './components/Footer';
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
