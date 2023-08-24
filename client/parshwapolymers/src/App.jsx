import video from './assets/logovideo.mp4';
import './App.css';
import { useNavigate } from 'react-router-dom';
import { useEffect } from 'react';
import Home from './pages/Home';
import Productlines from './pages/Productlines';
import Navbar from './Components/Navbar';
import './css/navbar/navbar.css';
import './css/navbar/navbarmin768.css';
import './css/navbar/navbarmin992.css';
import './css/navbar/navbarmin1200.css';
import './css/navbar/navbarmin1400.css';
import About from './pages/About';
import gsap from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';
import { Timeline } from 'gsap/gsap-core';

gsap.registerPlugin(ScrollTrigger);

const App = () => {
  const navigate = useNavigate();
  useEffect(() => {
    setTimeout(() => {
      hideVideoAndShowHome();
      gsap.timeline({
        scrollTrigger: {
          trigger: ".product",
          start: "top 78%",
          end: "5% bottom",
          scrub: true,
        }
      }).to("#pcard",{marginTop:"0px",opacity:1,ease:"power1.inOut"})
      .to(".productname",{marginTop:"0px",opacity:1,ease:"power1.inOut"})
      let mm = gsap.matchMedia();
      mm.add("(min-width: 992px)",() =>{
      gsap.timeline({
            scrollTrigger: {
              trigger: ".product",
              start: "top 60%",
              end: "center bottom",
              scrub: true,
              
            }
          }).fromTo(".Headrer", {background:"transparent"}, {background:"var(--accent-color)",ease:"power2"},"+=1")
          .to(".hero-title", {color:"var(--background-theme-color)"})
          .to(".li",{color:"var(--background-theme-color"})   })
    }, 5000);
  }, [navigate]);
  useEffect(()=>{
    setTimeout(()=>{
      let mm = gsap.matchMedia();
      mm.add("(min-width: 992px)",() => {gsap.timeline({
        scrollTrigger:{
          trigger: ".product",
          start: "-20% 80%",
          end: "34% bottom",
          scrub: true,
          
        }
      }).to(".hero-title", { fontSize:"1.6rem",bottom:"15%",left:"6%",transform:"translate(-50%,-50%)"})
      .fromTo(".Headrer", { position: "absolute",height: "55svh"}, { position: "fixed",height: "70px"})
      .fromTo(".home", {height:"100vh" }, { height:"calc(100vh-80px)", duration: 0 }) })
      
    },5000)
  })
  return (
    <div className="App">
      <video className='LogoVideo' autoPlay muted id="myVideo">
        <source src={video} type="video/mp4" />
      </video>
      <div className="pages">
      <Navbar />
      <Home/>
      <Productlines/>
      <About/>
      </div>
    </div>
  );
}

function hideVideoAndShowHome() {
  const video = document.getElementById("myVideo");
  video.style.display = "none";
  const pages = document.getElementsByClassName("pages")[0];
  pages.style.display = "block";
}

export default App;
