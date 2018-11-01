view: chris_asns {
  sql_table_name: PUBLIC.CHRIS_ASNS ;;

  dimension: account_order_no {
    type: string
    sql: ${TABLE}."ACCOUNT_ORDER_NO" ;;
  }

  dimension: asn_id {
    type: string
    sql: ${TABLE}."ASN_ID" ;;
  }

  dimension: box_id {
    type: string
    sql: ${TABLE}."BOX_ID" ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}."CREATED_DATE" ;;
  }

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

  dimension: customer_po {
    type: string
    sql: ${TABLE}."CUSTOMER_PO" ;;
  }

  dimension: line_number {
    type: string
    sql: ${TABLE}."LINE_NUMBER" ;;
  }

  dimension_group: order {
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
    sql: ${TABLE}."ORDER_DATE" ;;
  }

  dimension: order_no {
    type: string
    sql: ${TABLE}."ORDER_NO" ;;
  }

  dimension: order_v_ship {
    type: string
    sql: ${TABLE}."ORDER_V_SHIP" ;;
  }

  dimension: pack_id {
    type: string
    sql: ${TABLE}."PACK_ID" ;;
  }

  dimension: packing_code {
    type: string
    sql: ${TABLE}."PACKING_CODE" ;;
  }

  dimension: packing_qty {
    type: string
    sql: ${TABLE}."PACKING_QTY" ;;
  }

  dimension: qty {
    type: string
    sql: ${TABLE}."QTY" ;;
  }

  dimension: qty_packed {
    type: string
    sql: ${TABLE}."QTY_PACKED" ;;
  }

  dimension_group: ship {
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
    sql: ${TABLE}."SHIP_DATE" ;;
  }

  dimension: ship_to_address {
    type: string
    sql: ${TABLE}."SHIP_TO_ADDRESS" ;;
  }

  dimension: ship_to_city {
    type: string
    sql: ${TABLE}."SHIP_TO_CITY" ;;
  }

  dimension: ship_to_name {
    type: string
    sql: ${TABLE}."SHIP_TO_NAME" ;;
  }

  dimension: ship_to_state {
    type: string
    sql: ${TABLE}."SHIP_TO_STATE" ;;
  }

  dimension: ship_to_zip {
    type: string
    sql: ${TABLE}."SHIP_TO_ZIP" ;;
  }

  dimension: shipped_via {
    type: string
    sql: ${TABLE}."SHIPPED_VIA" ;;
  }

  dimension: tracking_no {
    type: string
    sql: ${TABLE}."TRACKING_NO" ;;
  }

  dimension: trading_partner_id {
    type: string
    sql: ${TABLE}."TRADING_PARTNER_ID" ;;
  }

  dimension: trading_partner_name {
    type: string
    sql: ${TABLE}."TRADING_PARTNER_NAME" ;;
  }

  dimension: uom {
    type: string
    sql: ${TABLE}."UOM" ;;
  }

  measure: count {
    type: count
    drill_fields: [ship_to_name, trading_partner_name]
  }
}
