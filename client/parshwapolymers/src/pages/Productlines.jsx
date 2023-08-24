import { useEffect, useState } from 'react';
import './../css/productlines/productlines.css'
import axios from 'axios';
import PlineCard from '../Components/ProductLinesCard';

const Productlines = () => {
  const [productLines, setProductLines] = useState([]);
  const [image, setImage] = useState('');
  useEffect(() => {
    try {
      const fetchProductLines = async () => {
        const res = await axios.get('productlines/getAllProductLines');
        console.log(res.data);
        // var Buffer = require('buffer/').Buffer;
        // let base64ToString = Buffer.from(res.data.image, "base64").toString()
        // console.log(base64ToString);
        // setImage(base64ToString);
        setProductLines(res.data);
      }
      fetchProductLines();
    }
    catch (err) {
      console.log(err);
    }
  }, []);
  return (<><div className='product' id='products'>
    <h1 className='productname'>Product Lines</h1>
    <div className='main'>{productLines.map((p) => (<PlineCard title={p.title} image={image} />))}</div>
  </div>
  </>);
};
export default Productlines;