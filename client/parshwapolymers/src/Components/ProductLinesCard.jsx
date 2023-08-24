import './../css/Pcard.css';

const PlineCard = ({title,image}) => {
  return (<div id="pcard"><img className='showimg' src={'data:image/jpeg;base64,'+image} alt="" />{title}</div>);
};
export default PlineCard;