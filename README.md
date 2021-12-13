SS-GAIL
============================================================================================================
By: Akshay Dharmavaram
-----------------------------------------------------------------------------------------

Code adapted from [DAC](https://github.com/google-research/google-research/tree/master/dac)

Getting Started
--------------------

We use conda to setup the environments, but any other package manager should suffice. We use Python 3.5.4

```
conda create --name ssgail python=3.5.4
conda activate ssgail
pip install -r requirements.txt
bash install_mujoco150.sh # If this doesn't working, just install mujoco150 manually
```

Generating / Downloading Expert Trajectories:
-------------------------------

Clone the repo of expert trajectories:

```
cd data/ssgail  # We will assume access to this directory.
git clone https://github.com/ikostrikov/gail-experts.git
```

Then use our import script to turn them into checkpoints (~1-2 hours):

```
python generate_expert_data.py --src_data_dir data/ssgail/gail-experts/ --dst_data_dir data/ssgail/gail-experts/
```

Running Training
----------------

Launch run_training_worker.sh to start the training worker. Then in another
terminal, launch run_evaluation_worker.sh. Training takes approximately 1 to 2 hours.

To change the environment, number of expert trajectories, etc, edit the
variables defined in the bash scripts above.

To see reward results live during training, launch a tensorboard:

    tensorboard --logdir /tmp/lfd_state_action_traj_4_HalfCheetah-v2_20
