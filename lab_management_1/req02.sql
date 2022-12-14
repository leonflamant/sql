SELECT count(transaction.id) FROM transaction JOIN assistant ON assistant.login = transaction.assistant WHERE login LIKE 'serval.martinot-lagarde' GROUP BY assistant.login;
