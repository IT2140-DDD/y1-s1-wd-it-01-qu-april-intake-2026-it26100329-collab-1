CREATE TABLE Course (
    CID             VARCHAR(10)     PRIMARY KEY,
    Cname           VARCHAR(50)     NOT NULL,
    C_Description   VARCHAR(255),
    C_fee           DECIMAL(10,2)
);

CREATE TABLE Module (
    Mcode           VARCHAR(10)     PRIMARY KEY,
    Mname           VARCHAR(50)     NOT NULL,
    M_Description   VARCHAR(255),
    NoOfCredits     INT
);

CREATE TABLE Student (
    SID         VARCHAR(10)     PRIMARY KEY,
    Sname       VARCHAR(50)     NOT NULL,
    Address     VARCHAR(255),
    dob         DATE,
    NIC         VARCHAR(10),
    CID         VARCHAR(10),
    CONSTRAINT fk_student_course FOREIGN KEY (CID)
        REFERENCES Course(CID)
);

CREATE TABLE Offers (
    CID             VARCHAR(10),
    Mcode           VARCHAR(10),
    Accadamic_year  VARCHAR(10),
    Semester        VARCHAR(5),
    CONSTRAINT pk_offers PRIMARY KEY (CID, Mcode),
    CONSTRAINT fk_offers_course FOREIGN KEY (CID)
        REFERENCES Course(CID),
    CONSTRAINT fk_offers_module FOREIGN KEY (Mcode)
        REFERENCES Module(Mcode)
);

ALTER TABLE Student
ADD CONSTRAINT chk_student_nic
CHECK (NIC LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][Vv]');


ALTER TABLE Module
ADD CONSTRAINT chk_module_credits
CHECK (NoOfCredits IN (1, 2, 3, 4));
