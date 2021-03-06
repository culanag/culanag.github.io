<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/style.css" type="text/css">
	<link rel="stylesheet" href="css/responsive.css" type="text/css">
	<!-- Bootstrap CSS CDN -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script>		
		var html5_audiotypes={ //define list of audio file extensions and their associated audio types. Add to it if your specified audio file isn't on this list:
			"mp3": "audio/mpeg",
			"mp4": "audio/mp4",
			"ogg": "audio/ogg",
			"wav": "audio/wav"
		}
		function createsoundbite(sound){
			var html5audio=document.createElement('audio')
			if (html5audio.canPlayType){ //check support for HTML5 audio
				for (var i=0; i<arguments.length; i++){
					var sourceel=document.createElement('source')
					sourceel.setAttribute('src', arguments[i])
					if (arguments[i].match(/\.(\w+)$/i))
						sourceel.setAttribute('type', html5_audiotypes[RegExp.$1])
					html5audio.appendChild(sourceel)
				}
				html5audio.load()
				html5audio.playclip=function(){
					html5audio.pause()
					html5audio.currentTime=0
					html5audio.play()
				}
				return html5audio
			}
			else{
				return {playclip:function(){throw new Error("Your browser doesn't support HTML5 audio unfortunately")}}
			}
		}
		//Initialize two sound clips with 1 fallback file each:
		var mouseoversound=createsoundbite("media/spin.mp4")
		var clicksound=createsoundbite("media/click.mp4")
	</script>
	<meta charset="UTF-8">  
  	<title>WebTech</title>
</head>

<body>
	<div class="video-container">
		<video autoplay muted loop id="vidwall">
			<source src="media/bg.mp4" type="video/mp4">
		</video>
	</div>
	
	<div id="quote"><p id="quoteText"></p><img src="media/yoda.png" alt="yoda"></div>
  
	<div id="page-header">
		<h1>Web Systems and Technologies</h1>
	</div>
  
	<div id="content">
    <div id="topics-list">
		<ul>
			<li onmouseover="mouseoversound.playclip()" onclick="clicksound.playclip()">
				<a id="aSSWSTech" href="#SSWSTech">Server-Side Web Scripting Technologies</a></li>
			<li onmouseover="mouseoversound.playclip()" onclick="clicksound.playclip()">
				<a id="aSSWSTopics" href="#SSWSTopics">Server-Side Web Scripting Topics</a></li>
			<li onmouseover="mouseoversound.playclip()" onclick="clicksound.playclip()">
				<a id="aWAS" href="#WAS">Web Application Security</a></li>
			<br>
			<li onmouseover="mouseoversound.playclip()" onclick="clicksound.playclip()">
			<a href="quiz.html" id="quizTag">take the quiz!</a></li>
		</ul>
    </div>
	
	<div class = "notetopics" id="SSWSTech">
		<h2>Server-Side Web Scripting Technologies</h2>
    <div class="subtopic">
		<h3 id="servletsNotes">Java Web Servlets</h3>	
			<h4>what is a java servlet?</h4>
				<p>Java Servlet technology was created as a portable way to provide dynamic, user-oriented content. A servlet is a Java programming language class used to extend the capabilities of servers that host applications accessed by means of a request-response programming model. Although servlets can respond to any type of request, they are commonly used to extend the applications hosted by web servers. For such applications, Java Servlet technology defines HTTP-specific servlet classes.</p>
				<p>The <i>javax.servlet</i> and <i>javax.servlet.http</i> packages provide interfaces and classes for writing servlets. All servlets must implement the <b>Servlet interface</b>, which defines lifecycle methods. When implementing a generic service, you can use or extend the <b>GenericServlet</b> class provided with the Java Servlet API. The <b>HttpServlet</b> class provides methods, such as <i>doGet</i> and <i>doPost</i>, for handling HTTP-specific services.</p>
			<h4>servlet lifecycle</h4>
				<p>The lifecycle of a servlet is controlled by the container in which the servlet has been deployed. When a request is mapped to a servlet, the container performs the following steps.</p>
				<ol>
					<li>If an instance of the servlet does not exist, the web container:
						<ul>
							<li>Loads the servlet class</li>
							<li>Creates an instance of the servlet class</li>
							<li>Initializes the servlet instance by calling the init method</li>
							<li>Invokes the service method, passing request and response objects</li>
						</ul></li>
					<li>If it needs to remove the servlet, the container finalizes the servlet by calling the servlet's destroy method.</li>
				</ol>
			<h4>php version release</h4>	
				<div class="col-lg-3 col-sm-12">
                    <button class="btn btn-lg btn-secondary" onClick="versions()"> Show Version Release </button>
                    <script type="text/javascript">
                        
                    function versions()
                    {
                            
                            var url = 'javaServlet.jsp';
                            $.get(url, function(response)
                            {
                                    $('#out').html(response);
                            });
                    }
               
                    </script>
      
                </div>
				<table class="version">
					<tr>
						<th>Servlet API Version</th>
						<th>Release Date</th>
						<th>Changes</th>
					</tr>
					<tr>
						<td>Servlet 1.0</td>
						<td>June 1997</td>
						<td></td>
					</tr>
					<tr>
						<td>Servlet 2.0</td>
						<td></td>
						<td>Part of Java Servlet Development Kit 2.0</td>
					</tr>
					<tr>
						<td>Servlet 2.1</td>
						<td>November 1998</td>
						<td>First official specification, added <b>RequestDispatcher</b>, <b>ServletContext</b></td>
					</tr>
					<tr>
						<td>Servlet 2.2</td>
						<td>August 1999</td>
						<td>Becomes part of J2EE, introduced independent web applications in .war files</td>
					</tr>
					<tr>
						<td>Servlet 2.3</td>
						<td>August 2001</td>
						<td>Addition of <b>Filter</b></td>
					</tr>
					<tr>
						<td>Servlet 2.4</td>
						<td>November 2003</td>
						<td>web.xml uses XML Schema</td>
					</tr>
					<tr>
						<td>Servlet 2.5</td>
						<td>September 2005</td>
						<td>Requires Java SE 5, supports annotation</td>
					</tr>
					<tr>
						<td>Servlet 3.0</td>
						<td>December 2009</td>
						<td>Pluggability, Ease of development, Async Servlet, Security, File Uploading</td>
					</tr>
					<tr>
						<td>Servlet 3.1</td>
						<td>May 2013</td>
						<td>Non-blocking I/O, HTTP protocol upgrade mechanism (WebSocket) </td>
					</tr>
					<tr>
						<td>Servlet 4.0</td>
						<td>September 2017</td>
						<td>HTTP/2</td>
					</tr>
			</table>
    </div>
	
	<div class="subtopic">
      <h3 id="JSPNotes">Java Server Pages(JSP)</h3>
		<h4>what is jsp?</h4>
			<p>Java Server Pages (JSP) is a server-side programming technology that enables the creation of dynamic, platform-independent method for building Web-based applications based on HTML, XML, or other document types. Released in 1999 by Sun Microsystems, JSP is similar to PHP and ASP, but it uses the Java programming language.</p>
			<p>To deploy and run JavaServer Pages, a compatible web server with a servlet container, such as Apache Tomcat or Jetty, is required. JSP has access to the entire family of Java APIs, including the JDBC API to access enterprise databases.</p>
			<p>Architecturally, JSP may be viewed as a high-level abstraction of Java servlets. JSPs are translated into servlets at runtime, therefore JSP is a Servlet; each JSP servlet is cached and re-used until the original JSP is modified. The difference of JSP with Java servlets is that, servlets are HTML in Java, while JSP is Java in HTML.</p>
    </div>
	
	<div class="subtopic">
      <h3 id="PHPNotes">PHP</h3>
		<h4>What is php?</h4>
			<p>PHP stands for PHP: Hypertext Preprocessor. This confuses many people because the first word of the acronym is the acronym. This type of acronym is called a recursive acronym. PHP is an HTML-embedded scripting language. Much of its syntax is borrowed from C, Java and Perl with a couple of unique PHP-specific features thrown in. The goal of the language is to allow web developers to write dynamically generated pages quickly.</p>
			<p>PHP development began in 1994 when Rasmus Lerdorf wrote several Common Gateway Interface (CGI) programs in C, which he used to maintain his personal homepage. He extended them to work with web forms and to communicate with databases, and called this implementation "Personal Home Page/Forms Interpreter" or PHP/FI.</p>
			<p>What distinguishes PHP from something like client-side JavaScript is that the code is executed on the server, generating HTML which is then sent to the client. The client would receive the results of running that script, but would not know what the underlying code was. You can even configure your web server to process all your HTML files with PHP, and then there's really no way that users can tell what you have up your sleeve.</p>
		
		<h4>php version release</h4>
			<p>The PHP language evolved without a written formal specification or standard until 2014, leaving the canonical PHP interpreter as a de facto standard.</p>
			<div class="col-lg-3 col-sm-12">
                    <button class="btn btn-lg btn-secondary" onClick="versions()"> Show Version Release </button>
                    <script type="text/javascript">
                        
                    function versions()
                    {
                            
                            var url = 'php.jsp';
                            $.get(url, function(response)
                            {
                                    $('#out').html(response);
                            });
                    }
               
                    </script>
      
            </div>
			<table class="version">
				<tr>
					<th>Version</th>
					<th>Release Date</th>
					<th>Notes</th>
				</tr>
				<tr>
					<td>1.0</td>
					<td>8 June 1995</td>
					<td>Officially called "Personal Home Page Tools (PHP Tools)". This is the first use of the name "PHP".</td>
				</tr>
				<tr>
					<td>2.0</td>
					<td>1 November 1997</td>
					<td>Officially called "PHP/FI 2.0".</td>
				</tr>
				<tr>
					<td>3.0</td>
					<td>6 June 1998</td>
					<td>Zeev Suraski and Andi Gutmans rewrite the base for this version.</td>
				</tr>
				<tr>
					<td>4.0</td>
					<td>22 May 2000</td>
					<td>Added more advanced two-stage parse/execute tag-parsing system called the Zend engine. </td>
				</tr>
				<tr>
					<td>4.1</td>
					<td>10 December 2001</td>
					<td>Introduced "superglobals" <b>($_GET, $_POST, $_SESSION, etc.)</b></td>
				</tr>
				<tr>
					<td>4.2</td>
					<td>22 April 2002</td>
					<td>Disabled <b>register_globals</b> by default.</td>
				</tr>
				<tr>
					<td>4.3</td>
					<td>27 December 2002</td>
					<td>Introduced the command-line interface (CLI), to supplement the CGI. </td>
				</tr>
				<tr>
					<td>4.4</td>
					<td>11 July 2005</td>
					<td>Fixed a memory corruption bug</td>
				</tr>
				<tr>
					<td>5.0</td>
					<td>13 July 2004</td>
					<td>Zend Engine II with a new object model. </td>
				</tr>
				<tr>
					<td>5.1</td>
					<td>24 November 2005</td>
					<td>Added PHP Data Objects (PDO) as a consistent interface for accessing databases.</td>
				</tr>
				<tr>
					<td>5.2</td>
					<td>2 November 2006</td>
					<td>Enabled the filter extension by default. Native JSON support.</td>
				</tr>
				<tr>
					<td>5.3</td>
					<td>30 June 2009</td>
					<td>Namespace support; late static bindings, jump label (limited goto), closures, PHP archives (phar), garbage collection for circular references</td>
				</tr>
				<tr>
					<td>5.4</td>
					<td>1 March 2012</td>
					<td>Trait support, short array syntax support. Removed items: <b>register_globals</b>, <b>safe_mode</b>, <b>session_register()</b>, <b>session_unregister()</b> and <b>session_is_registered()</b>.</td>
				</tr>
				<tr>
					<td>5.5</td>
					<td>20 June 2013</td>
					<td>Support for generators, <i>finally</i> blocks for exceptions handling, <b>OpCache</b> (based on Zend Optimizer+) bundled in official distribution.</td>
				</tr>
				<tr>
					<td>5.6</td>
					<td>28 August 2014</td>
					<td>Constant scalar expressions, variadic functions, argument unpacking, new exponentiation operator, extensions of the <i>usestatement</i></td>
				</tr>
				<tr>
					<td>6.x</td>
					<td></td>
					<td>Abandoned version of PHP that planned to include native Unicode support. </td>
				</tr>
				<tr>
					<td>7.0</td>
					<td>3 December 2015</td>
					<td>Zend Engine 3 </td>
				</tr>
				<tr>
					<td>7.1</td>
					<td>1 December 2016</td>
					<td>void return type, class constant visibility modifiers</td>
				</tr>
				<tr>
					<td>7.2</td>
					<td>30 November 2017</td>
					<td>Counting of non-countable objects </td>
				</tr>
			</table>
    </div>
	
	<div class="subtopic">
      <h3 id="NodeJSNotes">Node.JS</h3>
		<h4>what is Node.js?</h4>
			<p>Node.js is a JavaScript runtime built on Chrome's V8 JavaScript engine. Node.js uses an event-driven, non-blocking I/O model that makes it lightweight and efficient. Node.js' package ecosystem,<b>npm</b>, is the largest ecosystem of open source libraries in the world.</p>
			<p>Node.js is an open source, cross-platform runtime environment for developing server-side and networking applications. Node.js applications are written in JavaScript, and can be run within the Node.js runtime on OS X, Microsoft Windows, and Linux.</p>
			<p>Node.js uses a single threaded model with event looping. Event mechanism helps the server to respond in a non-blocking way and makes the server highly scalable as opposed to traditional servers which create limited threads to handle requests. Node.js uses a single threaded program and the same program can provide service to a much larger number of requests than traditional servers like Apache HTTP Server.</p>
		<h4>brief history</h4>
			<p>Node.js was originally written by Ryan Dahl in 2009,about thirteen years after the introduction of the first server-side JavaScript environment, Netscape's LiveWire Pro WebThe initial release supported only Linux and Mac OS X. Its development and maintenance was led by Dahl and later sponsored by Joyent.</p>
			<dl>
				<dt>June 2011</dt>
					<dd>Microsoft and Joyent implemented a native Windows version of Node.js.</dd>
				<dt>January 2012</dt>
					<dd>Dahl stepped aside, promoting coworker and npm creator Isaac Schlueter to manage the project</dd>
				<dt>January 2014</dt>
					<dd>Schlueter announced that Timothy J. Fontaine would lead the project.</dd>
				<dt>December 2014</dt>
					<dd>Indutny started io.js, a fork of Node.js. Due to the internal conflict over Joyent's governance, io.js was created as an open governance alternative with a separate technical committee.</dd>
				<dt>June 2015</dt>
					<dd>Node.js and io.js communities voted to work together under the Node.js Foundation.</dd>
				<dt>September 2015</dt>
					<dd>Node.js v0.12 and io.js v3.3 were merged back together into Node v4.0. </dd>
			</dl>
		<h4>node.js version release</h4>
			<div class="col-lg-3 col-sm-12">
                    <button class="btn btn-lg btn-secondary" onClick="versions()"> Show Version Release </button>
                    <script type="text/javascript">
                        
                    function versions()
                    {
                            
                            var url = 'php.jsp';
                            $.get(url, function(response)
                            {
                                    $('#out').html(response);
                            });
                    }
               
                    </script>
      
				</div>
			<table class="version">
				<tr>
					<th>Version</th>
					<th>Code Name</th>
					<th>Release Date</th>
					<th>LTS Status(as of May 2018)</th>
				</tr>
				<tr>
					<td>v0.10.x</td>
					<td></td>
					<td>2013-03-11</td>
					<td>End-of-life</td>
				</tr>
				<tr>
					<td>v0.12.x</td>
					<td></td>
					<td>2015-02-06</td>
					<td>End-of-life</td>
				</tr>
				<tr>
					<td>4.x</td>
					<td>Argon</td>
					<td>2015-09-08</td>
					<td>End-of-life</td>
				</tr>
				<tr>
					<td>5.x</td>
					<td></td>
					<td>2015-10-29</td>
					<td>No LTS</td>
				</tr>
				<tr>
					<td>6.x</td>
					<td>Boron</td>
					<td>2016-04-26</td>
					<td>Maintenance</td>
				</tr>
				<tr>
					<td>7.x</td>
					<td></td>
					<td>2016-10-25</td>
					<td>No LTS</td>
				</tr>
				<tr>
					<td>8.x</td>
					<td>Carbon</td>
					<td>2017-05-30</td>
					<td>Active</td>
				</tr>
				<tr>
					<td>9.x</td>
					<td></td>
					<td>2017-10-01</td>
					<td>No LTS</td>
				</tr>
				<tr>
					<td>10.x</td>
					<td>Dubnium</td>
					<td>2018-04-24</td>
					<td>Active</td>
				</tr>
				<tr>
					<td>11.x</td>
					<td></td>
					<td>2018-04-23</td>
					<td>No LTS</td>
				</tr>
			</table>
    </div>
    </div>
	
	<div class = "notetopics" id="SSWSTopics">
		<h2>Server-Side Web Scripting Topics</h2>
	</div>
	
	<div class = "notetopics" id="WAS">
		<h2>Web Application Security<br><small>(based on 2017 owasp Top 10)</small></h2>
		
		<div class="subtopic">
			<h3>About owasp</h3>
				<p>The Open Web Application Security Project (OWASP) is an open community dedicated to enabling organizations to develop, purchase, and maintain applications and APIs that can be trusted.</p>
			<h3>What Are Application Risks</h3>
				<p>Attackers can potentially use many different paths through your application to do harm to your business or organization. Each of these paths represents a risk that may, or may not, be serious enough to warrant attention. Sometimes these paths are trivial to find and exploit, and sometimes they are extremely difficult. Similarly, the harm that is caused may be of no consequence, or it may put you out of business. To determine the risk to your organization, you can evaluate the likelihood associated with each threat agent, attack vector, and security weakness and combine it with an estimate of the technical and business impact to your organization. Together, these factors determine your overall risk.</p>
			<h3>What Changed from 2013 Top 10 Web App Security Risks
				<br><img src="media/WASComparison.png" alt="OWASP 2013to2017 comparison"></h3>
			<h3>Top 10 Application Security Risks of 2017</h3>
				<ol id="top10">
					<li>Injection</li>
						<p>- Injection flaws, such as SQL, NoSQL, OS, and LDAP injection, occur when untrusted data is sent to an interpreter as part of a command or query. The attacker�s hostile data can trick the interpreter into executing unintended commands or accessing data without proper authorization.</p>
					<li>Broken Authentication</li>
						<p>- Application functions related to authentication and session management are often implemented incorrectly, allowing attackers to compromise passwords, keys, or session tokens, or to exploit other implementation flaws to assume other users� identities temporarily or permanently.</p>
					<li>Sensitive Data Exposure</li>
						<p>- Many web applications and APIs do not properly protect sensitive data, such as financial, healthcare, and PII. Attackers may steal or modify such weakly protected data to conduct credit card fraud, identity theft, or other crimes. Sensitive data may be compromised without extra protection, such as encryption at rest or in transit, and requires special precautions when exchanged with the browser.</p>
					<li>XML External Entities (XXE)</li>
						<p>- Many older or poorly configured XML processors evaluate external entity references within XML documents. External entities can be used to disclose internal files using the file URI handler, internal file shares, internal port scanning, remote code execution, and denial of service attacks.</p>
					<li>Broken Access Control</li>
						<p>- Restrictions on what authenticated users are allowed to do are often not properly enforced. Attackers can exploit these flaws to access unauthorized functionality and/or data, such as access other users' accounts, view sensitive files, modify other users� data, change access rights, etc.</p>
					<li>Security Misconfiguration</li>
						<p>- Security misconfiguration is the most commonly seen issue. This is commonly a result of insecure default configurations, incomplete or ad hoc configurations, open cloud storage, misconfigured HTTP headers, and verbose error messages containing sensitive information. Not only must all operating systems, frameworks, libraries, and applications be securely configured, but they must be patched and upgraded in a timely fashion.</p>
					<li>Cross-Site Scripting (XSS)</li>
						<p>- XSS flaws occur whenever an application includes untrusted data in a new web page without proper validation or escaping, or updates an existing web page with user-supplied data using a browser API that can create HTML or JavaScript. XSS allows attackers to execute scripts in the victim�s browser which can hijack user sessions, deface web sites, or redirect the user to malicious sites.</p>
					<li>Insecure Deserialization</li>
						<p>- Insecure deserialization often leads to remote code execution. Even if deserialization flaws do not result in remote code execution, they can be used to perform attacks, including replay attacks, injection attacks, and privilege escalation attacks. </p>
					<li>Using Components with Known Vulnerabilities</li>
						<p>- Components, such as libraries, frameworks, and other software modules, run with the same privileges as the application. If a vulnerable component is exploited, such an attack can facilitate serious data loss or server takeover. Applications and APIs using components with known vulnerabilities may undermine application defenses and enable various attacks and impacts. </p>
					<li>Insufficient Logging & Monitoring</li>
						<p>- Insufficient logging and monitoring, coupled with missing or ineffective integration with incident response, allows attackers to further attack systems, maintain persistence, pivot to more systems, and tamper, extract, or destroy data. Most breach studies show time to detect a breach is over 200 days, typically detected by external parties rather than internal processes or monitoring. </p>
				</ol>
				<p>For more information, download the full <a href='files/OWASP_Top_10-2017.pdf' download>pdf</a>.</p>
		</div>
	</div>
	</div>
  </div>
  
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
  <script src="js/quote.js"></script>
  <script src="js/main.js"></script>
</body>
</html>
