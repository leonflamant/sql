SELECT creature.id FROM creature JOIN creature_template ON creature_template.id = creature.gid where level > 10 ORDER BY id;
