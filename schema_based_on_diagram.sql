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

CREATE INDEX idx_patient_id_medical_histories ON medical_histories(patient_id);

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

CREATE INDEX idx_medical_history_id_invoices ON invoices(medical_history_id);

CREATE TABLE invoice_items (
	id INTEGER PRIMARY KEY,	unit_price DECIMAL,
	quantity INTEGER,
	total_price DECIMAL,
	invoice_id INTEGER,
	treatment_id INTEGER,
	FOREIGN KEY (invoice_id) REFERENCES invoices (id),
	FOREIGN KEY (treatment_id) REFERENCES treatments (id)
);

CREATE INDEX idx_invoice_id_invoice_items ON invoice_items(invoice_id);
CREATE INDEX idx_treatment_id_invoice_items ON invoice_items(treatment_id);

CREATE TABLE medical_history_treatments (
    medical_history_id INTEGER,
    treatment_id INTEGER,
    PRIMARY KEY (medical_history_id, treatment_id),
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
    FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);

CREATE INDEX idx_medical_history_id_treatments ON medical_history_treatments(medical_history_id);
CREATE INDEX idx_treatment_id_treatments ON medical_history_treatments(treatment_id);