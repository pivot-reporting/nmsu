view: nmsu_slate_applications {
  sql_table_name: `tidy-groove-392522.nmsu_apps_slate.nmsu_slate_applications` ;;

  dimension_group: _fivetran_synced {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}._fivetran_synced ;;
  }
  dimension: admit_month {
    type: number
    sql: ${TABLE}.admit_month ;;
  }
  dimension: app_filter {
    type: number
    sql: ${TABLE}.app_filter ;;
  }
  dimension: app_start_month {
    type: number
    sql: ${TABLE}.app_start_month ;;
  }
  dimension: application_campus {
    type: string
    sql: ${TABLE}.application_campus ;;
  }
  dimension_group: application_created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.application_created_date ;;
  }
  dimension: application_decision_code {
    type: string
    sql: ${TABLE}.application_decision_code ;;
  }
  dimension: application_degree_type {
    type: string
    sql: ${TABLE}.application_degree_type ;;
  }
  dimension: application_entry_term {
    type: string
    sql: ${TABLE}.application_entry_term ;;
  }
  dimension: application_guid {
    type: string
    sql: ${TABLE}.application_guid ;;
  }
  dimension: application_priority {
    type: string
    sql: ${TABLE}.application_priority ;;
  }
  dimension: application_program_gr {
    type: string
    sql: ${TABLE}.application_program_gr ;;
  }
  dimension: application_program_ug {
    type: string
    sql: ${TABLE}.application_program_ug ;;
  }
  dimension: application_rank {
    type: string
    sql: ${TABLE}.application_rank ;;
  }
  dimension: application_reference_id {
    type: string
    sql: ${TABLE}.application_reference_id ;;
  }
  dimension: application_round {
    type: string
    sql: ${TABLE}.application_round ;;
  }
  dimension: application_student_type {
    type: string
    sql: ${TABLE}.application_student_type ;;
  }
  dimension_group: application_submitted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.application_submitted_date ;;
  }
  dimension: campaign_program {
    type: string
    sql: ${TABLE}.campaign_program ;;
  }
  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }
  dimension: days_app_start_submit {
    type: number
    sql: ${TABLE}.days_app_start_submit ;;
  }
  dimension: days_inq_app_start {
    type: number
    sql: ${TABLE}.days_inq_app_start ;;
  }
  dimension: days_inq_enroll {
    type: number
    sql: ${TABLE}.days_inq_enroll ;;
  }
  dimension: days_inq_submit {
    type: number
    sql: ${TABLE}.days_inq_submit ;;
  }
  dimension: days_submit_admit {
    type: number
    sql: ${TABLE}.days_submit_admit ;;
  }
  dimension: enroll_month {
    type: number
    sql: ${TABLE}.enroll_month ;;
  }
  dimension: enroll_week {
    type: number
    sql: ${TABLE}.enroll_week ;;
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
  dimension_group: first_rfi_submission {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.first_rfi_submission_date ;;
  }
  dimension: first_term_enrolled {
    type: string
    sql: ${TABLE}.first_term_enrolled ;;
  }
  dimension: first_utm_campaign {
    type: string
    sql: ${TABLE}.first_utm_campaign ;;
  }
  dimension: first_utm_medium {
    type: string
    sql: ${TABLE}.first_utm_medium ;;
  }
  dimension: first_utm_source {
    type: string
    sql: ${TABLE}.first_utm_source ;;
  }
  dimension: graduate_application_workflow_bin {
    type: string
    sql: ${TABLE}.graduate_application_workflow_bin ;;
  }
  dimension: hispanic {
    type: string
    sql: ${TABLE}.hispanic ;;
  }
  dimension_group: last_admit {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_admit_date ;;
  }
  dimension_group: last_enroll {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.last_enroll_date ;;
  }
  dimension: last_term_enrolled {
    type: string
    sql: ${TABLE}.last_term_enrolled ;;
  }
  dimension: military_identifier {
    type: string
    sql: ${TABLE}.military_identifier ;;
  }
  dimension: most_recent_utm_campaign {
    type: string
    sql: ${TABLE}.most_recent_utm_campaign ;;
  }
  dimension: most_recent_utm_medium {
    type: string
    sql: ${TABLE}.most_recent_utm_medium ;;
  }
  dimension: most_recent_utm_source {
    type: string
    sql: ${TABLE}.most_recent_utm_source ;;
  }
  dimension: overall_campaign {
    type: string
    sql: ${TABLE}.overall_campaign ;;
  }
  dimension: portfolio {
    type: string
    sql: ${TABLE}.portfolio ;;
  }
  dimension: program {
    type: string
    sql: ${TABLE}.program ;;
  }
  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }
  dimension: rev_app_entry_term {
    type: string
    sql: ${TABLE}.rev_app_entry_term ;;
  }
  dimension: round_key_student_level {
    type: string
    sql: ${TABLE}.round_key_student_level ;;
  }
  dimension: round_level {
    type: string
    sql: ${TABLE}.round_level ;;
  }
  dimension: slate_id {
    type: string
    sql: ${TABLE}.slate_id ;;
  }
  dimension: submitted_month {
    type: number
    sql: ${TABLE}.submitted_month ;;
  }
  dimension: submitted_year {
    type: number
    sql: ${TABLE}.submitted_year ;;
  }
  dimension: term_code {
    type: string
    sql: ${TABLE}.term_code ;;
  }
  dimension: term_year {
    type: number
    sql: ${TABLE}.term_year ;;
  }
  dimension: utm_campaign {
    type: string
    sql: ${TABLE}.utm_campaign ;;
  }
  dimension: utm_platform {
    type: string
    sql: ${TABLE}.utm_platform ;;
  }
  dimension: utm_source {
    type: string
    sql: ${TABLE}.utm_source ;;
  }
  measure: admit {
    type: sum
    sql: ${TABLE}.admit ;;
    label: "Admit"
  }
  measure: app_start {
    type: sum
    sql: ${TABLE}.app_start ;;
    label: "App Starts"
  }
  measure: app_submit {
    type: sum
    sql: ${TABLE}.app_submit ;;
    label: "Apps"
  }
  measure: enroll {
    type: sum
    sql: ${TABLE}.enroll ;;
    label: "Enrolled"
  }
  measure: ytd_admit {
    type: sum
    sql: ${TABLE}.ytd_admit ;;
  }
  measure: ytd_enroll {
    type: sum
    sql: ${TABLE}.ytd_enroll ;;
  }
  measure: ytd_start {
    type: sum
    sql: ${TABLE}.ytd_start ;;
  }
  measure: ytd_submit {
    type: sum
    sql: ${TABLE}.ytd_submit ;;
  }
  measure: count {
    type: count
  }
  measure: submit_to_admit_rate {
    type:  number
    value_format_name: percent_0
    sql: case when ${app_submit} != 0 then ${admit}/${app_submit} else null end ;;
  }
  measure: submit_to_enroll_rate {
    type:  number
    value_format_name: percent_0
    sql: case when ${app_submit} != 0 then ${enroll}/${app_submit} else null end ;;
  }
  measure: admit_to_enroll_rate {
    type:  number
    value_format_name: percent_0
    sql: case when ${admit} != 0 then ${enroll}/${admit} else null end ;;
  }
}
