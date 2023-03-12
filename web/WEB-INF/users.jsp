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
            <c:if test="${user.email.isempty()}">No users found. Please add a user</c:if>
        </p>
        
            <table>
                <tr>
                    <th>Email</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Role</th>
                    <th> </th>
                    <th> </th>
                </tr>
            <c:forEach items="${allUsers}" var="user">
                <tr>
                    <td>${user.email}</td>
                    <td>${user.firstName}</td>
                    <td>${user.lastName}</td>
                    <c:choose>
                        <c:when test="${user.getRole().getRoleID() == 1}">
                            <td>system admin</td>
                        </c:when>
                        <c:otherwise>
                            <td>regular user</td>
                        </c:otherwise>
                    </c:choose>
                    <td><a href="user?action=edit&amp;email=${user.email}">Edit</a></td>
                    <td><a href="user?action=delete&amp;email=${user.email}">Delete</a></td>
                </tr>
            </c:forEach>
            </table>

        
        <c:if test="${selectedUser eq null}">
            <h2>Add User</h2>
            <form action="" method="post">
                Email: <input type="text" name="email" value="${email}"><br>
                First name: <input type="text" name="firstName" value="${firstName}"><br>
                Last name: <input type="text" name="lastName" value="${lastName}"><br>
                Password: <input type="password" name="password" value=""><br>
                Role<select name = "role">
                    <option value="1">system admin</option>
                    <option value="2">regular user</option>
                </select>
                <br>
                <input type="hidden" name="action" value="add">
                <input type="submit" value="Add user">
            </form>
        </c:if>
            
        <c:if test="${selectedUser ne null}">
            <h2>Edit User</h2>
            <form action="users" method="post">
                Email: ${selectedUser.email}<br>
                First name: <input type="text" name="firstName" value="${selectedUser.firstName}"><br>
                Last name: <input type="text" name="lastName" value="${selectedUser.lastName}"><br>
                Password: <input type="password" name="password" value=""><br>
                Role<select name = "role">
                    <option value="1">system admin</option>
                    <option value="2">regular user</option>
                </select>
                <br>
                <input type="hidden" name="action" value="update">
                <input type="submit" value="Update">
                <input type="hidden" name="action" value="cancel">
                <input type="submit" value="Cancel">
            </form>
        </c:if>
    </body>
</html>
