connection: "snowflake_pc_dailey_test"

# include all the views
include: "*.view"

datagroup: edw_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: edw_default_datagroup

explore: Dates {
  join: sales {
    type: inner
    relationship: one_to_many
    sql_on: ${sales.date_sk} = ${Dates.date_sk} ;;
  }
}

explore: sales {
  join: Dates {
    type: inner
    relationship: many_to_one
    sql_on: ${Dates.date_sk} = ${sales.date_sk} ;;
  }

}

explore: Aloha_Detail {
  join: Dates {
    type: left_outer
    relationship: many_to_one
    sql_on: ${Dates.date_sk} = ${Aloha_Detail.dateofbusiness_date} ;;
  }
}
