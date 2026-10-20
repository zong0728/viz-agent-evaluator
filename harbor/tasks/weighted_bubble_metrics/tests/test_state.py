import json
import subprocess
from pathlib import Path

from PIL import Image

APP = Path("/app")
EXPECTED = {
    "services": ["Alpha", "Beta", "Gamma", "Delta", "Epsilon"],
    "latency": [80, 120, 60, 150, 95],
    "accuracy": [0.91, 0.94, 0.88, 0.96, 0.92],
    "bubble_area": [600, 400, 800, 300, 500],
    "cost": [0.06, 0.09, 0.04, 0.12, 0.07],
}


def test_required_files_and_png():
    for name in ("plot.py", "figure.png", "plotted_values.json"):
        assert (APP / name).is_file(), f"missing {name}"
    with Image.open(APP / "figure.png") as image:
        image.verify()
    with Image.open(APP / "figure.png") as image:
        assert image.format == "PNG"
        assert image.size == (960, 720)


def test_plotted_values_are_exact():
    assert json.loads((APP / "plotted_values.json").read_text()) == EXPECTED


def test_plot_is_reproducible():
    subprocess.run(["python", "plot.py"], cwd=APP, check=True, timeout=60)
    assert json.loads((APP / "plotted_values.json").read_text()) == EXPECTED
