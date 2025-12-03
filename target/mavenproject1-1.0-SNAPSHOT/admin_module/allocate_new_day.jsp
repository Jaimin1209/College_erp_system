<%-- 
    Document   : allocate_new_day
    Created on : 29 Nov 2025, 4:46:37 pm
    Author     : PRITESH
--%>

<%--
    Document   : allocate_new_day
    Created on : 18 Nov 2025, 8:06:02 pm
    Author     :
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>

<%
    // Session validation: Ensure user is logged in and has ADMIN role
  /*  User user = (User) session.getAttribute("user");
    if (user == null || user.getRole() != User.Role.ADMIN) {
        response.sendRedirect("login.jsp?error=Access denied. Admin login required.");
        return;
    }*/
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard - Allocate New Day</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
                       <%@include file="stylesheet/time_table.css" %>

        </style>
    </head>
    <body>
        <div class="sidebar">
            <div class="nav-title">ADMIN PANEL</div>
            <a href="admin_dashboard.jsp">📊 Dashboard</a>
            <a href="department.jsp">🏢 Departments</a>
            <a href="cource.jsp">📚 Courses</a>
            <a href="subjects.jsp">📖 Subjects</a>
            <a href="faculty.jsp">👨‍🏫 Faculty</a>
            <a href="student.jsp">👨‍🎓 Students</a>
            <a href="class_allocation.jsp">📅 Subject Allocation</a>
            <a href="timetable.jsp">⏰ Add Time-table</a>
            <a href="logout.jsp">🚪 Logout</a>
        </div>

        <div class="content-area">
            <div class="container">
                <h1><i class="fas fa-plus"></i> Allocate New Day</h1>
                <hr>

                <!-- Form -->
                <form action="#" method="post">
                    <div class="row">
                        <div class="col-md-4">
                            <label for="dept"><i class="fas fa-building"></i> Department</label>
                            <select name="dept_id" id="dept" class="form-control" required>
                                <option value="">Select Department</option>
                                <option value="1">Computer Science</option>
                                <option value="2">Electrical Engineering</option>
                                <option value="3">Mechanical Engineering</option>
                                <option value="4">Civil Engineering</option>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <label for="sem"><i class="fas fa-graduation-cap"></i> Semester</label>
                            <select name="sem_id" id="sem" class="form-control" required>
                                <option value="">Select Semester</option>
                                <option value="1">1st Semester</option>
                                <option value="2">2nd Semester</option>
                                <option value="3">3rd Semester</option>
                                <option value="4">4th Semester</option>
                                <option value="5">5th Semester</option>
                                <option value="6">6th Semester</option>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <label for="day"><i class="fas fa-calendar-day"></i> Day</label>
                            <select name="day_name" id="day" class="form-control" required>
                                <option value="">Select Day</option>
                                <option value="Monday">Monday</option>
                                <option value="Tuesday">Tuesday</option>
                                <option value="Wednesday">Wednesday</option>
                                <option value="Thursday">Thursday</option>
                                <option value="Friday">Friday</option>
                                <option value="Saturday">Saturday</option>
                            </select>
                        </div>
                    </div>

                    <!-- Timetable Table -->
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Lecture No</th>
                                <th>Subject</th>
                                <th>Faculty</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Lecture 1 -->
                            <tr>
                                <td>1</td>
                                <td>
                                    <select name="subject_id_1" class="form-control">
                                        <option value="">Select Subject</option>
                                        <option value="CS101">Programming Fundamentals</option>
                                        <option value="MA101">Calculus I</option>
                                        <option value="LAB">Computer Lab</option>
                                        <option value="FREE">Free Period</option>
                                    </select>
                                </td>
                                <td>
                                    <select name="faculty_id_1" class="form-control">
                                        <option value="">Select Faculty</option>
                                        <option value="F001">Dr. Jane Smith</option>
                                        <option value="F002">Prof. Alex Jones</option>
                                        <option value="TBD">TBD</option>
                                    </select>
                                </td>
                            </tr>
                            <!-- Lecture 2 -->
                            <tr>
                                <td>2</td>
                                <td>
                                    <select name="subject_id_2" class="form-control">
                                        <option value="">Select Subject</option>
                                        <option value="CS101">Programming Fundamentals</option>
                                        <option value="MA101">Calculus I</option>
                                        <option value="LAB">Computer Lab</option>
                                        <option value="FREE">Free Period</option>
                                    </select>
                                </td>
                                <td>
                                    <select name="faculty_id_2" class="form-control">
                                        <option value="">Select Faculty</option>
                                        <option value="F001">Dr. Jane Smith</option>
                                        <option value="F002">Prof. Alex Jones</option>
                                        <option value="TBD">TBD</option>
                                    </select>
                                </td>
                            </tr>
                            <!-- Lecture 3 -->
                            <tr>
                                <td>3</td>
                                <td>
                                    <select name="subject_id_3" class="form-control">
                                        <option value="">Select Subject</option>
                                        <option value="CS101">Programming Fundamentals</option>
                                        <option value="MA101">Calculus I</option>
                                        <option value="LAB">Computer Lab</option>
                                        <option value="FREE">Free Period</option>
                                    </select>
                                </td>
                                <td>
                                    <select name="faculty_id_3" class="form-control">
                                        <option value="">Select Faculty</option>
                                        <option value="F001">Dr. Jane Smith</option>
                                        <option value="F002">Prof. Alex Jones</option>
                                        <option value="TBD">TBD</option>
                                    </select>
                                </td>
                            </tr>
                            <!-- Lecture 4 (Break) -->
                            <tr>
                                <td>4</td>
                                <td>
                                    <select name="subject_id_4" class="form-control">
                                        <option value="BREAK">LUNCH / BREAK</option>
                                    </select>
                                </td>
                                <td>
                                    <select name="faculty_id_4" class="form-control">
                                        <option value="N/A">N/A</option>
                                    </select>
                                </td>
                            </tr>
                            <!-- Lecture 5 -->
                            <tr>
                                <td>5</td>
                                <td>
                                    <select name="subject_id_5" class="form-control">
                                        <option value="">Select Subject</option>
                                        <option value="CS101">Programming Fundamentals</option>
                                        <option value="MA101">Calculus I</option>
                                        <option value="LAB">Computer Lab</option>
                                        <option value="FREE">Free Period</option>
                                    </select>
                                </td>
                                <td>
                                    <select name="faculty_id_5" class="form-control">
                                        <option value="">Select Faculty</option>
                                        <option value="F001">Dr. Jane Smith</option>
                                        <option value="F002">Prof. Alex Jones</option>
                                        <option value="TBD">TBD</option>
                                    </select>
                                </td>
                            </tr>
                            <!-- Lecture 6 -->
                            <tr>
                                <td>6</td>
                                <td>
                                    <select name="subject_id_6" class="form-control">
                                        <option value="">Select Subject</option>
                                        <option value="CS101">Programming Fundamentals</option>
                                        <option value="MA101">Calculus I</option>
                                        <option value="LAB">Computer Lab</option>
                                        <option value="FREE">Free Period</option>
                                    </select>
                                </td>
                                <td>
                                    <select name="faculty_id_6" class="form-control">
                                        <option value="">Select Faculty</option>
                                        <option value="F001">Dr. Jane Smith</option>
                                        <option value="F002">Prof. Alex Jones</option>
                                        <option value="TBD">TBD</option>
                                    </select>
                                </td>
                            </tr>
                            <!-- Lecture 7 -->
                            <tr>
                                <td>7</td>
                                <td>
                                    <select name="subject_id_7" class="form-control">
                                        <option value="">Select Subject</option>
                                        <option value="CS101">Programming Fundamentals</option>
                                        <option value="MA101">Calculus I</option>
                                        <option value="LAB">Computer Lab</option>
                                        <option value="FREE">Free Period</option>
                                    </select>
                                </td>
                                <td>
                                    <select name="faculty_id_7" class="form-control">
                                        <option value="">Select Faculty</option>
                                        <option value="F001">Dr. Jane Smith</option>
                                        <option value="F002">Prof. Alex Jones</option>
                                        <option value="TBD">TBD</option>
                                    </select>
                                </td>
                            </tr>
                            <!-- Lecture 8 -->
                            <tr>
                                <td>8</td>
                                <td>
                                    <select name="subject_id_8" class="form-control">
                                        <option value="">Select Subject</option>
                                        <option value="CS101">Programming Fundamentals</option>
                                        <option value="MA101">Calculus I</option>
                                        <option value="LAB">Computer Lab</option>
                                        <option value="FREE">Free Period</option>
                                    </select>
                                </td>
                                <td>
                                    <select name="faculty_id_8" class="form-control">
                                        <option value="">Select Faculty</option>
                                        <option value="F001">Dr. Jane Smith</option>
                                        <option value="F002">Prof. Alex Jones</option>
                                        <option value="TBD">TBD</option>
                                    </select>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                    <div class="text-center mt-4">
                        <button type="submit" class="btn btn-success"><i class="fas fa-save"></i> Allocate Day</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>