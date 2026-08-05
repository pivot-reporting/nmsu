view: fall_time_analysis_days {
  sql_table_name: `tidy-groove-392522.nmsu_apps_slate.fall_time_analysis_days` ;;

  dimension: application_degree_type {
    label: "Degree Type"
    type: string
    sql: ${TABLE}.application_degree_type ;;
  }

  dimension: bucket_sort {
    type: number
    sql: ${TABLE}.bucket_sort ;;
    hidden: yes
  }

  dimension: portfolio {
    type: string
    sql: ${TABLE}.portfolio ;;
  }

  dimension: rev_app_entry_term {
    label: "Entry Term"
    type: string
    sql: ${TABLE}.rev_app_entry_term ;;
  }

  dimension: term_number {
    label: "Term"
    type: string
    sql: ${TABLE}.term_number ;;
  }

  dimension: term_year {
    label: "Year"
    type: string
    sql: ${TABLE}.term_year ;;
  }

  dimension: time_bucket {
    label: "Time Bucket"
    type: string
    sql: ${TABLE}.time_bucket ;;
    order_by_field: bucket_sort
  }

  dimension: is_complete_bucket {
    label: "Is Complete Bucket"
    description: "No for the 2026 bucket currently in progress. Filter to Yes on any chart showing year-over-year variance."
    type: yesno
    sql: ${TABLE}.is_complete_bucket ;;
  }

  measure: bucket_count {
    type: sum
    sql: ${TABLE}.bucket_count ;;
  }

  measure: cumulative_count {
    type: sum
    sql: ${TABLE}.cumulative_count ;;
  }

  measure: cum_2025 {
    label: "2025"
    type: sum
    sql: ${TABLE}.cumulative_count ;;
    filters: [term_year: "2025"]
    value_format_name: decimal_0
  }

  measure: cum_2026 {
    label: "2026"
    type: sum
    sql: ${TABLE}.cumulative_count ;;
    filters: [term_year: "2026"]
    value_format_name: decimal_0
  }

  # Do NOT wrap either measure in COALESCE. Where 2026 has no rows yet,
  # cum_2026 is NULL and the variance is NULL, so the line simply stops.
  # Coalescing to 0 would draw a large fake deficit instead.
  measure: variance_abs {
    label: "2026 vs 2025"
    type: number
    sql: ${cum_2026} - ${cum_2025} ;;
    value_format: "+#,##0;[RED]-#,##0"
  }

  measure: variance_pct {
    label: "2026 vs 2025 %"
    type: number
    sql: SAFE_DIVIDE(${cum_2026} - ${cum_2025}, NULLIF(${cum_2025}, 0)) ;;
    value_format_name: percent_1
  }

  measure: count {
    type: count
  }
}
