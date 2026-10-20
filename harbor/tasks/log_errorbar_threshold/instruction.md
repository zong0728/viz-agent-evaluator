# log_errorbar_threshold

<!-- Copied from tasks/log_errorbar_threshold/task.json. This is the prompt the three fixed agents
     were given, so do NOT reword it: check-submission holds both your runs
     and this file to the descriptor's wording. Add what your verifier needs
     under the heading below instead. -->

Using matplotlib, plot x=[1, 10, 100, 1000] and y=[2, 20, 200, 2000] as a navy dashed line with circular markers. Add symmetric y error bars equal to 10 percent of each y value, with red caps. Use logarithmic base-10 scales on both axes, set x limits 0.8 to 1200 and y limits 1 to 3000, and shade the vertical region from x=10 to x=100 in light gray with alpha 0.3. Annotate the point (100, 200) with the exact text `threshold`, with an arrow pointing to that point. Turn on major and minor grids, label the axes `Input Size` and `Runtime (ms)`, and set the exact title `Scaling with Uncertainty`. Include a legend in the upper left. Make the figure 8 by 5 inches at 120 dpi and save it as figure.png.

## Required outputs

Leave `/app/plot.py`, `/app/figure.png`, and `/app/plotted_values.json`. Extra
images are allowed, but only `figure.png` is graded. `plot.py` must use bare
filenames, run without arguments from `/app`, and reproduce both outputs.

`plotted_values.json` must contain exactly `x`, `y`, and `y_error` (four JSON
numbers each), plus `shaded_region` (two JSON numbers). Example:
`{"x":[0,0,0,0],"y":[0,0,0,0],"y_error":[0,0,0,0],"shaded_region":[0,0]}`.

Only installed libraries may be used; network access is unavailable.
