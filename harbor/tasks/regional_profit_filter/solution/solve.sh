#!/bin/bash
set -euo pipefail
cat > plot.py <<'PY'
import json
import matplotlib.pyplot as plt

records = [
    ("North", "A", 12, 10, 6), ("North", "B", 8, 12, 7),
    ("South", "A", 15, 9, 5), ("South", "C", 20, 7, 4),
    ("East", "A", 10, 11, 8), ("East", "B", 14, 6, 2),
    ("West", "C", 9, 13, 9), ("West", "A", 18, 8, 3),
]
totals = {}
for region, _, units, price, cost in records:
    if units >= 10:
        totals[region] = totals.get(region, 0) + (price - cost) * units
ordered = sorted(totals.items(), key=lambda item: item[1], reverse=True)
regions = [item[0] for item in ordered]
values = [item[1] for item in ordered]
fig, ax = plt.subplots(figsize=(8, 5), dpi=120)
bars = ax.barh(regions, values, color="darkgreen")
ax.invert_yaxis()
ax.set_xlim(left=0)
ax.set_xlabel("Total Profit")
ax.set_ylabel("Region")
ax.set_title("Filtered Profit by Region")
ax.bar_label(bars, labels=[str(value) for value in values], padding=3)
fig.tight_layout()
fig.savefig("figure.png", dpi=120)
with open("plotted_values.json", "w") as file:
    json.dump({"regions": regions, "total_profit": values}, file)
PY
python plot.py
