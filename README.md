# README

The vars will be passed to models like this

```
{
      "dev": {
          "another_var": "dev_setting",
          "my_var": "value_for_dev"
      },
      "preprod": {
          "another_var": "preprod_setting",
          "my_var": "value_for_preprod"
      },
      "prod": {
          "another_var": "prod_setting",
          "my_var": "value_for_prod"
      }
}

```

Test target: dev 

```
source ~/dbt-env/bin/activate  
dbt debug --target dev --profile my_project --profiles-dir .
dbt compile --target dev --profile my_project --profiles-dir .
# check compiled sql in target/copiled folder
select
  'value_for_dev' as my_var_value,
  'dev_setting' as another_var_value
FROM
  `dev_database`.`dev_schema`.`dev_table`
```

Test target: prod 
```
# test using prod target
dbt compile --target prod --profile my_project --profiles-dir .
# check compiled sql in target/copiled folder
select
  'value_for_prod' as my_var_value,
  'prod_setting' as another_var_value
FROM
  `prod_database`.`prod_schema`.`prod_table`
```

