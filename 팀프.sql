-- 1) 데이터베이스 생성 및 선택
CREATE DATABASE IF NOT EXISTS school_management;
USE school_management;

-- 2) 학교 정보 테이블
CREATE TABLE School (
    school_id INT PRIMARY KEY,
    school_name VARCHAR(50) NOT NULL
);

-- 3) 관리자 정보 테이블
CREATE TABLE Admin (
    admin_id VARCHAR(30) PRIMARY KEY,
    school_id INT NOT NULL
);

-- 3-1) 관리자 과목 생성
CREATE TABLE Admin_Create (
admin_id VARCHAR(30) PRIMARY KEY,
school_id INT NOT NULL,
subject_id VARCHAR(30) NOT NULL,
teacher_name VARCHAR(10) NOT NULL,
lecture_status ENUM('수업 중', '공강') NOT NULL,
FOREIGN KEY (school_id) REFERENCES School (school_id),
create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 4) 과목 테이블
CREATE TABLE Subject (
    subject_id VARCHAR(30) PRIMARY KEY,
    school_id INT NOT NULL,
    subject_name VARCHAR(30) NOT NULL,
    grade VARCHAR(10) NOT NULL,
    semester VARCHAR(10) NOT NULL,
    category ENUM('수강완료', '수강 미선택') NOT NULL,
    FOREIGN KEY (school_id) REFERENCES School (school_id)
);

-- 5) 학생 정보 테이블
CREATE TABLE Student (
  student_id VARCHAR(30) PRIMARY KEY,
  school_id INT NOT NULL,
  name VARCHAR(50) NOT NULL,
  phone_number VARCHAR(20) NOT NULL,
  birthday DATE NOT NULL,
  password VARCHAR(100) NOT NULL,
  email VARCHAR(50) NOT NULL UNIQUE,
  status ENUM('재학','졸업') NOT NULL,
  student_grade INT NOT NULL,
  FOREIGN KEY (school_id) REFERENCES School(school_id)
); 

-- 6) 학생-과목 매핑 테이블 (수강신청 기본 정보)
CREATE TABLE Student_subject (
    student_id VARCHAR(30) NOT NULL,
    subject_id VARCHAR(30) NOT NULL,
    grade VARCHAR(10) NOT NULL,
    affiliation ENUM('이과', '문과') NOT NULL,
    PRIMARY KEY (student_id , subject_id),
    FOREIGN KEY (student_id) REFERENCES Student (student_id),
    FOREIGN KEY (subject_id) REFERENCES Subject (subject_id)
);

-- 7) 관리자-과목 매핑 테이블 (과목 담당 권한)
CREATE TABLE Admin_subject (
    admin_id VARCHAR(30) NOT NULL,
    subject_id VARCHAR(30) NOT NULL,
    PRIMARY KEY (admin_id , subject_id),
    FOREIGN KEY (admin_id) REFERENCES Admin (admin_id),
    FOREIGN KEY (subject_id) REFERENCES Subject (subject_id)
);

-- 8) 로그인 시도 기록 테이블
CREATE TABLE Loginattempt (
    attempt_id INT AUTO_INCREMENT PRIMARY KEY,
    admin_id VARCHAR(30),
    student_id VARCHAR(30),
    success BOOLEAN NOT NULL,
    FOREIGN KEY (admin_id) REFERENCES Admin (admin_id),
    FOREIGN KEY (student_id) REFERENCES Student (student_id)
);

-- 9) 수강 신청 이력 테이블
CREATE TABLE Application_for_classes (
    application_id INT AUTO_INCREMENT PRIMARY KEY,
    application_date DATE NOT NULL,
    student_id VARCHAR(30) NOT NULL,
    subject_id VARCHAR(30) NOT NULL,
    FOREIGN KEY (student_id , subject_id) REFERENCES Student_subject (student_id , subject_id)
);

-- 시간표 (Schedule) 테이블
CREATE TABLE Schedule (
    timetable_id INT AUTO_INCREMENT PRIMARY KEY,
    subject_name VARCHAR(20) NOT NULL,
    day_of_week VARCHAR(20) NOT NULL,
    startPeriod INT NOT NULL,
    endPeriod INT NOT NULL,
    classroom INT NOT NULL,
    tearcher INT NOT NULL
);

-- 공지사항 (Notice) 테이블
CREATE TABLE Notice (
    notice_id INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(255) NOT NULL,
    contect TEXT NOT NULL,
    created_at DATETIME NOT NULL,
	author INT NOT NULL,
    target VARCHAR(20) NOT NULL,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 교실 (Classroom) 테이블
CREATE TABLE Classroom (
    classroom_id INT AUTO_INCREMENT PRIMARY KEY,
    roomNumber VARCHAR(20) NOT NULL,
    capacity INT NOT NULL,
    isAvailable BOOLEAN NOT NULL,
	locatrion VARCHAR(255) NOT NULL,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 수강제한 (CourseRestriction) 테이블
 CREATE TABLE CourseRestriction (
    restriction_id INT AUTO_INCREMENT PRIMARY KEY,
    subject_id VARCHAR(20) NOT NULL,
    minGrade INT NOT NULL,
    maxGrade INT NOT NULL,
    isDuplicateAllowed BOOLEAN NOT NULL,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 과거 수강 기록 (PastEnrollment) 테이블
CREATE TABLE PastEnrollment (
    student_id INT NOT NULL,
    subject_id VARCHAR(20) NOT NULL,
    semester VARCHAR(10) NOT NULL,
    year INT NOT NULL,
    teacherName VARCHAR(50) NOT NULL,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 현재 수강신청 기록 (CurrentEnrollment) 테이블
CREATE TABLE CurrentEnrollment (
    student_id INT NOT NULL,
    subject_id VARCHAR(20) NOT NULL,
    semester VARCHAR(10) NOT NULL,
    year INT NOT NULL,
    registrationStatus VARCHAR(20) NOT NULL,
    registrationDate DATETIME NOT NULL,
	create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
