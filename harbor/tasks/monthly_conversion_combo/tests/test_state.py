import json
import subprocess
from pathlib import Path

from PIL import Image

APP = Path("/app")
EXPECTED = {
    "months": ["Jan", "Feb", "Mar", "Apr", "May", "Jun"],
    "visits": [1000, 1200, 900, 1500, 1800, 1600],
    "conversion_rate": [5, 6, 7, 8, 9, 8],
    "cumulative_orders": [50, 122, 185, 305, 467, 595],
}


def test_required_files_and_png():
    for name in ("plot.py", "figure.png", "plotted_values.json"):
        assert (APP / name).is_file(), f"missing {name}"
    with Image.open(APP / "figure.png") as image:
        image.verify()
    with Image.open(APP / "figure.png") as image:
        assert image.format == "PNG"
        assert image.size == (1080, 840)


def test_plotted_values_are_exact():
    assert json.loads((APP / "plotted_values.json").read_text()) == EXPECTED


def test_plot_is_reproducible():
    subprocess.run(["python", "plot.py"], cwd=APP, check=True, timeout=60)
    assert json.loads((APP / "plotted_values.json").read_text()) == EXPECTED
