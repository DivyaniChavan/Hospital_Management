-- Create the Hospital Management Database
CREATE DATABASE Hospital_Management;
USE Hospital_Management;

-- Create the Patient Table
CREATE TABLE Patient_Details (
    PatientID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    ContactNumber VARCHAR(20),
    Address VARCHAR(255)
);

-- Create the Department table
CREATE TABLE Department_Details (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

-- Create the Doctor table
CREATE TABLE Doctor_Details (
    DoctorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Specialization VARCHAR(50),
    ContactNumber VARCHAR(20),
    Email VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department_Details(DepartmentID)
);

-- Create the Appointment table
CREATE TABLE Appointment_Details 
(
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATETIME,
    Status VARCHAR(20),
    FOREIGN KEY (PatientID) REFERENCES Patient_Details(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor_Details(DoctorID)
);

-- Create the MedicalRecord table
CREATE TABLE MedicalRecord (
    RecordID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    Date DATE,
    Diagnosis TEXT,
    Prescription TEXT,
    TestResults TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patient_Details(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor_Details(DoctorID)
);

-- Create the Billing table
CREATE TABLE Billing_Details (
    BillID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentID INT,
    BillDate DATETIME,
    TotalAmount DECIMAL(10, 2),
    PaymentStatus VARCHAR(20),
    FOREIGN KEY (PatientID) REFERENCES Patient_Details(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor_Details(DoctorID),
    FOREIGN KEY (AppointmentID) REFERENCES Appointment_Details(AppointmentID)
);

-- Create the User table
CREATE TABLE User_Details (
    UserID INT PRIMARY KEY,
    Username VARCHAR(50),
    Password VARCHAR(50),
    Role VARCHAR(20)
);
