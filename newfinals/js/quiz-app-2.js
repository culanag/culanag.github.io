function populate() {
	if(quiz.isEnded()) {
		showScores();
	}
	else {
		var element = document.getElementById("question");
		element.innerHTML = quiz.getQuestionIndex().text;
		
		var choices = quiz.getQuestionIndex().choices;
		for (var i = 0; i < choices.length; i++) {
			var element = document.getElementById("choice" + i);
			element.innerHTML = choices[i];
			guess("button-" + i, choices[i]);
		}
		showProgress();
	}
};

function guess(id, guess) {
	var button = document.getElementById(id);
	button.onclick = function() {
		quiz.guess(guess);
		populate();
	}
}

function showProgress() {
	var currentQuestionNumber = quiz.questionIndex + 1;
	var element = document.getElementById("progress");
	element.innerHTML = "Question " + currentQuestionNumber + " of " + quiz.questions.length;
}

function showScores() {
	var gameOverHTML = "<h1>CONGRATULATIONS</h1>";
		gameOverHTML += "<h2 You Have Finished The Course Topic<br><small>OWASP Top 10 Web App Security Risks</small></h2>";
	var element = document.getElementById("quiz");
	element.innerHTML = gameOverHTML;
}

var questions = [
	new Question("This occurs when untrusted data is sent to an interpreter as part of a command or query.", ["Broken Authentication","XML External Entities","Injection","Insecure Deserialization"], "Injection"),
	new Question("This often leads to remote code execution", ["Insecure Deserialization", "Security Misconfiguration","Insufficient Logging & Monitoring", "Broken Access Control"], "Insecure Deserialization"),
	new Question("This is commonly a result of insecure default configurations, incomplete or ad hoc configurations, etc.", ["Security Misconfigurationg","Insufficient Logging & Monitoring","XML External Entities","Insecure Deserialization"], "Security Misconfiguration"),
	new Question("Restrictions on what authenticated users are allowed to do are often not properly enforced. Attackers can exploit these flaws to access unauthorized functionality and/or data", ["Sensitive Data Exposure","Injection","Broken Access Control","XML External Entities"], "Broken Access Control"),
	new Question("This allows attackers to further attack systems, maintain persistence, pivot to more systems, and tamper, extract, or destroy data.", ["Insufficient Logging & Monitoring","XML External Entities","Sensitive Data Exposure","Broken Authentication"], "Insufficient Logging & Monitoring"),
    new Question("allows attackers to execute scripts in the victim’s browser which can hijack user sessions, deface web sites, or redirect the user to malicious sites.", ["Components w/ known vulnerabilities","Cross-Site Scripting","Sensitive Data Exposure","Broken Authentication"], "Cross-Site Scripting"),
	new Question("Applications and APIs using components with known vulnerabilities may undermine application defenses and enable various attacks and impacts.", ["Components w/ known vulnerabilities","Cross-Site Scripting","XML External Entities","Broken Authentication"], "Components w/ known vulnerabilities"),
    new Question("Allowing attackers to compromise passwords, keys, or session tokens, or to exploit other implementation flaws to assume other users’ identities temporarily or permanently by incorrect implementation of application functions related to authentication and session management ", ["Components w/ known vulnerabilities","Cross-Site Scripting","Insecure Deserialization","XML External Entities"], "Broken Authentication"),
    new Question("External entities can be used to disclose internal files using the file URI handler, internal file shares, internal port scanning, remote code execution, and denial of service attacks.", ["Broken Access Control","Broken Access Control","Sensitive Data Exposure","Broken Authentication"], "XML External Entities"),
    new Question("Sensitive data may be compromised without extra protection, such as encryption at rest or in transit, and requires special precautions when exchanged with the browser.", ["Insecure Deserialization","Security Misconfiguration","Sensitive Data Exposure","Broken Authentication"], "Sensitive Data Exposure"),
];

var quiz = new Quiz(questions);

populate();
