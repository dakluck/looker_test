connection: "snowflake_pc_dailey_test"

# include all the views
include: "*.view"

datagroup: edw_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: edw_default_datagroup

explore: Dates {
  join: Sales {
    type: inner
    relationship: one_to_many
    sql_on: ${Sales.date_sk} = ${Dates.date_sk} ;;
  }
}

explore: Sales {
  join: Dates {
    type: inner
    relationship: many_to_one
    sql_on: ${Dates.date_sk}.date_sk} = ${Sales.date_sk} ;;
  }

}
