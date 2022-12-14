SELECT name FROM creature_template EXEPT SELECT name FROM creature_template JOIN creature ON creature.gid = creature_template.id;
