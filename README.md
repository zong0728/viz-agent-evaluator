# Hybrid Evaluator for a Data-Visualization Agent

A validator that grades a plotting agent's runs against four failure families
(execution failure, wrong data, wrong chart, hard to read). It combines
deterministic checks with a single schema-validated VLM judgment that must cite
evidence, and it was measured against human labels.

Built for CMU 11-768 (AI Agents), Assignment 2. The validator plugs into the
course starter code at [cmu-agents/assignment-2](https://github.com/cmu-agents/assignment-2)
(runner, model client and scoring), which is not copied here.

## Approach

- **Deterministic where possible.** Execution failure is decided by checking that
  the required `figure.png` exists and decodes as a PNG, instead of asking a model.
  Exact saved-image sizes are parsed from the prompt ("W by H inches at DPI") and
  compared with the decoded pixels; a trajectory check flags descending `barh`
  charts that were never reversed.
- **One joint VLM call for the rest.** The task, bounded input and trajectory
  excerpts, a downscaled image and its original pixel/DPI metadata go into one
  request with a full rubric and explicit family boundaries. The model returns a
  JSON object with a Boolean and an evidence string per family, validated before
  any error is emitted.
- **Grounded merging.** Deterministic findings carry their own evidence and are
  merged with, not replaced by, the model judgment.

## Results (macro-MCC against human labels)

| Set | Baseline | Redesigned judge | + deterministic checks |
|---|---|---|---|
| Seed set, 110 runs | 0.027 | 0.441 | 0.430 |
| Authored set, 15 runs | – | 0.284 | 0.908 |

Execution-failure MCC went from -0.002 to 1.000 on the seed set (12/12 true
failures, no false positives). The authored set is small, and the two
deterministic checks were motivated by it, so its number is optimistic.
Readability is the open weakness (seed MCC 0.03), and the VLM's answers vary
between sweeps (17 of 110 seed predictions changed). Details in
[report.pdf](report.pdf).

## Authored tasks

Five adversarial tasks, each run with Qwen2.5-Coder-3B, Ministral-3-14B and
GLM-4.7-Flash, labeled by hand and packaged as [Harbor](https://github.com/laude-institute/harbor)
environments with deterministic tests (file presence, PNG size, exact sidecar
values, reproducibility). Two mutant solutions test the verifiers: `wrong_total`
is caught, `illegible` (2-point text) is not, which is why readability needs
image-level judgment.

| Task | What it stresses |
|---|---|
| `regional_profit_filter` | filter, aggregate, sort, labeled horizontal bars |
| `weighted_bubble_metrics` | four metrics through position, area and color |
| `monthly_conversion_combo` | derived rates, cumulative series, twin axis, annotations |
| `log_errorbar_threshold` | log scales, proportional error bars, limits, shading |
| `shared_panel_functions` | exact functions in a shared-axis 2x2 layout |

## Layout

```
validator/solution.py   the validator
tasks/, harbor/tasks/   authored tasks and their Harbor packaging
runs/                   agent runs on the authored tasks (result + figure)
labels.json             human labels for the authored runs
output/                 predictions from each validator version
report.pdf, report.tex  write-up
```
