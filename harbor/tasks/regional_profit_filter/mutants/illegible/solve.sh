#!/bin/bash
set -euo pipefail
cat > plot.py <<'PY'
import json
import matplotlib.pyplot as plt
regions = ["South", "West", "East", "North"]
values = [120, 90, 86, 48]
plt.rcParams.update({"font.size": 2})
fig, ax = plt.subplots(figsize=(8, 5), dpi=120)
bars = ax.barh(regions, values, color="darkgreen")
ax.invert_yaxis(); ax.set_xlim(left=0)
ax.set_xlabel("Total Profit", fontsize=2); ax.set_ylabel("Region", fontsize=2)
ax.set_title("Filtered Profit by Region", fontsize=2)
ax.tick_params(labelsize=2); ax.bar_label(bars, fontsize=2)
fig.tight_layout(); fig.savefig("figure.png", dpi=120)
with open("plotted_values.json", "w") as file:
    json.dump({"regions": regions, "total_profit": values}, file)
PY
python plot.py
