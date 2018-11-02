connection: "snowflake_pc_dailey_test"

#have to add lookml dashboards to the model as below
include: "*.view"
#include: "*.dashboard.lookml"

datagroup: edw_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: edw_default_datagroup

explore: cpg_sales {
  join: dates {
    type: inner
    relationship: many_to_one
    sql_on: ${dates.date_sk} = ${cpg_sales.date_sk} ;;
  }
}

explore: retail_sales{
  join: dates {
    type: left_outer
    relationship: many_to_one
    sql_on: ${dates.date_sk} = ${retail_sales.dateofbusiness_date} ;;
  }
}
