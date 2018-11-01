view: fact_pos_detail_coldcraft {
  sql_table_name: PUBLIC.FACT_POS_DETAIL_COLDCRAFT ;;

  dimension: Amount {
    type: string
    sql: ${TABLE}."AMOUNT" ;;
  }

  dimension: Brand {
    type: string
    sql: ${TABLE}."BRAND" ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}."CATEGORY" ;;
  }

  dimension: Chain_Number {
    type: string
    sql: ${TABLE}."CHAINNUMBER" ;;
  }

  dimension: Cost {
    type: string
    sql: ${TABLE}."COST" ;;
  }

  dimension: date_sk {
    type: string
    sql: ${TABLE}."DATE_SK" ;;
    hidden: yes
  }

  dimension: DAX_Number {
    type: string
    sql: ${TABLE}."DAX ID" ;;
  }

  dimension: Delivery_Method {
    type: string
    sql: ${TABLE}."DELIVERY_METHOD" ;;
  }

  dimension: Discount {
    type: string
    sql: ${TABLE}."DISCOUNT" ;;
  }

  dimension: Sales_Order{
    type: string
    sql: ${TABLE}."Drop" ;;
  }

  dimension: Inventory_Location {
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

  dimension: Quantity {
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

  measure: gross_sales_less_buybacks {
    type: sum
    sql:  ${Amount} ;;
    filters: {
      field: Transaction_Type
      value: "Buyback ,Sales"
    }
    drill_fields: []
  }

  measure: avg_sales_route_week {
    type: number
    sql: ${gross_sales_less_buybacks}/nullif(${Distinct_Routes},0) ;;
    drill_fields: []
  }

  measure: gross_units_less_buybacks {
    type: sum
    sql:  ${Quantity} ;;
    filters: {
      field: Transaction_Type
      value: "Buyback ,Sales"
    }
    drill_fields: []
  }

  measure: Distinct_Stores {
    type: count_distinct
    sql: ${DAX_Number};;
    drill_fields: []
  }

  measure: Distinct_Brands {
    type: count_distinct
    sql: ${Brand};;
    drill_fields: []
  }

  measure: avg_brands_account {
    type: number
    sql: ${Distinct_Brands}/nullif(${Distinct_Stores});;
    drill_fields: []
  }

  measure: Distinct_Routes {
    type: count_distinct
    sql: ${Route_Number};;
    drill_fields: []
  }

  measure: Distinct_Weeks {
    type: count_distinct
    sql: ${Dates.Fiscal_Week} ;;
    drill_fields: []
  }

  measure: units_store_week {
    type: number
    sql: ${gross_units_less_buybacks}/nullif(${Distinct_Stores},0)/nullif(${Distinct_Weeks},0);;
    drill_fields: []
  }

}
