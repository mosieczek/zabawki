import React, {useContext} from 'react';
import { AuthContext } from '../context/AuthContext';

const LogoutButton = (props) => {
  const { setIsLogged } = useContext(AuthContext);
  return (
    <button type="button" onClick={e => setIsLogged(false)}>logout</button>
  );
}


export default LogoutButton;
