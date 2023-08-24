import React from 'react'
import './../css/home/home.css'
import './../css/home/homemin768.css'
import './../css/home/homemin992.css'
import './../css/home/homemin1200.css'
import './../css/home/homemin1400.css'
import './../css/home/scrollview.css'
import mainpageanim from './../assets/mainpageanim.mov'

function Home() {
    return (
        <><div className='home'>
            <div className='content'>
                <div className='hero'>
                    <video className='mainpageanim' autoPlay muted loop>
                        <source src={mainpageanim} type="video/mp4" />
                    </video>
                    <div className="overlay"></div>
                    <div className='hero-text'>
                        <h1 className='hero-subtitle'>Design Your Perfect Bathroom Oasis with our Sanitary Wares</h1>
                    </div>
                    <a href="#products">
                        <div id="mouse-scroll">
                            <div className="mouse">
                                <div className="mouse-in"></div>
                            </div>
                            <div>
                                <span className="down-arrow-1"></span>
                                <span className="down-arrow-2"></span>
                                <span className="down-arrow-3"></span>
                            </div>
                        </div>
                        <div className='text'>Scroll Down</div>
                    </a>
                </div>
            </div>
           <div className="bottomoverlay"></div>
        </div></>
    )
}

export default Home;