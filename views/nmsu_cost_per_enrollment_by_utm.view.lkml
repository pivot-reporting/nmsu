view: nmsu_cost_per_enrollment_by_utm {
  sql_table_name: `tidy-groove-392522.nmsu_reporting.nmsu_agg_metrics` ;;

  dimension: campaign {
    type: string
    sql: ${TABLE}.Campaign ;;
  }
  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Date ;;
  }

  measure: conv_rate {
    type: number
    value_format_name: percent_1
    sql: ${conversions} / NULLIF(${clicks}, 0) ;;
    label: "Conv. Rate"
  }
  measure: cpe {
    type: number
    value_format_name: usd_0
    sql: ${spend} / NULLIF(${enroll}, 0) ;;
    label: "CPE"
  }
  measure: cpi {
    type: number
    value_format_name: usd_0
    sql: ${spend} / NULLIF(${rfi}, 0) ;;
    label: "CPI"
  }
  measure: cpsubmits {
    type: number
    value_format_name: usd_0
    sql: ${spend} / NULLIF(${submits}, 0) ;;
    label: "CPSubmits"
  }
  measure: ctr {
    type: number
    value_format_name: percent_2
    sql: ${clicks} / NULLIF(${impressions}, 0) ;;
    label: "CTR"
  }
  measure: admits {
    type: sum
    sql: ${TABLE}.tot_admits ;;
  }
  measure: clicks {
    type: sum
    sql: ${TABLE}.tot_clicks ;;
  }
  measure: conversions {
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.tot_conv ;;
  }
  measure: enroll {
    type: sum
    sql: ${TABLE}.tot_enroll ;;
  }
  measure: impressions {
    type: sum
    sql: ${TABLE}.tot_impressions ;;
  }
  measure: rfi {
    type: sum
    sql: ${TABLE}.tot_rfi ;;
  }
  measure: spend {
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.tot_spend ;;
  }
  measure: starts {
    type: sum
    sql: ${TABLE}.tot_starts ;;
  }
  measure: submits {
    type: sum
    sql: ${TABLE}.tot_submits ;;
  }
  measure: count {
    type: count
  }
}
