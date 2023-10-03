CREATE TABLE patients (
	patient_id INTEGER PRIMARY KEY,
	name VARCHAR,
	date_of_birth DATE	
);

CREATE TABLE medical_histories (
	id INTEGER PRIMARY KEY,
	admitted_at TIMESTAMP,
	patient_id INTEGER,
	status VARCHAR,
	FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

CREATE TABLE treatments (
	id INTEGER PRIMARY KEY,
	type VARCHAR,
	name VARCHAR
);

