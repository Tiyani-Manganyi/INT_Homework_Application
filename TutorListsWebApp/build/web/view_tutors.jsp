<%@page import="java.util.Base64"%>
<%@page import="za.ac.tut.model.entity.Image"%>
<%@page import="java.util.List"%>
<%@page import="za.ac.tut.model.entity.Tutor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Tutors Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f9f9f9;
                margin: 0;
                padding: 20px;
            }
            h1 {
                color: #333;
            }
            p {
                color: #555;
            }
            table {
                width: 100%;
                max-width: 800px;
                margin-bottom: 30px;
                border-collapse: collapse;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
                border-radius: 8px;
                overflow: hidden;
            }
            td {
                padding: 12px 15px;
                border-bottom: 1px solid #ddd;
            }
            tr:last-child td {
                border-bottom: none;
            }
            ol {
                padding-left: 20px;
            }
            img {
                margin: 10px;
                border-radius: 8px;
                box-shadow: 0 0 5px rgba(0,0,0,0.1);
            }
            a {
                color: #007BFF;
                text-decoration: none;
                font-weight: bold;
            }
            a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <%
            List<Tutor> tutors = (List<Tutor>) request.getAttribute("tutors");
            String h1 = (String) request.getAttribute("h1");
            String p = (String) request.getAttribute("p");
        %>

        <h1><%=h1%></h1>
        <p><%=p%></p>

        <% for (int i = 0; i < tutors.size(); i++) {
            Tutor tutor = tutors.get(i);
            String tut_name = tutor.getName();
            Long tut_number = tutor.getId();
            Integer tut_age = tutor.getAge();
            String tut_gender = tutor.getGender();
            List<Image> images = tutor.getImages();
            List<String> subjects = tutor.getSubjects();
        %>
        <table>
            <tbody>
                <tr>
                    <td><strong>Tutor Staff Number:</strong></td>
                    <td><%=tut_number%></td>
                </tr>
                <tr>
                    <td><strong>Tutor Name:</strong></td>
                    <td><%=tut_name%></td>
                </tr>
                <tr>
                    <td><strong>Tutor Age:</strong></td>
                    <td><%=tut_age%></td>
                </tr>
                <tr>
                    <td><strong>Tutor Gender:</strong></td>
                    <td><%=tut_gender%></td>
                </tr>
                <tr>
                    <td><strong>Tutor Subjects:</strong></td>
                    <td>
                        <ol>
                        <% for (int x = 0; x < subjects.size(); x++) {
                            String subject = subjects.get(x); %>
                            <li><%=subject%></li>
                        <% } %>
                        </ol>
                    </td>
                </tr>
                <tr>
                    <td><strong>Tutor Images:</strong></td>
                    <td>
                        <% for (int y = 0; y < images.size(); y++) {
                            String image_source = "data:image/png;base64," + Base64.getEncoder().encodeToString(images.get(y).getImage_source()); %>
                            <img src="<%=image_source%>" width="200px" height="200px">
                        <% } %>
                    </td>
                </tr>
            </tbody>
        </table>
        <% } %>

        <p>Please click <a href="menu.html">here</a> to go back to menu or <a href="EndSessionServlet.do">here</a> to logout</p>

    </body>
</html>
