# monthly_conversion_combo

<!-- Copied from tasks/monthly_conversion_combo/task.json. This is the prompt the three fixed agents
     were given, so do NOT reword it: check-submission holds both your runs
     and this file to the descriptor's wording. Add what your verifier needs
     under the heading below instead. -->

Using matplotlib, use months Jan through Jun with visits [1000, 1200, 900, 1500, 1800, 1600] and orders [50, 72, 63, 120, 162, 128]. Compute conversion rate as 100*orders/visits and cumulative orders as the running sum of orders. Create two vertically stacked panels sharing the x axis. The top panel must contain blue bars for visits on the left y axis and an orange circle-marker line for conversion rate on a twin right y axis. The bottom panel must contain a purple step plot of cumulative orders using where=`mid`, with every cumulative value annotated. Give the top left axis label `Visits`, top right axis label `Conversion Rate (%)`, and bottom y axis label `Cumulative Orders`; label the bottom x axis `Month`. Include a combined legend in the upper left of the top panel, turn on a horizontal dashed grid in both panels, and set the exact suptitle `Monthly Funnel Performance`. Make the figure 9 by 7 inches at 120 dpi and save it as figure.png.

## Required outputs

Leave `/app/plot.py`, `/app/figure.png`, and `/app/plotted_values.json`. Extra
images are allowed, but only `figure.png` is graded. `plot.py` must use bare
filenames, run without arguments from `/app`, and reproduce both outputs.

`plotted_values.json` must contain exactly `months` (six strings), and `visits`,
`conversion_rate`, and `cumulative_orders` (six JSON numbers each). Example:
`{"months":["Jan"],"visits":[0],"conversion_rate":[0],"cumulative_orders":[0]}`.

Only installed libraries may be used; network access is unavailable.
