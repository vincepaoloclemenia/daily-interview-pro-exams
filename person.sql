SELECT
	person.person_id,
	family_name,
	age,
  COALESCE(person_parent.person_id, '(Unknown)')
FROM
	person
INNER JOIN person_parent ON person_parent.person_id = person.person_id;