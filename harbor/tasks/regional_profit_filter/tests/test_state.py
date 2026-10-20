import json
import subprocess
from pathlib import Path

from PIL import Image

APP = Path("/app")
EXPECTED = {"regions": ["South", "West", "East", "North"], "total_profit": [120, 90, 86, 48]}


def test_required_files_and_png():
    for name in ("plot.py", "figure.png", "plotted_values.json"):
        assert (APP / name).is_file(), f"missing {name}"
    with Image.open(APP / "figure.png") as image:
        image.verify()
    with Image.open(APP / "figure.png") as image:
        assert image.format == "PNG"
        assert image.size == (960, 600)


def test_plotted_values_are_exact():
    assert json.loads((APP / "plotted_values.json").read_text()) == EXPECTED


def test_plot_is_reproducible():
    subprocess.run(["python", "plot.py"], cwd=APP, check=True, timeout=60)
    assert json.loads((APP / "plotted_values.json").read_text()) == EXPECTED
