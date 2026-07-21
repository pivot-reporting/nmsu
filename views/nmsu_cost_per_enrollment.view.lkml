view: nmsu_cost_per_enrollment {
 sql_table_name: `tidy-groove-392522.nmsu_reporting.nmsu_prog_agg_metrics` ;;

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
  measure: inq_rate {
    type: number
    value_format_name: percent_1
    sql: ${tot_conv} / NULLIF(${tot_clicks}, 0) ;;
  }
  measure: cpe {
    type: number
    value_format_name: usd_0
    sql: ${tot_spend} / NULLIF(${tot_enroll}, 0) ;;
  }
  measure: cpl {
    type: number
    value_format_name: usd_0
    sql: ${tot_spend} / NULLIF(${tot_rfi}, 0) ;;
  }
  measure: cpsubmits {
    type: number
    value_format_name: usd_0
    sql: ${tot_spend} / NULLIF(${tot_submits}, 0) ;;
  }
  measure: ctr {
    type: number
    value_format_name: percent_2
    sql: ${tot_clicks} / NULLIF(${tot_impressions}, 0) ;;
  }
  measure: tot_admits {
    type: sum
    sql: ${TABLE}.tot_admits ;;
  }
  measure: tot_clicks {
    type: sum
    sql: ${TABLE}.tot_clicks ;;
  }
  measure: tot_conv {
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.tot_conv ;;
  }
  measure: tot_enroll {
    type: sum
    sql: ${TABLE}.tot_enroll ;;
  }
  measure: tot_impressions {
    type: sum
    sql: ${TABLE}.tot_impressions ;;
  }
  measure: tot_rfi {
    type: sum
    sql: ${TABLE}.tot_rfi ;;
  }
  measure: tot_spend {
    type: sum
    value_format_name: usd_0
    sql: ${TABLE}.tot_spend ;;
  }
  measure: tot_starts {
    type: sum
    sql: ${TABLE}.tot_starts ;;
  }
  measure: tot_submits {
    type: sum
    sql: ${TABLE}.tot_submits ;;
  }
  measure: count {
    type: count
  }
}
