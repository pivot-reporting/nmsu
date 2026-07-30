view: nmsu_apps_digital_influence {
  sql_table_name: `tidy-groove-392522.nmsu_interactions_slate.nmsu_apps_digital_influence` ;;

  dimension: admit {
    type: number
    sql: ${TABLE}.admit ;;
  }
  dimension: app_start {
    type: number
    sql: ${TABLE}.app_start ;;
  }
  dimension: app_submit {
    type: number
    sql: ${TABLE}.app_submit ;;
  }
  dimension_group: application_created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.application_created_date ;;
  }
  dimension: application_reference_id {
    type: string
    sql: ${TABLE}.application_reference_id ;;
  }
  dimension_group: application_submitted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.application_submitted_date ;;
  }
  dimension: days_admit_to_enroll {
    type: number
    sql: ${TABLE}.days_admit_to_enroll ;;
  }
  dimension: days_start_to_submit {
    type: number
    sql: ${TABLE}.days_start_to_submit ;;
  }
  dimension: days_submit_to_admit {
    type: number
    sql: ${TABLE}.days_submit_to_admit ;;
  }
  dimension: enroll {
    type: number
    sql: ${TABLE}.enroll ;;
  }
  dimension_group: first_admit {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.first_admit_date ;;
  }
  dimension_group: first_enroll {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.first_enroll_date ;;
  }
  dimension: google_interactions_pre_start {
    type: number
    sql: ${TABLE}.google_interactions_pre_start ;;
  }
  dimension: google_interactions_pre_submit {
    type: number
    sql: ${TABLE}.google_interactions_pre_submit ;;
  }
  dimension: influenced_pre_start {
    type: number
    sql: ${TABLE}.influenced_pre_start ;;
  }
  dimension: influenced_pre_submit {
    type: number
    sql: ${TABLE}.influenced_pre_submit ;;
  }
  dimension: linkedin_interactions_pre_start {
    type: number
    sql: ${TABLE}.linkedin_interactions_pre_start ;;
  }
  dimension: linkedin_interactions_pre_submit {
    type: number
    sql: ${TABLE}.linkedin_interactions_pre_submit ;;
  }
  dimension: meta_interactions_pre_start {
    type: number
    sql: ${TABLE}.meta_interactions_pre_start ;;
  }
  dimension: meta_interactions_pre_submit {
    type: number
    sql: ${TABLE}.meta_interactions_pre_submit ;;
  }
  dimension: no_campaign_interactions_pre_start {
    type: number
    sql: ${TABLE}.no_campaign_interactions_pre_start ;;
  }
  dimension: no_campaign_interactions_pre_submit {
    type: number
    sql: ${TABLE}.no_campaign_interactions_pre_submit ;;
  }
  dimension: other_interactions_pre_start {
    type: number
    sql: ${TABLE}.other_interactions_pre_start ;;
  }
  dimension: other_interactions_pre_submit {
    type: number
    sql: ${TABLE}.other_interactions_pre_submit ;;
  }
  dimension: pivot_influenced_pre_start {
    type: number
    sql: ${TABLE}.pivot_influenced_pre_start ;;
  }
  dimension: pivot_influenced_pre_submit {
    type: number
    sql: ${TABLE}.pivot_influenced_pre_submit ;;
  }
  dimension: pivot_interactions_pre_start {
    type: number
    sql: ${TABLE}.pivot_interactions_pre_start ;;
  }
  dimension: pivot_interactions_pre_submit {
    type: number
    sql: ${TABLE}.pivot_interactions_pre_submit ;;
  }
  dimension: portfolio {
    type: string
    sql: ${TABLE}.portfolio ;;
  }
  dimension: primary_campaign_type {
    type: string
    sql: ${TABLE}.primary_campaign_type ;;
  }
  dimension: rev_app_entry_term {
    type: string
    sql: ${TABLE}.rev_app_entry_term ;;
  }
  dimension: slate_id {
    type: string
    sql: ${TABLE}.slate_id ;;
  }
  dimension: tiktok_interactions_pre_start {
    type: number
    sql: ${TABLE}.tiktok_interactions_pre_start ;;
  }
  dimension: tiktok_interactions_pre_submit {
    type: number
    sql: ${TABLE}.tiktok_interactions_pre_submit ;;
  }
  dimension: total_interactions_pre_start {
    type: number
    sql: ${TABLE}.total_interactions_pre_start ;;
  }
  dimension: total_interactions_pre_submit {
    type: number
    sql: ${TABLE}.total_interactions_pre_submit ;;
  }
  dimension: unknown_interactions_pre_start {
    type: number
    sql: ${TABLE}.unknown_interactions_pre_start ;;
  }
  dimension: unknown_interactions_pre_submit {
    type: number
    sql: ${TABLE}.unknown_interactions_pre_submit ;;
  }
  measure: count {
    type: count
  }
}
