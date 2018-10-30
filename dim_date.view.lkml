view: dim_date {
  sql_table_name: PUBLIC.DIM_DATE ;;

  dimension_group: Calendar {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATE" ;;
  }

  dimension_group: Fiscal {
    type: time
    timeframes: [
      raw,
      date,
      week_of_year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATE" ;;
  }

  dimension: date_sk {
    type: string
    sql: ${TABLE}."DATE_SK" ;;
  }

  dimension: day_name {
    type: string
    sql: ${TABLE}."DAY_NAME" ;;
  }

  dimension: fiscal_day {
    type: string
    sql: ${TABLE}."FISCAL_DAY" ;;
  }

  dimension: fiscal_month {
    type: string
    sql: ${TABLE}."FISCAL_MONTH" ;;
  }

  dimension: fiscal_quarter {
    type: string
    sql: ${TABLE}."FISCAL_QUARTER" ;;
  }

  dimension: fiscal_week {
    type: string
    order_by_field: Fiscal_week_of_year
    sql: ${TABLE}."FISCAL_WEEK" ;;
  }

  dimension: fiscal_year {
    type: string
    sql: ${TABLE}."FISCAL_YEAR" ;;
  }

  dimension: relative_date {
    type: string
    sql: ${TABLE}."RELATIVE_DATE" ;;
  }

  dimension: to_date {
    type: string
    sql: ${TABLE}."TO_DATE" ;;
  }

  measure: count {
    type: count
    drill_fields: [day_name]
  }

  measure: weeks {
    type: count_distinct
    sql: ${fiscal_week}  ;;
  drill_fields: []
}

}
