view: nmsu_channel_breakdown {
  sql_table_name: `tidy-groove-392522.nmsu_interactions_slate.nmsu_channel_breakdown` ;;

  dimension: application_reference_id {
    type: string
    sql: ${TABLE}.application_reference_id ;;
  }
  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }
  dimension: ping_utm_campaign {
    type: string
    sql: ${TABLE}.ping_utm_campaign ;;
  }
  dimension: portfolio {
    type: string
    sql: ${TABLE}.portfolio ;;
  }
  dimension: rev_app_entry_term {
    type: string
    sql: ${TABLE}.rev_app_entry_term ;;
  }
  dimension: slate_id {
    type: string
    sql: ${TABLE}.slate_id ;;
  }
  measure: app_start {
    type: sum
    sql: ${TABLE}.app_start ;;
  }
  measure: app_submit {
    type: sum
    sql: ${TABLE}.app_submit ;;
  }
  measure: influenced_pre_start {
    type: sum
    sql: ${TABLE}.influenced_pre_start ;;
  }
  measure: influenced_pre_submit {
    type: sum
    sql: ${TABLE}.influenced_pre_submit ;;
  }
  measure: interactions_pre_start {
    type: sum
    sql: ${TABLE}.interactions_pre_start ;;
  }
  measure: interactions_pre_submit {
    type: sum
    sql: ${TABLE}.interactions_pre_submit ;;
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
  measure: count {
    type: count
  }
}
