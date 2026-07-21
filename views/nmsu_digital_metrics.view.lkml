view: nmsu_digital_metrics {
 sql_table_name: `tidy-groove-392522.nmsu_reporting.nmsu_digital_metrics` ;;

  dimension: campaign {
    type:  string
    sql: ${TABLE}.campaign ;;
    suggest_persist_for: "0 seconds"
  }
  dimension: ad_group {
    type:  string
    sql:  ${TABLE}.ad_group ;;
  }
  dimension: network {
    type:  string
    sql:  ${TABLE}.network ;;
  }
  dimension_group: date {
    type: time
    datatype: date
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.date ;;
  }
  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }
  dimension: tactic {
    type: string
    sql:  ${TABLE}.tactic ;;
  }

  filter: date_range_filter {
    type: date
    datatype: date
    description: "Bind the dashboard date picker to this field for dynamic YoY comparisons."
  }
  dimension_group: comparison_date {
    type: time
    timeframes: [date, week, month, quarter, year]
    sql: CASE
      WHEN {% condition date_range_filter %} ${TABLE}.date {% endcondition %}
      THEN ${TABLE}.date
      WHEN {% condition date_range_filter %} DATE_ADD(${TABLE}.date, INTERVAL 1 YEAR) {% endcondition %}
      THEN DATE_ADD(${TABLE}.date, INTERVAL 1 YEAR)
      END ;;
    description: "Aligns current and prior-year periods on a single x-axis for YoY overlay charts."
  }

  measure: count {
    type: count
  }
  measure: impressions {
    type: sum
    sql: ${TABLE}.impressions ;;
    label: "Impressions (Unfiltered)"
  }
  measure: impressions_in_period {
    type: sum
    sql: CASE WHEN {% condition date_range_filter %} ${TABLE}.date {% endcondition %}
      THEN ${TABLE}.impressions END ;;
    label: "Impressions"
  }

  measure: impressions_prior_year_period {
    type: sum
    sql: CASE WHEN {% condition date_range_filter %} DATE_ADD(${TABLE}.date, INTERVAL 1 YEAR) {% endcondition %}
         AND NOT ({% condition date_range_filter %} ${TABLE}.date {% endcondition %})
THEN ${TABLE}.impressions END ;;
    label: "Impressions Prior Year"
  }
  measure: impressions_yoy_change_pct {
    type: number
    sql: (${impressions_in_period} - ${impressions_prior_year_period})
      / NULLIF(${impressions_prior_year_period}, 0) ;;
    value_format_name: percent_1
    label: "Impressions YoY % Change"
    html:
    {% if value < 0 %}
    <span style="color: #6e4850;">▼ {{ rendered_value }}</span>
    {% else %}
    <span style="color: #3eb8c7;">▲ {{ rendered_value }}</span>
    {% endif %} ;;

  }
  measure: clicks {
    type: sum
    sql: ${TABLE}.clicks ;;
    label: "Clicks (Unfiltered)"
  }
  measure: clicks_in_period {
    type: sum
    sql: CASE WHEN {% condition date_range_filter %} ${TABLE}.date {% endcondition %}
      THEN ${TABLE}.clicks END ;;
    label: "Clicks"
  }

  measure: clicks_prior_year_period {
    type: sum
    sql: CASE WHEN {% condition date_range_filter %} DATE_ADD(${TABLE}.date, INTERVAL 1 YEAR) {% endcondition %}
        AND NOT ({% condition date_range_filter %} ${TABLE}.date {% endcondition %})
THEN ${TABLE}.clicks END ;;
    label: "Clicks Prior Year"
  }
  measure: clicks_yoy_change_pct {
    type: number
    sql: (${clicks_in_period} - ${clicks_prior_year_period})
      / NULLIF(${clicks_prior_year_period}, 0) ;;
    value_format_name: percent_1
    label: "Clicks YoY % Change"
    html:
    {% if value < 0 %}
    <span style="color: #6e4850;">▼ {{ rendered_value }}</span>
    {% else %}
    <span style="color: #3eb8c7;">▲ {{ rendered_value }}</span>
    {% endif %} ;;

  }
  measure: conversions {
    type: sum
    sql: ${TABLE}.conversions ;;
    value_format_name: decimal_0
    label: "Inquiries (Unfiltered)"
  }
  measure: conversions_in_period {
    type: sum
    sql: CASE WHEN {% condition date_range_filter %} ${TABLE}.date {% endcondition %}
      THEN ${TABLE}.conversions END ;;
    value_format_name:  decimal_0
    label: "Inquiries"
  }

  measure: conversions_prior_year_period {
    type: sum
    sql: Case WHEN {% condition date_range_filter %} DATE_ADD(${TABLE}.date, INTERVAL 1 YEAR) {% endcondition %}
              AND NOT ({% condition date_range_filter %} ${TABLE}.date {% endcondition %})
         THEN ${TABLE}.conversions
       END ;;
    value_format_name:  decimal_0
    label: "Inquiries Prior Year"
  }
  measure: conversions_yoy_change_pct {
    type: number
    sql: (${conversions_in_period} - ${conversions_prior_year_period})
      / NULLIF(${conversions_prior_year_period}, 0) ;;
    value_format_name: percent_1
    label: "Inquiries YoY % Change"
    html:
    {% if value < 0 %}
    <span style="color: #6e4850;">▼ {{ rendered_value }}</span>
    {% else %}
    <span style="color: #3eb8c7;">▲ {{ rendered_value }}</span>
    {% endif %} ;;

  }
  measure: spend {
    type: sum
    sql: ${TABLE}.cost ;;
    value_format_name: usd
    label: "Spend (Unfiltered)"
  }
  measure: spend_in_period {
    type: sum
    value_format_name: usd_0
    sql: CASE WHEN {% condition date_range_filter %} ${TABLE}.date {% endcondition %}
      THEN ${TABLE}.cost END ;;
    label: "Spend"
  }

  measure: spend_prior_year_period {
    type: sum
    sql: CASE WHEN {% condition date_range_filter %} DATE_ADD(${TABLE}.date, INTERVAL 1 YEAR) {% endcondition %}
        AND NOT ({% condition date_range_filter %} ${TABLE}.date {% endcondition %})
THEN ${TABLE}.cost END ;;
    label: "Spend Prior Year"
  }
  measure: spend_yoy_change_pct {
    type: number
    sql: (${spend_in_period} - ${spend_prior_year_period})
      / NULLIF(${spend_prior_year_period}, 0) ;;
    value_format_name: percent_1
    label: "Spend YoY % Change"
    html:
    {% if value < 0 %}
    <span style="color: #3eb8c7;">▼ {{ rendered_value }}</span>
    {% else %}
    <span style="color: #6e4850;">▲ {{ rendered_value }}</span>
    {% endif %} ;;
  }

  measure: cost_per_conv {
    type: number
    sql: case when ${conversions}!= 0 then ${spend}/${conversions} else null end ;;
    value_format_name: usd_0
    label: "Cost per Inq. (Unfiltered)"
  }
  measure: cost_per_conv_in_period {
    type: number
    value_format_name: usd_0
    sql: CASE WHEN ${conversions_in_period} != 0
      THEN ${spend_in_period} / ${conversions_in_period} END ;;
    label: "Cost per Inq."
  }

  measure: cost_per_conv_prior_year_period {
    type: number
    sql: CASE WHEN ${conversions_prior_year_period} != 0
      THEN ${spend_prior_year_period} / ${conversions_prior_year_period} END ;;
    value_format_name: usd_0
    label: "Cost per Inq. Prior Year"
  }
  measure: cost_per_conv_yoy_change_pct {
    type: number
    sql: (${cost_per_conv_in_period} - ${cost_per_conv_prior_year_period})
      / NULLIF(${cost_per_conv_prior_year_period}, 0) ;;
    value_format_name: percent_1
    label: "Cost per Inq. YoY % Change"
    html:
    {% if value < 0 %}
    <span style="color: #3eb8c7;">▼ {{ rendered_value }}</span>
    {% else %}
    <span style="color: #6e4850;">▲ {{ rendered_value }}</span>
    {% endif %} ;;
  }
  measure: conv_rate {
    type: number
    sql: case when ${clicks}!= 0 then ${conversions}/${clicks} else null end ;;
    value_format_name: percent_2
    label: "Inq. Rate (Unfiltered)"
  }
  measure: conv_rate_in_period {
    type: number
    value_format_name: percent_2
    sql: CASE WHEN ${clicks_in_period} != 0
      THEN ${conversions_in_period} / ${clicks_in_period} END ;;
    label: "Inq. Rate"
  }

  measure: conv_rate_prior_year_period {
    type: number
    sql: CASE WHEN ${clicks_prior_year_period} != 0
      THEN ${conversions_prior_year_period} / ${clicks_prior_year_period} END ;;
    value_format_name: percent_2
    label: "Inq. Rate Prior Year"
  }
  measure: conv_rate_yoy_change_pct {
    type: number
    sql: (${conv_rate_in_period} - ${conv_rate_prior_year_period})
      / NULLIF(${conv_rate_prior_year_period}, 0) ;;
    value_format_name: percent_1
    label: "Inq. Rate YoY % Change"
    html:
    {% if value < 0 %}
    <span style="color: #6e4850;">▼ {{ rendered_value }}</span>
    {% else %}
    <span style="color: #3eb8c7;">▲ {{ rendered_value }}</span>
    {% endif %} ;;
  }
  measure: ctr {
    type: number
    sql: case when ${impressions}!= 0 then ${clicks}/${impressions} else null end ;;
    value_format_name: percent_2
    label: "CTR (Unfiltered)"
  }
  measure: ctr_in_period {
    type: number
    value_format_name: percent_2
    sql: CASE WHEN ${impressions_in_period} != 0
      THEN ${clicks_in_period} / ${impressions_in_period} END ;;
    label: "CTR"
  }

  measure: ctr_prior_year_period {
    type: number
    sql: CASE WHEN ${impressions_prior_year_period} != 0
      THEN ${clicks_prior_year_period} / ${impressions_prior_year_period} END ;;
    value_format_name: percent_2
    label: "CTR Prior Year"
  }
  measure: ctr_yoy_change_pct {
    type: number
    sql: (${ctr_in_period} - ${ctr_prior_year_period})
      / NULLIF(${ctr_prior_year_period}, 0) ;;
    value_format_name: percent_1
    label: "CTR YoY % Change"
    html:
    {% if value < 0 %}
    <span style="color: #6e4850;">▼ {{ rendered_value }}</span>
    {% else %}
    <span style="color: #3eb8c7;">▲ {{ rendered_value }}</span>
    {% endif %} ;;
  }

}
