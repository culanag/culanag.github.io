document.addEventListener("scroll", function() { 
	if(window.scrollY > 400){
	document.getElementById("quote").style.display = "block";} 
	else{	
	document.getElementById("quote").style.display = "none";
	init = getQuote();}
});

function getQuote(){
		var quoteSource =[
		'I find your lack of faith disturbing. — Darth Vader',
		'Do. Or do not. There is no try. — Yoda',
		'You can’t stop the change, any more than you can stop the suns from setting. — Shmi Skywalker',
		'Fear is the path to the dark side. Fear leads to anger; anger leads to hate; hate leads to suffering. I sense much fear in you. — Yoda',
		'Hope. — Leia Organa',
	];
			var randomNumber= Math.floor(Math.random()* (quoteSource.length));
			document.getElementById("quoteText").innerHTML = quoteSource[randomNumber];
};