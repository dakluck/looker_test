- dashboard: coldcraft_dashboard
  title: Coldcraft Dashboard
  layout: newspaper
  elements:
  - title: Coldcraft Sales Trend
    name: Coldcraft Sales Trend
    model: edw
    explore: dates
    type: looker_column
    fields:
    - dates.Calendar_week
    - Sales.Gross_Sales_Less_Buybacks
    - Sales.Returns
    fill_fields:
    - dates.Calendar_week
    sorts:
    - dates.Calendar_week desc
    limit: 500
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_labels:
      Sales.Returns: Returns
      Sales.Gross_Sales_Less_Buybacks: Gross Sales Less Buybacks
    series_types:
      Sales.Returns: line
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: true
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Brand: Sales.Brand
      Item: Sales.Item
      Account: Sales.Account
      Delivery Method: Sales.Delivery_Method
      Relative Date: dates.Relative_Date
    row: 0
    col: 0
    width: 20
    height: 9
  - title: Untitled
    name: Untitled
    model: edw
    explore: Sales
    type: single_value
    fields:
    - Sales.Distinct_Routes
    limit: 500
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    single_value_title: Routes Delivering
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Brand: Sales.Brand
      Item: Sales.Item
      Account: Sales.Account
      Delivery Method: Sales.Delivery_Method
      Relative Date: dates.Relative_Date
    row: 4
    col: 20
    width: 4
    height: 5
  - title: Sales By Brand
    name: Sales By Brand
    model: edw
    explore: Sales
    type: looker_pie
    fields:
    - Sales.Brand
    - Sales.Gross_Sales_Less_Buybacks
    sorts:
    - Sales.Gross_Sales_Less_Buybacks desc
    limit: 500
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Brand: Sales.Brand
      Item: Sales.Item
      Account: Sales.Account
      Delivery Method: Sales.Delivery_Method
      Relative Date: dates.Relative_Date
    row: 9
    col: 0
    width: 8
    height: 6
  - title: Unit Trend vs Account Growth
    name: Unit Trend vs Account Growth
    model: edw
    explore: Sales
    type: looker_line
    fields:
    - Sales.Distinct_SKUs
    - Sales.units_store_week
    - Sales.Distinct_Stores
    - dates.Calendar_month
    fill_fields:
    - dates.Calendar_month
    sorts:
    - dates.Calendar_month desc
    limit: 500
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_types: {}
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: Sales.Distinct_SKUs
        name: Sales Distinct Skus
        axisId: Sales.Distinct_SKUs
      - id: Sales.units_store_week
        name: Sales Units Store Week
        axisId: Sales.units_store_week
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label:
      orientation: right
      series:
      - id: Sales.Distinct_Stores
        name: Sales Distinct Stores
        axisId: Sales.Distinct_Stores
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Brand: Sales.Brand
      Item: Sales.Item
      Account: Sales.Account
      Delivery Method: Sales.Delivery_Method
      Relative Date: dates.Relative_Date
    row: 9
    col: 8
    width: 16
    height: 6
  - title: Item Details
    name: Item Details
    model: edw
    explore: Sales
    type: table
    fields:
    - Sales.Item
    - Sales.Gross_Sales_Less_Buybacks
    - Sales.Gross_Units_Less_Buybacks
    - Sales.Unit_Mix
    - Sales.Sales_Mix
    - Sales.Distinct_Stores
    sorts:
    - Sales.Gross_Sales_Less_Buybacks desc
    limit: 500
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '20'
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: none
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Brand: Sales.Brand
      Item: Sales.Item
      Account: Sales.Account
      Delivery Method: Sales.Delivery_Method
      Relative Date: dates.Relative_Date
    row: 20
    col: 0
    width: 24
    height: 6
  - title: Sales Heatmap
    name: Sales Heatmap
    model: edw
    explore: Sales
    type: looker_map
    fields:
    - Sales.Gross_Sales_Less_Buybacks
    - Sales.Account_Location
    filters:
      Sales.Account_Location_bin_level: '7'
      Sales.Account_Location: inside box from 79.17133464081945, -180 to -40.979898069620134,
        -45
    sorts:
    - Sales.Gross_Sales_Less_Buybacks desc
    limit: 5000
    map_plot_mode: automagic_heatmap
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_latitude: 36.94989178681327
    map_longitude: -101.86523437500001
    map_zoom: 3
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: true
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: none
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Brand: Sales.Brand
      Item: Sales.Item
      Account: Sales.Account
      Delivery Method: Sales.Delivery_Method
      Relative Date: dates.Relative_Date
    row: 15
    col: 0
    width: 24
    height: 5
  - title: Untitled
    name: Untitled
    model: edw
    explore: Sales
    type: single_value
    fields:
    - Sales.Active_Stores
    limit: 500
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    single_value_title: Active Accounts
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    show_view_names: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: none
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Brand: Sales.Brand
      Item: Sales.Item
      Account: Sales.Account
      Delivery Method: Sales.Delivery_Method
      Relative Date: dates.Relative_Date
    row: 0
    col: 20
    width: 4
    height: 4
  - title: Top 10 Customers by Brand
    name: Top 10 Customers by Brand
    model: edw
    explore: dates
    type: looker_bar
    fields:
    - Sales.Account
    - Sales.Gross_Sales_Less_Buybacks
    - Sales.Brand
    pivots:
    - Sales.Brand
    sorts:
    - Sales.Gross_Sales_Less_Buybacks desc 0
    - Sales.Brand
    limit: 5000
    column_limit: 50
    row_total: right
    stacking: normal
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_types: {}
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 26
    col: 0
    width: 6
    height: 6
  - title: Average Brands Per Account
    name: Average Brands Per Account
    model: edw
    explore: dates
    type: looker_column
    fields:
    - dates.Calendar_month
    - Sales.Avg_Brands_Per_Account
    fill_fields:
    - dates.Calendar_month
    limit: 500
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 26
    col: 6
    width: 8
    height: 6
  filters:
  - name: Brand
    title: Brand
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: edw
    explore: Sales
    listens_to_filters:
    - Delivery Method
    - Account
    - Item
    - Relative Date
    field: Sales.Brand
  - name: Item
    title: Item
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: edw
    explore: Sales
    listens_to_filters:
    - Delivery Method
    - Account
    - Brand
    - Relative Date
    field: Sales.Item
  - name: Account
    title: Account
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: edw
    explore: Sales
    listens_to_filters:
    - Delivery Method
    - Item
    - Brand
    - Relative Date
    field: Sales.Account
  - name: Delivery Method
    title: Delivery Method
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: edw
    explore: Sales
    listens_to_filters:
    - Account
    - Item
    - Brand
    - Relative Date
    field: Sales.Delivery_Method
  - name: Relative Date
    title: Relative Date
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: edw
    explore: dates
    listens_to_filters:
    - Delivery Method
    - Account
    - Item
    - Brand
    field: dates.Relative_Date