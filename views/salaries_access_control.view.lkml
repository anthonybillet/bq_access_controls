view: salaries_access_control {
  sql_table_name: `ant-billet-looker-core-argolis.BQ_Access_Controls.Salaries_access_control` ;;
  view_label: "Salaries"

  dimension: commute_time {
    type: number
    sql: ${TABLE}.commute_time ;;
  }
  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.Country ;;
  }
  dimension: currency {
    type: string
    sql: ${TABLE}.Currency ;;
  }
  dimension: department {
    type: string
    sql: ${TABLE}.Department ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }
  dimension: first_name {
    type: string
    sql: ${TABLE}.First_Name ;;
  }
  dimension: last_name {
    type: string
    sql: ${TABLE}.Last_Name ;;
  }

  dimension: full_name {
    type: string
    sql: CONCAT(${first_name}, ' ' , ${last_name}) ;;
  }

  dimension: last_perf {
    type: number
    sql: ${TABLE}.last_perf ;;
  }
  dimension: salary {
    type: number
    sql: ${TABLE}.Salary ;;
  }
  dimension: salary_positioning {
    type: number
    sql: ${TABLE}.Salary_Positioning ;;
  }
  dimension: seniority {
    type: number
    sql: ${TABLE}.seniority ;;
  }
  measure: count_employees {
    type: count
    drill_fields: [first_name, last_name]
  }
  measure: total_salary {
    type: sum
    sql: ${salary} ;;
  }
  measure: total_commute_time {
    type: sum
    sql: ${commute_time} ;;
  }
  measure: avg_commute_time_per_employee {
    value_format_name: decimal_2
    type: number
    sql: 1.0*${total_commute_time}/NULLIF(${count_employees},0) ;;
  }
  measure: avg_salary_per_employee {
    value_format_name: decimal_2
    type: number
    sql: 1.0*${total_salary}/NULLIF(${count_employees},0) ;;
  }
}
