#!/bin/bash
set -euo pipefail
cat > plot.py <<'PY'
import json
import matplotlib.pyplot as plt

x = [-2, -1, 0, 1, 2]
series = {
    "linear": x,
    "quadratic": [value ** 2 for value in x],
    "cubic": [value ** 3 for value in x],
    "absolute": [abs(value) for value in x],
}
specs = [
    ("linear", "Linear", "blue", "-", "o"),
    ("quadratic", "Quadratic", "red", "--", "s"),
    ("cubic", "Cubic", "green", ":", "^"),
    ("absolute", "Absolute", "purple", "-.", "D"),
]
fig, axes = plt.subplots(2, 2, figsize=(8, 8), dpi=120, sharex=True,
                         gridspec_kw={"hspace": 0, "wspace": 0})
for index, (axis, spec) in enumerate(zip(axes.flat, specs)):
    key, title, color, style, marker = spec
    axis.plot(x, series[key], color=color, linestyle=style, marker=marker, label=title)
    axis.set_title(title)
    axis.grid(True, linestyle="--", alpha=0.5)
    axis.legend(loc="upper left")
    axis.spines["top"].set_visible(False)
    axis.spines["right"].set_visible(False)
    if index % 2 == 0:
        axis.set_ylabel("f(x)")
    if index >= 2:
        axis.set_xlabel("x")
fig.suptitle("Four Functions on a Shared Domain")
fig.savefig("figure.png", dpi=120)
with open("plotted_values.json", "w") as file:
    json.dump({"x": x, **series}, file)
PY
python plot.py
