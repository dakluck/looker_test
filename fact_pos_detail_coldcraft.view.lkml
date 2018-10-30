view: fact_pos_detail_coldcraft {
  sql_table_name: PUBLIC.FACT_POS_DETAIL_COLDCRAFT ;;

  dimension: amount {
    type: string
    sql: ${TABLE}."AMOUNT" ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}."BRAND" ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}."CATEGORY" ;;
  }

  dimension: chainnumber {
    type: string
    sql: ${TABLE}."CHAINNUMBER" ;;
  }

  dimension: cost {
    type: string
    sql: ${TABLE}."COST" ;;
  }

  dimension: date_sk {
    type: string
    sql: ${TABLE}."DATE_SK" ;;
  }

  dimension: dax_id {
    type: string
    sql: ${TABLE}."DAX ID" ;;
  }

  dimension: delivery_method {
    type: string
    sql: ${TABLE}."DELIVERY_METHOD" ;;
  }

  dimension: discount {
    type: string
    sql: ${TABLE}."DISCOUNT" ;;
  }

  dimension: drop {
    type: string
    sql: ${TABLE}."Drop" ;;
  }

  dimension: inventory_location {
    type: string
    sql: ${TABLE}."INVENTORY_LOCATION" ;;
  }

  dimension: item {
    type: string
    sql: ${TABLE}."ITEM" ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}."LATITUDE" ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}."LONGITUDE" ;;
  }

  dimension: Account {
    type: string
    sql: ${TABLE}."OUTLET" ;;
  }

  dimension: Account_Location{
    type: location
    sql_latitude: ${latitude};;
    sql_longitude:${longitude};;
  }

  dimension: qty {
    type: string
    sql: ${TABLE}."QTY" ;;
  }

  dimension: route_id {
    type: string
    sql: ${TABLE}."ROUTE_ID" ;;
  }

  dimension: sales_rep {
    type: string
    sql: ${TABLE}."SALES_REP" ;;

  }

  dimension: transaction_type {
    type: string
    sql: ${TABLE}."TRANSACTION_TYPE" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: gross_sales_less_buybacks {
    type: sum
    sql:  ${amount} ;;
    filters: {
      field: transaction_type
      value: "Buyback ,Sales"
    }
    drill_fields: []
  }

  measure: avg_sales_route_week {
    type: number
    sql: ${gross_sales_less_buybacks}/nullif(${routes},0)/nullif(${weeks},0) ;;
    drill_fields: []
  }

  measure: gross_units_less_buybacks {
    type: sum
    sql:  ${qty} ;;
    filters: {
      field: transaction_type
      value: "Buyback ,Sales"
    }
    drill_fields: []
  }

  measure: stores {
    type: count_distinct
    sql: ${dax_id};;
    drill_fields: []
  }

  measure: routes {
    type: count_distinct
    sql: ${route_id};;
    drill_fields: []
  }

  measure: weeks {
    type: count_distinct
    sql:  ${dim_date.fiscal_week} ;;
    drill_fields: []
  }

  measure: units_store_week {
    type: number
    sql: ${gross_units_less_buybacks}/nullif(${stores},0)/nullif(${weeks},0);;
    drill_fields: []
  }

}
