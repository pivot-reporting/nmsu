view: nmsu_apps_digital_influence {
  sql_table_name: `tidy-groove-392522.nmsu_interactions_slate.nmsu_apps_digital_influence` ;;

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
  measure: admit {
    type: sum
    sql: ${TABLE}.admit ;;
  }
  measure: app_start {
    type: sum
    sql: ${TABLE}.app_start ;;
  }
  measure: app_submit {
    type: sum
    sql: ${TABLE}.app_submit ;;
  }
  measure: days_admit_to_enroll {
    type: sum
    sql: ${TABLE}.days_admit_to_enroll ;;
  }
  measure: days_start_to_submit {
    type: sum
    sql: ${TABLE}.days_start_to_submit ;;
  }
  measure: days_submit_to_admit {
    type: sum
    sql: ${TABLE}.days_submit_to_admit ;;
  }
  measure: enroll {
    type: sum
    sql: ${TABLE}.enroll ;;
  }
  measure: google_interactions_pre_start {
    type: sum
    sql: ${TABLE}.google_interactions_pre_start ;;
  }
  measure: google_interactions_pre_submit {
    type: sum
    sql: ${TABLE}.google_interactions_pre_submit ;;
  }
  measure: google_interactions_enroll {
    type: sum
    sql: ${TABLE}.google_interactions_enroll ;;
  }
  measure: influenced_pre_start {
    type: sum
    sql: ${TABLE}.influenced_pre_start ;;
  }
  measure: influenced_pre_submit {
    type: sum
    sql: ${TABLE}.influenced_pre_submit ;;
  }
  measure: influenced_pre_enroll {
    type: sum
    sql: ${TABLE}.influenced_pre_enroll ;;
  }
  measure: linkedin_interactions_pre_start {
    type: sum
    sql: ${TABLE}.linkedin_interactions_pre_start ;;
  }
  measure: linkedin_interactions_pre_submit {
    type: sum
    sql: ${TABLE}.linkedin_interactions_pre_submit ;;
  }
  measure: linkedin_interactions_enroll {
    type: sum
    sql: ${TABLE}.linkedin_interactions_enroll ;;
  }
  measure: meta_interactions_pre_start {
    type: sum
    sql: ${TABLE}.meta_interactions_pre_start ;;
  }
  measure: meta_interactions_pre_submit {
    type: sum
    sql: ${TABLE}.meta_interactions_pre_submit ;;
  }
  measure: meta_interactions_enroll {
    type: sum
    sql: ${TABLE}.meta_interactions_enroll ;;
  }
  measure: no_campaign_interactions_pre_start {
    type: sum
    sql: ${TABLE}.no_campaign_interactions_pre_start ;;
  }
  measure: no_campaign_interactions_pre_submit {
    type: sum
    sql: ${TABLE}.no_campaign_interactions_pre_submit ;;
  }
  measure: no_campaign_interactions_enroll {
    type: sum
    sql: ${TABLE}.no_campaign_interactions_enroll ;;
  }
  measure: other_interactions_pre_start {
    type: sum
    sql: ${TABLE}.other_interactions_pre_start ;;
  }
  measure: other_interactions_pre_submit {
    type: sum
    sql: ${TABLE}.other_interactions_pre_submit ;;
  }
  measure: other_interactions_enroll {
    type: sum
    sql: ${TABLE}.other_interactions_enroll ;;
  }
  measure: pivot_influenced_pre_start {
    type: sum
    sql: ${TABLE}.pivot_influenced_pre_start ;;
  }
  measure: pivot_influenced_pre_submit {
    type: sum
    sql: ${TABLE}.pivot_influenced_pre_submit ;;
  }
  measure: pivot_influenced_pre_enroll {
    type: sum
    sql: ${TABLE}.pivot_influenced_pre_enroll ;;
  }
  measure: pivot_interactions_pre_start {
    type: sum
    sql: ${TABLE}.pivot_interactions_pre_start ;;
  }
  measure: pivot_interactions_pre_submit {
    type: sum
    sql: ${TABLE}.pivot_interactions_pre_submit ;;
  }
  measure: pivot_interactions_enroll {
    type: sum
    sql: ${TABLE}.pivot_interactions_enroll ;;
  }
  measure: tiktok_interactions_pre_start {
    type: sum
    sql: ${TABLE}.tiktok_interactions_pre_start ;;
  }
  measure: tiktok_interactions_pre_submit {
    type: sum
    sql: ${TABLE}.tiktok_interactions_pre_submit ;;
  }
  measure: tiktok_interactions_enroll {
    type: sum
    sql: ${TABLE}.tiktok_interactions_enroll ;;
  }
  measure: total_interactions_pre_start {
    type: sum
    sql: ${TABLE}.total_interactions_pre_start ;;
  }
  measure: total_interactions_pre_submit {
    type: sum
    sql: ${TABLE}.total_interactions_pre_submit ;;
  }
  measure: total_interactions_enroll {
    type: sum
    sql: ${TABLE}.total_interactions_enrollt ;;
  }
  measure: unknown_interactions_pre_start {
    type: sum
    sql: ${TABLE}.unknown_interactions_pre_start ;;
  }
  measure: unknown_interactions_pre_submit {
    type: sum
    sql: ${TABLE}.unknown_interactions_pre_submit ;;
  }
  measure: unknown_interactions_enroll {
    type: sum
    sql: ${TABLE}.unknown_interactions_enroll ;;
  }
  measure: pct_starts_influenced {
    type:  number
    value_format_name: percent_0
    sql: case when ${app_start} != 0 then ${influenced_pre_start}/${app_start} else null end ;;
  }
  measure: pct_submits_influenced {
    type:  number
    value_format_name: percent_0
    sql: case when ${app_submit} != 0 then ${influenced_pre_submit}/${app_submit} else null end ;;
  }
  measure: pct_enroll_influenced {
    type:  number
    value_format_name: percent_0
    sql: case when ${enroll} != 0 then ${influenced_pre_enroll}/${enroll} else null end ;;
  }
  measure: pct_starts_influenced_pivot {
    type:  number
    value_format_name: percent_0
    sql: case when ${app_start} != 0 then ${pivot_influenced_pre_start}/${app_start} else null end ;;
  }
  measure: pct_submits_influenced_pivot {
    type:  number
    value_format_name: percent_0
    sql: case when ${app_submit} != 0 then ${pivot_influenced_pre_submit}/${app_submit} else null end ;;
  }
  measure: pct_enroll_influenced_pivot {
    type:  number
    value_format_name: percent_0
    sql: case when ${enroll} != 0 then ${pivot_influenced_pre_enroll}/${enroll} else null end ;;
  }measure: count {
    type: count
  }
}
