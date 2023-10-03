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

CREATE TABLE invoices (
	id INTEGER PRIMARY KEY,
	total_amount DECIMAL,
	generated_at TIMESTAMP,
	payed_at TIMESTAMP,
	medical_history_id INTEGER,
	FOREIGN KEY (medical_history_id) REFERENCES medical_histories (id)
);

CREATE TABLE invoice_items (
	id INTEGER PRIMARY KEY,
	unit_price DECIMAL,
	quantity INTEGER,
	total_price DECIMAL,
	invoice_id INTEGER,
	treatment_id INTEGER,
	FOREIGN KEY (invoice_id) REFERENCES invoices (id),
	FOREIGN KEY (treatment_id) REFERENCES treatments (id)
);
