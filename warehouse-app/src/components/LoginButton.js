import React, { useContext } from 'react';
import { AuthContext } from '../context/AuthContext';

const LoginButton = (props) => {
  const { setIsLogged } = useContext(AuthContext);
  return (
    <button type="button" onClick={e => setIsLogged(true)}>Sign in </button>
  );
}



export default LoginButton;
