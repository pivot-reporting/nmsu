view: nmsu_channel_breakdown {
  sql_table_name: `tidy-groove-392522.nmsu_interactions_slate.nmsu_channel_breakdown` ;;

  dimension: app_start {
    type: number
    sql: ${TABLE}.app_start ;;
  }
  dimension: app_submit {
    type: number
    sql: ${TABLE}.app_submit ;;
  }
  dimension: application_reference_id {
    type: string
    sql: ${TABLE}.application_reference_id ;;
  }
  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }
  dimension: influenced_pre_start {
    type: number
    sql: ${TABLE}.influenced_pre_start ;;
  }
  dimension: influenced_pre_submit {
    type: number
    sql: ${TABLE}.influenced_pre_submit ;;
  }
  dimension: interactions_pre_start {
    type: number
    sql: ${TABLE}.interactions_pre_start ;;
  }
  dimension: interactions_pre_submit {
    type: number
    sql: ${TABLE}.interactions_pre_submit ;;
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
  measure: count {
    type: count
  }
}
