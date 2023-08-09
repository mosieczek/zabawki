import {Button} from './components/Buttons';
import { GlobalStyle } from "./utils";
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link
} from "react-router-dom";
import {Home, Login, UsersPage} from './pages';

function App() {
  return (
    <div>
      <Router>
        <nav>
          <ul>
            <li>
              <Link to="/">Home</Link>
            </li>
            <li>
              <Link to="/login">Login</Link>
            </li>
            <li>
              <Link to="/users">Users</Link>
            </li>
          </ul>
        </nav>
        <Switch>
          <Route path="/" exact>
            <Home/>
          </Route>
          <Route path="/login">
            <Login/>
          </Route>
          <Route path="/users" >
            <UsersPage/>
          </Route>
          <Route path="*">
            <strong>404 not forund</strong>
          </Route>
        </Switch>
      </Router>
      
    </div>
  );
}

export default App;
