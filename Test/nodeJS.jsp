<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Homeseek</title>
  <!-- Bootstrap CSS CDN -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <!-- Our Custom CSS -->
  <link rel="stylesheet" href="css/style.css"> </head>
  <link rel="stylesheet" href="css/responsive.css" type="text/css">

    
     <sql:setDataSource driver="com.mysql.jdbc.Driver"
            user="root" password=""
            url="jdbc:mysql://localhost:3306/versions"/>
 
            <sql:query var="result">
            SELECT version.version_release, version.version_code_name, version.release_date, version.version_lts FROM version INNER JOIN technology USING (tech_id) WHERE technology.name = "Node.JS";
        </sql:query>

  <table class="version">
		<tr>
			<th>Version</th>
			<th>Code Name</th>
			<th>Release Date</th>
			<th>LTS Status(as of May 2018)</th>
		</tr>
            <c:forEach var="rows" items="${result.rows}">
                <tr>
					<td>${rows.version_release}</td>
					<td>${rows.release_date}</td>
					<td>${rows.version_details}</td>
                </tr>                    
            </c:forEach>
  </table>