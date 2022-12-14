SELECT creature_template.name FROM creature_template JOIN loots ON loots.creature_gid = creature_template.id JOIN inventory ON loots.item_id = inventory.item_id WHERE name = 'Tilon';
