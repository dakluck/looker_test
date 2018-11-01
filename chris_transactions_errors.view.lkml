view: chris_transactions_errors {
  sql_table_name: PUBLIC.CHRIS_TRANSACTIONS_ERRORS ;;

  dimension_group: created_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."CREATED_TIMESTAMP" ;;
  }

  dimension: data_error {
    type: string
    sql: ${TABLE}."DATA_ERROR" ;;
  }

  dimension: direction {
    type: string
    sql: ${TABLE}."DIRECTION" ;;
  }

  dimension: document_description {
    type: string
    sql: ${TABLE}."DOCUMENT_DESCRIPTION" ;;
  }

  dimension: document_group {
    type: string
    sql: ${TABLE}."DOCUMENT_GROUP" ;;
  }

  dimension: document_id {
    type: string
    sql: ${TABLE}."DOCUMENT_ID" ;;
  }

  dimension: err_code {
    type: string
    sql: ${TABLE}."ERR_CODE" ;;
  }

  dimension: err_desc {
    type: string
    sql: ${TABLE}."ERR_DESC" ;;
  }

  dimension: log_err_desc {
    type: string
    sql: ${TABLE}."LOG_ERR_DESC" ;;
  }

  dimension: log_function {
    type: string
    sql: ${TABLE}."LOG_FUNCTION" ;;
  }

  dimension: log_progress {
    type: string
    sql: ${TABLE}."LOG_PROGRESS" ;;
  }

  dimension: problem {
    type: string
    sql: ${TABLE}."PROBLEM" ;;
  }

  dimension: solution {
    type: string
    sql: ${TABLE}."SOLUTION" ;;
  }

  dimension: trading_partner {
    type: string
    sql: ${TABLE}."TRADING_PARTNER" ;;
  }

  dimension_group: txn {
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
    sql: ${TABLE}."TXN_DATE" ;;
  }

  dimension: xml_reference {
    type: string
    sql: ${TABLE}."XML_REFERENCE" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
