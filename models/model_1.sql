-- models/example_model.sql

select
  '{{ var(target.name)["my_var"] }}' as my_var_value,
  '{{ var(target.name)["another_var"] }}' as another_var_value
FROM
  {{ source('my_source', 'my_table') }}