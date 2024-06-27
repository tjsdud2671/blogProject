<style>
@charset "UTF-8";

* {
  box-sizing: border-box;
  margin: 0;
}

/* Reset CSS*/

a {
  text-decoration: none;
  color: inherit;
}
button,
input,
textarea {
  font-family: 'DM Sans', sans-serif;
  font-size: 16px;
}
button:focus,
button:active,
input:focus,
input:active,
textarea:focus,
textarea:active {
  outline: none;
  box-shadow: none;
}
ul,
ol,
li {
  list-style-type: none;
  padding-left: 0;
  margin-left: 0;
}
p {
  font-size: 16px;
  line-height: 1.5;
  color: 2B292D;
  letter-spacing: -0.01em;
}

body {
  background-color: #d3d3d3;
}

/* Header */

.header {
  position: relative;
}
.header-img img {
  height: auto;
  width: 100%;
}
.header-title {
  position: absolute;
  color: #fff;
  top: 20px;
  left: 10px;
}

.header-title p{
	text-align: center;
}

/* Center */

.mobile-neighbor{
	display: flex;
	flex-direction: column;
	align-items: center;
}

.mobile-neighbor img{
	display: block;
	width: 300px;
	height:auto;
	max-height: 500px;
}

.mobile-neighbor:hover{
	opacity: 0.5;
}

.center-aside {
  display: none;
}

.center-main-aside {
  text-align: center;
  opacity: 0.5;
  padding: 5px 30px;
  box-shadow: 0 8px 5px #c0c0c0;
  margin-bottom: 10px;
  
}

.center-main-aside h1{
	font-size: 18px;
}
.main-aside-login {
  margin-bottom: 3px;
}
.main-aside-desc {
  font-size: 13px;
}

.center-card {
  display: flex;
  flex-direction:column;
  align-items: center;
  width: 100%;
  height: auto;
  background-color: #fff;
  padding: 30px 30px;
  border-radius: 5px;
  margin-bottom: 10px;
}

.center-card-desc{
	padding: 5px 0;
}
.center-card-desc p {
	color: #696969;
	font-size: 13px;
	
}

 .center-card-logout{
    background-color: #fff;
    opacity: 0.5;
   	text-align: center;
   	padding: 8px 0;
 }



.center-card img {
  border-radius: 5px;
  display: block;
  object-fit: cover;
  width: 100%;
  height: 100%;
}

 













/*-------------- Desktop (768px) ----------------*/

@media screen and (min-width: 768px) {


  /* Header */
  
  .mobile-neighbor{
  	display: none;;
  } 
  
  .header-img img {
    height: 700px;
  }
  .header-title h1 {
    font-size: 70px;
  }
  .header-title p {
    font-size: 16px;
  }
  


  /* Center */
  .main {
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
    margin-bottom: 20px;
  }
  
  .main-login{
  	background-color: #fff;
  }

  .center-card {
    width: 800px;
    height: auto;
    background-color: #D3D3D3;
    padding: 30px 30px;
    border-radius: 8px;
    display: flex;
    flex-direction: column;
    align-items: center;
    max-height: 800px;
    margin-bottom: 20px;
    box-shadow: 0 8px 5px #c0c0c0;
  }
  
  .center-card img {
  display: block;
  width:auto;
  max-height:600px;
  margin-top: 20px;
  margin-bottom: 20px;
  
}
  
  .letter-img{
    border-radius: 50%;
    position: relative;
  }
  
  .letter-img img{
    position:absolute;
    width: 100%;
    height: 100%;
    object-fit: cover;
  }
  
  .center-card-logout{
  	background-color: #D3D3D3;
  	box-shadow: 0 8px 5px #c0c0c0;
    padding: 30px 30px;
    border-radius: 8px;
    text-align: center;
  }


  .center-main-aside {
    display: none;
  }

  .center-aside {
    display: block;
    margin-left: 20px;
    margin-top:30px;
    text-align: center;
  }

  .center-desc {
    font-size: 20px;
  }
  
  .center-desc:last-child {
    font-size: 20px;
    margin-bottom: 20px;
  }
  
  .toffic-info{
  	padding: 20px 0;
  	opacity: 0.5;
  }
  
  .toffic-info p{
  	font-size: 13px;
  }

  .neighbor{
    display: flex;
    justify-content: center;
  }

  .neighbor-button{
    display: block;
    text-align: center;
    width: 200px;
    color: white;
    font-weight: 700;
    background-color: #DB7093;
    padding: 10px 10px;
    margin-bottom: 10px;
    transition: all 0.5s;
  }
  .neighbor-button:hover{
    opacity: 0.8;
  }
  }
</style>  