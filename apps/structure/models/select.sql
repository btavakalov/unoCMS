-- --------------------------
-- Select object
-- --------------------------
-- EXPLAIN
SELECT
  SQL_NO_CACHE

-- 	*
  `o`.`id` 				AS object_id,
  `ot`.`id` 				AS object_type_id,
  `ot`.`name`				AS object_type_name,
  `ot`.`object_type_id`	AS object_type_parent,
  `of`.`id` 				AS object_field_id,
  `of`.`name` 			AS object_field_name,
  `oft`.`id` 				AS object_field_type_id,
  `oft`.`name`			AS object_field_type_name
  ,
  `oc`.`id`				AS object_field_content_id,
  CASE
  WHEN NOT ISNULL(`oc`.`value_int`) 		THEN `oc`.`value_int`
  WHEN NOT ISNULL(`oc`.`value_text`) 		THEN `oc`.`value_text`
  WHEN NOT ISNULL(`oc`.`value_float`) 	THEN `oc`.`value_float`
  WHEN NOT ISNULL(`oc`.`value_string`) 	THEN `oc`.`value_string`
  ELSE NULL
  END AS object_field_content_value

FROM
    `objects` AS `o`

    JOIN `objects_types` AS `ot` ON `ot`.`id` = `o`.`object_type_id`

    JOIN `objects_fields` AS `of` ON `of`.`object_type_id` = `o`.`object_type_id`

    JOIN `objects_fields_types` AS `oft` ON `oft`.`id` = `of`.`object_filed_type_id`

    LEFT JOIN `objects_contents` AS `oc` ON TRUE
                                            AND `oc`.`object_field_id` = `of`.`id`
                                            AND `oc`.`object_id` = `o`.`id`

WHERE TRUE
#       AND `o`.`id` IN (1,2,3)


ORDER BY
  `object_id`
;