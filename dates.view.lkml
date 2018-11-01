view: dates {
  sql_table_name: PUBLIC.DIM_DATE ;;

  dimension_group: Calendar {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATE" ;;
  }


  dimension: date_sk {
    type: string
    sql: ${TABLE}."DATE_SK" ;;
    hidden: yes
  }

  dimension: Day {
    type: string
    sql: ${TABLE}."DAY_NAME" ;;
  }

  dimension: Fiscal_Day {
    type: number
    sql: ${TABLE}."FISCAL_DAY" ;;
  }

  dimension: Fiscal_Month {
    type: number
    sql: ${TABLE}."FISCAL_MONTH" ;;
    alias: [Month]
  }

  dimension: Fiscal_Quarter {
    type: number
    sql: ${TABLE}."FISCAL_QUARTER" ;;
    alias: [Quarter]
  }

  dimension: Fiscal_Week {
    type: number
    sql: ${TABLE}."FISCAL_WEEK" ;;
    alias: [Week]
  }

  dimension: Fiscal_Year {
    type: number
    sql: ${TABLE}."FISCAL_YEAR" ;;
    alias: [Year]
    order_by_field: Fiscal_Year
  }

  dimension: Relative_Date {
    type: string
    sql: ${TABLE}."RELATIVE_DATE" ;;
  }

  dimension: To_Date_Flag {
    type: string
    sql: ${TABLE}."TO_DATE" ;;
  }

  measure: Distinct_Weeks {
    type: count_distinct
    sql: ${Fiscal_Week} ;;
    drill_fields: []
  }
}
