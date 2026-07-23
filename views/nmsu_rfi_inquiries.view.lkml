view: nmsu_rfi_inquiries {
  sql_table_name: `tidy-groove-392522.nmsu_inquiry_slate.nmsu_rfi_inquiries` ;;

  dimension_group: _fivetran_synced {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}._fivetran_synced ;;
  }
  dimension: address_city {
    type: string
    sql: ${TABLE}.address_city ;;
  }
  dimension: address_country {
    type: string
    sql: ${TABLE}.address_country ;;
  }
  dimension: address_region {
    type: string
    sql: ${TABLE}.address_region ;;
  }
  dimension: campaign_program {
    type: string
    sql: ${TABLE}.campaign_program ;;
  }
  dimension: campus {
    type: string
    sql: ${TABLE}.campus ;;
  }
  dimension: degree_type {
    type: string
    sql: ${TABLE}.degree_type ;;
  }
  dimension: entry_term_person {
    type: string
    sql: ${TABLE}.entry_term_person ;;
  }
  dimension_group: first_rfi_submission {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.first_rfi_submission_date ;;
  }
  dimension: first_utm_campaign {
    type: string
    sql: ${TABLE}.first_utm_campaign ;;
  }
  dimension: first_utm_content {
    type: string
    sql: ${TABLE}.first_utm_content ;;
  }
  dimension: first_utm_medium {
    type: string
    sql: ${TABLE}.first_utm_medium ;;
  }
  dimension: first_utm_source {
    type: string
    sql: ${TABLE}.first_utm_source ;;
  }
  dimension: first_utm_term {
    type: string
    sql: ${TABLE}.first_utm_term ;;
  }
  dimension: gr_academic_program {
    type: string
    sql: ${TABLE}.gr_academic_program ;;
  }
  dimension: military_identifier {
    type: string
    sql: ${TABLE}.military_identifier ;;
  }
  dimension_group: most_recent_rfi_submission {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.most_recent_rfi_submission_date ;;
  }
  dimension: most_recent_utm_campaign {
    type: string
    sql: ${TABLE}.most_recent_utm_campaign ;;
  }
  dimension: most_recent_utm_content {
    type: string
    sql: ${TABLE}.most_recent_utm_content ;;
  }
  dimension: most_recent_utm_medium {
    type: string
    sql: ${TABLE}.most_recent_utm_medium ;;
  }
  dimension: most_recent_utm_source {
    type: string
    sql: ${TABLE}.most_recent_utm_source ;;
  }
  dimension: most_recent_utm_term {
    type: string
    sql: ${TABLE}.most_recent_utm_term ;;
  }
  dimension: overall_campaign {
    type: string
    sql: ${TABLE}.overall_campaign ;;
  }
  dimension: person_guid {
    type: string
    sql: ${TABLE}.person_guid ;;
  }
  dimension: person_id {
    type: string
    sql: ${TABLE}.person_id ;;
  }
  dimension: person_status {
    type: string
    sql: ${TABLE}.person_status ;;
  }
  dimension_group: person_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.person_updated_date ;;
  }
  dimension: portfolio {
    type: string
    sql: ${TABLE}.portfolio ;;
  }
  dimension: program {
    type: string
    sql: ${TABLE}.program ;;
  }
  dimension: rev_entry_term {
    type: string
    sql: ${TABLE}.rev_entry_term ;;
  }
  dimension: rev_first_utm_medium {
    type: string
    sql: ${TABLE}.rev_first_utm_medium ;;
  }
  dimension: rev_first_utm_source {
    type: string
    sql: ${TABLE}.rev_first_utm_source ;;
  }
  dimension: rfi_month {
    type: number
    sql: ${TABLE}.rfi_month ;;
  }
  dimension: rfi_year {
    type: number
    sql: ${TABLE}.rfi_year ;;
  }
  dimension: student_level {
    type: string
    sql: ${TABLE}.student_level ;;
  }
  dimension: student_type {
    type: string
    sql: ${TABLE}.student_type ;;
  }
  dimension: ug_academic_program {
    type: string
    sql: ${TABLE}.ug_academic_program ;;
  }
  dimension: utm_platform {
    type: string
    sql: ${TABLE}.utm_platform ;;
  }
# ============================================================
# INQUIRY YTD
# ============================================================
  dimension: is_inquiry_ytd {
    type: yesno
    sql:
    CASE
      WHEN ${rev_entry_term} LIKE '%2025%' THEN
        DATE_DIFF(CURRENT_DATE(), CAST(${first_rfi_submission_date} AS DATE), DAY) > 365
      WHEN ${rev_entry_term} LIKE '%2026%' THEN
        TRUE
      ELSE FALSE
    END ;;
  }
measure: inquiry_ytd_2025 {
  type: count
  filters: [
    is_inquiry_ytd: "yes",
    rev_entry_term: "%2025%"
  ]
  label: "2025 Inquiries YTD"
}
measure: inquiry_ytd_2026 {
  type: count
  filters: [
    is_inquiry_ytd: "yes",
    rev_entry_term: "%2026%"
  ]
  label: "2026 Inquiries YTD"
}
measure: inquiry_ytd_pct_change {
  type: number
  sql: SAFE_DIVIDE(
    (${inquiry_ytd_2026} - ${inquiry_ytd_2025}),
    NULLIF(${inquiry_ytd_2025}, 0)
  ) ;;
  value_format_name: percent_1
  label: "Inquiry YTD % Change"
    html:
    <span style="color: {% if value > 0 %}#3B6D11{% elsif value < 0 %}#A32D2D{% else %}#888780{% endif %}">
    {% if value > 0 %}▲{% elsif value < 0 %}▼{% endif %}
    {{ rendered_value }}
    </span> ;;
  }
  measure: distinct_person_count {
    type: count_distinct
    sql: ${person_id} ;;
    value_format_name: decimal_0
  }
  measure: count {
    type: count
    }
  }
