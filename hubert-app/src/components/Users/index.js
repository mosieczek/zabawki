import React, { useState, useEffect } from 'react';
import axios from 'axios';

const Users = () => {
  const [data, setData] = useState([]);
  const [query, setQuery] = useState('');
  useEffect(() => {
    const fetchData = async () => {
      const result = await axios.get(`https://jsonplaceholder.typicode.com/users?q=${query}`);
      setData(result.data);
    }
    fetchData();
  },[query])
  return (
    <div> 
      <div>
        search: <input type="text" value={query} onChange={e => setQuery(e.target.value)} />
      </div>
      <ul>
        {data.map(({name, email}) => (
          <li>{name} <em>({email})</em></li>
        ))}
      </ul>
      {!data.length &&  (
        <em>no data</em>
      )}
    </div>
  );
}

export default Users;
