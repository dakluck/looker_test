view: cpg_sales {
  sql_table_name: PUBLIC.FACT_POS_DETAIL_COLDCRAFT ;;

  dimension: amount {
    type: number
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

  dimension: chain_number {
    type: number
    sql: ${TABLE}."CHAINNUMBER" ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}."COST" ;;
  }

  dimension: date_sk {
    type: string
    sql: ${TABLE}."DATE_SK" ;;
    hidden: yes
  }

  dimension: dax_number {
    type: string
    sql: ${TABLE}."DAX ID" ;;
  }

  dimension: delivery_method {
    type: string
    sql: ${TABLE}."DELIVERY_METHOD" ;;
  }

  dimension: discount {
    type: number
    sql: ${TABLE}."DISCOUNT" ;;
  }

  dimension: sales_order {
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
    hidden: yes
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}."LONGITUDE" ;;
    hidden: yes
  }

  dimension: account {
    type: string
    sql: ${TABLE}."OUTLET" ;;
  }

  dimension: account_location{
    type: location
    sql_latitude: ${latitude};;
    sql_longitude:${longitude};;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}."QTY" ;;
  }

  dimension: route_number {
    type: string
    sql: ${TABLE}."ROUTE_ID" ;;
  }

  dimension: rsr {
    type: string
    sql: ${TABLE}."SALES_REP" ;;
  }

  dimension: transaction_type {
    type: string
    sql: ${TABLE}."TRANSACTION_TYPE" ;;
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
    sql: ${gross_sales_less_buybacks}/nullif(${distinct_routes},0) ;;
    drill_fields: []
  }

  measure: gross_units_less_buybacks {
    type: sum
    sql:  ${quantity} ;;
    filters: {
      field: transaction_type
      value: "Buyback ,Sales"
    }
    drill_fields: []
  }

  measure: returns {
    type: sum
    sql:  ${amount}*-1 ;;
    filters: {
      field: transaction_type
      value: "Return"
    }
    drill_fields: []
  }

  measure: count_of_stores {
    type: count_distinct
    sql: ${dax_number};;
  }

  measure: active_stores {
    type: count_distinct
    sql: ${dax_number};;
    description: "Stores Listed as Active in Salesforce"
  }

  measure: distinct_brands {
    type: count_distinct
    sql: ${brand};;
    drill_fields: []
  }

  measure: avg_brands_account {
    type: number
    sql: ${distinct_brands}/nullif(${count_of_stores});;
    drill_fields: []
  }

  measure: distinct_routes {
    type: count_distinct
    sql: ${rsr};;
    drill_fields: []
  }

  measure: distinct_skus {
    type: count_distinct
    sql: ${item};;
    drill_fields: []
  }

  measure: units_store_week {
    type: number
    sql: ${gross_units_less_buybacks}/nullif(${count_of_stores},0)/nullif(${dates.Distinct_Weeks},0);;
    drill_fields: []
  }

  measure: sales_mix {
    type: percent_of_total
    sql: ${gross_sales_less_buybacks} ;;
    drill_fields: []
  }

  measure: avg_brands_per_account {
    type: number
    sql: ${distinct_brands}/nullif(${active_stores},0) ;;
    drill_fields: []
    description: "Need To Ask About This One - Hard to Replicate"
  }

  measure: unit_mix {
    type: percent_of_total
    sql: ${gross_sales_less_buybacks} ;;
    drill_fields: []
  }

  measure: units_store_sku_week {
    type: number
    sql: ${gross_units_less_buybacks}/nullif(${count_of_stores},0)/nullif(${dates.Distinct_Weeks},0)/nullif(${distinct_skus},0);;
    drill_fields: []
  }

}
