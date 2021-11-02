

<style type="text/css">

h1.title {
  font-size: 35px;
  font-weight: bold;
  font-family: Arial-Black;
  color: #E05156			;
}
h1{
  font-size: 35px;
  font-weight: bold;
  font-family: Arial-Black;
  
  color: #E05156			;

}

h2 {
  font-size: 70px;
  font-weight: bold;
 font-family: Calibri
  color: red			;

}

h3 {
  font-size: 26px;
  font-weight: bold;
  font-family: Arial-Black;
    
  color: #A60000			;

}

h4 {
  font-size: 24px;
  font-weight: bold;
  font-family: Arial-Black;
    
  color:  #A60000			;

}



h5 {
  font-size: 22px;
  font-weight: bold;
  font-family: Arial-Black;
    
  color:  #A60000			;

}



h6 {
  font-size: 19px;
  font-weight: bold;
  font-family: Arial-Black;
    
  color: white			;

}



img {
	border:0;
}




body {
  font-size: 18px;
  <!-- font-weight: normal ; -->
    font-weight:bolder;
    font-family: arial black;
    <!--  font-family: Calibri;; -->
    <!-- background-image: url("a.gif"); -->
  color: #800000			;
  background-color:#808080;
    <!-- background-color:#999999; -->

<!--   margin:0; -->
<!-- 	padding:0; -->


  
</body>




}
.center{
  <!-- border: 1px solid #aaa; -->
  width: 400px;
  text-align: center;
}


p {
    color: white					;
    <!-- text-indent:3%; -->
    line-height: 1em;
}

p.initcap{
font-size: 16em;
line-height; 0.6em;
font-weight:bold;
}


button
{
  height:30px;
  width:150px;
  border-radius:8px;
  padding:10px;
  font-size:20px;
  font-family: 'Oswald', sans-serif;
  height:52px;
  cursor:pointer;
  background-color:wheat;
}


</style>

## ver. 0.0.1



 - R-packages such as `rJava` and `xlsx` are difficult to install. so I made this package to separate dependencies of these packages from some package.
 
 The following code makes `rJava` work fine, but I am not sure that this is effective for others. 
 
     if(Sys.getenv("JAVA_HOME")!=""){
        Sys.setenv(JAVA_HOME="")
    }

 
 The above code is effective for my following error
 
       i Loading pkg
      Error: Dependency package(s) 'xlsx' not available.
      Run `rlang::last_error()` to see where the error occurred.
      In addition: Warning message:
      In (function (dep_name, dep_ver = "*")  :
        Dependency package 'xlsx' not available.

For error of `rJava`, the above code is also effective.


NOTE: As the environment variable `JAVA_HOME`, the path `C:\Program Files (x86)\Java\jre1.8.0_311` is not  correct ....I also tried jdk. 
