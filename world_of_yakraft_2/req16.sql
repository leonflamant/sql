DELETE FROM character WHERE lastconn < now() - interval '31556926';
