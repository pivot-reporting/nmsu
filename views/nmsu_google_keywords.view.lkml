view: nmsu_google_keywords {
  sql_table_name: `tidy-groove-392522.nmsu_reporting.nmsu_google_keywords` ;;

  dimension: campaign {
    type:  string
    sql: ${TABLE}.campaign ;;
    suggest_persist_for: "0 seconds"
  }
  dimension: ad_group {
    type:  string
    sql:  ${TABLE}.ad_group_name ;;
  }
  dimension: keywords {
    type:  string
    sql: ${TABLE}.keywords ;;
  }
  dimension: ad_network_type {
    type:  string
    sql:  ${TABLE}.ad_network_type ;;
  }
  dimension: device {
    type:  string
    sql:  ${TABLE}.device ;;
  }
  dimension_group: date {
    type: time
    datatype: date
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.date ;;
  }
  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }

  dimension: campaign_type {
    type: string
    sql: ${TABLE}.campaign_type ;;
  }
  dimension: degree_type {
    type: string
    sql: ${TABLE}.degree_type ;;
  }


  measure: count {
    type: count
  }
  measure: impressions {
    type: sum
    sql: ${TABLE}.impressions ;;
  }
  measure: clicks {
    type: sum
    sql: ${TABLE}.clicks ;;
  }

  measure: inquiries {
    type: sum
    sql: ${TABLE}.conversions ;;
    value_format_name: decimal_0
  }

  measure: spend {
    type: sum
    sql: ${TABLE}.cost ;;
    value_format_name: usd
  }
  measure: cost_per_inq {
    type: number
    sql: case when ${inquiries}!= 0 then ${spend}/${inquiries} else null end ;;
    value_format_name: usd_0
  }
  measure: inq_rate {
    type: number
    sql: case when ${clicks}!= 0 then ${inquiries}/${clicks} else null end ;;
    value_format_name: percent_2
  }
  measure: ctr {
    type: number
    sql: case when ${impressions}!= 0 then ${clicks}/${impressions} else null end ;;
    value_format_name:  percent_2
  }
}
