#!/bin/bash
set -euo pipefail
cat > plot.py <<'PY'
import json
import matplotlib.pyplot as plt

services = ["Alpha", "Beta", "Gamma", "Delta", "Epsilon"]
latency = [80, 120, 60, 150, 95]
accuracy = [0.91, 0.94, 0.88, 0.96, 0.92]
requests = [1200, 800, 1600, 600, 1000]
cost = [0.06, 0.09, 0.04, 0.12, 0.07]
area = [value / 2 for value in requests]
fig, ax = plt.subplots(figsize=(8, 6), dpi=120)
points = ax.scatter(latency, accuracy, s=area, c=cost, cmap="viridis", vmin=0.04, vmax=0.12, alpha=0.75)
for name, x, y in zip(services, latency, accuracy):
    ax.annotate(name, (x, y), ha="center", va="center")
cbar = fig.colorbar(points, ax=ax)
cbar.set_label("Cost per Request ($)")
ax.set_xlabel("Latency (ms)")
ax.set_ylabel("Accuracy")
ax.set_ylim(0.85, 0.98)
ax.grid(True, linestyle="--", alpha=0.5)
ax.set_title("Service Quality and Load")
fig.tight_layout()
fig.savefig("figure.png", dpi=120)
with open("plotted_values.json", "w") as file:
    json.dump({"services": services, "latency": latency, "accuracy": accuracy,
               "bubble_area": area, "cost": cost}, file)
PY
python plot.py
