import React, { useState, useEffect, useContext } from 'react';


const Button = ({ title, color, border, onClick }) => {
  const [isClicked, setClicked] = useState(false);
  const all = useState('');
  const query = all[0];
  const setQuery = all[1];

  const [data, setData] = useState([{
    name : 'hubert marzec'
  }]);

  useEffect(() => {
      fetch(`https://jsonplaceholder.typicode.com/users?q=${query}`)
        .then(res => res.json())
        .then(data => {
          setData(data);
        })
  }, [query]);

  const bgColor = isClicked ? 'red' : 'white';
 
  return (
   <div>
       <button 
        type="button" 
        style={{
            color,
            "background-color" : bgColor
        }} 
        onClick={e => setClicked(!isClicked)}
        >{title}</button>
        <input type="text" value={query} onChange={e => setQuery(e.target.value)}/>
        <ul>
          {data.map(item => (
            <li>{item.name}</li>
          ))}
        </ul>
   </div>
  );
}

export default Button;
