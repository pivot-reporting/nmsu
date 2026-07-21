connection: "pivot_bigquery_reporting"

include: "/views/nmsu_digital_metrics.view.lkml"
include: "/views/nmsu_google_keywords.view.lkml"

explore: nmsu_digital_metrics {}
explore: nmsu_google_keywords {}
