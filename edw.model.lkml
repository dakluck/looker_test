connection: "snowflake_pc_edw_test"

# include all the views
include: "*.view"

datagroup: edw_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: edw_default_datagroup

explore: dim_date {
  join: fact_pos_detail_coldcraft {
    type: inner
    relationship: one_to_many
    sql_on: ${fact_pos_detail_coldcraft.date_sk} = ${dim_date.date_sk} ;;
  }
}

explore: fact_pos_detail_coldcraft {
  join: dim_date {
    type: inner
    relationship: many_to_one
    sql_on: ${dim_date.date_sk} = ${fact_pos_detail_coldcraft.date_sk} ;;
  }

}
