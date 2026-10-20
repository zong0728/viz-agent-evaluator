#!/bin/bash
set -euo pipefail
cat > plot.py <<'PY'
import json
import matplotlib.pyplot as plt
import numpy as np

months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"]
visits = [1000, 1200, 900, 1500, 1800, 1600]
orders = [50, 72, 63, 120, 162, 128]
rates = [100 * order / visit for order, visit in zip(orders, visits)]
cumulative = np.cumsum(orders).tolist()
fig, (top, bottom) = plt.subplots(2, 1, figsize=(9, 7), dpi=120, sharex=True)
bars = top.bar(months, visits, color="tab:blue", label="Visits")
right = top.twinx()
line, = right.plot(months, rates, color="tab:orange", marker="o", label="Conversion Rate")
top.set_ylabel("Visits")
right.set_ylabel("Conversion Rate (%)")
top.legend([bars, line], ["Visits", "Conversion Rate"], loc="upper left")
top.grid(axis="y", linestyle="--", alpha=0.5)
bottom.step(months, cumulative, where="mid", color="purple", label="Cumulative Orders")
for month, value in zip(months, cumulative):
    bottom.annotate(str(value), (month, value), xytext=(0, 5), textcoords="offset points", ha="center")
bottom.set_ylabel("Cumulative Orders")
bottom.set_xlabel("Month")
bottom.grid(axis="y", linestyle="--", alpha=0.5)
fig.suptitle("Monthly Funnel Performance")
fig.tight_layout()
fig.savefig("figure.png", dpi=120)
with open("plotted_values.json", "w") as file:
    json.dump({"months": months, "visits": visits, "conversion_rate": rates,
               "cumulative_orders": cumulative}, file)
PY
python plot.py
