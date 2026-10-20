# shared_panel_functions

<!-- Copied from tasks/shared_panel_functions/task.json. This is the prompt the three fixed agents
     were given, so do NOT reword it: check-submission holds both your runs
     and this file to the descriptor's wording. Add what your verifier needs
     under the heading below instead. -->

Using matplotlib and x=[-2, -1, 0, 1, 2], create a 2 by 2 grid with a shared x axis. Plot y=x in the top-left as a blue solid line with circle markers and title `Linear`; y=x**2 in the top-right as a red dashed line with square markers and title `Quadratic`; y=x**3 in the bottom-left as a green dotted line with triangle markers and title `Cubic`; and y=abs(x) in the bottom-right as a purple dash-dot line with diamond markers and title `Absolute`. Give every panel a light dashed grid and a legend in the upper left. Only the left-column panels should have the y-axis label `f(x)`, and only the bottom-row panels should have the x-axis label `x`. Set the exact suptitle `Four Functions on a Shared Domain`, use zero horizontal and vertical spacing between panels, and hide the top and right spines of every panel. Make the figure 8 by 8 inches at 120 dpi and save it as figure.png.

## Required outputs

Leave `/app/plot.py`, `/app/figure.png`, and `/app/plotted_values.json`. Extra
images are allowed, but only `figure.png` is graded. `plot.py` must use bare
filenames, run without arguments from `/app`, and reproduce both outputs.

`plotted_values.json` must contain exactly `x`, `linear`, `quadratic`, `cubic`,
and `absolute`, each an array of five JSON numbers. Example:
`{"x":[0,0,0,0,0],"linear":[0,0,0,0,0],"quadratic":[0,0,0,0,0],
"cubic":[0,0,0,0,0],"absolute":[0,0,0,0,0]}`.

Only installed libraries may be used; network access is unavailable.
