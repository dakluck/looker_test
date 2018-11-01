connection: "snowflake_pc_dailey_test"

# include all the views
include: "*.view"

datagroup: edw_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: edw_default_datagroup

explore: Dates {
  join: fact_pos_detail_coldcraft {
    type: inner
    relationship: one_to_many
    sql_on: ${fact_pos_detail_coldcraft.date_sk} = ${Dates.date_sk} ;;
  }
}

explore: fact_pos_detail_coldcraft {
  join: Dates {
    type: inner
    relationship: many_to_one
    sql_on: ${Dates.date_sk}.date_sk} = ${fact_pos_detail_coldcraft.date_sk} ;;
  }

}
