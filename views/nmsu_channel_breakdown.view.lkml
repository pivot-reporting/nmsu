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
  dimension: campaign_group {
    type: string
    label: "Campaign Group"
    sql:
    CASE
      WHEN ${ping_utm_campaign} IS NULL THEN 'No Campaign'
      WHEN REGEXP_CONTAINS(${ping_utm_campaign}, r'criminal-justice-bachelors|criminal-justice-masters|dnp|engineering|general-online-nm|hotel-restaurant-tourism|information-communication-techno|information-technology-masters|ma-educational-administration|ma-technical-professional-writin|ms-food-science|msn-leadership-admin|psychology|public-health-masters|military|prospects|sitelink|social-work-masters|sociology|apply|brand-global-campus-nm|brand-masters-graduate|Brand-NewMexico|brand-nm|brand-scholarships|NMSU-\|-Brand---Mast')
        THEN 'Pivot'
      WHEN ${ping_utm_campaign} = 'brand' THEN 'Pivot'
      WHEN ${ping_utm_campaign} IN (
        'NMSU-|-General-Online---NM',
        'NMSU-|-General-Online---AZ,-CO,-',
        'NMSU-|-Engineering---NM',
        'NMSU-|-Brand-Global-Campus---NM',
        'NMSU-|-Sociology---NM',
        'NMSU-|-Brand---TX',
        'NMSU-|-Brand-Global-Campus---TX',
        'NMSU-|-Health-Degree---NM',
        'NMSU-|-Brand---NM',
        'NMSU-|-Hotel,-Restaurant,-',
        'NMSU-|-Psychology---NM',
        'NMSU-|-Criminal-Justice'
      ) THEN 'Pivot'
      ELSE 'Other'
    END ;;
  }
  dimension: campaign_program {
    type: string
    label: "Campaign Program"
    sql:
    CASE
      WHEN ${ping_utm_campaign} IS NULL THEN 'No Campaign'

      -- Program-level CONTAINS matches (order preserved from original)
      WHEN REGEXP_CONTAINS(${ping_utm_campaign}, r'criminal-justice-bachelors') THEN 'Criminal Justice BCJ'
      WHEN REGEXP_CONTAINS(${ping_utm_campaign}, r'criminal-justice-masters')   THEN 'Criminal Justice MCJ'
      WHEN REGEXP_CONTAINS(${ping_utm_campaign}, r'dnp')                        THEN 'Nursing Practice DNP'
      WHEN REGEXP_CONTAINS(${ping_utm_campaign}, r'engineering')                THEN 'Engineering MEng'
      WHEN REGEXP_CONTAINS(${ping_utm_campaign}, r'general-online-nm')          THEN 'General Online'
      WHEN REGEXP_CONTAINS(${ping_utm_campaign}, r'hotel-restaurant-tourism')   THEN 'Hotel, Restaurant, & Tourism MS'
      WHEN REGEXP_CONTAINS(${ping_utm_campaign}, r'information-communication-techno') THEN 'Information and Communication Tech'
      WHEN REGEXP_CONTAINS(${ping_utm_campaign}, r'information-technology-masters')   THEN 'Information Technology Masters'
      WHEN REGEXP_CONTAINS(${ping_utm_campaign}, r'ma-educational-administration')    THEN 'MAED'
      WHEN REGEXP_CONTAINS(${ping_utm_campaign}, r'ma-technical-professional-writin') THEN 'MATPC'
      WHEN REGEXP_CONTAINS(${ping_utm_campaign}, r'ms-food-science')            THEN 'FSTE'
      WHEN REGEXP_CONTAINS(${ping_utm_campaign}, r'msn-leadership-admin')       THEN 'Leadership & Administration MSN'
      WHEN REGEXP_CONTAINS(${ping_utm_campaign}, r'psychology')                 THEN 'Psychology BA'
      WHEN REGEXP_CONTAINS(${ping_utm_campaign}, r'public-health-masters')      THEN 'Public Health Masters'
      WHEN REGEXP_CONTAINS(${ping_utm_campaign}, r'military')                   THEN 'Funnel - Military'
      WHEN REGEXP_CONTAINS(${ping_utm_campaign}, r'prospects')                  THEN 'Funnel - Purchased Lists'
      WHEN REGEXP_CONTAINS(${ping_utm_campaign}, r'sitelink')                   THEN 'Brand - Awareness'
      WHEN REGEXP_CONTAINS(${ping_utm_campaign}, r'social-work-masters')        THEN 'Social Work MA'
      WHEN REGEXP_CONTAINS(${ping_utm_campaign}, r'sociology')                  THEN 'Sociology General'
      WHEN REGEXP_CONTAINS(${ping_utm_campaign}, r'apply')                      THEN 'Funnel - Apply'

      -- Brand CONTAINS matches (all share one result, so collapsed)
      WHEN ${ping_utm_campaign} = 'brand'
      OR REGEXP_CONTAINS(${ping_utm_campaign}, r'brand-global-campus-nm|brand-masters-graduate|NMSU-\|-Brand---Mast|Brand-NewMexico|brand-nm|brand-scholarships')
      THEN 'Brand - Awareness'

      -- Exact matches (mutually exclusive, so grouped by result)
      WHEN ${ping_utm_campaign} IN (
      'NMSU-|-General-Online---NM',
      'NMSU-|-General-Online---AZ,-CO,-'
      ) THEN 'General Online'
      WHEN ${ping_utm_campaign} = 'NMSU-|-Engineering---NM' THEN 'Engineering MEng'
      WHEN ${ping_utm_campaign} IN (
      'NMSU-|-Brand-Global-Campus---NM',
      'NMSU-|-Brand-Global-Campus---TX',
      'NMSU-|-Brand---NM',
      'NMSU-|-Brand---TX'
      ) THEN 'Brand - Awareness'
      WHEN ${ping_utm_campaign} = 'NMSU-|-Sociology---NM'        THEN 'Sociology General'
      WHEN ${ping_utm_campaign} = 'NMSU-|-Psychology---NM'       THEN 'Psychology BA'
      WHEN ${ping_utm_campaign} = 'NMSU-|-Hotel,-Restaurant,-'   THEN 'Hotel, Restaurant, & Tourism MS'
      WHEN ${ping_utm_campaign} = 'NMSU-|-Health-Degree---NM'    THEN 'Health Degree'
      WHEN ${ping_utm_campaign} = 'NMSU-|-Criminal-Justice'      THEN 'Criminal Justice BCJ'

      ELSE 'Other'
      END ;;
  }
  measure: app_start {
    type: sum
    sql: ${TABLE}.app_start ;;
  }
  measure: app_submit {
    type: sum
    sql: ${TABLE}.app_submit ;;
  }
  measure: enroll {
    type: sum
    sql: ${TABLE}.enroll ;;
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
  measure: interactions_pre_start {
    type: sum
    sql: ${TABLE}.interactions_pre_start ;;
  }
  measure: interactions_pre_submit {
    type: sum
    sql: ${TABLE}.interactions_pre_submit ;;
  }
  measure: interactions_pre_enroll {
    type: sum
    sql: ${TABLE}.interactions_pre_enroll ;;
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
  measure: count {
    type: count
  }
}
