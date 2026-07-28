view: fall_time_analysis_days {
  sql_table_name: `tidy-groove-392522.nmsu_apps_slate.fall_time_analysis_days` ;;

  dimension: application_degree_type {
    type: string
    sql: ${TABLE}.application_degree_type ;;
  }
  dimension: bucket_sort {
    type: number
    sql: ${TABLE}.bucket_sort ;;
  }
  dimension: portfolio {
    type: string
    sql: ${TABLE}.portfolio ;;
  }
  dimension: rev_app_entry_term {
    type: string
    sql: ${TABLE}.rev_app_entry_term ;;
  }
  dimension: term_number {
    type: string
    sql: ${TABLE}.term_number ;;
  }
  dimension: term_year {
    type: string
    sql: ${TABLE}.term_year ;;
  }
  dimension: time_bucket {
    type: string
    sql: ${TABLE}.time_bucket ;;
  }
  measure: bucket_count {
    type: sum
    sql: ${TABLE}.bucket_count ;;
  }
  measure: cumulative_count {
    type: sum
    sql: ${TABLE}.cumulative_count ;;
  }
  measure: count {
    type: count
  }
}
