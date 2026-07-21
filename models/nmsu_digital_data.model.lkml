connection: "pivot_bigquery_reporting"

include: "/views/nmsu_digital_metrics.view.lkml"
include: "/views/nmsu_google_keywords.view.lkml"
include: "/views/nmsu_cost_per_enrollment.view.lkml"
include: "/views/nmsu_cost_per_enrollment_by_utm.view.lkml"

explore: nmsu_digital_metrics {}
explore: nmsu_google_keywords {}
explore: nmsu_cost_per_enrollment {}
explore: nmsu_cost_per_enrollment_by_utm {}
