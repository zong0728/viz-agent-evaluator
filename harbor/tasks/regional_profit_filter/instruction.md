# regional_profit_filter

<!-- Copied from tasks/regional_profit_filter/task.json. This is the prompt the three fixed agents
     were given, so do NOT reword it: check-submission holds both your runs
     and this file to the descriptor's wording. Add what your verifier needs
     under the heading below instead. -->

Using matplotlib, create a horizontal bar chart from these records: (North, A, units=12, price=10, cost=6), (North, B, 8, 12, 7), (South, A, 15, 9, 5), (South, C, 20, 7, 4), (East, A, 10, 11, 8), (East, B, 14, 6, 2), (West, C, 9, 13, 9), (West, A, 18, 8, 3). First discard records with units below 10. For every remaining record compute profit=(price-cost)*units, then sum profit by region. Sort regions by total profit from largest to smallest and display that descending order from top to bottom. Use dark green horizontal bars, label every bar with its exact total, start the x axis at zero, label the axes `Total Profit` and `Region`, and set the exact title `Filtered Profit by Region`. Make the figure 8 by 5 inches at 120 dpi. Save the result as figure.png.

## Required outputs

Leave `/app/plot.py`, `/app/figure.png`, and `/app/plotted_values.json`. Extra
images are allowed, but only `figure.png` is graded. `plot.py` must use bare
filenames, run without arguments from `/app`, and reproduce both outputs.

`plotted_values.json` must be an object with exactly two keys: `regions`, an
array of four strings in plotted top-to-bottom order, and `total_profit`, an
array of four JSON numbers in matching order. Example schema:
`{"regions":["A","B","C","D"],"total_profit":[0,0,0,0]}`.

Only installed libraries may be used; network access is unavailable.
