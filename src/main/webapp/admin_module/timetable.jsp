<!DOCTYPE html>
<html>
<head>
    <title>Add Timetable (Static)</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
    <style>
         /* --- Sidebar & Base Styles --- */
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f9;
                margin: 0;
                padding: 0;
                min-height: 100vh;
            }


            .content-area {

                margin-left: 250px;
                padding: 20px;
                padding-top: 40px;
            }



            .sidebar {
                height: 100%;
                width: 250px;
                position: fixed;
                z-index: 1;
                top: 0;
                left: 0;
                background-color: #343a40;
                overflow-x: hidden;
                padding-top: 0;
                box-shadow: 2px 0 5px rgba(0, 0, 0, 0.2);
            }

            .sidebar a {
                padding: 10px 20px;
                text-decoration: none;
                font-size: 16px;
                color: #f8f9fa;
                display: block;
                transition: background-color 0.3s;
                border-bottom: 1px solid #454d55;
            }

            .sidebar a:hover {
                background-color: #495057;
                color: #fff;
            }

            .nav-title {
                font-size: 18px;
                font-weight: 600;
                padding: 12px 20px;
                color: #fff;
                background: #212529;
                margin-bottom: 0;
                border-bottom: 1px solid #454d55;
            }

        /* --- New Layout Wrapper for Side Panel and Main Content --- */
        .page-wrapper {
            display: flex;
            max-width: 1200px; /* Increased max-width for sidebar space */
            margin: 0px auto;
            gap: 20px;
        }

        .container {
            /* Now takes remaining space instead of fixed max-width */
            flex-grow: 1;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            margin: 0; /* Remove previous auto margin */
        }
        
        /* --- New Side Panel Styling --- */
        .side-panel {
            width: 250px; /* Fixed width for the sidebar */
            flex-shrink: 0;
            background: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            height: fit-content; /* Only take the height needed */
        }

        .side-panel h3 {
            color: #007bff;
            border-bottom: 2px solid #e0e0e0;
            padding-bottom: 10px;
            margin-top: 0;
            font-weight: 700;
            font-size: 1.2em;
        }

        .side-panel ul {
            list-style: none;
            padding: 0;
        }

        .side-panel li a {
            display: block;
            padding: 10px 0;
            color: #555;
            text-decoration: none;
            border-bottom: 1px dashed #eee;
            transition: color 0.2s;
            font-weight: 500;
        }

        .side-panel li a:hover {
            color: #007bff;
            font-weight: 600;
        }
        /* --- End Side Panel Styling --- */

        /* --- Media Query for Responsiveness (Stacking on Small Screens) --- */
        @media (max-width: 900px) {
            .page-wrapper {
                flex-direction: column; /* Stack vertically */
                gap: 15px;
            }
            .side-panel {
                width: 100%; /* Full width when stacked */
            }
            body {
                padding: 10px;
            }
        }
        /* --- End Responsive Layout --- */

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
            font-weight: 700;
        }

        label {
            display: block;
            margin-top: 15px;
            margin-bottom: 5px;
            font-weight: 600;
            color: #555;
        }

        select, button {
            padding: 10px;
            width: 100%;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
            transition: border-color 0.3s;
        }

        select:focus {
            outline: none;
            border-color: #007bff;
        }

        table {
            width: 100%;
            margin-top: 30px;
            border-collapse: separate;
            border-spacing: 0;
            overflow: hidden;
            border-radius: 8px;
        }

        th, td {
            border: 1px solid #e0e0e0;
            padding: 12px;
            text-align: center;
        }

        th {
            background: #007bff;
            color: white;
            font-weight: 600;
        }
        
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        td select {
            width: 100%;
            margin: 0;
            padding: 8px;
            border: 1px solid #ddd;
        }

        .btn-save {
            background: #28a745;
            color: white;
            border: none;
            cursor: pointer;
            margin-top: 30px;
            padding: 14px;
            width: 250px;
            display: block;
            margin-left: auto;
            margin-right: auto;
            font-size: 1.1em;
            font-weight: 600;
            box-shadow: 0 4px 6px rgba(40, 167, 69, 0.3); /* Changed shadow color to match green */
            transition: background 0.3s ease;
        }

        .btn-save:hover {
            background: #218838;
        }
    </style>
</head>

<body>

<div class="page-wrapper">
    
    <!-- Side Panel -->
    <div class="side-panel">
        <h3>Timetable Menu</h3>
        <ul>
            <li><a href="view_current_time_table.jsp">View Current Timetable</a></li>
            <li><a href="allocate_new_day.jsp">Allocate New Day</a></li>
            <li><a href="manage_subjects.jsp">Manage Subjects</a></li>
            <li><a href="manage_faculties.jsp">Manage Faculty</a></li>
            <li><a href="report_conflicts.jsp">Report Conflicts</a></li>
        </ul>

        <div style="margin-top: 30px; padding-top: 20px; border-top: 1px solid #eee; text-align: center;">
            <p style="font-size: 0.9em; color: #888;">Allocation Tool v1.0</p>
        </div>
    </div>
    
    <!-- Main Content Container -->
    <div class="container">
        <h2>Allocate Timetable (Full Day)</h2>

        <!-- TOP SELECTION -->
        <form action="#" method="post">

            <label for="dept">Department</label>
            <select name="dept_id" id="dept">
                <option value="">Select Department</option>
                <!-- Static Options -->
                <option value="1">Computer Science</option>
                <option value="2">Electrical Engineering</option>
                <option value="3">Mechanical Engineering</option>
                <option value="4">Civil Engineering</option>
            </select>

            <label for="sem">Semester</label>
            <select name="sem_id" id="sem">
                <option value="">Select Semester</option>
                <!-- Static Options -->
                <option value="1">1st Semester</option>
                <option value="2">2nd Semester</option>
                <option value="3">3rd Semester</option>
                <option value="4">4th Semester</option>
                <option value="5">5th Semester</option>
                <option value="6">6th Semester</option>
            </select>

            <label for="day">Day</label>
            <select name="day_name" id="day">
                <option>Monday</option>
                <option>Tuesday</option>
                <option>Wednesday</option>
                <option>Thursday</option>
                <option>Friday</option>
                <option>Saturday</option>
            </select>

            <!-- FULL DAY LECTURES -->
            <table>
                <tr>
                    <th>Lecture No</th>
                    <th>Subject</th>
                    <th>Faculty</th>
                </tr>

                <!-- Static Rows for 8 Lectures -->
                
                <!-- Lecture 1 -->
                <tr>
                    <td>1</td>
                    <td>
                        <select name="subject_id_1">
                            <option value="">Select Subject</option>
                            <option value="CS101">Programming Fundamentals</option>
                            <option value="MA101">Calculus I</option>
                            <option value="LAB">Computer Lab</option>
                            <option value="FREE">Free Period</option>
                        </select>
                    </td>
                    <td>
                        <select name="faculty_id_1">
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
                        <select name="subject_id_2">
                            <option value="">Select Subject</option>
                            <option value="CS101">Programming Fundamentals</option>
                            <option value="MA101">Calculus I</option>
                            <option value="LAB">Computer Lab</option>
                            <option value="FREE">Free Period</option>
                        </select>
                    </td>
                    <td>
                        <select name="faculty_id_2">
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
                        <select name="subject_id_3">
                            <option value="">Select Subject</option>
                            <option value="CS101">Programming Fundamentals</option>
                            <option value="MA101">Calculus I</option>
                            <option value="LAB">Computer Lab</option>
                            <option value="FREE">Free Period</option>
                        </select>
                    </td>
                    <td>
                        <select name="faculty_id_3">
                            <option value="">Select Faculty</option>
                            <option value="F001">Dr. Jane Smith</option>
                            <option value="F002">Prof. Alex Jones</option>
                            <option value="TBD">TBD</option>
                        </select>
                    </td>
                </tr>
                
                <!-- Lecture 4 (Often Lunch or Break) -->
                <tr>
                    <td>4</td>
                    <td>
                        <select name="subject_id_4">
                            <option value="BREAK">LUNCH / BREAK</option>
                        </select>
                    </td>
                    <td>
                        <select name="faculty_id_4">
                            <option value="N/A">N/A</option>
                        </select>
                    </td>
                </tr>

                <!-- Lecture 5 -->
                <tr>
                    <td>5</td>
                    <td>
                        <select name="subject_id_5">
                            <option value="">Select Subject</option>
                            <option value="CS101">Programming Fundamentals</option>
                            <option value="MA101">Calculus I</option>
                            <option value="LAB">Computer Lab</option>
                            <option value="FREE">Free Period</option>
                        </select>
                    </td>
                    <td>
                        <select name="faculty_id_5">
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
                        <select name="subject_id_6">
                            <option value="">Select Subject</option>
                            <option value="CS101">Programming Fundamentals</option>
                            <option value="MA101">Calculus I</option>
                            <option value="LAB">Computer Lab</option>
                            <option value="FREE">Free Period</option>
                        </select>
                    </td>
                    <td>
                        <select name="faculty_id_6">
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
                        <select name="subject_id_7">
                            <option value="">Select Subject</option>
                            <option value="CS101">Programming Fundamentals</option>
                            <option value="MA101">Calculus I</option>
                            <option value="LAB">Computer Lab</option>
                            <option value="FREE">Free Period</option>
                        </select>
                    </td>
                    <td>
                        <select name="faculty_id_7">
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
                        <select name="subject_id_8">
                            <option value="">Select Subject</option>
                            <option value="CS101">Programming Fundamentals</option>
                            <option value="MA101">Calculus I</option>
                            <option value="LAB">Computer Lab</option>
                            <option value="FREE">Free Period</option>
                        </select>
                    </td>
                    <td>
                        <select name="faculty_id_8">
                            <option value="">Select Faculty</option>
                            <option value="F001">Dr. Jane Smith</option>
                            <option value="F002">Prof. Alex Jones</option>
                            <option value="TBD">TBD</option>
                        </select>
                    </td>
                </tr>
            </table>

            <button class="btn-save" type="submit">Save Timetable</button>

        </form>
    </div>

</div>

</body>
</html>