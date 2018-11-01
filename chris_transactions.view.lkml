view: chris_transactions {
  sql_table_name: PUBLIC.CHRIS_TRANSACTIONS ;;

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

  dimension: full_text_timestamp {
    type: string
    sql: ${TABLE}."FULL_TEXT_TIMESTAMP" ;;
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
