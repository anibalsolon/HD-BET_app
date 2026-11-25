<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

> **Extracts the brain from a T1-weighted image with the HD-BET neural network, outputting the skull-stripped T1w and a binary brain mask.**

Runs the hd-bet command from MIC-DKFZ/HD-BET on the T1w image, using an NVIDIA GPU when one is available and the CPU otherwise. Fast mode uses one model; accurate mode uses five models with a majority vote, and test-time augmentation adds mirrored inputs. Use it as a deep-learning alternative to FSL BET for skull stripping. The repository README gives no further documentation.

| | |
|---|---|
| 📥 **Inputs** | `neuro/anat/t1w` |
| 📤 **Outputs** | `neuro/anat/t1w` · `neuro/mask` |
| 🐳 **Container** | `anibalsolon/hd-bet:v0.0.1` |
| ⚙️ **Resources** | 16 CPUs · 2 h walltime |
| 🔗 **Run it** | [doi.org/10.25663/brainlife.app.416](https://doi.org/10.25663/brainlife.app.416) |

#### 📥 Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `t1` | `neuro/anat/t1w` | yes | T1-weighted MRI volume to skull-strip. |

#### 📤 Outputs

| Output | Datatype | Description |
|---|---|---|
| `output` | `neuro/anat/t1w` | Brain-extracted (skull-stripped) T1-weighted image. |
| `mask` | `neuro/mask` | Binary brain mask predicted by HD-BET. |

<details>
<summary><b>⚙️ Parameters</b> (2)</summary>

| Parameter | Type | Default | Description |
|---|---|---|---|
| `tta` | boolean | `false` | Testing-time augmentation: mirror the input image on the three axes and infer the brain mask on the original & the three new images, taking the majority decision for each voxel for the final output. |
| `mode` | enum | `fast` | Inference mode Options: `accurate`, `fast`. |

</details>

<!-- brainlife-app:end -->

# HD-BET_app