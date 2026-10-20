# weighted_bubble_metrics

<!-- Copied from tasks/weighted_bubble_metrics/task.json. This is the prompt the three fixed agents
     were given, so do NOT reword it: check-submission holds both your runs
     and this file to the descriptor's wording. Add what your verifier needs
     under the heading below instead. -->

Using matplotlib, visualize these service measurements: Alpha(latency=80, accuracy=0.91, requests=1200, cost=0.06), Beta(120, 0.94, 800, 0.09), Gamma(60, 0.88, 1600, 0.04), Delta(150, 0.96, 600, 0.12), Epsilon(95, 0.92, 1000, 0.07). Create one bubble per service with latency on the x axis, accuracy on the y axis, bubble area equal to requests divided by 2, and bubble color equal to cost. Use the viridis colormap with fixed color limits 0.04 to 0.12 and include a colorbar labeled `Cost per Request ($)`. Annotate every bubble with its service name, label the axes `Latency (ms)` and `Accuracy`, set the y limits to 0.85 through 0.98, turn on a dashed grid, and use the exact title `Service Quality and Load`. Make the figure 8 by 6 inches at 120 dpi and save it as figure.png.

## Required outputs

Leave `/app/plot.py`, `/app/figure.png`, and `/app/plotted_values.json`. Extra
images are allowed, but only `figure.png` is graded. `plot.py` must use bare
filenames, run without arguments from `/app`, and reproduce both outputs.

`plotted_values.json` must contain exactly `services` (five strings), `latency`,
`accuracy`, `bubble_area`, and `cost` (five JSON numbers each), all in service
order. Example schema: `{"services":["A"],"latency":[0],"accuracy":[0],
"bubble_area":[0],"cost":[0]}`.

Only installed libraries may be used; network access is unavailable.
