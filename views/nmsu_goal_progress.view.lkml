view: nmsu_goal_progress {
  sql_table_name: `tidy-groove-392522.nmsu_apps_slate.nmsu_goal_progress` ;;

  dimension: term_semester {
    type: string
    sql: ${TABLE}.term_semester ;;
  }
  measure: admits_26 {
    type: sum
    sql: ${TABLE}.admits_26 ;;
  }
  measure: admits_27 {
    type: sum
    sql: ${TABLE}.admits_27 ;;
  }
  measure: apps_26 {
    type: sum
    sql: ${TABLE}.apps_26 ;;
  }
  measure: apps_27 {
    type: sum
    sql: ${TABLE}.apps_27 ;;
  }
  measure: enroll_26 {
    type: sum
    sql: ${TABLE}.enroll_26 ;;
  }
  measure: enroll_27 {
    type: sum
    sql: ${TABLE}.enroll_27 ;;
  }
  measure: goal_admits {
    type: sum
    sql: ${TABLE}.goal_admits ;;
  }
  measure: goal_apps {
    type: sum
    sql: ${TABLE}.goal_apps ;;
  }
  measure: goal_enroll {
    type: sum
    sql: ${TABLE}.goal_enroll ;;
  }
  measure: goal_inquiry {
    type: sum
    sql: ${TABLE}.goal_inquiry ;;
  }
  measure: inquiry_26 {
    type: sum
    sql: ${TABLE}.inquiry_26 ;;
  }
  measure: inquiry_27 {
    type: sum
    sql: ${TABLE}.inquiry_27 ;;
  }
  measure: inquiry_progress_rate {
    type:  number
    value_format_name: percent_0
    sql: case when ${goal_inquiry} != 0 then ${inquiry_27}/${goal_inquiry} else null end ;;
  }
  measure: apps_progress_rate {
    type:  number
    value_format_name: percent_0
    sql: case when ${goal_apps} != 0 then ${apps_27}/${goal_apps} else null end ;;
  }
  measure: admits_progress_rate {
    type:  number
    value_format_name: percent_0
    sql: case when ${goal_admits} != 0 then ${admits_27}/${goal_admits} else null end ;;
  }
  measure: enroll_progress_rate {
    type:  number
    value_format_name: percent_0
    sql: case when ${goal_enroll} != 0 then ${enroll_27}/${goal_enroll} else null end ;;
  }
  measure: inquiry_prior_rate {
    type:  number
    value_format_name: percent_0
    sql: case when ${inquiry_26} != 0 then ${inquiry_27}/${inquiry_26} else null end ;;
  }
  measure: apps_prior_rate {
    type:  number
    value_format_name: percent_0
    sql: case when ${apps_26} != 0 then ${apps_27}/${apps_26} else null end ;;
  }
  measure: admits_prior_rate {
    type:  number
    value_format_name: percent_0
    sql: case when ${admits_26} != 0 then ${admits_27}/${admits_26} else null end ;;
  }
  measure: enroll_prior_rate {
    type:  number
    value_format_name: percent_0
    sql: case when ${enroll_26} != 0 then ${enroll_27}/${enroll_26} else null end ;;
  }

  measure: count {
    type: count
  }
}
