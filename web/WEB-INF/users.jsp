<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Users</title>
    </head>
    <body>
        <h1>Manage Users</h1>
        
        <p>
            <c:if test="${user.email == null}">No users found. Please add a user</c:if>
        </p>
        
        <c:if test="${user.email != null}">
            <table>
                <tr>
                    <th>Email</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Role</th>
                    <th> </th>
                    <th> </th>
                </tr>
            <c:forEach items="${users}" var="user">
                <tr>
                    <td>${user.getEmail()}</td>
                    <td>${user.getFirstName()}</td>
                    <td>${user.getLastName()}</td>
                    <td>${user.getRole().getRoleName()}</td>
                    <td><a href="notes?action=edit&amp;email=${user.getEmail()}">Edit</a></td>
                    <td><a href="notes?action=delete&amp;email=${user.getEmail()}">Delete</a></td>
                </tr>
            </c:forEach>
            </table>

        
        <c:if test="${edit != null}">
            <h2>Add User</h2>
            <form action="notes" method="post">
                Email: <input type="text" name="email" value="${email}"><br>
                First name: <input type="text" name="firstname" value="${firstname}"><br>
                Last name: <input type="text" name="lastname" value="${lastname}"><br>
                Password: <input type="password" name="password" value=""><br>
                <label for = "roleDropDown">Role:</label>
                <select name = "role">
                    <option value="1">system admin</option>
                    <option value="2">regular user</option>
                </select>
                <br>
                <input type="hidden" name="action" value="add">
                <input type="submit" value="Add user">
            </form>
        </c:if>
            
        <c:if test="${edit == null}">
            <h2>Edit User</h2>
            <form action="notes" method="post">
                Email: ${user.getEmail()}<br>
                First name: <input type="text" name="firstname" value="${fname}"><br>
                Last name: <input type="text" name="firstname" value="${lname}"><br>
                Password: <input type="password" name="password" value=""><br>
                <label for = "roleDropDown">Role:</label>
                <select name="role">
                    <option value="1">system admin</option>
                    <option value="2">regular user</option>
                </select>
                <br>
                <input type="hidden" name="action" value="Update">
                <input type="submit" value="Update">
                <input type="hidden" name="action" value="Cancel">
                <input type="submit" value="Cancel">
            </form>
    </body>
</html>
