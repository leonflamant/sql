SELECT quest.title, creature_template.name FROM quest JOIN creature ON creature.id = quest.creature_start JOIN creature_template ON creature_template.id = creature.gid ORDER BY quest.title, creature_template.name;
