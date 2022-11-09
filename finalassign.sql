use groupassign;

#create table Blood_Type (bloodtype_id INT NOT NULL, bloodtype_letter varchar(16) NULL, PRIMARY KEY(bloodtype_id));
#create table Disease(disease_id INT NOT NULL, disease_name varchar(64) NULL, PRIMARY KEY(disease_id));
#CREATE TABLE Zip(zip varchar(16) NOT NULL, city varchar(32) NULL, state varchar(32) NOT NULL, PRIMARY KEY(zip));
#CREATE TABLE Address(address_id varchar(16), zip varchar(16) NOT NULL, street varchar(64) NULL, PRIMARY KEY
#(address_id), FOREIGN KEY(zip) REFERENCES Zip(zip));

#CREATE TABLE Patient(patient_id INT NOT NULL, bloodtype_id INT NOT NULL, disease_id INT NOT NULL, fname varchar(64) NOT NULL,
#lname varchar(64) NOT NULL, address_id varchar(16) NOT NULL, patient_dob DATE NOT NULL, patient_email varchar(128) NULL,
#patient_num varchar(13) NOT NULL, PRIMARY KEY(patient_id), FOREIGN KEY (bloodtype_id) REFERENCES Blood_Type(bloodtype_id), 
#FOREIGN KEY(disease_id) REFERENCES Disease(disease_id), FOREIGN KEY(address_id) REFERENCES Address(address_id));

#CREATE TABLE Donor(donor_id varchar(16) NOT NULL, bloodtype_id INT NOT NULL, donor_dob date NULL, donor_email varchar(128) NULL,
#donor_num varchar(13) NOT NULL, PRIMARY KEY(donor_id), FOREIGN KEY(bloodtype_id) REFERENCES Blood_Type(bloodtype_id));

#CREATE TABLE Blood_bank(bloodbank_id varchar(16) NOT NULL, bloodbankname varchar(64) NOT NULL,
#address_id varchar(16) NULL, PRIMARY KEY(bloodbank_id), FOREIGN KEY(address_id) REFERENCES Address(address_id));

#CREATE TABLE Hospital(hospital_id varchar(16) NOT NULL, hospital_name varchar(64) NOT NULL,
#address_id varchar(16) NULL, PRIMARY KEY(hospital_id), FOREIGN KEY (address_id) REFERENCES Address(address_id));

#CREATE TABLE Bloodbank_inv(bloodbank_id varchar(16) NOT NULL,
#bloodtype_id INT NOT NULL, qty INT NOT NULL, PRIMARY KEY(bloodbank_id, bloodtype_id),
#FOREIGN KEY (bloodbank_id) REFERENCES Blood_bank(bloodbank_id), FOREIGN KEY (bloodtype_id)
#REFERENCES Blood_Type(bloodtype_id));

#CREATE TABLE Hospital_inv(hospital_id varchar(16) NOT NULL, bloodtype_id INT NOT NULL, qty INT NOT NULL,
#PRIMARY KEY (hospital_id, bloodtype_id),FOREIGN KEY (hospital_id) REFERENCES Hospital(hospital_id), FOREIGN KEY (bloodtype_id) REFERENCES Blood_Type(bloodtype_id));

#CREATE TABLE Hospital_Rec(visit_id varchar(16), hospital_id varchar(16), patient_id INT NOT NULL, 
#disease_id INT NOT NULL, bloodtype_id INT NOT NULL, visit_date DATE NOT NULL, visit_time TIME NULL,
#PRIMARY KEY(visit_id), FOREIGN KEY (hospital_id) REFERENCES Hospital(hospital_id), 
#FOREIGN KEY (patient_id) REFERENCES Patient(patient_id), FOREIGN KEY(disease_id) REFERENCES Disease(disease_id),
#FOREIGN KEY (bloodtype_id) REFERENCES Blood_Type(bloodtype_id));

#CREATE TABLE Request(request_id varchar(16) NOT NULL, hospital_id varchar(16) NOT NULL, patient_id INT NULL,
#bloodtype_id INT NOT NULL, request_date DATE NULL, request_time TIME NULL, processed varchar(3) NOT NULL,
#PRIMARY KEY(request_id), FOREIGN KEY (hospital_id) REFERENCES Hospital(hospital_id), 
#FOREIGN KEY(patient_id) REFERENCES Patient(patient_id), FOREIGN KEY(bloodtype_id) REFERENCES Blood_type(bloodtype_id));

#CREATE TABLE Blood_Shipment(shipment_id varchar(16) NOT NULL, request_id varchar(16) NOT NULL,
#bloodbank_id varchar(16) NOT NULL, donor_id varchar(16) NULL, hospital_id varchar(16) NOT NULL, 
#shipment_date DATE NULL, shipment_time DATETIME NULL, PRIMARY KEY(shipment_id), 
#FOREIGN KEY(request_id) REFERENCES Request(request_id), FOREIGN KEY(bloodbank_id) REFERENCES Blood_bank(bloodbank_id),
#FOREIGN KEY(donor_id) REFERENCES Donor(donor_id), FOREIGN KEY(hospital_id) REFERENCES Hospital(hospital_id));

#CREATE TABLE Transfusions(transfusion_id varchar(16) NOT NULL, trans_date DATE NOT NULL, hospital_id varchar(16) NOT NULL, 
#patient_id INT NOT NULL, bloodtype_id INT NOT NULL, disease_id INT NOT NULL, success varchar(3) NOT NULL,
#PRIMARY KEY(transfusion_id), FOREIGN KEY (hospital_id) REFERENCES Hospital(hospital_id), FOREIGN KEY (disease_id) REFERENCES Disease(disease_id));


