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

  #group_label is hierarchy
  #this is a comment

  dimension: Fiscal_Day {
    group_label: "Fiscal Calendar"
    type: number
    sql: ${TABLE}."FISCAL_DAY" ;;
  }

  dimension: Fiscal_Week {
    group_label: "Fiscal Calendar"
    type: number
    sql: ${TABLE}."FISCAL_WEEK" ;;
    alias: [Week]
  }

  dimension: Fiscal_Month {
    group_label: "Fiscal Calendar"
    type: number
    sql: ${TABLE}."FISCAL_MONTH" ;;
    alias: [Month]
  }

  dimension: Fiscal_Quarter {
    group_label: "Fiscal Calendar"
    type: number
    sql: ${TABLE}."FISCAL_QUARTER" ;;
    alias: [Quarter]
  }

  dimension: Fiscal_Year {
    group_label: "Fiscal Calendar"
    type: number
    sql: ${TABLE}."FISCAL_YEAR" ;;
    alias: [Year]
    order_by_field: Fiscal_Year
  }

  dimension: Relative_Date_Str {
    hidden: yes
    type: string
    sql: ${TABLE}."RELATIVE_DATE" ;;
  }

  dimension: Relative_Date {
    type: string
    case: {
      when: {
        sql: ${Relative_Date_Str} = 'LY - Year' ;;
        label: "LY - Year"
      }
      when: {
        sql: ${Relative_Date_Str} = 'LY - Year;LY - Quarter' ;;
        label: "LY - Quarter"
      }
      when: {
        sql: ${Relative_Date_Str} = 'LY - Year;LY - Quarter;LY - Month' ;;
        label: "LY - Month"
      }
      when: {
        sql: ${Relative_Date_Str} = 'LY - Year;LY - Quarter;LY - Month;LY - Week' ;;
        label: "LY - Week"
      }
      when: {
        sql: ${Relative_Date_Str} = 'TY - Year' ;;
        label: "TY - Year"
      }
      when: {
        sql: ${Relative_Date_Str} = 'TY - Year;TY - Quarter;TY - Month' ;;
        label: "TY - Month"
      }
      when: {
        sql: ${Relative_Date_Str} = 'TY - Year;TY - Quarter;TY - Month;TY - Week' ;;
        label: "TY - Week"
      }
      when: {
        sql: ${Relative_Date_Str} = 'TY - Year;TY - Quarter;TY - Month;TY - Week;TY - Day' ;;
        label: "TY - Day"
      }
      else: "NULL"
    }
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
