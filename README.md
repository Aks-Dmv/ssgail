Discriminator-Actor-Critic: Addressing Sample Inefficiency and Reward Bias in Adversarial Imitation Learning
============================================================================================================
Ilya Kostrikov, Kumar Krishna Agrawal, Debidatta Dwibedi, Sergey Levine, Jonathan Tompson
-----------------------------------------------------------------------------------------

Source code to accompany our [paper](https://arxiv.org/abs/1809.02925).

Getting Started
--------------------

We use conda to setup the environments, but any other package manager should suffice. We use Python 3.5.4

```
conda create --name ssgail python=3.5.4
pip install -r requirements.txt
wget https://www.roboti.us/download/mjpro150_linux.zip
unzip mjpro150
mkdir .mujoco
mv mjpro150 .mujoco/mjpro150
cd .mujoco
wget https://www.roboti.us/file/mjkey.txt
cd
pip install --upgrade pip
pip install -U 'mujoco-py<1.50.2,>=1.50.1'
python -c 'import mujoco_py'
```

Generating / Downloading Expert Trajectories:
-------------------------------

Clone the repo of expert trajectories:

```
cd /data/dac/  # We will assume access to this directory.
git clone https://github.com/ikostrikov/gail-experts.git
```

Then use our import script to turn them into checkpoints (~1-2 hours):

```
python generate_expert_data.py --src_data_dir /data/dac/gail-experts/ --dst_data_dir /data/dac/gail-experts/
```

Running Training
----------------

Launch run_training_worker.sh to start the training worker. Then in another
terminal, launch run_evaluation_worker.sh. Training takes approximately 1 to 2
hours.

To change the environment, number of expert trajectories, etc, edit the
variables defined in the bash scripts above.

To see reward results live during training, launch a tensorboard:

    tensorboard --logdir /tmp/lfd_state_action_traj_4_HalfCheetah-v2_20
