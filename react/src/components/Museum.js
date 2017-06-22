import React from 'react';
const Museum = props => {
  return (
    <div className="museum-info-box">
    <img src={props.photo} alt={props.name} className="museum-index-img" />
        <a href={`/museums/${props.id}`}>
          <h2>{props.name}</h2>
        </a>
        <p>Rating: {props.rating} <br />
        Address: {props.address} </p>
    </div>
  );
}

export default Museum;
