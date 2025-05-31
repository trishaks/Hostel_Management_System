package com.dao;

import com.model.Student;
import java.sql.*;
import java.util.*;
import java.sql.Date;
public class HostelDAO {

    private Connection connect() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/hosteldb", "root", "");
    }

    // ✅ Add Student - returns true if insertion is successful
    public boolean addStudent(Student s) throws Exception {
        boolean success = false;
        String sql = "INSERT INTO HostelStudents (StudentID, StudentName, RoomNumber, AdmissionDate, FeesPaid, PendingFees) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection con = connect(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, s.getStudentID());
            ps.setString(2, s.getStudentName());
            ps.setString(3, s.getRoomNumber());
            ps.setDate(4, s.getAdmissionDate());
            ps.setDouble(5, s.getFeesPaid());
            ps.setDouble(6, s.getPendingFees());
            int rowsInserted = ps.executeUpdate();
            success = rowsInserted > 0;
        }
        return success;
    }

    // ✅ Update Student
    public void updateStudent(Student s) throws Exception {
        String sql = "UPDATE HostelStudents SET StudentName=?, RoomNumber=?, AdmissionDate=?, FeesPaid=?, PendingFees=? WHERE StudentID=?";
        try (Connection con = connect(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, s.getStudentName());
            ps.setString(2, s.getRoomNumber());
            ps.setDate(3, s.getAdmissionDate());
            ps.setDouble(4, s.getFeesPaid());
            ps.setDouble(5, s.getPendingFees());
            ps.setInt(6, s.getStudentID());
            ps.executeUpdate();
        }
    }

    // ✅ Delete Student by ID
    public void deleteStudent(int id) throws Exception {
        String sql = "DELETE FROM HostelStudents WHERE StudentID=?";
        try (Connection con = connect(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }

    // ✅ Get All Students
    public List<Student> getAllStudents() throws Exception {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT * FROM HostelStudents";
        try (Connection con = connect(); Statement st = con.createStatement(); ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                Student s = new Student();
                s.setStudentID(rs.getInt("StudentID"));
                s.setStudentName(rs.getString("StudentName"));
                s.setRoomNumber(rs.getString("RoomNumber"));
                s.setAdmissionDate(rs.getDate("AdmissionDate"));
                s.setFeesPaid(rs.getDouble("FeesPaid"));
                s.setPendingFees(rs.getDouble("PendingFees"));
                list.add(s);
            }
        }
        return list;
    }

    // ✅ Get Students With Pending Fees
    public List<Student> getStudentsWithPendingFees() throws Exception {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT * FROM HostelStudents WHERE PendingFees > 0";
        try (Connection con = connect(); Statement st = con.createStatement(); ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                Student s = new Student();
                s.setStudentID(rs.getInt("StudentID"));
                s.setStudentName(rs.getString("StudentName"));
                s.setRoomNumber(rs.getString("RoomNumber"));
                s.setAdmissionDate(rs.getDate("AdmissionDate"));
                s.setFeesPaid(rs.getDouble("FeesPaid"));
                s.setPendingFees(rs.getDouble("PendingFees"));
                list.add(s);
            }
        }
        return list;
    }

    // ✅ Get Students by Room
    public List<Student> getStudentsByRoom(String room) throws Exception {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT * FROM HostelStudents WHERE RoomNumber = ?";
        try (Connection con = connect(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, room);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Student s = new Student();
                    s.setStudentID(rs.getInt("StudentID"));
                    s.setStudentName(rs.getString("StudentName"));
                    s.setRoomNumber(rs.getString("RoomNumber"));
                    s.setAdmissionDate(rs.getDate("AdmissionDate"));
                    s.setFeesPaid(rs.getDouble("FeesPaid"));
                    s.setPendingFees(rs.getDouble("PendingFees"));
                    list.add(s);
                }
            }
        }
        return list;
    }

    // ✅ Get Students Admitted Between Two Dates
    public List<Student> getStudentsAdmittedBetween(String start, String end) throws Exception {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT * FROM HostelStudents WHERE AdmissionDate BETWEEN ? AND ?";
        try (Connection con = connect(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setDate(1, Date.valueOf(start));
            ps.setDate(2, Date.valueOf(end));
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Student s = new Student();
                    s.setStudentID(rs.getInt("StudentID"));
                    s.setStudentName(rs.getString("StudentName"));
                    s.setRoomNumber(rs.getString("RoomNumber"));
                    s.setAdmissionDate(rs.getDate("AdmissionDate"));
                    s.setFeesPaid(rs.getDouble("FeesPaid"));
                    s.setPendingFees(rs.getDouble("PendingFees"));
                    list.add(s);
                }
            }
        }
        return list;
    }
}
