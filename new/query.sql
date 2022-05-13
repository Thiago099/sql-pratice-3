SELECT `cardinality`.`description` `cardinality description`,
`cardinality`.`name` `cardinality`,
`entity_parent`.`name` `parent`,
`entity_child`.`name` `child`
FROM `entity_parameter`
INNER JOIN `cardinality` ON `cardinality`.`id` = `entity_parameter`.`id_cardinality`
INNER JOIN `entity` AS `entity_parent` ON `entity_parent`.`id` = `entity_parameter`.`id_entity_parent`
INNER JOIN `entity` AS `entity_child` ON `entity_child`.`id` = `entity_parameter`.`id_entity_child`