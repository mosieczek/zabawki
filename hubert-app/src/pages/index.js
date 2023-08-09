import React from 'react';
import Users from '../components/Users';

const Home = () => {
  return (
    <h2>home page</h2>
  );
}

const Login = (props) => {
  return (
    <h2>login page</h2>
  );
}


const UsersPage = (props) => {
  return (
    <Users/>
  );
}

export { Home, Login, UsersPage };
