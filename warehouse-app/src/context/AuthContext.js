import React, { useState, useEffect } from 'react';
const AuthContext = React.createContext({});

export const AuthProvider = ({ children }) => {
  const [isLogged, orgSetIsLogged ] = useState(false);
  const setIsLogged = (value ) => {
      console.log('co leci do local storage', value);
      localStorage.setItem('koko', JSON.stringify(value));
      return orgSetIsLogged(value);
  };
  const data = {
    isLogged,
    setIsLogged 
  }

  useEffect(() => {
    const data = localStorage.getItem('koko');
    console.log('data from storage', data);
    orgSetIsLogged(data !== 'false');
  },[])

  return (
    <AuthContext.Provider value={data}>
      {children}
    </AuthContext.Provider>
  )
}


export { AuthContext };
