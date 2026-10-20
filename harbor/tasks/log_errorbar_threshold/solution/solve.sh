#!/bin/bash
set -euo pipefail
cat > plot.py <<'PY'
import json
import matplotlib.pyplot as plt

x = [1, 10, 100, 1000]
y = [2, 20, 200, 2000]
yerr = [value * 0.1 for value in y]
fig, ax = plt.subplots(figsize=(8, 5), dpi=120)
ax.errorbar(x, y, yerr=yerr, color="navy", linestyle="--", marker="o",
            ecolor="red", capsize=5, label="Runtime")
ax.set_xscale("log", base=10)
ax.set_yscale("log", base=10)
ax.set_xlim(0.8, 1200)
ax.set_ylim(1, 3000)
ax.axvspan(10, 100, color="lightgray", alpha=0.3)
ax.annotate("threshold", xy=(100, 200), xytext=(180, 80),
            arrowprops={"arrowstyle": "->"})
ax.grid(True, which="both")
ax.set_xlabel("Input Size")
ax.set_ylabel("Runtime (ms)")
ax.set_title("Scaling with Uncertainty")
ax.legend(loc="upper left")
fig.tight_layout()
fig.savefig("figure.png", dpi=120)
with open("plotted_values.json", "w") as file:
    json.dump({"x": x, "y": y, "y_error": yerr, "shaded_region": [10, 100]}, file)
PY
python plot.py
