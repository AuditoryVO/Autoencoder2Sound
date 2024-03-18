# Autoencoder2Sound
Synthesizes musical notes and chords sonifying the ten-dimensional latent space of a sparse autoencoder that explores the spectra of the MILES stellar library. Data: SVO.
![AUTOENCODER-GitHub](https://github.com/AuditoryVO/Autoencoder2Sound/assets/144262864/1a4e93fb-368e-4b1a-8a0a-a2ba116a8ef2)

CONTENTS

- Model and weights: 2layers_Miles_autoencoder.tf
- Jupyter notebook 1: Notes-Demo.ipynb
- Jupyter notebook 2: Chords-Demo.ipynb
- Jupyter notebook 3: Autoencoder2Sound-Demo.ipynb
- CSound/Cabbage file: Autoencoder2Sound.csd
- Cabbage mask file: Init2.png
- Sample spectrum: Autoencoder.png
- LICENSE
- README
- requirements.txt

CABBAGE/CSOUND INSTALLATION

1- Download and install CSound 6.15 from: https://github.com/csound/csound/releases/tag/6.15.0

2- Download Cabbage from (current version 2.9.0): https://cabbageaudio.com/download/ 

3- Install only Cabbage from the downloaded Cabbage package.

   Warning: Current Cabbage version 2.9.0 allows to optionally install the latest version of CSound. This default option should be unchecked not to overwrite CSound 6.15.
   Latests versions of CSound require additional plugins to work with the image CSound opcodes, so they should not be used.


AUTOENCODER2SOUND INSTALLATION

1- Download the spectra from: http://svocats.cab.inta-csic.es/miles/index.php?action=credits

2- Download all the content of this repository into the same folder

3- Install all the dependencies included in the requirements.txt file

4- For a direct sonification with pre-calculated autoencoder:
   - Launch Cabbage, open Autoencoder2Sound.csd, and press play
   
   Important note: Cabbage 2.9.0 requires CamelCase update via: File/Convert Identifiers to camelCase. Also change manually “PluginID” to “PluginId” to avoid warnings.

   - Run Jupyter notebook 1 (Notes-Demo.ipynb) for sequential note sonification
   - Add your path to the downloaded spectra before running all the cells
   - Run Jupyter notebook 2 (Chords-Demo.ipynb) for chord sonification
   - Add your path to the downloaded spectra before running all the cells


5- To recalculate the weights of the autoencoder for the MILES stellar library run Jupyter notebook 3 (Autoencoder2Sound-Demo)
   - Add your path to the downloaded spectra before running all the cells

Enjoy the sonifications!

Developer system info: Python 3.8.5 - Cabbage 2.5.0 - i7 macOS 10.15.7 - 32 GB - 1536 MB




