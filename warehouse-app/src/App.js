import React, { useContext } from 'react';

import { Button, TextField, LoginButton, LogoutButton } from './components';
import * as all from './utils';

import { AuthContext, AuthProvider } from './context/AuthContext';


class App extends React.Component {
  name = "hubert"

  render() {


    return (
      <div>
        <AuthProvider>
          <Main/>
        </AuthProvider>
      </div>
    )
  }
}

const Main = () => {
  const { isLogged } = useContext(AuthContext);
  return (
    <div style={{margin: '1em'}}>
        <nav style={{float: 'right'}}>
          {isLogged ? (
            <LogoutButton/>
          ):(
            <LoginButton/>
          )}
        </nav>
        <main>
          {isLogged ? (
            <div>
              <h1> dashboard :)</h1>
            </div>
          ) : (
            <div>
              <em>please log in </em>
            </div>
          )}
        </main>
    </div>
  )

}

export default App
