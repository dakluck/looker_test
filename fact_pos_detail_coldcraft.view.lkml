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
    hidden: yes
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

  dimension: Sales_Order{
    type: string
    sql: ${TABLE}."Drop" ;;
  }

  dimension: inventory_location {
    type: string
    sql: ${TABLE}."INVENTORY_LOCATION" ;;
  }

  dimension: Item {
    type: string
    sql: ${TABLE}."ITEM" ;;
  }

  dimension: Latitude {
    type: number
    sql: ${TABLE}."LATITUDE" ;;
  }

  dimension: Longitude {
    type: number
    sql: ${TABLE}."LONGITUDE" ;;
  }

  dimension: Account {
    type: string
    sql: ${TABLE}."OUTLET" ;;
  }

  dimension: Account_Location{
    type: location
    sql_latitude: ${Latitude};;
    sql_longitude:${Longitude};;
  }

  dimension: qty {
    type: string
    sql: ${TABLE}."QTY" ;;
  }

  dimension: Route_Number {
    type: string
    sql: ${TABLE}."ROUTE_ID" ;;
  }

  dimension: RSR {
    type: string
    sql: ${TABLE}."SALES_REP" ;;

  }

  dimension: Transaction_Type {
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
      field: Transaction_Type
      value: "Buyback ,Sales"
    }
    drill_fields: []
  }

  measure: avg_sales_route_week {
    type: number
    sql: ${gross_sales_less_buybacks}/nullif(${routes},0) ;;
    drill_fields: []
  }

  measure: gross_units_less_buybacks {
    type: sum
    sql:  ${qty} ;;
    filters: {
      field: Transaction_Type
      value: "Buyback ,Sales"
    }
    drill_fields: []
  }

  measure: stores {
    type: count_distinct
    sql: ${dax_id};;
    drill_fields: []
  }

  measure: brands {
    type: count_distinct
    sql: ${brand};;
    drill_fields: []
  }

  measure: avg_brands_account {
    type: number
    sql: ${brands}/nullif(${stores});;
    drill_fields: []
  }

  measure: routes {
    type: count_distinct
    sql: ${Route_Number};;
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
