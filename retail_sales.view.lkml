view: retail_sales {
  sql_table_name: PUBLIC.FACT_HSTGNDITEM ;;

  dimension: bohcontrolname {
    type: string
    sql: ${TABLE}."BOHCONTROLNAME" ;;
  }

  dimension: bohcontrolnameparent {
    type: string
    sql: ${TABLE}."BOHCONTROLNAMEPARENT" ;;
  }

  dimension: checknumber {
    type: string
    sql: ${TABLE}."CHECKNUMBER" ;;
  }

  dimension: conceptitemorder {
    type: string
    sql: ${TABLE}."CONCEPTITEMORDER" ;;
  }

  dimension_group: dateofbusiness {
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
    sql: ${TABLE}."DATEOFBUSINESS" ;;
    hidden: yes
  }

  dimension_group: datetimestamp {
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
    sql: ${TABLE}."DATETIMESTAMP" ;;
    hidden: yes
  }

  dimension: discpric {
    type: string
    sql: ${TABLE}."DISCPRIC" ;;
  }

  dimension: entryid {
    type: string
    sql: ${TABLE}."ENTRYID" ;;
  }

  dimension: excltax {
    type: string
    sql: ${TABLE}."EXCLTAX" ;;
  }

  dimension: familystyleportion {
    type: string
    sql: ${TABLE}."FAMILYSTYLEPORTION" ;;
  }

  dimension: fkcategoryid {
    type: string
    sql: ${TABLE}."FKCATEGORYID" ;;
  }

  dimension: fkdaypartid {
    type: string
    sql: ${TABLE}."FKDAYPARTID" ;;
  }

  dimension: fkemployeenumber {
    type: string
    sql: ${TABLE}."FKEMPLOYEENUMBER" ;;
  }

  dimension: fkitemid {
    type: string
    sql: ${TABLE}."FKITEMID" ;;
  }

  dimension: fkoccasionid {
    type: string
    sql: ${TABLE}."FKOCCASIONID" ;;
  }

  dimension: fkordermodeid {
    type: string
    sql: ${TABLE}."FKORDERMODEID" ;;
  }

  dimension: fkrevenueid {
    type: string
    sql: ${TABLE}."FKREVENUEID" ;;
  }

  dimension: fkstoreid {
    type: string
    sql: ${TABLE}."FKSTOREID" ;;
  }

  dimension: fktaxid {
    type: string
    sql: ${TABLE}."FKTAXID" ;;
  }

  dimension: fkterminalid {
    type: string
    sql: ${TABLE}."FKTERMINALID" ;;
  }

  dimension: fohuniquetableid {
    type: string
    sql: ${TABLE}."FOHUNIQUETABLEID" ;;
  }

  dimension: groupquickcomboid {
    type: string
    sql: ${TABLE}."GROUPQUICKCOMBOID" ;;
  }

  dimension: hour {
    type: string
    sql: ${TABLE}."HOUR" ;;
  }

  dimension: houritemadded {
    type: string
    sql: ${TABLE}."HOURITEMADDED" ;;
  }

  dimension: importchecksum {
    type: string
    sql: ${TABLE}."IMPORTCHECKSUM" ;;
  }

  dimension: importid {
    type: string
    sql: ${TABLE}."IMPORTID" ;;
  }

  dimension: incltax {
    type: string
    sql: ${TABLE}."INCLTAX" ;;
  }

  dimension: itemcoursenumber {
    type: string
    sql: ${TABLE}."ITEMCOURSENUMBER" ;;
  }

  dimension: menupanel {
    type: string
    sql: ${TABLE}."MENUPANEL" ;;
  }

  dimension: minute {
    type: string
    sql: ${TABLE}."MINUTE" ;;
  }

  dimension: minuteitemadded {
    type: string
    sql: ${TABLE}."MINUTEITEMADDED" ;;
  }

  dimension: modcode {
    type: number
    sql: ${TABLE}."MODCODE" ;;
  }

  dimension: modifierfunctiontypes {
    type: string
    sql: ${TABLE}."MODIFIERFUNCTIONTYPES" ;;
  }

  dimension: origin {
    type: string
    sql: ${TABLE}."ORIGIN" ;;
  }

  dimension: parentid {
    type: string
    sql: ${TABLE}."PARENTID" ;;
  }

  dimension: parentmodifierid {
    type: string
    sql: ${TABLE}."PARENTMODIFIERID" ;;
  }

  dimension: periodid {
    type: string
    sql: ${TABLE}."PERIODID" ;;
  }

  dimension: price {
    type: string
    sql: ${TABLE}."PRICE" ;;
  }

  dimension: qsquickcomboid {
    type: string
    sql: ${TABLE}."QSQUICKCOMBOID" ;;
    hidden: yes
  }

  dimension: quantity {
    type: string
    sql: ${TABLE}."QUANTITY" ;;
  }

  dimension: quantityunit {
    type: string
    sql: ${TABLE}."QUANTITYUNIT" ;;
  }

  dimension: revenuecenteritemorder {
    type: string
    sql: ${TABLE}."REVENUECENTERITEMORDER" ;;
    hidden: yes
  }

  dimension: seatnumber {
    type: string
    sql: ${TABLE}."SEATNUMBER" ;;
    hidden: yes
  }

  dimension: secondarytaxid {
    type: string
    sql: ${TABLE}."SECONDARYTAXID" ;;
    hidden: yes
  }

  dimension: seconditemadded {
    type: string
    sql: ${TABLE}."SECONDITEMADDED" ;;
    hidden: yes
  }

  dimension: substituteitemid {
    type: string
    sql: ${TABLE}."SUBSTITUTEITEMID" ;;
    hidden: yes
  }

  dimension_group: systemdate {
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
    sql: ${TABLE}."SYSTEMDATE" ;;
    hidden: yes
  }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
  }

  dimension: uniqueid {
    type: string
    sql: ${TABLE}."UNIQUEID" ;;
  }

  measure: netsales {
    type: sum
    sql: case when ${discpric} is null then ${price} else ${discpric} - ${incltax} ;;
    filters: {
      field: modcode
      value: "not 1"
    }
    drill_fields: [bohcontrolname]
  }

  measure: units_sold {
    type: sum
    sql: ${quantityunit} ;;
    filters: {
      field: modcode
      value: "not 1"
    }
    drill_fields: [bohcontrolname]
  }

  measure: distinct_items {
    type: count_distinct
    sql: ${fkitemid} ;;
    filters: {
      field: modcode
      value: "not 1"
    }
    drill_fields: [bohcontrolname]
  }

  measure: distinct_stores {
    type: count_distinct
    sql: ${fkstoreid} ;;
    filters: {
      field: modcode
      value: "not 1"
    }
    drill_fields: [bohcontrolname]
  }

  measure: avg_unit_price{
    type: number
    sql: ${netsales}/${units_sold} ;;
    drill_fields: [bohcontrolname]
  }

  measure: units_per_store_per_day {
    type: number
    sql: ${units_sold}/${distinct_stores}/${dates.distinct_days};;
    drill_fields: [bohcontrolname]
  }


}
