SELECT surname, employee.name, email FROM employee JOIN agency ON agency.code = employee.agency_code WHERE ratings > 6.0 ORDER BY surname, name, email;
