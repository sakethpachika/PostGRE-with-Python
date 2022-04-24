DROP DATABASE IF EXISTS healthcare;

CREATE DATABASE healthcare;

\c healthcare

create table mapping
  (IMS_ID varchar(35) PRIMARY KEY,
   NPI_ID varchar(35) NOT NULL UNIQUE
  );

create table demographics
  (NPI_ID varchar(35) PRIMARY KEY,
   Physician_Name varchar(35) NOT NULL,
   Zip_Code INT NOT NULL,
   City varchar(35) NOT NULL,
   State_Code varchar(35) NOT NULL,
   Gender varchar(35) NOT NULL,
   Years_Practise INT NOT NULL,
   CONSTRAINT fk_demo
   FOREIGN KEY (NPI_ID)
   REFERENCES mapping(NPI_ID)
  );

create table rxdata
  (IMS_ID varchar(35),
   month varchar(35),
   Product_Name varchar(35),
   TRx INT NOT NULL,
   NRx INT NOT NULL,
   PRIMARY KEY (IMS_ID,month,Product_Name),
   CONSTRAINT fk_rxdata
   FOREIGN KEY(IMS_ID)
   REFERENCES mapping(IMS_ID)
 );

 create table targets
   (NPI_ID varchar(35) PRIMARY KEY,
    Target varchar(35) NOT NULL,
    Specialty varchar(35) NOT NULL,
    Tier varchar(35) NOT NULL,
    Decile INT NOT NULL,
  CONSTRAINT fk_targets
  FOREIGN KEY (NPI_ID)
  REFERENCES demographics(NPI_ID)
);

create table roster
  (Rep_ID varchar(35) PRIMARY KEY,
   FLM_ID varchar(35) NOT NULL,
   Joining_Date varchar(35) NOT NULL
);

create table activity
  (NPI_ID varchar(35),
   Rep_ID varchar(35),
   month varchar(35),
   F2F_Calls INT NOT NULL,
   Tele_Calls INT NOT NULL,
   Samples INT NOT NULL,
   PRIMARY KEY (NPI_ID,Rep_ID,month),
   CONSTRAINT fk_activity_npi
   FOREIGN KEY (NPI_ID)
   REFERENCES mapping(NPI_ID),
   CONSTRAINT fk_activity_rep
   FOREIGN KEY (Rep_ID)
   REFERENCES roster(Rep_ID)
 );
