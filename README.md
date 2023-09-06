# Autoencoder2Sound
Synthesizes musical notes and chords sonifying the ten-dimensional latent space of a sparse autoencoder that explores the spectra of the MILES stellar library. Data: SVO.

CONTENTS

- Model and weights: 2layers_Miles_autoencoder.tf
- Jupyter notebook 1: Notes-Demo.ipynb
- Jupyter notebook 2: Chords-Demo.ipynb
- Jupyter notebook 3: Autoencoder2Sound-Demo.ipynb
- CSound/Cabbage file: Autoencoder2Sound.csd
- Cabbage mask file: Init2.png
- Sample spectrum: Autoencoder.png
- requirements.txt

INSTALLATION

- Download the data: http://svocats.cab.inta-csic.es/miles/index.php?action=credits
- Download all the content into the same folder
- Download and install Cabbage-Audio: https://cabbageaudio.com/download/
- For a direct sonification with pre-calculated autoencoder:
    - Launch Cabbage, open Autoencoder2Sound.csd, and press play
    - Run Jupyter notebook 1 for notes or 2 for chord demos  
- To recalculate the weights of the autoencoder run Jupyter notebook 3
- Enjoy the sonifications!
