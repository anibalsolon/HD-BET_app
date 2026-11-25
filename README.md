<h1 align="center">HD-BET</h1>

<p align="center">
  Extracts the brain from a T1-weighted image with the HD-BET neural network, outputting the skull-stripped T1w and a binary brain mask.
</p>

<p align="center">
  <a href="https://github.com/brainlife/abcd-spec"><img src="https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg" alt="ABCD Spec v1.1"></a>
  <a href="https://doi.org/10.25663/brainlife.app.416"><img src="https://img.shields.io/badge/Brainlife-brainlife.app.416-blue.svg" alt="Run on brainlife.io"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-see_LICENSE-lightgrey.svg" alt="License"></a>
</p>

## At a glance

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

> **Extracts the brain from a T1-weighted image with the HD-BET neural network, outputting the skull-stripped T1w and a binary brain mask.**

Runs the hd-bet command from MIC-DKFZ/HD-BET on the T1w image, using an NVIDIA GPU when one is available and the CPU otherwise. Fast mode uses one model; accurate mode uses five models with a majority vote, and test-time augmentation adds mirrored inputs. Use it as a deep-learning alternative to FSL BET for skull stripping. The repository README gives no further documentation.

| | |
|---|---|
| **Inputs** | `neuro/anat/t1w` |
| **Outputs** | `neuro/anat/t1w` · `neuro/mask` |
| **Container** | `anibalsolon/hd-bet:v0.0.1` |
| **Resources** | 16 CPUs · 2 h walltime |
| **Run it** | [doi.org/10.25663/brainlife.app.416](https://doi.org/10.25663/brainlife.app.416) |

#### Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `t1` | `neuro/anat/t1w` | yes | T1-weighted MRI volume to skull-strip. |

#### Outputs

| Output | Datatype | Description |
|---|---|---|
| `output` | `neuro/anat/t1w` | Brain-extracted (skull-stripped) T1-weighted image. |
| `mask` | `neuro/mask` | Binary brain mask predicted by HD-BET. |

<details>
<summary><b>Parameters</b> (2)</summary>

| Parameter | Type | Default | Description |
|---|---|---|---|
| `tta` | boolean | `false` | Testing-time augmentation: mirror the input image on the three axes and infer the brain mask on the original & the three new images, taking the majority decision for each voxel for the final output. |
| `mode` | enum | `fast` | Inference mode Options: `accurate`, `fast`. |

</details>

<!-- brainlife-app:end -->

## Running the App

### On brainlife.io

Open the App at [doi.org/10.25663/brainlife.app.416](https://doi.org/10.25663/brainlife.app.416), choose `neuro/anat/t1w` from your project, set the parameters and press **Execute**. The results are saved to your project as `neuro/anat/t1w`, `neuro/mask`.

### Locally

You need [Singularity/Apptainer](https://apptainer.org/) (the App runs in `anibalsolon/hd-bet:v0.0.1`), [`jq`](https://jqlang.github.io/jq/).

1. Clone this repository.
2. Create `config.json` with the paths to your inputs and the parameters:

   ```json
   {
       "t1": "/path/to/t1/t1",
       "tta": false,
       "mode": "fast"
   }
   ```

3. Run `./main`.

## Citing

If you use this App, please cite it, the software it builds on and brainlife.io:

- HD-BET. brainlife.io App. [doi:10.25663/brainlife.app.416](https://doi.org/10.25663/brainlife.app.416)
- Jenkinson et al. FSL. *NeuroImage* 62:782-790 (2012). [doi:10.1016/j.neuroimage.2011.09.015](https://doi.org/10.1016/j.neuroimage.2011.09.015)
- Hayashi S, Caron BA, Heinsfeld AS, et al. brainlife.io: a decentralized and open-source cloud platform to support neuroscience research. *Nature Methods* 21:809–813 (2024). [doi:10.1038/s41592-024-02237-2](https://doi.org/10.1038/s41592-024-02237-2)
- Avesani P, McPherson B, Hayashi S, et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. *Scientific Data* 6:69 (2019). [doi:10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)

## Authors

Maintained by [@anibalsolon](https://github.com/anibalsolon).

## License

See [LICENSE](LICENSE).
