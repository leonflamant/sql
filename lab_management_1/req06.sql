SELECT login FROM assistant EXCEPT SELECT DISTINCT login FROM assistant JOIN transaction ON transaction.assistant = assistant.login ORDER BY login;
