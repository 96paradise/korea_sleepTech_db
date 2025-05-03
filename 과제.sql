-- 학교 테이블
CREATE TABLE school (
    school_id INT PRIMARY KEY,
    school_address VARCHAR(50) NOT NULL,
    school_name VARCHAR(50) NOT NULL
);

-- 학생 테이블
CREATE TABLE student (
    student_id VARCHAR(30) PRIMARY KEY,
    school_id INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    birthday DATE NOT NULL,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(50) NOT NULL,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (school_id) REFERENCES school(school_id)
);

-- 교사 테이블
CREATE TABLE teacher (
    teacher_id VARCHAR(30) PRIMARY KEY,
    school_id INT NOT NULL,
    teacher_name VARCHAR(10) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(50) NOT NULL,
    lecture_status VARCHAR(20) NOT NULL,
    FOREIGN KEY (school_id) REFERENCES school(school_id)
);

-- 과목 테이블
CREATE TABLE subject (
    subject_id VARCHAR(30) PRIMARY KEY,
    subject_name VARCHAR(30) NOT NULL,
    grade VARCHAR(10) NOT NULL,
    semester VARCHAR(10) NOT NULL,
    category VARCHAR(10) NOT NULL
);

-- 수강 신청 테이블
CREATE TABLE application_for_classes (
    application_id INT PRIMARY KEY,
    student_id VARCHAR(30) NOT NULL,
    subject_id VARCHAR(30) NOT NULL,
    application_date DATE NOT NULL,
    UNIQUE (student_id, subject_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (subject_id) REFERENCES subject(subject_id)
);

-- 로그인 기록 테이블
CREATE TABLE loginattempt (
    attempt_id INT PRIMARY KEY,
    student_id VARCHAR(30),
    teacher_id VARCHAR(30),
    success BOOLEAN NOT NULL,
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (teacher_id) REFERENCES teacher(teacher_id)
);

-- 교사-과목 중간 테이블
CREATE TABLE teacher_subject (
    teacher_id VARCHAR(30),
    subject_id VARCHAR(30),
    PRIMARY KEY (teacher_id, subject_id),
    FOREIGN KEY (teacher_id) REFERENCES teacher(teacher_id),
    FOREIGN KEY (subject_id) REFERENCES subject(subject_id)
);
